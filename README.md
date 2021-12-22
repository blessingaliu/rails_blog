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

</br>

Setting up an articles route 

```ruby
# Let's start by adding a route to our routes file, config/routes.rb, at the top of the Rails.application.routes.draw block:

Rails.application.routes.draw do
  get "/articles", to: 
  
  "articles#index"

end

# The route above declares that GET /articles requests are mapped to the index action of ArticlesController.
```

```ruby
# To create ArticlesController and its index action, we'll run the controller generator (with the --skip-routes option because we already have an appropriate route):

$ bin/rails generate controller Articles index --skip-routes


# Let's open app/views/articles/index.html.erb, and replace its contents with:

<h1>Articles page!</h1>
```

Setting up the home page

```ruby 
# Let's open config/routes.rb, and add the following root route to the top of the Rails.application.routes.draw block:

Rails.application.routes.draw do
  root "articles#index"

  get "/articles", to: "articles#index"
end

# Now we can see our "Articles page" text when we visit http://localhost:3000, confirming that the root route is also mapped to the index action of ArticlesController.
```