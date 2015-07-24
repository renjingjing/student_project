class CourseResourcesController < ApplicationController
  before_action :find_course_unit,  only: [:new, :index, :create, :update]

  def new
    @course_resource = CourseResource.new
  end

  def index
    @course_resources = CourseResource.all
  end

  def create
    course_resource_params = params.require(:course_resource).permit([:title, :content, :kind_id, :resource_file])
    @course_resource = CourseResource.new(course_resource_params)
    if @course_resource.save
      redirect_to course_unit_course_resource_path(@course_unit, @course_resource)
    else
      render :new
    end
  end

  def show
    @course_resource = CourseResource.find params[:id]
    @submission = Submission.new
    @course_unit = CourseUnit.find(@course_resource.course_unit.id)
  end

  def edit
    @course_resource = CourseResource.find params[:id]
  end

  def update
    @course_resource = CourseResource.find params[:id]
    course_resource_params = params.require(:course_resource).permit([:title,
                                  :content, :kind_id, :resource_file, :hidden])
    if @course_resource.update(course_resource_params)
      if course_resource_params[:hidden] != nil
        redirect_to course_path(@course_resource.course_unit.course)
      else
        redirect_to course_unit_course_resource_path(@course_unit, @course_resource)
      end
    else
      render :update
    end
  end

  def destroy
    @course_resource = CourseResource.find params[:id]
    @course_resource.destroy
    redirect_to course_unit_path(@course_unit)
  end

  private

  def find_course_unit
    @course_unit ||= CourseUnit.find params[:course_unit_id]
  end


end
