
Promise = require "bluebird"

ReactaService = require "reacta-service"

ReactaServiceExpress = require("reacta-service-express")({
  session:
    secret: "!23"
  })


rsp = require("reacta-service-passport")

ReactaServicePassport = rsp({
  serializeUser: (user, req, done) ->
    err = null
    return done(err, user.id)

  deserializeUser: (id, done) ->
    user = id
    err = null
    return done(err, user)

  logoutPath: "/"
  loginSuccess: "/"
})

facebookStrategy = require("passport-facebook").Strategy
facebookConfig =  {
  clientID: ""
  clientSecret: ""
  callbackURL: "http://localhost:6655/auth/facebook/callback"
}
facebookCallback = (accessToken, refreshToken, profile, done) ->
  return done(null, profile)

ReactaServicePassportFacebook = rsp.createStrategy "facebook", facebookStrategy, facebookConfig, facebookCallback


module.exports = ReactaService [
  ReactaServiceExpress,
  ReactaServicePassport,
  ReactaServicePassportFacebook,
  {
    routes:
      get:
        '/api/testhit': ["passport-authenticate-facebook", '/testhit']
      post:
        '/api/testhit': ['/testhit']

    modules:
      "/testhit": (req, res, next) ->
        console.log "test"
        next()
  }
]
