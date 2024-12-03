class MainCoursesController < ApplicationController
  before_action :set_main_course, only: %i[ show edit update destroy ]

  # GET /main_courses
  def index
    @main_courses = MainCourse.all
  end

  # GET /main_courses/1
  def show
  end

  # GET /main_courses/new
  def new
    @main_course = MainCourse.new
  end

  # GET /main_courses/1/edit
  def edit
  end

  # POST /main_courses
  def create
    @main_course = MainCourse.new(main_course_params)

    if @main_course.save
      redirect_to @main_course, notice: "Main course was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /main_courses/1
  def update
    if @main_course.update(main_course_params)
      redirect_to @main_course, notice: "Main course was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /main_courses/1
  def destroy
    @main_course.destroy!
    redirect_to main_courses_url, notice: "Main course was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_course
      @main_course = MainCourse.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def main_course_params
      params.require(:main_course).permit(:name, :description, :price, :number_of_guests, :arrival, :comment)
    end
end
