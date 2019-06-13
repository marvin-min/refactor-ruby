# regular movie price
require File.expand_path('../price', __FILE__)
class RegularPrice
  include Price

  def charge(days_rented)
     days_rented > 2 ? (2 + (days_rented - 2) * 1.5) : 2
  end
end
