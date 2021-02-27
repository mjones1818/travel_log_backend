class Trip < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :user
  has_many_attached :images

  def image_url
    rails_blob_path(self.images.last)
  end

  def image_urls
    self.images.map {|image| rails_blob_path(image) }
  end
end
