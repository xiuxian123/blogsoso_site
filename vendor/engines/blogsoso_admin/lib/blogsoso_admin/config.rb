# -*- encoding : utf-8 -*-
module BlogsosoAdmin
  # BlogsosoAdmin.configure do |config|
  #   config.
  # end

  class << self
    attr_accessor :config

    def configure
      yield self.config ||= Config.new
    end
  end

  class Config
    def initialize
    end

    def admin_view_path
      "#{File.dirname(__FILE__)}/../../app/loyal_views"
    end

  end
end

