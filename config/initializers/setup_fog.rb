# create a connection
# connection = Fog::Storage.new({
#   :provider                 => 'AWS',
#   :region                   => 'us-west-2',
#   :aws_access_key_id        => ENV['S3_ACCESS_KEY'],
#   :aws_secret_access_key    => ENV['S3_SECRET_ACCESS_KEY']
# })
#
#
# )

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      region: 'us-west-2',
      aws_access_key_id: ENV['S3_ACCESS_KEY'],
      aws_secret_access_key: ENV['S3_SECRET_KEY'],
      path_style: true
    }
    config.fog_directory = ENV['S3_BUCKET']
  end
end
