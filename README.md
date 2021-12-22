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

### Setup your database 

```ruby
rails db:setup

rails db:migrate 
```

</br>

### Setting up an articles route 

```ruby
# Let's start by adding a route to our routes file, config/routes.rb, 
at the top of the Rails.application.routes.draw block:

Rails.application.routes.draw do
  get "/articles", to: "articles#index"
end

# The route above declares that GET /articles requests are 
mapped to the index action of ArticlesController.
```

```ruby
# To create ArticlesController and its index action, 
we'll run the controller generator (with the --skip-routes option because we already have an appropriate route):

$ bin/rails generate controller Articles index --skip-routes


# Let's open app/views/articles/index.html.erb, and replace its contents with:

<h1>Articles page!</h1>
```
</br>

### Setting up the home page

```ruby 
# Let's open config/routes.rb, and add the following root route to the top of the Rails.application.routes.draw block:

Rails.application.routes.draw do
  root "articles#index"

  get "/articles", to: "articles#index"
end

# Now we can see our "Articles page" text when we visit http://localhost:3000, 
confirming that the root route is also mapped to the index action of ArticlesController.
```

</br>

### Generating a model

```ruby 
bin/rails generate model Article title:string body:text

# This is saying generate a model with the name Article, with a string title and a text body 

# Model names are singular, because an instantiated model represents a single data record.

# this creates two files, a migration file (db/migrate/<timestamp>_create_articles.rb) and the model file (app/models/article.rb).
```

</br>

#### Results of the model explained
The call to create_table specifies how the articles table should be constructed. By default, the create_table method adds an id column as an auto-incrementing primary key. So the first record in the table will have an id of 1, the next record will have an id of 2, and so on.

Inside the block for create_table, two columns are defined: title and body. These were added by the generator because we included them in our generate command (bin/rails generate model Article title:string body:text).

On the last line of the block is a call to t.timestamps. This method defines two additional columns named created_at and updated_at. As we will see, Rails will manage these for us, setting the values when we create or update a model object.

</br>

### Migrate the database
```ruby
$ bin/rails db:migrate

# we can now interact with the table using our model 
```

</br>

### Using rails console to interact with the database

```ruby 
$ bin/rails console

# At this prompt, we can initialize a new Article object:
irb> article = Article.new(title: "Blessing checking in", body: "Excited to start learning Rails")

# It's important to note that we have only initialized this object. This object is not saved to the database at all. It's only available in the console at the moment. To save the object to the database, we must call save:
irb> article.save
=> true

irb> article 
=>  #<Article:0x00000001368142f0
 id: 1,
 title: "Blessing checking in",
 body: "Excited to start learning Rails",
 created_at:
  Wed, 22 Dec 2021 20:59:45.424206000 UTC +00:00,
 updated_at:
  Wed, 22 Dec 2021 20:59:45.424206000 UTC +00:00> 

irb> Article.find(1)

irb> Article.all
```

</br>

### Showing a list of articles

```ruby
# In app/controllers/articles_controller.rb, and change the index action to fetch all articles from the database:

class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
end

We can reference @articles in app/views/articles/index.html.erb
```

</br>

### Showing a single article

```ruby
# adding a new route that maps to a new controller action

get "/articles/:id", to: "articles#show"


# In the app/controllers/articles_controller.rb you can add the show action

  def show
    @article = Article.find(params[:id])
  end

# Create a show.html.erb that can show the single article title and body 

<h1><%= @article.title %></h1>

<p><%= @article.body %></p>

# Link each article's title in the index view to its page 
    <a href='/articles/<%= article.id %>'><button>Article title</button></a>

```

</br>

### Incorporating Resourceful routing 

```ruby 
# You can use **resources** in rails that maps all the conventional routes for a collection of resources eg the create, read, update and delete (CRUD) routes

Rails.application.routes.draw do
  root "articles#index"

  resources :articles
end

# the link_to helper renders a link with its first argument as the link's text 
# the second argument is where the link is going to 

<%= link_to article.title, article %>

# This will show th article title as the link text and when that is clicked the link will go to the article_path (which is the articles#index - all articles)

```

