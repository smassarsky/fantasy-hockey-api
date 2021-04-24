class ChangeVideoIdColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :goals, :video_id, :integer, using: 'video_id::integer'
  end
end
