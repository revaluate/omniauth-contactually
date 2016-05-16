require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Contactually < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, 'contactually'

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, :site => 'https://api.contactually.com/',
                              :authorize_url => 'https://auth.contactually.com/oauth2/authorize',
                              :token_url => 'https://auth.contactually.com/oauth2/token'

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid { raw_info['id'] }

      # https://github.com/intridea/omniauth/wiki/Auth-Hash-Schema#schema-10-and-later
      info do
        {
          :name => name_from_raw_info,
          :email => raw_info['email'],
          :first_name => raw_info['first_name'],
          :last_name => raw_info['last_name'],
          :image => raw_info['avatar_url']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/v2/me').parsed['data']
      end

      private

      def name_from_raw_info
        if raw_info['first_name'] || raw_info['last_name']
          "#{raw_info['first_name']} #{raw_info['last_name']}".strip
        else
          raw_info['email']
        end
      end
    end
  end
end
