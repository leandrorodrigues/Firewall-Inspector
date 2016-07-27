class LogsController < ApplicationController
  def index
    @logs = Core::LogFile::get_logs_with_details
  end

  def process_file
    log_file = params[:log_file]

    Core::Tasks::test_file_update_bots(log_file)

    redirect_to logs_path, notice: "Log #{log_file} was successfully processed."
  end

  def delete
    log_file = params[:log_file]

    Core::LogFile::delete_log(log_file)

    redirect_to logs_path, notice: "Log #{log_file} was successfully destroyed."
  end
end
