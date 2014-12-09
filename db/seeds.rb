g = Group.create(:name => 'Virma', :password => 'virma')
l = Lunch.create(:name => 'Factory', :time => DateTime.now, :group_id => g.id)
Registration.create(:name => 'Lalli', :lunch_id => l.id )
Registration.create(:name => 'Barbara', :lunch_id => l.id )
