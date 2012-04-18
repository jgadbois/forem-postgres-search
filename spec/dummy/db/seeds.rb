u = User.new({ :email => 'admin@localhost.com', :password => 'password' })
u.forem_admin = true
u.forem_state = 'approved'
u.save

u2 = User.new({ :email => 'user@localhost.com', :password => 'password' })
u2.forem_admin = false
u2.forem_state = 'approved'
u2.save

f = Forem::Forum.create({ :category_id => 1, :title => 'Test Forum', :description => "A Test Forum" })
t = Forem::Topic.new({ :forum_id => f.id, :subject => "What is the meaning of life?", :user_id => u.id })
t.posts.build(:text => '43' )
t.save