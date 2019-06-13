# Movie class used to describe a movie
# require '/Users/mmin/workspace/refactor/app/children_price.rb'

require File.expand_path('../children_price', __FILE__)
require File.expand_path('../new_release_price', __FILE__)
require File.expand_path('../regular_price', __FILE__)
class Movie
  REGULAR = 0
  NEW_RELEASE = 1
  CHILDRENS = 2

  attr_reader :title, :price_code

  def initialize(title, price_code)
    @title, self.price_code = title, price_code
  end

  def price_code=(price_code)
    @price_code = price_code
    @price = case price_code
             when REGULAR
               RegularPrice.new
             when NEW_RELEASE
               NewReleasePrice.new
             when CHILDRENS
               ChildrenPrice.new
             end
  end

  def charge(days_rented)
    @price.charge(days_rented)
  end
  def frequent_renter_points(days_rented)
    @price.frequent_renter_points(days_rented)
  end
end