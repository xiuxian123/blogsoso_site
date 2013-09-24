# Development Note

## init

* init project

    rails new blogsoso_site -d mysql

    cd blogsoso_site
    vim .gitignore

    git init && git commit -m 'init commit'

* init gems

  * rails_config
      
      rails g rails_config:install

  * rspec

      rails g rspec:install
      # rails g rspec:observer

  * kaminari

      rails g kaminari:config
      rails g kaminari:views

* init loyals

