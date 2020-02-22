require 'rails_helper'

RSpec.describe Cat, type: :model do
  describe 'get_offset_selection' do
    before(:example) do
      100.times do
        FactoryBot.create(:cat)
      end
    end
    it 'returns the max number of records' do
      result = Cat.get_offset_selection(10, 5)
      result.count.should be 10
    end

    it 'return records beginning after the offset ' do
      result = Cat.get_offset_selection(10, 5)
      result.first.id.should be 51
      result.last.id.should be 60
    end
  end
end
