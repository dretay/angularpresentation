define [
  'f/filters'
],
(filters) ->
  'use strict'

  filters.filter 'alcoholicWarning', [-> (recipe) ->
    if recipe.alcoholic
      return "☠ #{recipe.title} ☠"
    return recipe.title
  ]