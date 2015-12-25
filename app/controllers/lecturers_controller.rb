class LecturersController < ApplicationController
        def new
    end
    
    def create
        @lecturers = Lecturer.new(lecturers_params)
        @lecturers.save
        redirect_to "/lecturers" and return
    end
    
    def edit
        @lecturers = Lecturer.find(params[:id])
        @lecturers.edit
    end
    
    def destroy
  		@lecturers = Lecturer.find(params[:id])
  		@lecturers.destroy
  		redirect_to "/lecturers" and return
    end
    
    def index
         @lecturers = Lecturer.all
    end
    
    private
    
    def lecturers_params
        params.require(:lecturer).permit(:name, :surname, :fname, :works, :recomendations, :projects)
    end
    
end
