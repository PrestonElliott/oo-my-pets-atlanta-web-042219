class Owner
  OWNERS = []

  attr_accessor :name, :pets
  attr_reader :species

  def initialize(species)
    @species = species
    OWNERS << self
    @pets = {:fishes => [], :cats => [], :dogs => []}
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    OWNERS
  end

  def self.count
    OWNERS.count
  end

  def self.reset_all
    OWNERS.clear
  end

  def buy_fish(name)
    pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    pets[:dogs].map {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    pets[:cats].map {|cat| cat.mood = "happy"}
  end

  def feed_fish
    pets[:fishes].map {|fish| fish.mood = "happy"}
  end

  def sell_pets
    pets.each do |species, animals|
      animals.each {|pet| pet.mood = "nervous"}
      animals.clear
    end
  end

  def list_pets
    "I have #{pets[:fishes].count} fish, #{pets[:dogs].count} dog(s), and #{pets[:cats].count} cat(s)."

  end

end