# -*- encoding : utf-8 -*-
# RailsKindeditor ############################################################
RailsKindeditor.setup do |config|

  # Specify the subfolders in public directory.
  # You can customize it , eg: config.upload_dir = 'this/is/my/folder'
  config.upload_dir = 'uploads/kindeditor'

  # Allowed file types for upload.
  config.upload_image_ext = %w[gif jpg jpeg png bmp]
  config.upload_flash_ext = %w[swf flv]
  config.upload_media_ext = %w[swf flv mp3 wav wma wmv mid avi mpg asf rm rmvb]
  config.upload_file_ext = %w[doc docx xls xlsx ppt htm html txt zip rar gz bz2]

  config.march_upload_host = ::Settings.configs.servers.assets

  # Porcess upload image size
  # eg: 1600x1600 => 800x800
  #     1600x800  => 800x400
  #     400x400   => 400x400  # No Change
  # config.image_resize_to_limit = [800, 800]

end

if defined?(Blogsoso)
  Blogsoso.configure do |config|
  
  end
end

if defined?(BlogsosoAdmin)
  BlogsosoAdmin.configure do |config|
  
  end
end

# LoyalAdmin ##################################################################
LoyalAdmin.configure do |config|
  config.subdomain = ::Settings.configs.subdomains.admin

  config.white_hosts = {
    ::Blogsoso::Settings.configs.hosts.admin => {
      :view_paths => ::BlogsosoAdmin.config.admin_view_path
    }
  }
end

# LoyalCore ###################################################################
LoyalCore.configure do |config|
  config.avatar_server = ::Settings.configs.servers.assets
  config.clazz_alias = {
    'blogsoso-blogger'   => 'Blogsoso::Blogger'
  }
end

# SimpleCaptcha ###############################################################
SimpleCaptcha.setup do |config|
  # default: 100x28
  config.image_size = '120x40'

  # default: 5
  config.length = 6

  # default: simply_blue
  # possible values:
  # 'embosed_silver',
  # 'simply_red',
  # 'simply_green',
  # 'simply_blue',
  # 'distorted_black',
  # 'all_black',
  # 'charcoal_grey',
  # 'almost_invisible'
  # 'random'

  # config.image_style = 'simply_green'
  # config.image_style = 'charcoal_grey'
  config.image_style = 'random'

  # default: low
  # possible values: 'low', 'medium', 'high', 'random'
  # config.distortion = 'medium'
  config.distortion = 'medium'
end

LoyalPassport.configure do |config|
  config.subdomain = ::Settings.configs.subdomains.passport

  config.white_hosts = {
    ::Blogsoso::Settings.configs.hosts.passport => {
      :view_paths => ::Blogsoso.config.passport_view_path
    }
  }

  config.cancan_abilities = ::Blogsoso.config.cancan_abilities

  #  def config.request_routes_constraints?(request)
  #    true
  #  end

  #### initialize devise ###############################################################################
  config.devise_install do |devise_config|
    #  # ==> Mailer Configuration
    #  # Configure the e-mail address which will be shown in Devise::Mailer,
    #  # note that it will be overwritten if you use your own mailer class with default "from" parameter.
    #  devise_config.mailer_sender = "please-change-me-at-devise_config-initializers-devise@example.com"

    # ==> Mailer Configuration
    # Configure the e-mail address which will be shown in Devise::Mailer,
    # note that it will be overwritten if you use your own mailer class with default "from" parameter.
    # config.mailer_sender = "please-change-me-at-config-initializers-devise@example.com"

    smtp_settings = ::Settings.configs.action_mailer.smtp_settings
    devise_config.mailer_sender = "#{smtp_settings.user_name}@#{smtp_settings.domain}"

    # devise_config.mailer_sender = 'ruby800.test@gmail.com'

    # Configure the class responsible to send e-mails.
    devise_config.mailer = "LoyalPassport::Users::Mailer"

    # Configure the class responsible to send e-mails.
    # devise_config.mailer = "Devise::Mailer"

    # ==> ORM devise_configuration
    # Load and devise_configure the ORM. Supports :active_record (default) and
    # :mongoid (bson_ext recommended) by default. Other ORMs may be
    # available as additional gems.
    require 'devise/orm/active_record'

    # ==> Configuration for any authentication mechanism
    # Configure which keys are used when authenticating a user. The default is
    # just :email. You can devise_configure it to use [:username, :subdomain], so for
    # authenticating a user, both parameters are required. Remember that those
    # parameters are used only when authenticating and not when retrieving from
    # session. If you need permissions, you should implement that in a before filter.
    # You can also supply a hash where the value is a boolean determining whether
    # or not authentication should be aborted when the value is not present.
    # devise_config.authentication_keys = [ :email ]

    # Configure parameters from the request object used for authentication. Each entry
    # given should be a request method and it will automatically be passed to the
    # find_for_authentication method and considered in your model lookup. For instance,
    # if you set :request_keys to [:subdomain], :subdomain will be used on authentication.
    # The same considerations mentioned for authentication_keys also apply to request_keys.
    # devise_config.request_keys = []

    # Configure which authentication keys should be case-insensitive.
    # These keys will be downcased upon creating or modifying a user and when used
    # to authenticate or find a user. Default is :email.
    devise_config.case_insensitive_keys = [ :email ]

    # Configure which authentication keys should have whitespace stripped.
    # These keys will have whitespace before and after removed upon creating or
    # modifying a user and when used to authenticate or find a user. Default is :email.
    devise_config.strip_whitespace_keys = [ :email ]

    # Tell if authentication through request.params is enabled. True by default.
    # It can be set to an array that will enable params authentication only for the
    # given strategies, for example, `devise_config.params_authenticatable = [:database]` will
    # enable it only for database (email + password) authentication.
    # devise_config.params_authenticatable = true

    # Tell if authentication through HTTP Basic Auth is enabled. False by default.
    # It can be set to an array that will enable http authentication only for the
    # given strategies, for example, `devise_config.http_authenticatable = [:token]` will
    # enable it only for token authentication.
    # devise_config.http_authenticatable = false

    # If http headers should be returned for AJAX requests. True by default.
    # devise_config.http_authenticatable_on_xhr = true

    # The realm used in Http Basic Authentication. "Application" by default.
    # devise_config.http_authentication_realm = "Application"

    # It will change confirmation, password recovery and other workflows
    # to behave the same regardless if the e-mail provided was right or wrong.
    # Does not affect registerable.
    # devise_config.paranoid = true

    # By default Devise will store the user in session. You can skip storage for
    # :http_auth and :token_auth by adding those symbols to the array below.
    # Notice that if you are skipping storage for all authentication paths, you
    # may want to disable generating routes to Devise's sessions controller by
    # passing :skip => :sessions to `devise_for` in your devise_config/routes.rb
    devise_config.skip_session_storage = [:http_auth]

    # ==> Configuration for :database_authenticatable
    # For bcrypt, this is the cost for hashing the password and defaults to 10. If
    # using other encryptors, it sets how many times you want the password re-encrypted.
    #
    # Limiting the stretches to just one in testing will increase the performance of
    # your test suite dramatically. However, it is STRONGLY RECOMMENDED to not use
    # a value less than 10 in other environments.
    devise_config.stretches = Rails.env.test? ? 1 : 10

    # Setup a pepper to generate the encrypted password.
    # devise_config.pepper = "8ca3bd72d200fdd1c42dc525968e0f7762963385a18f283ee3b94c691c873caeff690655ac645f2add028832892f5d2f6a44eb3d49c4242ba827cb62792fa1ea"

    # ==> Configuration for :confirmable
    # A period that the user is allowed to access the website even without
    # confirming his account. For instance, if set to 2.days, the user will be
    # able to access the website for two days without confirming his account,
    # access will be blocked just in the third day. Default is 0.days, meaning
    # the user cannot access the website without confirming his account.
    # devise_config.allow_unconfirmed_access_for = 2.days

    # If true, requires any email changes to be confirmed (exactly the same way as
    # initial account confirmation) to be applied. Requires additional unconfirmed_email
    # db field (see migrations). Until confirmed new email is stored in
    # unconfirmed email column, and copied to email column on successful confirmation.
    devise_config.reconfirmable = true

    # Defines which key will be used when confirming an account
    devise_config.confirmation_keys = [ :email ]

    # ==> Configuration for :rememberable
    # The time the user will be remembered without asking for credentials again.
    # devise_config.remember_for = 2.weeks
    devise_config.remember_for = 3.months 

    # If true, extends the user's remember period when remembered via cookie.
    # devise_config.extend_remember_period = false

    # Options to be passed to the created cookie. For instance, you can set
    # :secure => true in order to force SSL only cookies.
    # devise_config.rememberable_options = {}

    # ==> Configuration for :validatable
    # Range for password length. Default is 6..128.
    # devise_config.password_length = 6..128

    # Email regex used to validate email formats. It simply asserts that
    # an one (and only one) @ exists in the given string. This is mainly
    # to give user feedback and not to assert the e-mail validity.
    # devise_config.email_regexp = /\A[^@]+@[^@]+\z/

    # ==> Configuration for :timeoutable
    # The time you want to timeout the user session without activity. After this
    # time the user will be asked for credentials again. Default is 30 minutes.
    # devise_config.timeout_in = 30.minutes

    # If true, expires auth token on session timeout.
    # devise_config.expire_auth_token_on_timeout = false

    # ==> Configuration for :lockable
    # Defines which strategy will be used to lock an account.
    # :failed_attempts = Locks an account after a number of failed attempts to sign in.
    # :none            = No lock strategy. You should handle locking by yourself.
    # devise_config.lock_strategy = :failed_attempts

    # Defines which key will be used when locking and unlocking an account
    # devise_config.unlock_keys = [ :email ]

    # Defines which strategy will be used to unlock an account.
    # :email = Sends an unlock link to the user email
    # :time  = Re-enables login after a certain amount of time (see :unlock_in below)
    # :both  = Enables both strategies
    # :none  = No unlock strategy. You should handle unlocking by yourself.
    # devise_config.unlock_strategy = :both

    # Number of authentication tries before locking an account if lock_strategy
    # is failed attempts.
    # devise_config.maximum_attempts = 20

    # Time interval to unlock the account if :time is enabled as unlock_strategy.
    # devise_config.unlock_in = 1.hour

    # ==> Configuration for :recoverable
    #
    # Defines which key will be used when recovering the password for an account
    # devise_config.reset_password_keys = [ :email ]

    # Time interval you can reset your password with a reset password key.
    # Don't put a too small interval or your users won't have the time to
    # change their passwords.
    devise_config.reset_password_within = 6.hours

    # ==> Configuration for :encryptable
    # Allow you to use another encryption algorithm besides bcrypt (default). You can use
    # :sha1, :sha512 or encryptors from others authentication tools as :clearance_sha1,
    # :authlogic_sha512 (then you should set stretches above to 20 for default behavior)
    # and :restful_authentication_sha1 (then you should set stretches to 10, and copy
    # REST_AUTH_SITE_KEY to pepper)
    # devise_config.encryptor = :sha512

    # ==> Configuration for :token_authenticatable
    # Defines name of the authentication token params key
    # devise_config.token_authentication_key = :auth_token

    # ==> Scopes devise_configuration
    # Turn scoped views on. Before rendering "sessions/new", it will first check for
    # "users/sessions/new". It's turned off by default because it's slower if you
    # are using only default views.
    # devise_config.scoped_views = false
    devise_config.scoped_views = true

    # Configure the default scope given to Warden. By default it's the first
    # devise role declared in your routes (usually :user).
    devise_config.default_scope = :user

    # Set this devise_configuration to false if you want /users/sign_out to sign out
    # only the current scope. By default, Devise signs out all scopes.
    # devise_config.sign_out_all_scopes = true

    # ==> Navigation devise_configuration
    # Lists the formats that should be treated as navigational. Formats like
    # :html, should redirect to the sign in page when the user does not have
    # access, but formats like :xml or :json, should return 401.
    #
    # If you have any extra navigational formats, like :iphone or :mobile, you
    # should add them to the navigational formats lists.
    #
    # The "*/*" below is required to match Internet Explorer requests.
    # devise_config.navigational_formats = ["*/*", :html]

    # The default HTTP method used to sign out a resource. Default is :delete.
    # devise_config.sign_out_via = :delete
    devise_config.sign_out_via = :get

    # ==> OmniAuth
    # Add a new OmniAuth provider. Check the wiki for more information on setting
    # up on your models and hooks.
    # devise_config.omniauth :github, 'APP_ID', 'APP_SECRET', :scope => 'user,public_repo'

    # devise_config.omniauth :github,
    #   Settings.oauth.providers.github.client_id,
    #   Settings.oauth.providers.github.client_secret,
    #   :scope => 'user,public_repo'

    if ::Settings.oauth.providers.github.enabled
      devise_config.omniauth :github,
        ::Settings.oauth.providers.github.client_id,
        ::Settings.oauth.providers.github.client_secret,
        :scope => 'user,public_repo'
    end

    if ::Settings.oauth.providers.qq_connect.enabled
      devise_config.omniauth :qq_connect,
        ::Settings.oauth.providers.qq_connect.client_id,
        ::Settings.oauth.providers.qq_connect.client_secret
    end

    if ::Settings.oauth.providers.google.enabled
      devise_config.omniauth :google,
        ::Settings.oauth.providers.google.client_id,
        ::Settings.oauth.providers.google.client_secret
    end

    # ==> Warden devise_configuration
    # If you want to use other strategies, that are not supported by Devise, or
    # change the failure app, you can devise_configure them inside the devise_config.warden block.
    #
    # devise_config.warden do |manager|
    #   manager.intercept_401 = false
    #   manager.default_strategies(:scope => :user).unshift :some_external_strategy
    # end

    ####  fail app  ######################
    devise_config.warden do |user|
      user.failure_app = ::LoyalPassport::Controllers::CustomFailureApp
    end


    # ==> Mountable engine devise_configurations
    # When using Devise inside an engine, let's call it `MyEngine`, and this engine
    # is mountable, there are some extra devise_configurations to be taken into account.
    # The following options are available, assuming the engine is mounted as:
    #
    #     mount MyEngine, at: "/my_engine"
    #
    # The router that invoked `devise_for`, in the example above, would be:
    # devise_config.router_name = :my_engine
    #
    # When using omniauth, Devise cannot automatically set Omniauth path,
    # so you need to do it manually. For the users scope, it would be:
    # devise_config.omniauth_path_prefix = "/my_engine/users/auth"

    devise_config.router_name = :loyal_passport_app
  end
end

