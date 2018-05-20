=begin
Thinkific::Bundle
bundle = Thinkific::Bundle.get( 'id' )
bundle.courses
chapter = Thinkific::Chapter.get 'id'
chapter.contents

category = Thinkific::Category.get 'id'
categories = Thinkific::Category.all
products = category.products
products[0].delete

new_product = Thinkific::Product.create( :name => 'prod name' )
categories[0].add_product( new_product )

new_category = Thinkfic::Category.create :name => 'cat name', :description => 'cat descr', :slug => 'cat slug'
new_category.update( :description => 'cat descr 2' )
new_category.delete

content = Thinkific::Content.get 'id'

coupons = Thinkific::Coupon.all
coupon = Thinkific::Coupon.get 'id'
new_coupon = Thinkific::Coupon.create :code => '123', :note => 'c note', :quantity => 5

users = Thinkific::User.all
user = Thinkific::User.get 'id'
new_user = Thinkific::User.create :first_name => 'Adam', :last_name => 'Smith'
new_user.update :last_name => 'Jackson'
new_user.delete
=end

module Thinkific
  DOMAIN = 'https://api.thinkific.com'
end

require 'thinkific/course'
require 'thinkific/user'

