require "pry"
class Waiter

    attr_accessor :name, :years_of_exp

    @@all = []

    

    def initialize(name, years_of_exp)
        @name = name
        @years_of_exp = years_of_exp

        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        waiter_meals = Meal.all.select do |meal|
            meal.waiter == self
        end
        waiter_meals.select do |meal|
            meal.waiter
        end 
    end

    def best_tipper
        biggest_tip = 0
        biggest_tipper = nil
        self.meals.each do |meal|
            if meal.tip > biggest_tip
                biggest_tip = meal.tip
                biggest_tipper = meal.customer
            end
        end
        biggest_tipper
    end


   
end