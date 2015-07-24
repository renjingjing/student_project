class CoursesController < ApplicationController

	before_action :find_course, only: [:edit, :update, :destroy, :show]

	def index
		@courses = Course.all
	end

	def new
		@course = Course.new
	end

	def create
		@course = Course.new course_params
		if @course.save
			redirect_to course_path(@course)
		else
			render :new
		end
	end

	def show
		@course = Course.find params[:id]
		@course_units = @course.course_unit_syllabulized
		@students = @course.students
		@course_resources = @course.course_resources
	end

	def edit
	end

	def update
		if @course.update(course_params)
			redirect_to course_path(@course)
		else
			render :edit
		end
	end

	def destroy
		@course.destroy
		redirect_to courses_path(@course), notice: "Course Deleted"
	end

	private

	def find_course
		@course = Course.find params[:id]
	end

	def course_params
		params.require(:course).permit([:name, :description, :course_logo, {course_unit_ids: []}, {course_unit_syllabulized_ids: []}])
  end
end
