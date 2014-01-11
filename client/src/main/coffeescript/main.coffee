###
  Main configures requirejs and begins the application load

  The application startup flow is like this main -> app -> bootstrap
    main configures requirejs (among other things)
###
window.loggingLevel = 'all'
requirejs.config
  #append timestamp to resource requests to prevent caching
  # urlArgs: "b=#{(new Date()).getTime()}"

  #define shortcuts to various modules
  paths:
    c:"controllers"
    d:"directives"
    s:"services"
    f:"filters"
    p:"providers"
    m:"mixins"
    r:"resources"
    jquery: 'vendor/managed/jquery/jquery'
    domReady: 'vendor/managed/requirejs-domready/domReady'
    angular: 'vendor/managed/angular/angular'
    angularRoute: 'vendor/managed/angular-route/angular-route'
    angularResource: 'vendor/managed/angular-resource/angular-resource'
    underscore: 'vendor/managed/underscore-amd/underscore'

  #Non-compliant AMD modules are explicitly defined here along with their dependencies
  shim:
    'angularResource':
      deps: ['angular']
    'angular':
      exports: 'angular'
      deps: ['jquery']
    'angularRoute':
      deps: ['angular']
    'bootstrap':
      deps: ['app']

  priority: ["angular"]

#Begin loading the application.
#Also wire routes here since providers aren't available once the injector is created
require [
  'app'
  'bootstrap'
  'c/bar'
],
(app) ->

  routes = ($routeProvider) ->
    $routeProvider.when('/bar', {
      templateUrl: '/html/bar.html',
      controller: 'bar'
    }).otherwise({ redirectTo: '/bar' })
  app.config ['$routeProvider', routes]

  app.constant 'recipeTypes',
    DRINK: "DRINK"
    CONDIMENT: "CONDIMENT"