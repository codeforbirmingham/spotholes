class Pothole < ActiveRecord::Base
  attr_accessible :name, :longitude, :latitude, :status, :score, :user_id, :image
  validates :name, :longitude, :latitude, :status, :score, presence: true
  belongs_to :user

  has_paper_trail :meta => {status: :status}

  has_attached_file :image,
                    :styles => {
                        mdpi: '40x40#',
                        hdpi: '60x60#',
                        xhdpi: '80x80#',
                        xxhdpi: '120x120#',
                        xxxhdpi: '160x160#'
                    },
                    convert_options: {
                        mdpi: '-strip',
                        hdpi: '-strip',
                        xhdpi: '-strip',
                        xxhdpi: '-strip',
                        xxxhdpi: '-strip',
                    },
                    path: 'photos/:style/:id.:extension'

  validates_attachment :image, content_type: {content_type: ["image/jpg", "image/jpeg", "image/png"]}, presence: true

  enum status: {unverified: 0, verified: 1, tagged: 2, fixed: 3}

end
