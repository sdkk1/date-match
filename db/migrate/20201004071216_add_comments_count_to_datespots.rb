class AddCommentsCountToDatespots < ActiveRecord::Migration[5.2]
  def change
    add_column :datespots, :comments_count, :integer, null: false, default: 0
  end
end
