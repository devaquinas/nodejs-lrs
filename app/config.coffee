# All configuration should be stored here.

module.exports =
  version: '0.0.1'
  database: # couchDB
    host: 'localhost'
    port: 5984
    name: 'nodejs-lrs'
    reset: false
  server: # REST server (xAPI)
    port: 8080
    name: 'nodejs-lrs'
    xApiVersion: '1.0.1'
    xApiVersionRange: '1.0.x'
    oauth: false
    routePrefix: '/api'
  logger:
    file: 'log.txt'
    level: 'error'
  lrs:
    statementsLimit: 1000
