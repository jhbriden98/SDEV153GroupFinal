class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy, :addcourse, :removecourse]
  before_action :authenticate_user!, except: [:show, :index]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
    if params[:search]
      @courses = Course.search(params[:search]).order("created_at DESC")
    else
      @courses = Course.all.order('created_at DESC')
    end
  end
  
  # GET courses/1/courselist
  def courselist
    @courses = Course.all
    @usercourselist = current_user.courses
  end
  
  # ADD a course to schedule
  def addcourse
    current_user.courses<<@course unless current_user.courses.exists?(@course.id)
    redirect_to courses_path
  end
  
  # REMOVE a course from schedule
  def removecourse
     course = Course.find(params[:course][:id])
     schedule = course.schedules.find(params[:schedule][:id])
     if schedule
        course.schedule.delete(scedule)
     end
     redirect_to courselist_courses_path
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:course_name, :course_desc, :course_subj, :course_cred, :teacher_id)
    end
end