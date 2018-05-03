class User
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end


  def self.all
    @@all
  end

  def recipe_cards
    RecipeCard.all.select {|recipecard| recipecard.user == self }
  end


  def recipes
    # should return all of the recipes this user has recipe cards for
    self.recipe_cards.map {|recipecard| recipecard.recipe}
  end


  def add_recipe_card(recipe, date, rating)
    # should accept a recipe instance as an argument, as well as a date and rating, and create a new recipe card for this user and the given recipe

    RecipeCard.new(recipe, self, date, rating)
  end


  def declare_allergen(ingredient)
    # should accept an ingredient instance as an argument, and create a new allergen instance for this user and the given ingredient

    Allergen.new(self, ingredient)
  end


  def allergens
    # should return all of the ingredients this user is allergic to
    allergens = Allergen.all.select {|allergen| allergen.user == self}
    # => [array of allergens instances]

    allergens.map {|allergen| allergen.ingredient}
  end


  def top_three_recipes
    # should return the top three highest rated recipes for this user.
    recipe_cards = self.recipe_cards.max_by(3){ |recipe_card| recipe_card.rating}

    recipe_cards.map {|recipe_card| recipe_card.recipe}
  end


  def most_recent_recipe
    # should return the recipe most recently added to the user's cookbook.
    self.recipe_cards.max_by { |recipe_card| Date.parse(recipe_card.date)}
  end

  def safe_recipes

    self.recipes.select do |recipe|
      # should return all recipes that do not contain ingredients the user is allergic to

      if recipe.allergens.find {|ingredient| self.allergens.include?(ingredient)} == nil
        true
      else
        false
      end
    end

  end




end
