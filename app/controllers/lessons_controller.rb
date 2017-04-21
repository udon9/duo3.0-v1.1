class LessonsController < ApplicationController
  def index
  end

  def toggle
    @lesson = Lesson.find(params[:id])
    @lesson.check_mark = !@lesson.check_mark
    @lesson.save
  end
end
