class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|

      t.timestamps
    end
      add_column :groups, :name, :string, null: false, unique: true
  end
end
