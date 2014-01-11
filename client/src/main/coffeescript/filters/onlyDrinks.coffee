define [
  'f/filters'
  'underscore'
],
(filters) ->
  'use strict'

  filters.filter 'onlyDrinks', ['recipeTypes', (recipeTypes)-> (recipes) ->
    _.filter recipes, (recipe)->if recipe.type == recipeTypes.DRINK then return true else return false
  ]