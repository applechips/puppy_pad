class User < ApplicationRecord
  has_secure_password

  has_many :pets
  has_many :vets

  has_many :conversations, :foreign_key => :sender_id
  
  validates :email, presence: true, uniqueness: true,
            format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
            # unless: :from_oauth?
#   validates :uid, uniqueness: {scope: :provider}, if: :using_oauth?
#
# def from_oauth?
# uid.present? && provider.present?
# end
#
# PROVIDER_FACEBOOK = "facebook"
#
# serialize :facebook_raw_data, Hash
#
# def self.find_or_create_from_facebook(facebook_data)
#   user = User.where(uid: facebook_data["uid"], provider: facebook_data["provider"] ).first
#   user = create_from_facebook(facebook_data) unless user
#   user
# end
#
# def using_facebook?
#     using_oauth? && provider == PROVIDER_FACEBOOK
# end
#
# def self.from_omniauth(auth)
#   where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
#     user.provider = auth.provider
#     user.uid = auth.uid
#     user.name = auth.info.name
#     user.oauth_token = auth.credentials.token
#     user.oauth_expires_at = Time.at(auth.credentials.expires_at)
#     user.save!
#   end
# end

def full_name
  "#{first_name} #{last_name}".squeeze(" ").strip.titleize
end


end
