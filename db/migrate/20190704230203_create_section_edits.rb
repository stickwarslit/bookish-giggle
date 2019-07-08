class CreateSectionEdits < ActiveRecord::Migration[5.2]
  def up
    create_table :section_edits do |t|
      t.integer "admin_user_id"
      t.integer "section_id"
      t.string "summary"

      t.timestamps
    end
    add_index(:section_edits, [:admin_user_id, :section_id])
    add_foreign_key(:section_edits, :admin_users)
    add_foreign_key(:section_edits, :sections)
  end

  def down
    drop_table :section_edits
  end
end
