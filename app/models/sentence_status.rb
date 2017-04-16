class SentenceStatus < ActiveRecord::Base
  belongs_to :user
  belongs_to :lesson
  belongs_to :sentence_datum
end
