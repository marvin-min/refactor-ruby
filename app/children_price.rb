# children movie price
require File.expand_path('../price', __FILE__)
class ChildrenPrice
  include Price
  def charge(days_rented)
    days_rented > 3 ? (1.5+(days_rented - 3) * 1.5) : 1.5
  end
end
