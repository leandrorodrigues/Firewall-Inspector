require 'core/tasks'

class HomeController < ApplicationController
  def index
    @logs = Dir.entries('public/files/logs').reject{|entry| entry =~ /^\.{1,2}$/}

  end

  def readfile
    puts Core::Tasks::test_file_complete(params[:file]).inspect


    redirect_to root_path
  end
end
