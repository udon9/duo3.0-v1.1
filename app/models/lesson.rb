class Lesson < ActiveRecord::Base
  belongs_to :user
  has_many :sentence_status
  has_many :sentence_data, through: :sentence_status
end
