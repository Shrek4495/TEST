class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_passage, only: %i[show update result gist]
  def show; end
  def create; end
  def result; end
  def gist
    request = GistQuestionService.new(@test_passage.current_question)
    request_result = request.call
    response = request.client.last_response
    gist_link = request_result.html_url

    redirect_to @test_passage

    if gist_link.present? && response.status.eql?(201)
      current_user.gists.create(question: @test_passage.current_question, gist_url: gist_link)
      flash[:notice] = t('.success', gist_link: view_context.link_to('Gist', gist_link))
    else
      flash[:alert] = t('.failure')
    end
  end
  def update
    @test_passage.accept!(params[:answers_ids])
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end
  private
  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end