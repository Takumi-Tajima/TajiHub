class AddPublishedToPosts < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :published, :boolean, null: false, default: false
  end
end
