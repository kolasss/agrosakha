# Agro14

This application was generated with the "rails_apps_composer":https://github.com/RailsApps/rails_apps_composer gem provided by the "RailsApps Project":http://railsapps.github.com/.

## Ruby on Rails

This application requires:

* Ruby version 2.2.0
* Rails version 3.2.21

## Деплой

- установил rbenv, ruby

- Для загрузки и обработки изображений нужен imagemagick:
	sudo apt-get install imagemagick libmagickcore-dev

- install postgresql 9.3

	http://wiki.postgresql.org/wiki/Apt

- create user for postgresql

- echo "gem: --no-document" > ~/.gemrc

- export RAILS_ENV=production >> ~/.bashrc 

- для истории команд в irb

~/.irbrc
```
require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"
```

	bundle install --deployment --binstubs
	rake db:setup

- настроить thin service
- настроить nginx

- насторить logrotate


### Clockwork
