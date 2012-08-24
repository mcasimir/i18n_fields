# I18n Fields

## Translatable fields for [ActiveRecordSchema](https://github.com/mcasimir/active_record_schema)

*I18n Fields* brings multilingual support to ActiveRecordSchema through `globalize3`.

### Installation

``` rb
gem 'i18n_fields'
```

### Usage

``` rb
class Post < ActiveRecord::Base

  field :title, :translatable => true
  field :text, :as => :text, :translatable => true

end
```

### How to generate migrations

For model with translatable fields you should generate an additional migration for translation model

``` bash
rails g migration:from post post/translation
```

Now learn how to use `globalize3` to actually translate your models either reading the [globalize docs](https://github.com/svenfuchs/globalize3) or watching this [Railscast episode](http://railscasts.com/episodes/338-globalize3).

---

Copyright (c) 2012 mcasimir

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
