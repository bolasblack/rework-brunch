# rework-brunch

Adds [Rework](https://github.com/visionmedia/rework) support to [brunch](http://brunch.io).

## Usage

Add `"rework-brunch": "git://github.com/bolasblack/rework-brunch.git"` to your `package.json` (in the "dependencies" section), or run command `npm install git+ssh://git@github.com:bolasblack/rework-brunch.git --save` in project folder.

### Options

```coffeescript
config =
  plugins:
    rework:
      whitespace: false            # compile with css-whitespace
      mixins: true                 # compile with plugin rework-mixins
      extensions: ['re', 'rework'] # watched file extensions
      import: true                 # compile with plugin rework-import
      basedir: 'app/styles'        # file folder setting for plugin rework-import
      config: (css, rework) ->     # custom configure
```

## Links

* [Rework](https://github.com/visionmedia/rework)
* [rework-import](https://github.com/bolasblack/rework-import)
* [rework-mixins](https://github.com/visionmedia/rework-mixins)

## License

The MIT License (MIT)

Copyright (c) 2012-2013 bolasblack (http://plafer.info)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

