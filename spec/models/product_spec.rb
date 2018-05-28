require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'saves succesfully' do
      @cat = Category.create(name: "newCat")
      @product = Product.create(name: "newProd", category: @cat, quantity: 10, price: 20)
      expect(@product).to be_valid
    end
  end
end
