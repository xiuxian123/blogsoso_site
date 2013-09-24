source 'http://rubygems.org'
# source 'http://ruby.taobao.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use mysql as the database for Active Record
gem 'mysql2'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# Use debugger
# gem 'debugger', group: [:development, :test]

group :development, :test do
  gem 'pry'
  gem 'pry-debugger'
end

####################################################################################

#  ERD 配置步骤如下：
#  sudo apt-get install graphviz      # 安装画图的软件 
#  gem install rails-erd                     # 安装gem 
#  配置Gemfile
#  
#  group :development do
#    gem "rails-erd"
#  end
#  bundle install     # 引入gem 
#  rake erd    # 开始画图，会在项目根目录下生成erd.pdf

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'activeresource', '4.0.0', :require => 'active_resource'
gem 'rack-cache'
gem 'protected_attributes'

gem 'capistrano', '2.15.5', :group => :development
gem 'rvm-capistrano', '1.3.4'

####################################################################################
############## start happy add ###########################

gem 'whenever', :require => false

# 一棵树
# gem 'loyal_awesome_nested_set', :require => 'awesome_nested_set'

# =>禁止输出assets日志
gem 'quiet_assets'

# 汉字转换为拼音
gem 'chinese_pinyin'

# rails config
gem 'progress_bar'

############### search #################################
# gem 'acts_as_ferret'

# ########## 中文分词 #################################
# git clone git://github.com/pluskid/rmmseg-cpp.git
# gem 'rmmseg-cpp'

# gem 'sunspot_rails'
# gem 'sunspot_solr'

# gem "eventmachine"

# gem 'RedCloth'

gem 'jquery-ui-rails'

############## end happy add #############################
##########################################################
############# happy vendor here ########################## 
####### gems    ##########################################
  # gem 'loyals', :path => '../../engines/loyals'
  # gem 'tiny_cache', :path => '../../engines/loyals/projects/tiny_cache'
  # gem 'loyal_core', :path => '../../engines/loyals/projects/loyal_core'
  # gem 'loyal_spider', :path => '../../engines/loyals/projects/loyal_spider'

  # gem 'loyal_spider'

#  gem 'loyal_passport', :path => '../../engines/loyals/projects/loyal_passport'
#  gem 'loyal_admin', :path => '../../engines/loyals/projects/loyal_admin'

gem 'loyal_spider',   :github => 'xiuxian123/loyal_spider'
gem 'loyal_admin',    :github => 'xiuxian123/loyal_admin'
gem 'loyal_passport', :github => 'xiuxian123/loyal_passport'
gem 'loyal_core',     :github => 'xiuxian123/loyal_core'
# gem 'loyal_omniauth-google', :github => 'xiuxian123/loyal_omniauth-google'
gem 'loyal_omniauth-qq',         :github => 'xiuxian123/loyal_omniauth-qq'
gem 'loyal_omniauth-github',     :github => 'xiuxian123/loyal_omniauth-github'
gem 'loyals', :github => 'xiuxian123/loyals'

############# happy vendor finish ########################

group :development, :test do
  gem 'magic_encoding'
  gem "magic_encoding"
  gem "rspec-rails"             #测试框架
  gem "rspec"
  gem "factory_girl_rails"
end

group :test do
  gem 'shoulda-matchers'
  gem 'webmock'
  gem 'database_cleaner'
  gem 'capybara'
end

# deploy ################################################
gem 'thin'

# sudo passenger-install-nginx-module
# sudo passenger-install-apache2-module
# gem 'passenger', '4.0.10'

gem 'blogsoso',       :path => "#{File.dirname(__FILE__)}/vendor/engines/blogsoso"
# gem 'blogsoso_admin',       :path => "#{File.dirname(__FILE__)}/vendor/engines/blogsoso_admin"

