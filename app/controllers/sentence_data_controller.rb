class SentenceDataController < ApplicationController
  def show
    @sentence_datum = SentenceDatum.find(params[:id])
    @english_sentence_another = @sentence_datum.english_sentence.dup
    @english_sentence_another.gsub!(/'/) do |m|
      '\\' + m
    end
  end
end
