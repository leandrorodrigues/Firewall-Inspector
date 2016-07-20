require 'core/tasks'

class HomeController < ApplicationController
  def index
    @logs = Dir.entries('public/files/logs').reject{|entry| entry =~ /^\.{1,2}$/}

  end

  def readfile
    Core::Tasks::readfile(params[:file])

    redirect_to root_path
  end
end
