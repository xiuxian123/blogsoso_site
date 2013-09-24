# -*- encoding : utf-8 -*-
require 'rails_config'

module Blogsoso
  Settings = ::RailsConfig.load_files(
    File.expand_path('../../../config/settings.yml', __FILE__),
    File.expand_path("../../../config/settings/#{Rails.env}.yml", __FILE__),
    File.expand_path("../../../config/settings/#{Rails.env}.local.yml", __FILE__),
    File.expand_path("#{Rails.root}/config/settings/blogsoso.yml", __FILE__),
    File.expand_path("../../../config/settings/blogsoso_#{Rails.env}.yml", __FILE__),
    File.expand_path("../../../config/settings/blogsoso_#{Rails.env}.local.yml", __FILE__)
  )
end
