class Admin::TestsController < Admin::BaseController
  before_action :find_tests, only: %i[index update_inline]
  before_action :find_test, only: %i[destroy update show edit update_inline]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found
  def index; end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.created_tests.new(test_params)

    if @test.save
      redirect_to [:admin, @test], notice: t('.success')
    else
      render :new
    end
  end

  def edit; end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test]
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  def show
    @questions = @test.questions
  end

  private

  def test_params
    params.require(:test).permit(:title, :category_id, :level, :time)
  end

  def find_tests
    @tests = Test.all
  end

  def find_tests
    @tests = Test.all
  end

  def find_tests
    @tests = Test.all
  end

  def find_tests
    @tests = Test.all
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    redirect_to admin_tests_path
  end
end