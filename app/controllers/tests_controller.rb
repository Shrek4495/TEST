class TestsController < ApplicationController
  before_action :find_test, only: %i[destroy update show edit start]
  before_action :find_user, only: :start
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found
  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end
  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit; end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def show
    @questions = @test.questions
  end

  private

  def test_params
    params.require(:test).permit(:title, :category_id, :level, :author_id)
  end
  def find_test
    @test = Test.find(params[:id])
  end

  def find_user
    @user = User.first
  end

  def rescue_with_test_not_found
    redirect_to tests_path
  end

end

