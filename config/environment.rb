require 'bundler/setup'
require 'date'
Bundler.require
require_all 'app'


bob = User.new("Bob")
terry = User.new("Terry")
sue = User.new("Sue")

pasta = Recipe.new("Pasta")
stew = Recipe.new("Stew")
jerky = Recipe.new("Beef Jerky")
strog = Recipe.new("Stronganoff")
pretzels = Recipe.new("Pretzels")
rabbit = Recipe.new("Rabbit")

salt = Ingredient.new("Salt")
pepper = Ingredient.new("Pepper")
onion = Ingredient.new("Onion")
fish = Ingredient.new("Fish")
beef = Ingredient.new("Beef")
noodle = Ingredient.new("Noodle")
cream = Ingredient.new("Cream")
potato = Ingredient.new("Potato")
broth = Ingredient.new("Broth")
dough = Ingredient.new("Dough")
raw_rabbit = Ingredient.new("Rabbit")

pasta_ingredients = [salt, pepper, beef, noodle]
stew_ingredients = [beef, broth, onion]

jerky_ingredients = [beef, salt]
strog_ingredients = [noodle, beef, cream]
pretzels_ingredients = [salt, dough, fish]
rabbit_ingredients = [raw_rabbit, salt, onion]

pasta.add_ingredients(pasta_ingredients)
stew.add_ingredients(stew_ingredients)
jerky.add_ingredients(jerky_ingredients)
strog.add_ingredients(strog_ingredients)
pretzels.add_ingredients(pretzels_ingredients)
rabbit.add_ingredients(rabbit_ingredients)

bob.add_recipe_card(pasta, "2018-05-03 14:10:11 UTC", 3)
bob.add_recipe_card(stew, "2018-06-06 14:10:11 UTC", 4)
bob.add_recipe_card(strog, "2018-05-08 14:10:11 UTC", 1)

terry.add_recipe_card(pasta, "2018-03-010 14:10:11 UTC", 6)

sue.add_recipe_card(pasta, "2018-01-02 14:10:11 UTC", 8)
sue.add_recipe_card(pretzels, "2018-04-23 14:10:11 UTC", 4)

# user.declare_allergen

bob.declare_allergen(fish)
bob.declare_allergen(noodle)
bob.declare_allergen(dough)

sue.declare_allergen(salt)
sue.declare_allergen(dough)

terry.declare_allergen(dough)







# RecipeIngredient.new(recipe, ingredient)
