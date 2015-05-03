class AddDepartmentIdToStory < ActiveRecord::Migration
  def change
    add_column :stories, :department_id, :integer
  end
end
