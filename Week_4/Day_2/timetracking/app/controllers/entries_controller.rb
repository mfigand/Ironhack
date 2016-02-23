class EntriesController < ApplicationController

  def index
    @projects = Project.find(params[:project_id])
    @entries = @projects.entries
  end
end
