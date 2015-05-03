class AddStoryStatusIdToStory < ActiveRecord::Migration
  def change
    add_column :stories, :story_status_id, :integer
  end
end
