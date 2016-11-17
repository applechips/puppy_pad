class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

   storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  process :auto_orient # this should go before all other "process" steps

  def auto_orient
    manipulate! do |image|
      image.tap(&:auto_orient)
    end
  end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # version :small do
  #   process :resize_to_fit => [100, 100]
  # end
  #
  version :medium do
    process :resize_to_fit => [200, 200]
  end
  #
  version :large do
    process :resize_to_fit => [1000, 1000]
  end
  #
  version :square do
    process :resize_to_fill => [400, 400]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

  ### SMARTCROPPER
  # def smart_crop_and_scale(width, height)
  #   manipulate! do |img|
  #     img = SmartCropper.new(img)
  #     img = img.smart_crop_and_scale(width, height)
  #     img = yield(img) if block_given?
  #     img
  #   end
  # end
  #
  # # Create different versions of your uploaded files:
  # # A square and tiny thumbnail
  # version :thumb do
  #   process :smart_crop_and_scale => [80, 80]
  # end
  # # A large version, only cropped
  # version :preview do
  #   processs :crop => [200,400]
  # end
  # # A square version
  # version :cover do
  #   process :smart_square
  # end

end
