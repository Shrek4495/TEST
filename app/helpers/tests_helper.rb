module TestsHelper
  def test_header(test)
    return 'Новый тест' if test.new_record?

    "Редактирование теста: #{test.title}"
  end
end
