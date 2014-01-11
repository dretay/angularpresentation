var RecipeRepository = require('./repository');
var express = require('express');
var cors = require('cors');
var app = express();
app.use(cors());
var recipeRepository = new RecipeRepository();
app.configure(function () {
    app.use(express.bodyParser());
});

app.get('/recipes', function (request, response) {
    response.json({recipes: recipeRepository.findAll()});
});

app.get('/recipes/:id', function (request, response) {
    var recipeId = request.params.id;
    try {
        response.json(recipeRepository.find(recipeId));
    } catch (exeception) {
        response.send(404);
    }

});

app.post('/recipes', function (request, response) {
    var recipe = request.body;
    recipe = recipeRepository.save({
        title: recipe.title || 'Default title',
        description: recipe.description || 'Default description',
        type: recipe.type || 'DRINK',
        alcoholic: recipe.alcoholic || false,
        complimentary: recipe.complimentary || true
    });
    response.json(recipe);
});

app.put('/recipes/:id', function (request, response) {
    var recipe = request.body;
    var recipeId = request.params.id;
    try {
        var persistedRecipe = recipeRepository.find(recipeId);
        recipeRepository.save({
            recipeId: persistedRecipe.recipeId,
            title: recipe.title || persistedRecipe.title,
            description: recipe.description || persistedRecipe.description,
            type: recipe.type || persistedRecipe.type,
            alcoholic: recipe.alcoholic || persistedRecipe.alcoholic,
            complimentary: recipe.complimentary || persistedRecipe.complimentary
        });
        response.json(recipe);
    } catch (exception) {
        response.send(404);
    }
});

app.delete('/recipes/:id', function (request, response) {
    console.log("delete recipe id "+request.params.id);
    try {
        recipeRepository.remove(request.params.id);
        response.send(200);
    } catch (exeception) {
        response.send(404);
    }
});

app.listen(8080); //to port on which the express server listen