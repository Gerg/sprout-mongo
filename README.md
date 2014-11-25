# sprout-Mongo cookbook

[![Build Status](https://travis-ci.org/pivotal-sprout/sprout-exemplar.png?branch=master)](https://travis-ci.org/pivotal-sprout/sprout-exemplar)

Chef Recipes to install and configure Mongo DB on OS X

## Usage

### Prerequisites

- [system ruby](.ruby-version)
- [bundler](http://bundler.io/)

### Quickstart

```
bundle
bundle exec soloist
```

## Cookbook Usage

### Attributes

*NOTE:* All preferences are namespaced under `sprout => mongo` they include:

* `plist_filename` &mdash; The name of the LaunchAgent plist file in the homebrew package to load; default is `'homebrew.mxcl.mongodb.plist'`

### Recipes

1. `sprout-mongo`
1. `sprout-mongo::install_mongo`
1. `sprout-mongo::add_launch_agent`

## Contributing

### Before committing

```
bundle
bundle exec rake
```

The default rake task includes rubocop, foodcritic, unit specs

### [Rubocop](https://github.com/bbatsov/rubocop)

```
bundle
bundle exec rake rubocop
```

### [FoodCritic](http://acrmp.github.io/foodcritic/)

```
bundle
bundle exec rake foodcritic
```

### Unit specs

Unit specs use [ServerSpec](http://serverspec.org/)

```
bundle
bundle exec rake spec:unit
```

### Integration specs

Integrations specs will run the default recipe on the host system (destructive) and make assertions on the system after
install.

*Note:* It has a precondition that exemplar is _not_ already installed on the system.

```
bundle
bundle exec rake spec:integration
```
