class User
  attr_reader :user_id, :name, :email
  @@user = []
# to store all the value  => @@user
  def initialize(user_id, name, email)
    @user_id = user_id
    @name = name
    @email = email
  end

  def self.user
    @@user
  end
# Class Method for validate the inputs
  def self.valid?(user_id, name, email)
    if (user_id != '') || (name != '') || (email != '')
      true
    else
      'plzz fill inputs'
    end
  end
# Method for create the blog
  def self.create(user_id, name, email)
    @@user << User.new(user_id, name, email) if valid?(user_id, name, email)
    @@user
  end
# Class Method to update the blog entry
  def self.update(user_id)
    if update_post = find(user_id)
      puts "\n a. Update_name\n b. Update_email \n c. Cancel"
      inputs = gets.chomp.to_s
      case inputs
      when 'a'
        puts 'Enter new Name'
        new_name = gets.chomp
        puts "old name \"#{update_post.name}\" changed to \"#{new_name}\" "
      when 'b'
        puts 'Enter New Email'
        new_email = gets.chomp
        puts "old email \"#{update_post.email}\" changed to \"#{new_email}\" "
        update_post.email == new_email
      when 'c'
        puts 'Cancel'
      else
        puts 'Not a valid input'
      end
    end
  end

# Class method to delete or destroy the blog using user_id
  def self.destroy(user_id)
    if post_delete = find(user_id)
    puts "post #{post_delete.user_id} with name \"#{post_delete.name} and \"#{post_delete.email}\" deleted "
    return @@user.delete(post_delete)
    end
    puts 'EMPTY'
  end

# Method for comments
  def comment
    comments_of_user = []
    Comments.comments.each do |comments|
    comments_of_user << comments if comments.user_id == user_id
    end
    comments_of_user.each do |comment|
    puts comment.body
    end
  end

# Method that return the title if user_id of Post class is match the user id of user class or self class
  def post
    array = []
    Post.post.each do |element|
      if element.user_id == self.user_id
        array << element
      end
    end
    array.each do |post|
      puts post.title
    end
  end

# Displays the  name of the user
  def user
      puts self.name
  end

# Class method all
  def self.all
    @@user
  end

# Class method to find the user_id
  def self.find(user_id)
    @@user.each do |element|
      if element.user_id == user_id
        return element
      end
    end
  end
end
