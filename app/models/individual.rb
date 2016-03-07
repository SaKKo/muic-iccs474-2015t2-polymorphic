class Individual < ActiveRecord::Base
  has_one :my_customer, as: :tradeable

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
