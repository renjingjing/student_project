class SubmissionsController < ApplicationController

	before_action :find_submission, only: [:show, :destroy]

	def index
		@course_resource = CourseResource.find params[:course_resource_id]
		@submissions = Submission.where(course_resource: @course_resource)
	end

	def new
		@submission = Submission.new
	end

	def create
		@course_resource = CourseResource.find params[:course_resource_id]
		@course_unit = CourseUnit.find params[:submission][:course_unit_id]
		@submission = Submission.new submission_params
		@submission.user = current_user
		@submission.course_resource = @course_resource
		if @submission.save
			redirect_to course_resource_path(@course_resource), notice: "Assignment Submitted"
		else
			redirect_to course_resource_path(@course_resource), notice: "Submission Error"
		end
	end

	def show
		@course_resource = CourseResource.find params[:course_resource_id]
		@submissions = Submission.where(course_resource: @course_resource)
	end

	def destroy
		@submission.destroy
		redirect_to course_resource_path(@course_resource), notice: "Assignment Deleted"
	end

private

	def find_submission
		@submission = Submission.find params[:id]
	end

	def submission_params
		params.require(:submission).permit(:body, :file)
	end

end
