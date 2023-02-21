module QuestionsHelper
  def question_header(question)
    return "Новый вопрос для теста: #{question.test.title}" if question.new_record?

    "Редактирование вопроса теста: #{question.test.title}"
  end
end
