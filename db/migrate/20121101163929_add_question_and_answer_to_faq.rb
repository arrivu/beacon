class AddQuestionAndAnswerToFaq < ActiveRecord::Migration
  def change
    add_column :faqs, :question, :text
    add_column :faqs, :answer, :text
  end
end
