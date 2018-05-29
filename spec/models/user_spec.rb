require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is created succesfully' do
      user = User.new(name: 'Iain', email: 'i_mack5@hotmail.com', password: 'abcdefgh', password_confirmation: 'abcdefgh')
      expect(user).to be_valid
    end

    it 'should have a password' do
      user = User.new(name: 'Iain', email: 'i_mack5@hotmail.com', password: nil, password_confirmation: 'abcdefgh')
      expect(user).to_not be_valid
    end

    it 'should have matching passwords' do
      user = User.new(name: 'Iain', email: 'i_mack5@hotmail.com', password: 'abcdefghi', password_confirmation: 'abcdefgh')
      expect(user).to_not be_valid
    end

    it 'should have a unique email' do
      user = User.new(name: 'Iain', email: 'i_mack5@hotmail.com', password: 'abcdefghi', password_confirmation: 'abcdefgh')
      user2 = User.new(name: 'Iain', email: 'i_mack5@hotmail.com', password: 'abcdefghi', password_confirmation: 'abcdefgh')
      expect(user).to_not be_valid
    end

    it 'should have minimum password length of 7' do
      user = User.new(name: 'Iain', email: 'i_mack5@hotmail.com', password: 'oh', password_confirmation: 'oh')
      expect(user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    let!(:user) { User.create! name: 'Iain', email: 'i_mack5@hotmail.com', password: 'abcdefgh', password_confirmation: 'abcdefgh' }

    it 'should have a email in the db' do
      expect(User.authenticate_with_credentials('i@hotmail.com', 'abcdefgh')).to equal(nil)
    end

    it 'should have a email with a matching password in the db' do
      expect(User.authenticate_with_credentials('i_mack5@hotmail.com', 'abcdefghi')).to equal(nil)
    end

    it 'should return a user when succesful' do
      expect(User.authenticate_with_credentials('i_mack5@hotmail.com', 'abcdefgh')).to_not be_nil
    end
  end
end
