class Financer < ActiveRecord::Base
  has_one :my_customer, as: :tradeable
end
