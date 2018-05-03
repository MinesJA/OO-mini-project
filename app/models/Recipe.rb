class Recipe
  attr_reader :name, :recipe

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end


  def self.all
    @@all
  end


  def recipe_cards
    RecipeCard.all.select do |recipecard|
      recipecard.recipe == self
    end
  end
  # => [<RecipeCard 2390u23oo2382 @user>, <RecipeCard 203942jg223 @user>, <RecipeCard 928j3fo28j @user>]

  def users
    self.recipe_cards.map do |recipecard|
      recipecard.user
    end
  end


  def self.most_popular
    # should return the recipe instance with the highest number of users (the recipe that has the most recipe cards)
    self.all.max_by do |recipe|
      recipe.recipe_cards.count
    end
  end

  def recipe_ingredients
    RecipeIngredient.all.select do |recipeingredient|
      recipeingredient.recipe == self
    end
  end


  def ingredients
    # should return all of the ingredients in this recipe
    self.recipe_ingredients.map do |recipeingredient|
      recipeingredient.ingredient
    end
  end


  def allergens
    # should return all of the ingredients in this recipe that are allergens
    self.ingredients.select do |ingredient|
      ingredient.allergens.any?
    end
  end


  def add_ingredients(array_ingredients)
    # should take an array of ingredient instances as an argument, and associate each of those ingredients with this recipe
    array_ingredients.each do |ingredient|
      RecipeIngredient.new(self, ingredient)
    end
  end


end
