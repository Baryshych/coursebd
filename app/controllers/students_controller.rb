class StudentsController < ApplicationController
  #  rescue_from ActiveRecord::RecordNotFound, :with => :set_marks
	def new
    if !check_permission 
      redirect_to '/mainbase' and return
    end
	end

	def create
    if check_permission 
		#render plain: params[:student].inspect
		 @student = Student.new(student_params)
     @student.save
    end
  else
    redirect_to '/mainbase' and return
	end
	

  def show
    @student = Student.find(params[:id])
    @students = Student.all
    @current_marks = Mark.where student_id: @student.id
    rescue ActiveRecord::RecordNotFound
      redirect_to :action => 'set_marks'
  end

  def destroy
    if check_permission
  		@student = Student.find(params[:id])
  		@student.destroy
    end
      redirect_to "/mainbase" and return		
  end


  def edit
    if check_permission
      @student = Student.find(params[:id])
      @student.update(student_params)
      @student.save
    else
  redirect_to :back and return
    end
  end
  
  def set_marks 
     @student = Student.find(params[:id])
  end
  
  def save_marks
   @mark = Mark.new(mark_params)
   @student = Student.find(params[:id])
   @mark.student_id = @student.id
   @mark.save
   redirect_to "#{student_path(@student)}" and return
  end
  
 private

  def student_params
    params.require(:student).permit(:name, :emails, :surname, :fname, :phone_number, :course, :group)
  end
  
  def mark_params
    params.require(:mark).permit(:professor, :subject, :points, :semester)
  end

  def check_permission
    if can? :manage, @student
      return 1
    else
      return 0
    end
  end
end
