class ScoresController < ApplicationController

  def show

  end

  def create
  
  end

  def update
    course_resource = CourseResource.find params[:course_resource]
    user = User.find params[:user_id]
    submission = Submission.find params[:submission]
    score = Score.where(course_resource: course_resource, user: user).first
    score.complete = true
    if score.save
      redirect_to course_resource_submission_path(course_resource, submission),
              notice: "Marked complete"
    else
      redirect_to course_resource_submission_path(course_resource, submission),
              alert: "Something went wrong"
    end
  end

end

# sc = Score.where(course_resource: course_resource, user: user)
