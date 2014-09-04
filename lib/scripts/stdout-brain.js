module.exports = function(robot) {
  var QUIET, inspect, log;
  inspect = require('util').inspect;
  QUIET = process.env.HUBOT_STDOUT_BRAIN_QUIET;
  log = function(message) {
    if (!QUIET) {
      return console.log(message);
    }
  };
  robot.brain.on('loaded', function(data) {
    return log('stdout-brain(loaded):' + inspect(data));
  });
  robot.brain.on('save', function(data) {
    return log('stdout-brain(save):' + inspect(data));
  });
  robot.brain.on('close', function() {
    return log('stdout-brain(close)');
  });
  log('stdout-brain(load)');
  return robot.brain.mergeData({});
};
