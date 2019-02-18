class AddUserToNudie < ActiveRecord::Migration[5.2]
  def change
    add_reference :nudies, :user
  end
end
