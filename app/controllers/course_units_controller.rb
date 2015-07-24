class CourseUnitsController < ApplicationController

  before_action :find_course_unit, only: [:edit, :update, :destroy, :show]

  def index
    @course_units = CourseUnit.all
  end

  def new
    @course_unit = CourseUnit.new
  end

  def create
    @course_unit = CourseUnit.new(course_unit_params)
    if @course_unit.save
      redirect_to course_unit_path(@course_unit), notice: "Course Unit Created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @course_unit.update(course_unit_params)
      redirect_to course_unit_path(@course_unit), notice: "Course Unit Updated"
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    # CURRENTLY JUST NULLIFIES CHILDREN COURSE RESOURCES
    @course_unit.destroy
    redirect_to course_units_path, notice: "Course Unit Destroyed"
  end

  private

  def find_course_unit
    @course_unit ||= CourseUnit.find params[:id]
  end

  def course
    @course ||= Course.find_by_id(params[:course_id])
  end

  def course_unit_params
    params.require(:course_unit).permit([:title, :body])
  end

end
