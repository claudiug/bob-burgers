class DepartmentsController < ApplicationController
  before_filter :authorize

  def new
    @user = User.find(params[:user_id])
    @deparment = @user.departments.build
  end

  def create
    @user = User.find(params[:user_id])
    @department = @user.departments.build(params.require(:department).permit(:name, :description))
    if @department.save
      @user.save
      redirect_to user_department_path(@user, @department)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
    @department = Department.find(params[:id])
  end
end
