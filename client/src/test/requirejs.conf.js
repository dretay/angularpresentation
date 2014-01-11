var tests = Object.keys(window.__karma__.files).filter(function(file){
  return /Spec\.js$/.test(file);
});

requirejs.config({
  baseUrl: '/base/src/main/coffeescript',
  paths:{
    c:"controllers",
    d:"directives",
    s:"services",
    f:"filters",
    p:"providers",
    m:"mixins",
    r:"resources",
    jquery: 'vendor/managed/jquery/jquery',
    domReady: 'vendor/managed/requirejs-domready/domReady',
    angular: 'vendor/managed/angular/angular',
    angularRoute: 'vendor/managed/angular-route/angular-route',
    angularResource: 'vendor/managed/angular-resource/angular-resource',
    angularMocks: 'vendor/managed/angular-mocks/angular-mocks',
    underscore: 'vendor/managed/underscore-amd/underscore'
  },
  shim:{
    'angularMocks':{
      deps: ['angular'],
      exports: 'angular.mock'
    },
    'angularRoute':{
      deps: ['angular']
    },
    'angular':{
      exports: 'angular',
      deps: ['jquery']
    },
    priority: ["angular"]

  },
  deps: tests,
  callback: window.__karma__.start
});
