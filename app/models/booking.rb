class Booking < ActiveRecord::Base
  has_many :passengers, dependent: :destroy
  belongs_to :flight
  belongs_to :user
  accepts_nested_attributes_for :passengers,
                                reject_if: :all_blank,
                                allow_destroy: true

  before_validation :generate_code

  validates :flight, presence: true

  def self.search(params)
    where(params.symbolize_keys).first
  end

  def get_code
    o = [(0..9), ("A".."Z")].map(&:to_a).flatten
    (0..7).map { o[rand(o.length)] }.join
  end

  def generate_code
    self.code = get_code
  end
end
