class CreateGroupsMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :groups_members do |t|
      t.references :group, foreign_key: true
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
