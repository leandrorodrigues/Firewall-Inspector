class LogsController < ApplicationController
  def index
    @logs = Core::LogFile::get_logs_with_details
  end

  def process_file

    redirect_to :back
  end

  def delete
    log_file = params[:log_file]

    Core::LogFile::delete_log(log_file)

    redirect_to :back, notice: "Log #{log_file} was successfully destroyed."
  end
end
