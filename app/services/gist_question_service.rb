class GistQuestionService

  attr_accessor :client

  def initialize(question, client: default_client)
    @question = question
    @test = question.test
    @client = client
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      "description": I18n.t('question', question: @question.body),
      "public": true,
      "files": {
        'test-guru-question.txt' => {
          "content": gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck :body
    content.join("\n")
  end

  def default_client
    Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end
end