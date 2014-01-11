define [
  "angular"
  "angularMocks"
  "app"
  'd/condiment'
],
(angular, mocks, app) ->
  describe "Unit::Directives Condiment", ->

    scope = null
    elm = null

    beforeEach angular.mock.module('app')

    beforeEach module 'templates'

    beforeEach inject ($rootScope,$compile)->
      elm = angular.element('<form name="form"><condiment recipe="recipe" save=""></condiment></form>')
      scope = $rootScope

      scope.recipe =
        title: "sarsaparilla"
        recipeId: 1
        type: "CONDIMENT"

      $compile(elm)(scope)
      scope.$digest()

    it "should display the title text properly", ->
      chai.expect(elm.html()).to.match(/sarsaparilla/i)