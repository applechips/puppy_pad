class User < ApplicationRecord
  has_secure_password

  has_many :pets
  has_many :vets

  has_many :conversations, :foreign_key => :sender_id

  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true,
            format: VALID_EMAIL_REGEX,
            unless: :from_oauth?
  validates :uid, uniqueness: {scope: :provider}, if: :from_oauth?
  serialize :twitter_raw_data, Hash

  def from_oauth?
    uid.present? && provider.present?
  end

  def self.find_or_create_from_twitter(twitter_data)
    find_by_twitter(twitter_data) || create_from_twitter(twitter_data)
  end

  def self.find_by_twitter(twitter_data)
    find_by(uid: twitter_data["uid"], provider: twitter_data["provider"])
  end

  def self.create_from_twitter(twitter_data)
    full_name = twitter_data["info"]["name"].split
    create!(first_name:       full_name[0],
             last_name:       full_name[1],
             uid:             twitter_data["uid"],
             provider:        twitter_data["provider"],
             twitter_token:   twitter_data["credentials"]["token"],
             twitter_secret:  twitter_data["credentials"]["secret"],
             password:        SecureRandom.hex(32),
             twitter_raw_data:    twitter_data
             )
  end

  def from_twitter?
    uid.present? && provider == "twitter"
  end


  def full_name
    "#{first_name} #{last_name}".squeeze(" ").strip.titleize
  end


end
