# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Food, type: :model do # rubocop:todo Metrics/BlockLength
  subject do
      # rubocop:todo Layout/IndentationWidth
      user1 = User.create!(name: 'Ekene', email: 'example@gmail.com', password: 'password')
      # rubocop:enable Layout/IndentationWidth
      # rubocop:todo Lint/UselessAssignment
      food1 = Food.create!(user: user1, user_id: user1.id, name: 'Rice', measurement_unit: 'kg', price: 50,
                           quantity: 5)
    # rubocop:enable Lint/UselessAssignment
  end

  describe 'Food Model validations' do
    it 'should check for invalid if name"s column is empty' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

      it 'should check if measurement_unit"s column is empty' do # rubocop:todo Layout/IndentationConsistency
        subject.measurement_unit = nil
        expect(subject).to_not be_valid
      end

      it 'should check if price column is empty' do # rubocop:todo Layout/IndentationConsistency
        subject.price = nil
          expect(subject).to_not be_valid # rubocop:todo Layout/IndentationConsistency
      end

      it 'should check if quantity column is empty' do # rubocop:todo Layout/IndentationConsistency
        subject.quantity = nil
          expect(subject).to_not be_valid # rubocop:todo Layout/IndentationConsistency
      end

      it 'should check if quantity column is alphabet' do # rubocop:todo Layout/IndentationConsistency
        subject.quantity = 'abc'
          expect(subject).to_not be_valid # rubocop:todo Layout/IndentationConsistency
      end
  end
end
