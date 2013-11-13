sysPath = require 'path'
extend = require 'extend'

rework = require 'rework'
mixinsPlugin = require 'rework-mixins'
importPlugin = require 'rework-import'
whitespaceCompiler = require 'css-whitespace'

module.exports = class ReworkPlugin
  brunchPlugin: true
  type: 'stylesheet'
  pattern: /.*/

  defaultConfig:
    whitespace: false
    mixins: true
    extensions: ['re', 'rework']
    import: true
    basedir: 'app/styles'
    config: (css, rework) ->

  constructor: (config) ->
    @config = config
    @reworkConfig = extend {}, @defaultConfig, @config.plugins?.rework
    null

  isValidFile: (path) ->
    sysPath.extname(path).replace(/^\./, '') in @reworkConfig?.extensions

  getDependencies: (data, path, callback) ->
    unless @reworkConfig.import and @isValidFile(path)
      callback null, []
      return

    parent = sysPath.dirname path
    deps = data.split('\n')
      .map (line) ->
        line.match /^\s*@import\s+['"]?([^'"]+)['"]?/
      .filter (matchs) ->
        matchs?.length > 0
      .map (matchs) ->
        matchs[1]
      .filter(@isValidFile.bind(this))
      .map (path) ->
        if path[0] is '/'
          # @import '/app/styles/app.re';
          sysPath.join @config.paths.root, path[1..]
        else
          # @import './app.re';
          sysPath.join parent, path

    callback null, deps

  compile: ({data, path}, callback) ->
    return callback(null, data) unless @isValidFile(path)

    result = error = null

    if @reworkConfig.whitespace
      data = whitespaceCompiler data

    try
      css = rework(data)
      css.use(rework.mixin mixinsPlugin) if @reworkConfig.mixins

      importPluginConfig = basedir: @reworkConfig.basedir
      if @reworkConfig.whitespace
        importPluginConfig.preprocesser = whitespaceCompiler
      css.use(importPlugin importPluginConfig) if @reworkConfig.import

      @reworkConfig.config? css, rework

      result = css.use(rework.extend())
        .use(rework.ease())
        .use(rework.references())
        .use(rework.colors())
        .toString()
    catch err
      error = err
    finally
      callback error, result

