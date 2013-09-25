# -*- encoding : utf-8 -*-
# http://guides.rubyonrails.org/action_mailer_basics.html
ActionMailer::Base.smtp_settings = ::Settings.configs.action_mailer.smtp_settings
ActionMailer::Base.default_url_options = {
  :host => ::Settings.configs.action_mailer.default_url_options.host
}

