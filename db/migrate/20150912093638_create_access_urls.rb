class CreateAccessUrls < ActiveRecord::Migration
  def change
    create_table :access_urls do |t|
      t.integer :url_id
      t.integer :count_access, default: 0

      t.timestamps null: false
    end
  end
end
