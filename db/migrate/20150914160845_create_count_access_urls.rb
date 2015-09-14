class CreateCountAccessUrls < ActiveRecord::Migration
  def change
    create_table :count_access_urls do |t|
      t.integer :access_url_id
      t.integer :count_click, default: 0
      t.string :date

      t.timestamps null: false
    end
  end
end
