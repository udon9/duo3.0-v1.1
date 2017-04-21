class LessonsController < ApplicationController
  def index
  end

  def show
    @sentence_statuses = SentenceStatus.where("user_id = ? and lesson_id = ?", current_user.id, params[:id])
  end

  def update
    @sentence_statuses = SentenceStatus.where("user_id = ? and lesson_id = ?", current_user.id, params[:id]).update_all("review_status = '0'")
    redirect_to root_path
  end

  def toggle
    @lesson = Lesson.find(params[:id])
    @lesson.check_mark = !@lesson.check_mark
    @lesson.save
  end
end
