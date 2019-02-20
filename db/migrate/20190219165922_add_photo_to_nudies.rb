class AddPhotoToNudies < ActiveRecord::Migration[5.2]
  def change
    add_column :nudies, :photo, :string
  end
end
