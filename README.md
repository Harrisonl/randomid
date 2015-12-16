# Randomid

RandomId was a gem created partly due to the frustration and partly due to wanting to have a go at creating a gem. Most of the time with a rails app, every model will be referenced in the URL by http://example.com/user/1. This makes it easy for users to know exactly how many of each model you have in the database which can lead to all sorts of problems. Me - I just don't like other users knowing how many objects there are.

This gem therefore makes it so that when an object is created it will generate a randon uid up to 22 characters long that you can use anywhere in your app. For example:

```ruby
#project/config/routes.rb
get 'users/:uid', to: 'users#show'
```


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'randomid'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install randomid

## Usage

Firstly, you need to make sure that each model you want to have a unique identifier for, you add an attribute to that model. 

E.g.
If I wanted the User model to have a unique identifier I would add a "uid" attribute of type string. 

*Note: You can name this attribute whatever you like*

Next navigate to that class's model file and add the following line:

```ruby
class User < ActiveRecord::Base
  unique_identifier :uid, 8
end
```

Where ":uid" is the attribute you created above and "8" is the length of the UID (between 1 - 22 characters).

From there, you are good to go - everytime a new object is created, a unique id will be assigned. **This ID will not clash with any other values in the database**


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/harrisonl/randomid. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

