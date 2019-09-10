class Post
  @@post = []
  # to store all the value  => @@post
  attr_reader :post_id, :title, :body ,:user_id
  def initialize(post_id, title, body, user_id)
    @post_id = post_id
    @title = title
    @body = body
    @user_id = user_id
  end

  def self.post
    @@post
  end

  # class method for validation of inputs
  def self.valid?(post_id, title, body, user_id)
    if post_id != '' or title != '' or body != '' or user_id != ''
      return true
    else
      return "plzz fill inputs"
    end
  end

  #class method for creation of blog and pushing in array
  def self.create(post_id, title, body, user_id)
    if (valid?(post_id, title, body, user_id))
      @@post << Post.new(post_id, title, body, user_id)
    end
    @@post
  end

  #method for updation of blog using the post_id
  def update(post_id)
    if update_post = Post.find(post_id)
      puts "\n a. Update_title\n b. Update_body \n c. Cancel"
      inputs = gets.chomp.to_s
      case inputs
      when "a"
        puts "Enter new Title"
        new_title = gets.chomp
        puts "old title \"#{update_post.title}\" changed to \"#{new_title}\" "
      when "b"
        puts "Enter some thing new to Body"
        new_body = gets.chomp
        puts "old body \"#{update_post.body}\" changed to \"#{new_body}\" "
        update_post.body == new_body
      when "c"
        puts "Cancel"
      else
        puts "Not a valid input"
      end
    end
  end

# method to delete or destroy the blog using post_id
  def destroy(post_id)
    if post_delete = Post.find(post_id)
      puts "post #{post_delete.post_id} with title \"#{post_delete.title}\" deleted "
      return @@post.delete(post_delete)
      end
      puts "EMPTY"
  end
# method for comments
def comment
  comments_of_post = []
  Comments.comments.each do |comments|
    if comments.post_id == self.post_id
       comments_of_post << comments
       end
       comments_of_post.each do |comment|
       puts comment.body
     end
  end
end

#Displays the user of the post
def user
  @@posts.each do |post|
    return User.find(post.user_id) if post.post_id == self.post_id && User.find(post.user_id)
  end
  return nil
end

#class method for all
  def self.all
  puts @@post
  end

#class method to find by id
  def self.find(post_id)
    @@post.each do |element|
      if(element.post_id == post_id)
        puts "#{element.post_id} found"
        return element
      end
    end
      puts "Not found"
    end
end
