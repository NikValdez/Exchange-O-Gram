class Post < ApplicationRecord
  validates :image, presence: true
  validates :user_id, presence: true
  validates :caption, length: {minimum: 3, maximum: 300}
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_attached_file :image, styles: { medium: "640x", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
