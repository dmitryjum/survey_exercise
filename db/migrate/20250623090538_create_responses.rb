class CreateResponses < ActiveRecord::Migration[7.2]
  def change
    create_table :responses do |t|
      t.references :survey, null: false, foreign_key: true
      t.integer :answer

      t.timestamps
    end
  end
end
