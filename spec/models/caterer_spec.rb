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
require 'rails_helper'

RSpec.describe Caterer, type: :model do
  let(:caterer) do
    create :caterer,
           address: '233 S. Wacker Drive',
           city: 'Chicago',
           state: 'IL',
           zip: '60606'
  end

  it 'is valid with valid attributes' do
    expect(caterer).to be_valid
  end

  it 'is not valid without a name' do
    caterer.name = nil
    expect(caterer).not_to be_valid
  end

  it 'is not valid without an address' do
    caterer.address = nil
    expect(caterer).not_to be_valid
  end

  it 'is not valid without a city' do
    caterer.city = nil
    expect(caterer).not_to be_valid
  end

  it 'is not valid without a description' do
    caterer.description = nil
    expect(caterer).not_to be_valid
  end

  it 'is not valid without a state' do
    caterer.state = nil
    expect(caterer).not_to be_valid
  end

  it 'is not valid without a zip' do
    caterer.zip = nil
    expect(caterer).not_to be_valid
  end

  it 'slug is updated after save' do
    caterer.update! name: 'A Fancy New Name'
    expect(caterer.slug).to eq 'a-fancy-new-name'
  end
end
