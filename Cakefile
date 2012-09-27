fs = require 'fs'

{print} = require 'util'
{spawn, exec} = require 'child_process'

COFFEE_FILES = [
  "picture_tag.coffee",
  "picture_tag/picture.coffee",
  "picture_tag/img.coffee",
  "picture_tag/sources.coffee",
  "picture_tag/source.coffee",
  "picture_tag/media.coffee",
]

SPEC_FILES = [
  "picture_tag_spec.coffee",
  "picture_tag/picture_spec.coffee",
  "picture_tag/img_spec.coffee",
  "picture_tag/sources_spec.coffee",
  "picture_tag/source_spec.coffee",
  "picture_tag/media_spec.coffee",
]

task "spec", "Watch for changes in src and update development package", ->
  compileSrc(true)
  compileSpec()

task "release", "Package for distribution and tag the git repo with the version number", ->
  fs.readFile 'VERSION', 'utf8', (err, data) ->
    throw err if err
    version = data
    emptyLib()
    compileSrc(false, version)
    execute "git", ["tag", "v#{data}"]
    execute "git", ["push", "--tags"]

emptyLib = ->
  execute "rm", ["-r", "lib"]

compileSrc = (development, version = null) ->
  outputFilename = "jquery-picture-tag"
  outputFilename += if version then "-#{version}.js" else ".js"
  behavior = if development then "--watch" else "--compile"
  outputPath = if development then "development/lib" else "lib"
  options = [
    "--join",
    outputFilename,
    behavior,
    "--output",
    outputPath
  ]
  # Add files to compile in proper order
  options.push "src/#{file}" for file in COFFEE_FILES
  execute "coffee", options, ->
    markVersion("#{outputPath}/#{outputFilename}", version)

markVersion = (file, version) ->
  comment = """
    /*
      jQuery Picture Tag #{version}
      Built by Jessica Lynn Suttles: https://github.com/jlsuttles
      Built by Bookis Smuin: https://github.com/bookis
      Details and source: https://github.com/g5/jquery-picture-tag
      Demo: https://g5.github.com/jquery-picture-tag/development/example.html
    */

    """
  tmpFile = "#{file}.tmp"
  exec "echo \"#{comment}\" | cat - #{file} > #{tmpFile} && mv #{tmpFile} #{file}"

compileSpec = () ->
  outputFilename = "jquery-picture-tag-spec.js"
  outputPath = "development/spec"
  options = [
    "--join",
    outputFilename,
    "--watch",
    "--output",
    outputPath
  ]
  # Add files to compile in proper order
  options.push "spec/#{file}" for file in SPEC_FILES
  execute "coffee", options

execute = (command, options, callback = null) ->
  command = spawn command, options
  command.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  command.stdout.on 'data', (data) ->
    print data.toString()
  command.on 'exit', (code) ->
    callback?() if code is 0
