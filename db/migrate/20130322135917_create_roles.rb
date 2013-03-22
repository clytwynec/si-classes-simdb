class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.references :movie
      t.references :person
      t.string :title
      t.integer :rank
      t.timestamps
    end
  end
end
