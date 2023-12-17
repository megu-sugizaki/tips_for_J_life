require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TipsForJLife
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    
    config.i18n.default_locale = :en
    config.i18n.available_locales = [:en, :ja, :ep]
    
    # # M:To delete the log of guest users when they log out
    # config.after_initialize do
    #   guest_user = User.find_or_create_by(email: User::GUEST_USER_EMAIL)
    #   guest_user.my_events.each { |event| my_event.destroy } if guest_user.my_events.any?
    #   guest_user.problem_comments.each { |problem_comment| problem_comments.destroy } if guest_user.problem_comments.any?
    #   guest_user.problems.each { |problem| board.destroy } if guest_user.problems.any?
    # end
  end
end
