class SentenceDatum < ActiveRecord::Base
  has_many :sentence_status
  has_many :user, through: :sentence_status
end
