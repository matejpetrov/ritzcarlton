class Guest < ActiveRecord::Base

  belongs_to :employee
  has_many :visits

  validates :guest_name, presence: true
  validates :guest_surname, presence: true

end
