class AddAnswerIdToResponses < ActiveRecord::Migration[7.2]
  def change
    add_column :responses, :answer_id, :integer
    remove_column :responses, :answer, :integer
  end
end
