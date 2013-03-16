class DeleteQuestionAndAnswerFromFaq < ActiveRecord::Migration
  def up
  	remove_column :faqs, :question
  	remove_column :faqs, :answer
  end

  def down
  end
end
