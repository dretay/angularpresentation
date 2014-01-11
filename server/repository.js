function RecipeRepository() {
    this.recipes = [];
    this.nextId = 1;
}

RecipeRepository.prototype.find = function (id) {
    var recipe = this.recipes.filter(function(item) {
        return item.recipeId == id;
    })[0];
    if (null === recipe) {
        throw new Error('recipe not found');
    }
    return recipe;
};

RecipeRepository.prototype.findIndex = function (id) {
    var index = null;
    this.recipes.forEach(function(item, key) {
        if (item.recipeId == id) {
            index = key;
        }
    });
    if (null === index) {
        throw new Error('recipe not found');
    }
    return index;
};

RecipeRepository.prototype.findAll = function () {
    return this.recipes;
};

RecipeRepository.prototype.save = function (recipe) {
    if (recipe.recipeId === undefined ||recipe.recipeId === null || recipe.recipeId === 0) {
        console.log("recipe does not exist! "+JSON.stringify(recipe));
        recipe.recipeId = this.nextId;
        this.recipes.push(recipe);
        this.nextId++;
    } else {
        console.log("recipe exists!");
        var index = this.findIndex(recipe.recipeId);
        this.recipes[index] = recipe;
    }
    return recipe;
};

RecipeRepository.prototype.remove = function (id) {
    var index = this.findIndex(id);
    this.recipes.splice(index, 1);
};

module.exports = RecipeRepository;