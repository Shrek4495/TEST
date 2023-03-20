module AnswersHelper
  def answer_header(answer)
    return "Новый ответ для вопроса: #{answer.question.body}" if answer.new_record?

    "Редактирование ответа на вопрос: #{answer.question.body}"
  end
end
