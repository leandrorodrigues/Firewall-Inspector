module Config
class PositiveTestsController < ApplicationController
  before_action :set_positive_test, only: [:edit, :update, :toggle, :destroy]


  # GET /positive_tests/new
  def new
    @positive_test = PositiveTest.new
  end

  # GET /positive_tests/1/edit
  def edit
  end

  # POST /positive_tests
  # POST /positive_tests.json
  def create
    @positive_test = PositiveTest.new(positive_test_params)

    if @positive_test.save
      redirect_to config_root_path, notice: 'Positive test was successfully created.'
    else
      format.html { render :new }
    end
  end

  # PATCH/PUT /positive_tests/1
  # PATCH/PUT /positive_tests/1.json
  def update

    if @positive_test.update(positive_test_params)
      redirect_to config_root_path, notice: 'Positive test was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /positive_tests/1
  # DELETE /positive_tests/1.json
  def destroy
    @positive_test.destroy
    redirect_to :back, notice: 'Positive test was successfully destroyed.'
  end

  def toggle
    params = {:active => !@positive_test.active}

    if @positive_test.update(params)
      redirect_to :back, notice: 'Positive test was successfully updated.'
    else
      redirect_to :back, notice: 'Positive test cannot update.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_positive_test
      @positive_test = PositiveTest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def positive_test_params
      params.require(:positive_test).permit(:test_name, :result_must_be, :active)
    end
end
end
