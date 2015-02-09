echo -n "Start init env ?[y/N]> "
read INPUT
case "$INPUT" in
  Y | y | yes ) frag=true  ;;
  * ) frag=false ;;
esac

if [ "$frag" = "true" ]; then
  echo 'Start Job.'
else
  echo 'Cancel Job.'
  return 0
fi

#bundle install --path vendor/bundle --without development test
bundle install --path vendor/bundle --without production
sudo su - postgres -c 'createuser rails-test'
##bundle exec rake db:create RAILS_ENV=production
##bundle exec rake db:create
#sudo su - postgres -c 'createdb rails-test_production'
sudo su - postgres -c 'createdb rails-test_development'
#bundle exec rake db:migrate RAILS_ENV=production
bundle exec rake db:migrate

if [ ! -e config/secrets.yml ]; then
  cat << EOS > config/secrets.yml
development:
  secret_key_base: hogehoge

test:
  secret_key_base: hogehoge

production:
  secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>
EOS
  sed -i 's/hogehoge/'$(bundle exec rake secret)'/g' config/secrets.yml
fi
