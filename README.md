# OmniAuth Contactually
Gem to authenticate with Instructure Contactually via OAuth2

# Background
Contactually has a full API (docs at https://developers.contactually.com/), and as of Q1 2016, has switched to OAuth for authentication (https://developers.contactually.com/docs/auth/). To aid in the development of applications that provide value by connecting to Contactually, we've provided this OmniAuth strategy. You see existing integrations and add your own at http://marketplace.contactually.com/

# Setup
Register for your OAuth credentials by creating an application at https://www.contactually.com/developer/applications (you'll need a Contactually account - contact us at api@contactually.com if you want it converted to a free developer account). You can see what scope(s) your application will require at https://developers.contactually.com/docs/auth/. Limiting your application to only access necessary information will install better user trust with your application.

## Standard setup:

  # Add to your initializers/omniauth.rb

  use OmniAuth::Builder do
    provider :contactually, ENV['CONTACTUALLY_APP_ID'], ENV['CONTACTUALLY_APP_SECRET'], :scope=>"all:manage"
  end

## Setup with Devise:

  # Add to your devise.rb

  config.omniauth :contactually, ENV['CONTACTUALLY_APP_ID'], ENV['CONTACTUALLY_APP_SECRET'], :scope=>"all:manage"

## License

Copyright (C) 2016 by Zvi Band and Contactually, Inc

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.