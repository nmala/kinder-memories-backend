class Post < ApplicationRecord
  # Only permit post_type attribute to have the following three values:
  # validates :post_type, inclusion: { in: %w(photo video letter)}
  validates :memory_date, presence: true
  belongs_to :timeline
  belongs_to :user

  has_one_attached :file

  def file_url
    if self.file.attached?
      Rails.application.routes.url_helpers.rails_blob_path(self.file, only_path: true)
    else
      nil
    end
  end
end
