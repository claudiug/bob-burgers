class CreateStoryStatuses < ActiveRecord::Migration
  def change
    create_table :story_statuses do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
