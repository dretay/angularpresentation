define [
  'c/controllers'
  'underscore'
  's/cookbook'
  'd/drink'
  'f/alcoholicWarning'
  'f/onlyDrinks'
],
(controllers, _) ->
  'use strict'

  controllers.controller 'bar', ['$scope', 'cookbook', 'recipeTypes', ($scope, cookbook, recipeTypes) ->

    $scope.recipes = cookbook.query()

    $scope.delete = (pendingRecipe)->
      pendingRecipe.$delete({id: pendingRecipe.recipeId}).then ->
        $scope.recipes = _.filter $scope.recipes, (recipe)-> if recipe.recipeId == pendingRecipe.recipeId then false else true

    $scope.update = (recipe)->
      recipe.$update
        id: recipe.recipeId
    $scope.addNewRecipe= (recipeType)->
      recipe = new cookbook
        title: "New Recipe"
        description: "Default Description"
        type: recipeType
      recipe.$save().then (recipe)->
        $scope.recipes.push recipe
  ]