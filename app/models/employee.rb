class Employee < ActiveRecord::Base
  belongs_to :position
  has_many :guests
  has_many :visits

  validates :position, presence: true

  validates :name, presence: true
  validates :surname, presence: true

  validates :username, presence: true, length: { minimum: 5, maximum: 20 }

  #adding an image to the employee model
  mount_uploader :picture, PictureUploader

  validate  :picture_size



  #does three things:
  #save a secure, hashed password_digest attribute to the database
  #two virtual attributes password and password_confirmation, including presence validation upon creation and a validation requiring that they match
  #authenticate method that returns the user when the password is correct(automatically compares the hashed version of what the user entered)            
  has_secure_password

  validates :password, length: { minimum: 6 }, allow_blank: true


  private


    def picture_size

      if :picure.size > 5.megabytes
        errors.add(:picture, "The image should be less than 5 MB")
      end

    end

end
