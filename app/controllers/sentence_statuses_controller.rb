class SentenceStatusesController < ApplicationController
  def show
    @hoge = ""
    @sentence_status = SentenceStatus.where("user_id = ? and sentence_datum_id = ?", current_user.id, params[:id]).first
    @sentence_datum = SentenceDatum.find(params[:id])
    @english_sentence_another = @sentence_datum.english_sentence.dup
    @english_sentence_another.gsub!(/'/) do |m|
      '\\' + m
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
