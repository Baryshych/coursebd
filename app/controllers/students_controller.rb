class StudentsController < ApplicationController

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

 private

  def student_params
    params.require(:student).permit(:name, :emails, :surname, :fname, :phone_number, :course, :group)
  end

  def check_permission
    if can? :manage, @student
      return 1
    else
      return 0
    end
  end
end
