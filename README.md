# README

## Project: Blog app

Installing ruby 

```ruby
$ ruby --version

ruby 3.0.2p107
```
</br>

Installing Node.js and Yarn 

```ruby
$ node --version

 brew install yarn

$ yarn --version
```
</br>

Installing Postgres

```ruby
gem install pg
```
</br>

Create application with specific params 

```ruby
rails new app-name -T -d postgresql
```
</br>

Install RSpec 

```ruby
#in Gemfile group :development, :test add 

 gem 'rspec-rails', '~> 5.0.0'

#in command line
bundle install
rails generate rspec:install
```

</br>

Create a Repo in GitHub

In your terminal, connect your local and remote repo 

```ruby
echo "# rails_blog" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/blessingaliu/rails_blog.git
git push -u origin main
```

</br>

Setup your database 

```ruby
rails db:setup

rails db:migrate 
```
