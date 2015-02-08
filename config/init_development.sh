sudo su - postgres -c 'createuser rails-test'
sudo su - postgres -c 'createdb rails-test_development'
bundle exec rake db:create RAILS_ENV=development
bundle exec rake db:migrate RAILS_ENV=development
