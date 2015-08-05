express = require 'express'
reacta = require "reacta"
app = express()

ECT = require('ect')
ectRenderer = ECT({ watch: true, root: __dirname + '/views', ext : '.ect' })
app.set('view engine', 'ect')
app.engine('ect', ectRenderer.render)



rc = reacta {
  static: "/libs"
  env: "development"
  components: "components"
  webpack:
    resolve:
      extensions: ['', '.js', '.cjsx', '.coffee']
    module:
      loaders: [
        { test: /\.cjsx$/, loaders: ['coffee', 'cjsx'] },
        { test: /\.coffee$/, loader: 'coffee' }
      ]
}


app.use express.static(__dirname + '/public')
rc.static(express, app);




app.get '/', rc.create "home", {
  view: "main"
  props: {}
  templateProps: {}
  dependencies: ["./next"]
}
app.get '/test', rc.create "sub/test", {
  view: "main"
  props: {}
  templateProps: {}
  dependencies: ["./home"]
}
# app.get '/next', rc.create "sub/next", {
#   view: "main"
#   props: {}
#   templateProps: {}
# }
# app.get '/broken', rc.create "broken", {
#   view: "main"
#   props: {}
#   templateProps: {}
# }

rc.compile().then () ->
  console.log "listening on 3030"
  app.listen(3030)
