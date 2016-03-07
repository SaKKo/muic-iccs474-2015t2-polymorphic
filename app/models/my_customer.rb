class MyCustomer < ActiveRecord::Base
  belongs_to :tradeable, polymorphic: true
  validates :tradeable, presence: true
  validates :number, presence: true
end
