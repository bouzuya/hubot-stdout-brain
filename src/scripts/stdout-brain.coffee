# Description
#   A Hubot script for dumping the contents of the brain.
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_STDOUT_BRAIN_QUIET
#
# Commands:
#   None
#
# Author:
#   bouzuya <m@bouzuya.net>
#
module.exports = (robot) ->
  {inspect} = require 'util'
  QUIET = process.env.HUBOT_STDOUT_BRAIN_QUIET

  log = (message) ->
    console.log message unless QUIET

  # #mergeData or #set
  robot.brain.on 'loaded', (data) ->
    log 'stdout-brain(loaded):' + inspect(data)

  # #save
  robot.brain.on 'save', (data) ->
    log 'stdout-brain(save):' + inspect(data)

  # #close
  robot.brain.on 'close', ->
    log 'stdout-brain(close)'

  log 'stdout-brain(load)'
  robot.brain.mergeData {}
