Traducto [![Build Status](https://secure.travis-ci.org/alchimikweb/traducto.png?branch=master)](http://travis-ci.org/alchimikweb/traducto) [![Code Climate](https://codeclimate.com/github/alchimikweb/traducto.png)](https://codeclimate.com/github/alchimikweb/traducto) [![Coverage Status](https://coveralls.io/repos/alchimikweb/traducto/badge.png)](https://coveralls.io/r/alchimikweb/traducto) [![Gem Version](https://badge.fury.io/rb/traducto.png)](http://badge.fury.io/rb/traducto)
===============

Rails helpers collection to simplify the localization code.

Install
-------

```
gem install traducto
```

or add the following line to Gemfile:

```ruby
gem 'traducto'
```

Usage
-----

This gem will overwrite the helper method ```t``` in Rails. It will mostly stay the same except for the following modifications :

### Lazy Lookup
The lazy lookup will check three more path. Here's the full stack of checkup if you call the following :

```erb
  <%# app/views/persons/index.html.erb %>

  <% t('.title') %>
```

```yaml
  en:
    views:
      persons:
        index:
          title: "Title"
```

This is for text in the persons view that is only present in the index action.

```yaml
  en:
    views:
      persons:
        title: "Title"
```

This is for text in the persons view that can be found in any actions.

```yaml
  en:
    views:
      title: "Title"
```

This is for text that is used in any views.

```yaml
  # Rails default
  en:
    persons:
      index:
        title: "Title"
```

The reason I add the ```views``` key in front of ```persons``` is to clearly separate the translations of the views, models and helpers.

### Recycle text for particular action
If you want to reuse text of an action in a different context, for instance, if you are in the action create
but you want to use the text of the new action. You can call the following on top of your view :

```erb
  <%# app/views/persons/create.html.erb %>

  <% use_translations_of 'new' %>
```

### Formatting
You can also provide the format options to wrap the content by paragraphs.

```yaml
  en:
    description:
      intro: "Let me start by ..."
      main:
        - "A lot of ..."
        - "Paragraphs that needs to be ..."
        - "Separated by p tags."
```

```ruby
  t('description.intro', format: nil)
  # => Let me start by

  t('description.intro', format: :text)
  # => <p>Let me start by</p>

  t('description.main', format: :text)
  # => <p>A lot of ...</p><p>Paragraphs that needs to be ...</p><p>Separated by p tags.</p>
```


Copyright
---------

Copyright (c) 2013 [Alchimik](http://www.alchimik.com). See [LICENSE](LICENCE) for further details.
