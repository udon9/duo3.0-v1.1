class SentenceDataController < ApplicationController
  def show
    @sentence_datum = SentenceDatum.find(params[:id])
  end

  def next_movement
    @hoge = params[:id].to_i + 1
    redirect_to "/sentence_data/#{@hoge}"
  end
end
