require 'spec_helper'
describe Group, :type => :model do
  it "orders by last name" do
    g = Group.create(:name => 'wat', :password => 'hat')
    Lunch.create(:name => 'lunch', :time => DateTime.yesterday, :group_id => g.id)
    Lunch.create(:name => 'lunch', :time => DateTime.now, :group_id => g.id)
    g.todays_lunches.count.should == 1
  end
end
