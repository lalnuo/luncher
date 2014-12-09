require 'spec_helper'
describe Lunch, :type => :model do
  it 'does not save lunch without time' do
    Lunch.create(:name => 'lunch', :group_id => 1)
    Lunch.count.should == 0
  end
end
