# CSCE431 Lab1 Book Collection

A simple content management system built with Ruby on Rails that implements CRUD actions and a RESTful API. Hosted [here](https://roush-book-collection.herokuapp.com/books).

## Getting Started

These instructions will outline the steps I went through to create this project.

### Prerequisites

- A working command line
- Ruby
- Rails
- PostgreSQL

### Rails Configuration

To create a new Rails app, runn the following command:

```console
foo@bar:~$ rails new app_name -d postgresql
```

To generate my Book model I ran the following command:

```console
foo@bar:~$ rails generate model Book title:string author:string genre:string price:float published_date:timestamp
```

To generate my Books controller I ran the following command:

```console
foo@bar:~$ rails generate controller Books index show new edit delete
```

To add RESTful routes to the app, I added the following code to routes.rb

```ruby
# root
root 'books#index'

#RESTful routes
resources :books do
  member do
    get :delete
  end
end
```

### Heroku Configuration

To configure Heroku, I had to run the following commands:

```console
foo@bar:~$ heroku login
foo@bar:~$ heroku create app_name --ssh-git
foo@bar:~$ heroku keys:add
foo@bar:~$ bundle lock --add-platform x86_64-linux
foo@bar:~$ git push heroku master
foo@bar:~$ heroku run rails db:migrate
foo@bar:~$ heroku open
```

## Authors

* **Michael Roush** - *Project completion*

## License

Copyright © 2020 Michael Roush. All rights reserved.