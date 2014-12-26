class Employee < ActiveRecord::Base
  belongs_to :position

  validates :position, presence: true

  validates :name, presence: true
  validates :surname, presence: true

  validates :username, presence: true, length: { minimum: 5, maximum: 20 }

end
