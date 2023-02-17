class Profile < ApplicationRecord
  # associations
  belongs_to :user

  # validations
  validates :nickname, presence: true, uniqueness: true
  with_options if: -> { avatar.attached? } do
    validate :avatar_fit_allowed_size_and_has_corrent_format
  end

  has_one_attached :avatar

  private

  def avatar_fit_allowed_size_and_has_corrent_format
    if avatar.blob.content_type.start_with? 'image/'
      return if avatar.blob.byte_size < 5.megabytes

      avatar.purge
      errors.add(:avatar, 'size needs to be less than 5MB')
    else
      avatar.purge
      errors.add(:avatar, 'needs to be an image')
    end
  end
end
