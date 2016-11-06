class CreateSymptoms < ActiveRecord::Migration
  def change
    create_table :symptoms do |t|
      t.string :symptom_name
      t.integer :severity
      t.string :notes
      t.integer :user_id
      t.timestamps
    end
  end
end
