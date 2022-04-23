# frozen_string_literal: true

# == Schema Information
#
# Table name: caterers
#
#  id                   :bigint           not null, primary key
#  address              :string           not null
#  city                 :string           not null
#  cloudinary_image_url :string
#  description          :text             not null
#  latitude             :float
#  longitude            :float
#  name                 :string           not null
#  radius_drop_off      :integer          default(25), not null
#  radius_on_site       :integer          default(25), not null
#  radius_pick_up       :integer          default(25), not null
#  slug                 :string           not null
#  state                :string           not null
#  zip                  :string           not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_caterers_on_latitude_and_longitude  (latitude,longitude)
#  index_caterers_on_name                    (name)
#  index_caterers_on_slug                    (slug)
#
class Caterer < ApplicationRecord
  geocoded_by :full_address

  validates :address, presence: true
  validates :city, presence: true
  validates :description, presence: true
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :state, presence: true
  validates :zip, presence: true

  after_validation :geocode, if: ->(c) { c.full_address.present? && c.full_address_changed? }

  before_save :set_slug

  def full_address
    [address, city, zip, state].compact.join(', ')
  end

  def full_address_changed?
    (address_changed? || city_changed? || zip_changed? || state_changed?)
  end

  private

  def set_slug
    self.slug = make_slug
  end
end
