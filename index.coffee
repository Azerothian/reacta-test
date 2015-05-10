log = require("debug")("react-test:")
memwatch = require "memwatch"
memwatch.on "leak", (info) ->
  log "onleak", info

reacta = require("reacta")({
  env: "development"
  threads: 1
  minify: false
  express:
    port: process.env.PORT || 6655
  name: 'site'
  'static': './public'
  layouts:
    'main': './layouts/main'
  browserify:
    extensions: [".js", ".coffee", ".json", ".cjsx", ".cson"]
    globalshim: {}
    #  react: 'React || React'
    #  "react-router": "window.ReactRouter"
  api: "./services"

  apps:
    'index':
      disableServerRenderer: true
      path: '/'
      layout: 'main'
      modules: []
      baseRoute: 'home'
      routes:
        'home':
          components: ['./react/home']
        'test':
          path: 'test'
          components: ['./react/test']
})
