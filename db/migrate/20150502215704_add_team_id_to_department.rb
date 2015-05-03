class AddTeamIdToDepartment < ActiveRecord::Migration
  def change
    add_column :departments, :team_id, :integer
  end
end
