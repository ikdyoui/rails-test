sudo su - postgres -c 'createuser rails-test'
sudo su - postgres -c 'createdb rails-test_development'
export RAILS_ENV=development
bundle exec rake db:create 
bundle exec rake db:migrate

