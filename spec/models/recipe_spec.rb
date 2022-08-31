require 'rails_helper'

RSpec.describe Recipe, type: :model do # rubocop:todo Metrics/BlockLength
  subject do
      # rubocop:todo Layout/IndentationWidth
      user1 = User.create!(name: 'Ekene', email: 'example@gmail.com', password: 'password')
      # rubocop:enable Layout/IndentationWidth
      Recipe.create!(user: user1, user_id: user1.id, name: 'prepare Rice', preparation_time: 10, cooking_time: 50,
                     description: 'Lessons on how to prepare rice', public: true)
  end

  describe 'Recipe Model validations' do
    it 'should check for invalid if name"s column is empty' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

      it 'should check if preparation_time column is empty' do # rubocop:todo Layout/IndentationConsistency
        subject.preparation_time = nil
        expect(subject).to_not be_valid
      end

      it 'should check if cooking_time column is empty' do # rubocop:todo Layout/IndentationConsistency
        subject.cooking_time = nil
        expect(subject).to_not be_valid
      end

      it 'should check if description column is empty' do # rubocop:todo Layout/IndentationConsistency
        subject.description = nil
        expect(subject).to_not be_valid
      end

      it 'should check if public column is empty' do # rubocop:todo Layout/IndentationConsistency
        subject.public = false
          expect(subject).to_not be_valid # rubocop:todo Layout/IndentationConsistency
      end
  end
end
