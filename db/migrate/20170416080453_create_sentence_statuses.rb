class CreateSentenceStatuses < ActiveRecord::Migration
  def change
    create_table :sentence_statuses do |t|
      t.integer :user_id
      t.integer :lesson_id
      t.integer :sentence_datum_id
      t.boolean :review_status, default: false
      t.timestamps null: false
    end
  end
end
