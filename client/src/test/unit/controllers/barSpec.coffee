define [
  "angular"
  "angularMocks"
  "app"
  "c/bar"
],
(angular, mocks, app) ->
  describe "Unit::Controllers Testing Bar Controller", ->

    beforeEach ->
      module 'app'
      module ($provide)->
        $provide.constant 'recipeTypes',
          DRINK: "DRINK"
          CONDIMENT: "condiment"
        null

    beforeEach inject ($httpBackend)->
      $httpBackend.whenGET('/recipes/1').respond([])


    it 'should not be null', ->
      chai.expect(app.bar).to.not.equal null

    it 'should have a properly working bar controller', inject ($rootScope, $controller)->
      ctrl = $controller 'bar',
        $scope : $rootScope.$new()
