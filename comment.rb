class Comments
  @@comments = []
# to store all the value  => @@comments
  attr_reader :id, :body, :user_id
  def initialize(id, post_id, user_id, body)
    @id = id
    @post_id = post_id
    @user_id = user_id
    @body = body
  end

  def self.comments
    @@comments
  end

# class method for validation of inputs
  def self.valid?(id, _post_id, user_id, body)
    if (id != '') || (title != '') || (body != '') || (user_id != '')
      true
    else
      'plzz fill inputs'
    end
  end

# class method for creation of blog and pushing in array
  def self.create(id, post_id, user_id, body)
    if valid?(id, post_id, user_id, body)
      @@comments << Comments.new(id, post_id, user_id, body)
    end
    @@comments
  end

# class method for updation of blog
  def self.update(id)
    if update_post = find(id)
      puts "\n a. Update_body \n b. Cancel"
      inputs = gets.chomp.to_s
      case inputs
      when 'a'
        puts 'Enter some thing new to Body'
        new_body = gets.chomp
        puts "old body \"#{update_post.body}\" changed to \"#{new_body}\" "
        update_post.body == new_body
      when 'b'
        puts 'Cancel'
      else
        puts 'Not a valid input'
      end
    end
  end

# class method to delete or destroy the blog
  def self.destroy(id)
    # @@post.each do |element|
    if post_delete = find(id)
      puts "post #{post_delete.id} with title \"#{post_delete.body}\" deleted "
      return @@comments.delete(post_delete)
    end
    puts 'EMPTY'
 end

# Displays the user of the comment
  def user
    if User.find(user_id)
      puts User.find(self.user_id).name
    end
  end

# Displays the title and body of the post
  def post
     Post.post.each do |element|
       if element.post_id == self.id
         puts "#{element.title} : #{element.body}"
       end
     end
  end

# class method for all
  def self.all
    @@comments
  end
# class method to find by id
  def self.find(id)
    @@comments.each do |element|
      if element.id == id
        # puts "#{element.id} found"
        return element
      end
    end
  end
end
