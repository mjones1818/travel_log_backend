class User < ApplicationRecord
  include Rails.application.routes.url_helpers
  has_many :trips
  has_secure_password
  has_one_attached :profile

  def profile_url
    rails_blob_path(self.profile)
  end

end
