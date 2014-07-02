OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '538104199648431', '71e0004484cc7cb707cbe812a3e92657'
end
