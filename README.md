# Ruby on Rails Sample Blog Application
## Dependencies

- Runs under Rails 4.0.3

## Terminologies Used

- Rails 4 Framework
- Rspec(Behavior Driven Development)
- Active Record Associations
- Active Record Validations
- Asset Pipeline
- Action Mailer
- Twitter bootstrap
- Jquery-rails
- Jquery Data table
- Simple form
- Less
- Devise
- Papertrail
- Ajax


### More Information
[Click here] to visit Application

[Click here]:http://rohitblog.herokuapp.com/

### Get It

The source code is managed with Git (a version control system) and hosted at GitHub.

You can download the app ("clone the repository") with the command

    $ git clone https://github.com/rohitpbhore/sample_blog_app.git


### Getting Started

Start the server

```
$ rails server
```

and go to http://localhost:3000/

### Set Up the Database

You'll need to be in the application root directory:

```ruby
$ cd origin_restful_authentication
```

You can use the default settings if you're using SQLite.

```ruby
$ cp config/database.sample.yml config/database.yml
```

If you're using MySQL or PostgreSQL, you'll need to edit the file

```
config/database.yml
```

### Running RSpec

RSpec is a framework for creating specifications and testing a Rails web application.

You can run RSpec "stories" to see the specifications for the application's behavior. You can run RSpec "examples" to verify the application is behaving as intended at the object level.

You must prepare the test database before running RSpec:

```ruby
$ rake db:test:clone
$ rake db:test:prepare
```

which takes a schema dump from the development database and uses it to create a test database. (If you're modifying the app, you'll need to do that after every migration.)

To run the RSpec examples:

```ruby
$ rake spec
```
