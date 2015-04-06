log = require("debug")("react-test:")
memwatch = require "memwatch"
memwatch.on "leak", (info) ->
  log "onleak", info

reacta = require("reacta")({
  env: "development"
  threads: 1
  minify: false
  express:
    port: 6655
  name: 'site'
  'static': './public'
  layouts:
    'main': './layouts/main'
  browserify:
    extensions: [".js", ".coffee", ".json", ".cjsx", ".cson"]
    globalshim: {}
    #  react: 'React || React'
    #  "react-router": "window.ReactRouter"

  modules: []
  api:
    get:
      '/api/testhit': ['/testhit']
    post:
      '/api/testhit': ['/testhit']

  apps:
    'index':
      disableServerRenderer: false
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
