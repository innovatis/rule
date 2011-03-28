module Rule
  class Railtie < Rails::Railtie
    initializer 'rule.initialize' do |app|
      app.config.autoload_paths += ["#{Rails.root}/app/rules/", "#{Rails.root}/app/rule_engines/"]
    end
  end 
end 


