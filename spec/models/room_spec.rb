require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'Validating required fields' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:capacity) }
  end
end
