module Blogsoso
  class Engine < ::Rails::Engine
    isolate_namespace Blogsoso

    config.generators do |g|
      g.test_framework :rspec, :view_specs => true
    end

  end
end
