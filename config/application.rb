require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FfcWebForm
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.paperclip_defaults = {
      s3_credentials: {
        bucket: ENV['AWS_S3_BUCKET_NAME'],
        access_key_id: ENV['AWS_ACCESS_KEY_ID'],
        secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
        s3_region: 'us-west-2'
      },
      storage: :s3,
      s3_headers: { 'Cache-Control' => 'max-age=31557600' },
      s3_protocol: 'https',
      bucket: ENV['AWS_S3_BUCKET_NAME'],
      s3_host_name: 's3-us-west-2.amazonaws.com',
      s3_region: 'us-west-2',

      path: '/:class/:id/:style/:basename.:extension',
      default_url: '/images/:style/missing.png',
      default_style: 'medium'
    }
  end
end
