# bundle exec rake assets:clean
# bundle exec rake assets:precompile RAILS_ENV=development
bundle exec rake assets:precompile RAILS_ENV=production
git add public/assets/
git add public/javascripts/
git commit -m "deploy"
git push
git push heroku master
