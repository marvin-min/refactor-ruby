#describe a customer's information and the history records
class Customer
  attr_reader :name
  
  def initialize(name)
    @name = name
    @rentals = []
  end

  def add_rental(args)
    @rentals << args
  end

  def html_statement
    result = "<h1>Rental Record for #{@name}\n</h1>"

    @rentals.each do |rental|
      result += "\t" + rental.move.title + "\t" + rental.charge.to_s + "\n"
    end
    result += "Amount owed is #{total_charge}\n"
    result += "You earned #{total_frequent_renter_points} frequents renter points"
    result
  end

  private
  def total_charge
    @rentals.inject(0) {|sum, rental| sum + rental.charge}
    end

  def total_frequent_renter_points
    @rentals.inject(0) {|sum, rental| sum + rental.frequent_renter_points}
  end
end
