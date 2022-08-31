require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
      # rubocop:todo Layout/IndentationWidth
      user1 = User.create!(name: 'Ekene', email: 'example@gmail.com', password: 'password')
      # rubocop:enable Layout/IndentationWidth
      food1 = Food.create!(user: user1, user_id: user1.id, name: 'Rice', measurement_unit: 'kg', price: 50,
                           quantity: 5)
      # rubocop:todo Layout/LineLength
      recipe1 = Recipe.create!(user: user1, user_id: user1.id, name: 'prepare Rice', preparation_time: 10, cooking_time: 50,
                               # rubocop:enable Layout/LineLength
                               description: 'Lessons on how to prepare rice', public: true)
      RecipeFood.create!(food: food1, recipe: recipe1, quantity: 50)
  end
  describe 'Food Model validations' do
    it 'should check for invalid if quantity"s column is empty' do
      subject.quantity = 'nil'
      expect(subject).to_not be_valid
    end
  end
end
