# Cappie

An instant capybara/cucumber/rspec/selenium-webdriver configuration for web apps that aren't written in Ruby.

## What does it do?

* Runs your web app in a child process

* Waits for your web app to start (by matching a regex against stdout output)

* Sets up selenium-webdriver to use capybara and rspec expectations

* Points selenium-webdriver at your web app host

* Sets selenium as the default capybara driver

## Install

1. Include cappie in your Gemfile, e.g.

        source 'https://rubygems.org'
    
        gem 'cappie'

2. Install your dependencies via bundler:
    
        > bundle install

3. Ensure your web app can be started with a single command, and that it _writes something predictable to stdout when it is ready to accept requests_.

4. Add cappie into your cucumber environment (features/support/env.rb):
    
        require 'cappie'
    
        Cappie.start(
          command: './serve/my/app --port 8080',
          await: /listening at 8080/,
          host: 'http://localhost:8080',
          driver: :poltergeist,
          environment: { variable: 'value' },
          working_dir: '/some/dir'
        )
    
        (driver, environment and working_dir are optional)

## Usage

Just add cucumber features and step definitions. Your steps can use use capybara, e.g.

    # features/step_definitions/my_app_steps.rb
        
    When /^I open my app$/ do
      visit '/'
    end
    
    Then /^I should see something rendered by my app$/ do
      page.should have_content('Hello from my app')
    end

## Debug

You can see debug output when you set the environment variable `CAPPIE_DEBUG=true`:

```sh
CAPPIE_DEBUG=true cucumber
```
