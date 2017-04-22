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

  def exercise
    @lesson = Lesson.find(params[:id])
    @lesson.status_flg = 0
    @lesson.save
    redirect_to sentence_status_path(params[:id].to_i * 10 - 9)
  end

  def review
    @lesson = Lesson.find(params[:id])
    @lesson.status_flg = 1
    @lesson.save
    @sentence_statuses = SentenceStatus.where("user_id = ? and lesson_id = ? and review_status = ?", current_user.id, params[:id], true).order("id")
    @num = @sentence_statuses[0].sentence_datum_id
    redirect_to sentence_status_path(@num)
  end
end
