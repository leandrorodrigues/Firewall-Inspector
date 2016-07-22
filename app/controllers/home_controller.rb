require 'core/tasks'

class HomeController < ApplicationController
  def index
    @lacnic_time = Core::LacnicDelegatedFile::get_file_time
    @lacnic_size = Core::LacnicDelegatedFile::get_file_size

    @last_log = Core::LogFile::get_lagitrst_log
  end

  def read_log_file
    puts Core::Tasks::test_file_complete(params[:file]).inspect


    redirect_to root_path
  end

  def update_lacnic_file
    begin
      Core::LacnicDelegatedFile::update_file

      flash[:success] = "File successfully updated."
    rescue  => error
      flash[:error] = "File failed to update. Please try again later. (#{error.message})"
    end
    redirect_to root_path
  end
end
