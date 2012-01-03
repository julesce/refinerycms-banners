class Banner < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :url]

  validates :name, :presence => true
  validates_presence_of :start_date

  belongs_to :image
  has_and_belongs_to_many :pages

  scope :not_expired, lambda {
    banners = Arel::Table.new(Banner.table_name)
    where(banners[:expiry_date].eq(nil).or(banners[:expiry_date].gt(Time.now)))
  }
  scope :active, where(:is_active => true)
  scope :published, lambda {
    not_expired.active.where("start_date < ?", Time.now).order(:position)
  }

end