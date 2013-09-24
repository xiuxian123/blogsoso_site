# -*- encoding : utf-8 -*-
BlogsosoSite::Application.routes.draw do
  mount ::LoyalPassport::Engine,  :at => '/', :as => :loyal_passport_app
  mount ::LoyalAdmin::Engine,     :at => '/', :as => :loyal_admin_app
  mount ::LoyalCore::Engine,      :at => '/', :as => :loyal_core_app

  mount ::Blogsoso::Engine,       :at => '/', :as => :blogsoso_app
  mount ::BlogsosoAdmin::Engine,  :at => '/', :as => :blogsoso_admin_app
end
