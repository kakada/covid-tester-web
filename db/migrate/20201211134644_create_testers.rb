class CreateTesters < ActiveRecord::Migration[6.0]
  def change
    create_table :testers do |t|
      t.string :phone_number
      t.integer :age
      t.string :gender
      t.string :lab_id
      t.datetime :visited_at

      t.timestamps
    end

    add_index :testers, [:phone_number, :lab_id], unique: true
  end
end
