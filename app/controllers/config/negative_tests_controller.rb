module Config
class NegativeTestsController < ApplicationController
  before_action :set_negative_test, only: [:edit, :update, :toggle, :destroy]

  def new
    @negative_test = NegativeTest.new
  end

  def edit
  end

  # POST /negative_tests
  def create
    @negative_test = NegativeTest.new(negative_test_params)

    if @negative_test.save
      redirect_to config_root_path , notice: 'Negative test was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /negative_tests/1
  def update
      if @negative_test.update(negative_test_params)
        redirect_to config_root_path, notice: 'Negative test was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /negative_tests/1
  def destroy
    @negative_test.destroy
    redirect_to :back, notice: 'Negative test was successfully destroyed.'
  end

  def toggle
    params = {:active => !@negative_test.active}

    if @negative_test.update(params)
      redirect_to :back, notice: 'Negative test was successfully updated.'
    else
      redirect_to :back, notice: 'Negative test cannot update.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_negative_test
      @negative_test = NegativeTest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def negative_test_params
      params.require(:negative_test).permit(:test_name, :result_must_be, :active)
    end
end
end
