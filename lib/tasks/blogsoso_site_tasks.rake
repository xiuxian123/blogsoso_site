# -*- encoding : utf-8 -*-
namespace :blogsoso_site_tasks do

  def system *args
    puts ""
    puts "#{args.join("\n")}" if Rails.env.development?
    super *args
    if $? != 0 then throw "system: error. when exec: #{args.join("\n")}" end
  end

  desc "run after deploy"
  task :run_after_deploy => :environment do
    puts "run after deploy start -------------------------------"

    puts "run after deploy finish ------------------------------"
  end

  desc "run before deploy"
  task :run_before_deploy => :environment do
    puts "run before deploy start -------------------------------"

    puts "run before deploy finish ------------------------------"
  end

  desc 'Creates a non-digest version of all the digest assets'
  task :hotfix_rails4_assets => :environment do
    require 'fileutils'
    regexp = /(-{1}[a-z0-9]{32}*\.{1}){1}/

    assets = File.join(Rails.root, 'public', ::BlogsosoSite::Application.config.assets.prefix, "**/*")

    Dir.glob(assets).each do |file|
      if File.directory?(file)
        next
      end

      unless File.exists?(file)
        next
      end

      next unless file =~ regexp

      source = file.split('/')
      source.last.gsub!(regexp, '.')

      non_digest = File.join(source)

      # puts "#{non_digest}"

      if File.file?(non_digest)
        File.delete(non_digest) 
      end

      if File.file?(file)
        FileUtils.cp(file, non_digest)
      end
    end
  end

end
