# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create!(name: 'Ekene', email: 'example@gmail.com', password: 'password') }

  before { subject.save }

  it 'if name exist' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
