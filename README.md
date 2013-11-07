Traducto
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

  t('.title')
```

```yaml
  en:
    views:
      persons:
        index:
          title: "Title"
```

```yaml
  en:
    views:
      persons:
        title: "Title"
```

```yaml
  en:
    views:
      title: "Title"
```

```yaml
  # Rails default
  en:
    persons:
      index:
        title: "Title"
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
  t('description.intro', format: :text)
  #--> <p>Let me start by</p>

  t('description.main', format: :text)
  #--> <p>A lot of ...</p><p>Paragraphs that needs to be ...</p><p>Separated by p tags.</p>
```


Copyright
---------

Copyright (c) 2013 Alchimik. See LICENSE for further details.
