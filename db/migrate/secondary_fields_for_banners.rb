class SecondaryFieldsForBanners < ActiveRecord::Migration

  def self.up
    add_column :banners, :title, :string
    add_column :banners, :description, :string
  end

  def self.down
    remove_column :banners, :title
    remove_column :banners, :description
  end

end