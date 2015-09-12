class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :name_url_minify
      t.string :name_original_url

      t.timestamps null: false
    end
  end
end
