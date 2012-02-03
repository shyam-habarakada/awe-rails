awe-rails
=========

This gem provides:
* AWE (https://github.com/sambaker/awe-core) integration into the rails 3.1 asset pipeline.

## Rails 3.1

For Rails 3.1 and greater, the files will be added to the asset pipeline and available for you to use. These two lines will be added to the file `app/assets/javascripts/application.js` by default:

    //= require awe

### Installation

This gem adds a single generator to Rails 3.1, awe:install. Running the generator will fetch AWE for Rails.

### Installation

In your Gemfile, add this line:

    gem "awe-rails"

Then, run `bundle install`. To invoke the generator, run:

    rails generate awe:install
    
You're done!