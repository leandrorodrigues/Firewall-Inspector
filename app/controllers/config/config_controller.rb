module Config

class ConfigController < ApplicationController
  def index
    @positive_tests = PositiveTest.all
    @negative_tests = NegativeTest.all
  end
end

end
