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
FactoryBot.define do
  factory :caterer do
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    description { Faker::Restaurant.description }
    name { Faker::Restaurant.name }
    state { Faker::Address.state }
    zip { Faker::Address.zip }
  end
end
