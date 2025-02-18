class Zoo
    attr_reader :location, :name

    @@all = []

    def initialize(name, location)
        @name = name
        @location = location
        @@all << self
    end 

    def self.all
        @@all
    end

    def animals
        Animal.all.select do |animal|
            animal.zoo == self
        end
    end

    def animal_species
        self.animals.map do |animals|
            animals.species
        end.uniq
    end

    def find_by_species(species)
        self.animals.select do |animal|
            animal.species == species
        end
    end

    def animal_nicknames
        self.animals.map do |animals|
            animals.nickname
        end
    end

    def self.find_by_location(location_find)
        self.all.select do |zoo|
            zoo.location == location_find
        end
    end
end
