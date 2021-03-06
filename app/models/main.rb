class Main < ApplicationRecord
  has_many :food_combinations, dependent: :destroy
  has_many :subs, through: :food_combinations
  has_one_attached :image

  enum genre: { noodle: 0, rice: 1 }
  enum stores: { seven: 0, lawson: 1, family: 2 }, _prefix: true

  scope :preload_main_image, -> { preload(image_attachment: :blob) }

  validate :image_content_type, :image_size, if: :was_attached?

  def image_content_type
    ['image/png', 'image/jpg', 'image/jpeg']
  end

  def was_attached?
    image.attached?
  end

  def image_size
    return unless image.blob.byte_size > 5.megabytes

    image.purge
  end
end
