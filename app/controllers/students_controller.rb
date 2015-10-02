class StudentsController < ApplicationController

	def new
	end

	def create
		#render plain: params[:student].inspect
		 @student = Student.new(student_params)
     @student.save
    redirect_to '/mainbase' and return
	end

	def show
    @student = Student.find(params[:id])
    @students = Student.all
    end

	def destroy
  		@student = Student.find(params[:id])
  		@student.destroy
   		redirect_to "/mainbase" and return
end
 private
  def student_params
    params.require(:student).permit(:name, :emails, :surname)
  end
end
