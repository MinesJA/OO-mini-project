class Allergen
  attr_reader :user, :ingredient

  @@all = []

  def initialize(user, ingredient)
    @user = user
    @ingredient = ingredient
    @@all << self
  end

  def self.all
    @@all
  end

  def ingredients
    Ingredient.all.select do |ingredient|
      ingredient.allergen == self
    end
  end


end
