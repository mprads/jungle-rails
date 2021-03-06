require 'rails_helper'

RSpec.feature "Visitor navigates to a product page", type: :feature, js: true do

  before :each do
      @category = Category.create! name: 'Apparel'

      10.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end

    scenario "Add item to cart" do
      visit root_path

      save_screenshot 'empty-cart.png'

      first('article.product').find_link('Add').click
      save_screenshot 'item-in-cart.png'
      expect(page).to have_content 'My Cart (1)'
    end

end
