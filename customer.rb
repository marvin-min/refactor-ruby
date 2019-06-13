class Customer
  attr_reader :name
  
  def initialize(name)
    @name = name
    @rentals = []
  end

  def add_rental(args)
    @rentals << args
  end

  def statement
    total_amount, frequent_renter_points = 0.0
    result = "Rental Record for #{@name}\n"
    
    @rentals.each do |rental|
      this_amount = rental.charge

      frequent_renter_points += 1

      if rental.move.price_code == Movie::NEW_RELEASE && rental.days_rented > 1
        frequent_renter_points += 1
      end
      result += "\t" + rental.move.title + "\t" + this_amount.to_s + "\n"
      this_amount += this_amount
    end
    result += "Amount owed is #{total_amount}\n"
    result += "You earned #{frequent_renter_points} frequents renter points"
    result
  end
end
