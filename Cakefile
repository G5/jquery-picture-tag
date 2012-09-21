fs = require 'fs'

{print} = require 'util'
{spawn, exec} = require 'child_process'

COFFEE_FILES = [
  "rp.coffee",
  "rp/picture.coffee",
  "rp/img.coffee",
  "rp/sources.coffee",
  "rp/source.coffee",
  "rp/media.coffee",
]

SPEC_FILES = [
  "rp_spec.coffee",
  "rp/picture_spec.coffee",
  "rp/img_spec.coffee",
  "rp/sources_spec.coffee",
  "rp/source_spec.coffee",
  "rp/media_spec.coffee",
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
  outputFilename = "responsive_picture.js"
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
  outputFilename = "responsive_picture_spec.js"
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
