class Company < ActiveRecord::Base
  has_one :my_customer, as: :tradeable
  after_save :ensure_my_customer
  # after_initialize :set_default_value
  #
  # def set_default_value
  #   self.unique_key ||= "qwertyuiop"
  # end

  def ensure_my_customer
    if self.my_customer.nil?
      my_customer = MyCustomer.new(number: "#{self.class}-#{self.class.count}")
      my_customer.tradeable = self
      my_customer.save!
    end
  end

  def description
    "#{self.tax_number}"
  end
end
