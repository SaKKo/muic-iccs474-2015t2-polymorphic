class MyCustomer < ActiveRecord::Base
  belongs_to :tradeable, polymorphic: true
  validates :tradeable, presence: true
end
