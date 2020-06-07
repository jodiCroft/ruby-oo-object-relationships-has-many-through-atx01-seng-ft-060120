require "pry"

class Customer

    attr_reader :name, :age

    @@all = []
  
    def initialize(name, age)
        @name = name
        @age = age

        @@all << self
    end


    def self.all
        @@all
    end

    def new_meal(waiter, total, tip)
        Meal.new(waiter, self, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.customer == self
        end
    end

    def waiters
        customers = Meal.all.select do |meal|
           meal.customer == self
        end
        customers.map do |customer|
            customer.waiter
        end
    end






end