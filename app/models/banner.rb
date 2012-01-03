class Banner < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :url]

  validates :name, :presence => true
  validates_presence_of :start_date

  belongs_to :image
  has_and_belongs_to_many :pages
  has_and_belongs_to_many :lodges

  scope :not_expired, lambda {
    banners = Arel::Table.new(Banner.table_name)
    where(banners[:expiry_date].eq(nil).or(banners[:expiry_date].gt(Time.now)))
  }
  scope :active, where(:is_active => true)
  scope :published, lambda {
    not_expired.active.where("start_date < ?", Time.now).order(:position)
  }

  # Return banners that are not assigned to lodges
  def self.without_lodges
    all_banners = Banner.all
    no_lodges = []

    all_banners.each do |b|
      no_lodges << b if b.lodges.count == 0
    end

    no_lodges
  end

end