# == Schema Information
#
# Table name: companies
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  tax_code          :string(255)
#  address           :string(255)
#  home_phone        :string(255)
#  mobile_phone      :string(255)
#  work_phone        :string(255)
#  email             :string(255)
#  ceo               :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  longitude         :float
#  latitude          :float
#  background_url    :string(2083)
#  logo              :string(255)
#  image_url         :string(2083)
#  facebook          :string(255)
#  google_plus       :string(255)
#  twiter            :string(255)
#  youtube           :string(255)
#  linkedin          :string(255)
#  partners          :string(255)      default([]), is an Array
#  about_us_title    :string(255)
#  about_us_content  :text
#  image_title       :string(255)
#  image_description :text
#

class Company < ActiveRecord::Base
  validates :name, presence: true
  validates :tax_code, presence: true
  validates :address, presence: true
  validates :email, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  has_many :images
  has_many :products
  accepts_nested_attributes_for :images

  translates :name, :address, :about_us_content, :about_us_title, :image_title, :image_description

  def image_thumb
    if images.any?
      images.first.image.thumb.url
    else
      asset_path("default.jpg")
    end
  end

  def image
    if images.any?
      images.first.image.url
    else
      asset_path("thumb_default.jpg")
    end
  end

  def phone
    str = []
    str << mobile_phone
    str << home_phone
    str << work_phone
    str.reject{ |x| x.nil? || x.empty? }.join(' - ')
  end
end
