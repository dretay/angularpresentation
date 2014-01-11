define [
  'd/directives'
  'm/commonBarItem'
  'jquery'
  'underscore'
  'f/alcoholicWarning'
],
(directives, commonBarItem, $, _) ->
  'use strict'

  directives.directive 'drink', ->
    restrict: 'E'
    replace: false
    templateUrl: '/html/directives/commonBarItem.html'
    scope:
      recipe: "="
      update: "&"
      delete: "&"
    controller: ($scope, $injector, $timeout)->
      $injector.invoke(commonBarItem, @, {$scope: $scope})

