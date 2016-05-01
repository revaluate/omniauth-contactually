require 'oauth2'
require 'omniauth-oauth2'
require 'multi_json'

module OmniAuth
  module Strategies
    class Contactually  < OmniAuth::Strategies::OAuth2

      option :name, :contactually

      option :client_options, {
        :site => "https://api.contactually.com/",
        :authorize_url => "https://auth.contactually.com/oauth2/authorize",
        :token_url => "https://auth.contactually.com/oauth2/token"
      }

      uid { raw_info["id"] }
      
      info do
        {
          :email => raw_info["email"],
          :all_info => raw_info
        }
      end

      credentials do 
        hash = {"token" => access_token.token}
      end

      def raw_info
        @raw_info ||= access_token.get('/v2/me.json').parsed["data"]
      end


      def callback_phase
        error = request.params["error_reason"] || request.params["error"]
        if error
          fail!(error, CallbackError.new(request.params["error"], request.params["error_description"] || request.params["error_reason"], request.params["error_uri"]))
        elsif !options.provider_ignores_state && (request.params["state"].to_s.empty? || request.params["state"] != session.delete("omniauth.state"))
          fail!(:csrf_detected, CallbackError.new(:csrf_detected, "CSRF detected"))
        else
          self.access_token = build_access_token
          env['omniauth.auth'] = auth_hash
          call_app!
        end
      end

      def build_access_token
        auth_code = request.params["code"]
        response = connection.post do |req|
          req.url client.token_url
          req.headers['Content-Type'] = 'application/json'
          req.body = {client_id: client.id, client_secret: client.secret, code: auth_code, grant_type: "authorization_code",redirect_uri: callback_url}.to_json
        end
        parsed_json = ActiveSupport::JSON.decode(response.body)
        if response.status == 200
          return ::OAuth2::AccessToken.from_hash(client,parsed_json)
        else
          e = Error.new(parsed_json["error_description"])
          raise(e)
        end
      end

      def validate_redirect_uri
        grant.redirect_uri == redirect_uri
      end

      private
      def connection
        @connection ||= begin
          conn = Faraday.new(options[:client_options][:site], options[:connection_opts])
          conn.build do |b|
            response :json
            options[:connection_build].call(b)
          end if options[:connection_build]
          conn
        end
      end
    end
  end
end