class SentenceStatusesController < ApplicationController
  include AjaxHelper 
  def index
    @sentence_statuses = SentenceStatus.where("user_id = ? and lesson_id = ? and review_status = ?", current_user.id, params[:lesson_id], 1)
  end

  def show
    @sentence_status = SentenceStatus.where("user_id = ? and sentence_datum_id = ?", current_user.id, params[:id]).first
    @sentence_datum = SentenceDatum.find(params[:id])
    @english_sentence_another = @sentence_datum.english_sentence.dup
    @english_sentence_another.gsub!(/'/) do |m|
      '\\' + m
    end
  end

  def next
    @sentence_status = SentenceStatus.where("user_id = ? and sentence_datum_id = ?", current_user.id, params[:id]).first
    if @sentence_status.lesson.status_flg == 0
      if params[:id].to_i % 10 != 0
        @next_id = params[:id].to_i + 1
        respond_to do |format|
          format.js { render ajax_redirect_to(sentence_status_path(@next_id)) }
        end
      else
        respond_to do |format|
          format.js { render ajax_redirect_to(lesson_path(id: @sentence_status.lesson_id)) }
        end
      end
    else
      if params[:id].to_i % 10 != 0
        start = params[:id].to_i + 1
        last = (params[:id].to_i / 10 + 1) * 10
        for num in start..last do
        if SentenceStatus.where("user_id = ? and sentence_datum_id = ? and review_status = ?", current_user.id, num, 1).present?
          respond_to do |format|
            format.js { render ajax_redirect_to(sentence_status_path(num)) }
          end
          break
        end
        if num == last
          respond_to do |format|
            format.js { render ajax_redirect_to(lesson_path(id: @sentence_status.lesson_id)) }
          end
        end
      end
      else
        respond_to do |format|
          format.js { render ajax_redirect_to(lesson_path(id: @sentence_status.lesson_id)) }
        end
      end
    end
  end

  def ttoggle
    @sentence_status = SentenceStatus.where("user_id = ? and sentence_datum_id = ?", current_user.id, params[:id]).first
    @sentence_status.review_status = 0
    @sentence_status.save
  end

  def ftoggle
    @sentence_status = SentenceStatus.where("user_id = ? and sentence_datum_id = ?", current_user.id, params[:id]).first
    @sentence_status.review_status = 1
    @sentence_status.save
  end
end