class StoriesController < ApplicationController

  def new
    @department = Department.find(params[:department_id])
  end
end
