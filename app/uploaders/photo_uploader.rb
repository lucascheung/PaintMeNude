class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true

  process convert: 'jpg'

  version :thumnail do
    resize_to_fit 256, 256
    cloudinary_transformation gravity: :face
  end

  version :index_profile do
    cloudinary_transformation width: 250, height: 300, gravity: :face, crop: :fill
  end

  version :show_profile do
    cloudinary_transformation width: 325, height: 390, crop: :fill
  end
end
