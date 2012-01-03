class CreateBannersPages < ActiveRecord::Migration
  def self.up
    create_table :banners_pages, :id => false do |t|
      t.integer :page_id
      t.integer :banner_id
      t.timestamps
    end

    add_index :banners_pages, :page_id
    add_index :banners_pages, :banner_id
  end

  def self.down
    drop_table :banners_pages
  end
end
