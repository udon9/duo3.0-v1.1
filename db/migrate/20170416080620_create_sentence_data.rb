class CreateSentenceData < ActiveRecord::Migration
  def change
    create_table :sentence_data do |t|
      t.text :english_sentence
      t.text :japanese_sentence
      t.timestamps null: false
    end
  end
end
