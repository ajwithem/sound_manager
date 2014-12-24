class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.text :artist
      t.text :format
      t.string :length
      t.string :size

      t.timestamps
    end
  end
end
