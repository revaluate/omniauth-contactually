# Example App

This folder contains a sample Sinatra app to test the Contactually OAuth2 flow.

## Setup

Ensure your Contactually App ID and Secret are available in the environment:

```bash
export CONTACTUALLY_APP_ID=YOUR_APP_ID_HERE
export CONTACTUALLY_APP_SECRET=YOUR_APP_SECRET_HERE
```

Run bundle install from the command line:

```bash
bundle install
```

## Usage

Run the app:

```bash
rackup -p 4567
```

NOTE: Since Contactually requires SSL, you'll probably need to set up a tunnel using a service like ngrok:

```bash
ngrok http -subdomain=some-custom-subdomain 4567
```
