class TeachingsController < ApplicationController
  def create
    @course = Course.find params[:course_id]
    @teach = Teaching.new
    @teach.user = current_user
    if @teach.save
      redirect_to @course, notice: "added student to course"
    else
      redirect_to @course, notice: "could not add student to course"
    end
  end

  def destroy
    @course = Course.find.params[:course_id]
    @teach = @course.teach_for(current_user)
    @teach.destroy
    redirect_to @course
  end
end
