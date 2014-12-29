class Employee < ActiveRecord::Base
  belongs_to :position

  validates :position, presence: true

  validates :name, presence: true
  validates :surname, presence: true

  validates :username, presence: true, length: { minimum: 5, maximum: 20 }

  #adding an image to the employee model
  mount_uploader :picture, PictureUploader

  validate  :picture_size


  private


    def picture_size

      if :picure.size > 5.megabytes
        errors.add(:picture, "The image should be less than 5 MB")
      end

    end

end
