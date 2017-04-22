class AddStatusFlgToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :status_flg, :integer, default: 0 #0が演習、1が復習
  end
end
