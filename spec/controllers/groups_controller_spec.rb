require 'spec_helper'

describe GroupsController, :type => :controller do
  it 'does not show group lunches without permission' do
    Group.create(:name => 'randoms', :password => 'random')
  end

end