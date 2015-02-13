# Ruby on Rails Sample Blog Application
## Dependencies

- Runs under Rails 4.0.3

## Terminologies Used

- Rails 4 Framework
- Rspec, Cucumber(Behavior Driven Development)
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
- Full Text Search 
- OmniAuth Google OAuth2

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

Start the Solr server by running:

```ruby
rake sunspot:solr:start
```

and go to http://localhost:3000/

### Set Up the Database

You'll need to be in the application root directory:

```ruby
$ cd blog
```

You'll need to edit the database.yml

```
config/database.yml
```
Load a schema.rb file into the database

```
rake db:schema:load
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

### Running Cucumber

Prepare the test database

To run the Cucumber examples:

```ruby
$ cucumber
```
