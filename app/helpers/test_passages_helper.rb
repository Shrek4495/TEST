module TestPassagesHelper
  def success_rate_color
    @test_passage.successful? ? 'success' : 'fail'
  end
end
