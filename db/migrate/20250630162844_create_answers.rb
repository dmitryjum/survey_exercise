class CreateAnswers < ActiveRecord::Migration[7.2]
  def change
    create_table :answers do |t|
      t.string :text
      t.integer :survey_id

      t.timestamps
    end
  end
end
