class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true
  before_validation :before_validation_set_first_question, on: %i[create update]

  def accept!(answers_ids)
    self.correct_questions += 1 if correct_answer?(answers_ids)
    self.successful = true if successful?
    self.current_question = nil if end_time?

    save!
  end
  def completed?
    current_question.nil?
  end
  def success_rate
    (correct_questions / test.questions.count.to_f) * 100
  end

  def test_time
    created_at + test.time * 60
  end

  def end_of_test_time
    test_time - Time.current
  end

  def end_time?
    Time.current - created_at >= test.time * 60
  end

  def successful?
    success_rate >= 85
  end
  def current_question_index
    test.questions.order(:id).index(current_question) + 1
  end
  def progress
    (current_question_index.to_f / test.questions.count * 100).round
  end
  private
  def before_validation_set_first_question
    self.current_question = next_question
  end

  def correct_answer?(answers_ids)
    return false if answers_ids.nil?

    correct_answers.ids.sort == answers_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end
  def next_question
    if new_record?
      self.current_question = test.questions.first if test.present?
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end
end