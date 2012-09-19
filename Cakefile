fs = require 'fs'

{print} = require 'util'
{spawn, exec} = require 'child_process'

COFFEE_FILES = [
  "responsive_picture.coffee"
]

SPEC_FILES = [
  "responsive_picture_spec.coffee"
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
