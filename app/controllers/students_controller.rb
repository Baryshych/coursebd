class StudentsController < ApplicationController

	def new
    if (check_permission == 0)
      redirect_to '/mainbase' and return
    end
	end

	def create
    if (check_permission == 1)
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
    if(check_permission == 1)
  		@student = Student.find(params[:id])
  		@student.destroy
      redirect_to "/mainbase" and return
    else
      redirect_to "/mainbase" and return
  end  		
end


  def edit
    @student = Student.find(params[:id])
    @student = Student.update(params[:id], student_params)
    @student.save
  end

 private

  def student_params
    params.require(:student).permit(:name, :emails, :surname, :fname, :phone_number, :course, :group)
  end

  def check_permission
    if (current_user.permissions == 'admin')
      return 1
    else
      return 0
    end
  end
end
