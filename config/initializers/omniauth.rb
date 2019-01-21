OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '936823825836-7mqo8571ps8u2rq94qus1nj3u687k3id.apps.googleusercontent.com', '2OuXtEkbX-9gMfE7Uh8vmOw9', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end