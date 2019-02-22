class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true

  process convert: 'png'

  version :avatar do
    cloudinary_transformation radius: 20,
    width: 40, height: 40, crop: :thumb, gravity: :face
  end

  version :index_profile do
    cloudinary_transformation width: 250, height: 300, gravity: :face, crop: :fill
  end

  version :show_profile do
    cloudinary_transformation width: 325, height: 390, crop: :fill, radius: 4
  end
end
