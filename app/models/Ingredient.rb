class Ingredient

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def allergens
    Allergen.all.select do |allergen|
      allergen.ingredient == self
    end
  end

  def users
    self.allergens.map do |allergen|
      allergen.user
    end
  end


  def self.most_common_allergen
    # should return the ingredient instance that the highest number of users are allergic to
    self.all.max_by do |ingredient|
      ingredient.users.uniq.count
    end
  end



end
