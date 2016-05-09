class SubjectsController < ApplicationController
  def new
    @subject = Subject.new
  end

  def show
    @subject = Subject.find params[:id]
  end

  private
  def subject_params
    params.require(:subject).permit :title, :description
  end
end
