require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'saves succesfully' do
      @cat = Category.create(name: "newCat")
      @product = Product.new(name: "newProd", category: @cat, quantity: 10, price: 20)
      expect(@product).to be_valid
    end

    it 'is not valid because no name' do
      @cat = Category.create(name: "newCat")
      @product = Product.new(name: nil, category: @cat, quantity: 10, price: 20)
      expect(@product).to_not be_valid
    end

    it 'is not valid because no category' do
      @cat = Category.create(name: "newCat")
      @product = Product.new(name: "newProd", category: nil, quantity: 10, price: 20)
      expect(@product).to_not be_valid
    end

    it 'is not valid because no quantity' do
      @cat = Category.create(name: "newCat")
      @product = Product.new(name: "newProd", category: @cat, quantity: nil, price: 20)
      expect(@product).to_not be_valid
    end

    it 'is not valid because no price' do
      @cat = Category.create(name: "newCat")
      @product = Product.new(name: "newProd", category: @cat, quantity: 10, price: nil)
      expect(@product).to_not be_valid
    end
  end
end
