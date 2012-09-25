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

task "build", "Package for distribution", ->
  emptyLib()
  compileSrc(false)

task "build:development", "Watch for changes in src and update development package", ->
  compileSrc(true)
  compileSpec()

emptyLib = ->
  execute "rm", ["-r", "lib"]

compileSrc = (development, version = null) ->
  behavior = if development then "-w" else "-c"
  outputPath = if development then "development/lib" else "lib"
  outputFilename = "jquery.picture-tag.js"
  options = [
    "-j",
    outputFilename,
    behavior,
    "-o",
    outputPath
  ]
  # Add files to compile in proper order
  options.push "src/#{file}" for file in COFFEE_FILES
  execute "coffee", options

compileSpec = () ->
  behavior = "-w"
  outputPath = "development/spec"
  outputFilename = "jquery.picture-tag-spec.js"
  options = [
    "-j",
    outputFilename,
    behavior,
    "-o",
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
