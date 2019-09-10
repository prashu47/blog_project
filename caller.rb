# required files of class
require './post'
require './comment'
require './user'


Post.create(1, "Countries", "India", 101)
post1 = Post.find(1)
post1.update(1)
post1.destroy(1)
post1.comment
Post.all

Comments.create(10,1,101,"foradian")
comment1 = Comments.update(10)
Comments.find(10)
Comments.destroy(10)

 User.create(101,"prashu","prashu@foradian.com")
 user1 = User.find(101)
 User.update(101)
 user1.comment
 user1.post
 User.destroy(101)
 User.find(101)
