class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.string :artist
      t.string :format
      t.string :length
      t.string :size

      t.timestamps
    end
  end
end
