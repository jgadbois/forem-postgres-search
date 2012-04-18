u = User.new
u.email = 'admin@localhost.com'
u.forem_admin = true
u.password = 'password'
u.forem_state = 'approved'
u.save

User.new
u.email = 'user@localhost.com'
u.forem_admin = false
u.password = 'password'
u.forem_state = 'approved'
u.save

f = Forem::Forum.new
f.category_id = 1
f.title = 'Test Forum'
f.description = "A Test Forum"
f.save

t = Forem::Topic.new
t.forum_id = f.id
t.subject = "What is the meaning of life?"
t.user_id = 1
t.posts.build(:text => '43' )
t.save