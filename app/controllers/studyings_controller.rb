class StudyingsController < ApplicationController

  def create
    @course = Course.find params[:course_id]
    @study = Studying.new
    @study.user = current_user
    if @study.save
      redirect_to @course, notice: "added student to course"
    else
      redirect_to @course, notice: "could not add student to course"
    end
  end

  def destroy
    @course = Course.find.params[:course_id]
    @study = @course.study_for(current_user)
    @study.destroy
    redirect_to course
  end

end
