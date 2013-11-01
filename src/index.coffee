rework = require 'rework'
mixins = require 'rework-mixins'
whitespaceCompiler = require 'css-whitespace'

module.exports = class ReworkPlugin
  brunchPlugin: true
  type: 'stylesheet'
  pattern: /\.re(work)?$/

  constructor: (config) ->
    @config = config.plugins.rework
    null

  #
  # plugins:
  #    rework:
  #      whitespace: true
  #      mixins: false
  #      config: (css, rework) ->
  #
  compile: (data, path, callback) ->
    result = error = null

    if @config.whitespace
      data = whitespaceCompiler data

    try
      css = rework(data)
      css.use(rework.mixin mixins) unless @config.mixins
      @config.config? css, rework

      result = css.use(rework.extend())
        .use(rework.ease())
        .use(rework.references())
        .use(rework.colors())
        .toString compress: @config.compress
    catch err
      error = err
    finally
      callback error, result

