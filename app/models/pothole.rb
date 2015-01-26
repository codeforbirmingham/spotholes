class Pothole < ActiveRecord::Base
  attr_accessible :name, :longitude, :latitude, :status, :score, :user_id, :image
  validates :name, :longitude, :latitude, :status, :score, presence: true
  belongs_to :user
  has_many :pothole_logs


  has_attached_file :image,
                    :styles => {
                        mdpi: ['40x40#', :webp],
                        hdpi: ['60x60#', :webp],
                        xhdpi: ['80x80#', :webp],
                        xxhdpi: ['120x120#', :webp],
                        xxxhdpi: ['160x160#', :webp]
                    },
                    convert_options: {
                        mdpi: '-strip',
                        hdpi: '-strip',
                        xhdpi: '-strip',
                        xxhdpi: '-strip',
                        xxxhdpi: '-strip',
                    },
                    path: 'photos/:style/:id.:extension',
                    use_timestamp: false

  validates_attachment :image, content_type: {content_type: ["image/jpg", "image/jpeg", "image/png"]}, presence: true

  enum status: {unverified: 0, verified: 1, tagged: 2, fixed: 3}

end
