class CreateCollaborators < ActiveRecord::Migration[5.0]
  def change
    create_table :collaborators do |t|

      t.timestamps

      t.references :user, foreign_key: true

      t.references :wiki, foreign_key: true
    end
  end
end
