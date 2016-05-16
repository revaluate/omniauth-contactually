# OmniAuth Contactually
Gem to authenticate applications to Contactually via OAuth2.

# Background
Contactually has a full API (docs at https://developers.contactually.com), and as of Q1 2016, has switched to OAuth2 for authentication (https://developers.contactually.com/docs/auth).

To aid in the development of applications that provide value by connecting to Contactually, we've provided this OmniAuth strategy. You see existing integrations and add your own at http://marketplace.contactually.com/

# Setup
Register for your OAuth2 credentials by creating an application at https://www.contactually.com/developer/applications (you'll need a Contactually account - contact us at api@contactually.com if you want it converted to a free developer account).

You can see what scope(s) your application will require at https://developers.contactually.com/docs/auth/. Limiting your application to only access necessary information will instill better user trust with your application.

## Standard setup:

```ruby
  # Add to your initializers/omniauth.rb

  use OmniAuth::Builder do
    provider :contactually, ENV['CONTACTUALLY_APP_ID'], ENV['CONTACTUALLY_APP_SECRET'], :scope=>"all:manage"
  end
```

## Setup with Devise:

```ruby
  # Add to your devise.rb

  config.omniauth :contactually, ENV['CONTACTUALLY_APP_ID'], ENV['CONTACTUALLY_APP_SECRET'], :scope=>"all:manage"
```
