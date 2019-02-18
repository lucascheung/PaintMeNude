class RemoveNudieFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :nudie
  end
end
