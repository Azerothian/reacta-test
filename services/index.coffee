Promise = require "bluebird"


module.exports = (app) ->
  return new Promise (resolve, reject) ->
    resolve () ->
      {
        "/testhit": (req, res, next) ->
          console.log "test"
          next()
      }
