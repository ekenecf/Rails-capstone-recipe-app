# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    user1 = User.create!(name: 'Ekene', email: 'example@gmail.com', password: 'password')
    food1 = Food.create!(user: user1, user_id: user1.id, name: 'Rice', measurement_unit: 'kg', price: 50,
                         quantity: 5)
  end

  describe 'Food Model validations' do
    it 'should check for invalid if name"s column is empty' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should check if measurement_unit"s column is empty' do
      subject.measurement_unit = nil
      expect(subject).to_not be_valid
    end

    it 'should check if price column is empty' do
      subject.price = nil
      expect(subject).to_not be_valid
    end

    it 'should check if quantity column is empty' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it 'should check if quantity column is alphabet' do
      subject.quantity = 'abc'
      expect(subject).to_not be_valid
    end
  end
end
