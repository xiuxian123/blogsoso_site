# -*- encoding : utf-8 -*-
module Blogsoso
  # Blogsoso.configure do |config|
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

    def passport_view_path
      "#{File.dirname(__FILE__)}/../../app/loyal_views"
    end

    def cancan_abilities
      @cancan_abilities ||= [
        'Blogsoso::Ability'
      ]
    end

    def authoritie_configs
      @authoritie_configs ||= {
        # 'ruby800_juice_bag' => {
        #   :desc => "Ruby800个人主页",
        #   :jobs => {
        #     'review' => '审核'
        #   }
        # },
        # 'ruby800_juice_candy' => {
        #   :desc => 'Ruby800果汁',
        #   :jobs => {
        #     'review'     => '审核',
        #     'categoried' => '分类'
        #   }
        # }
      }
    end

  end
end

