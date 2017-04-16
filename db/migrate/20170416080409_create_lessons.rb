class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :user_id
      t.boolean :check_mark, default: false
      t.timestamps null: false
    end
  end
end
