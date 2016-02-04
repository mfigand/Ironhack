require "pry"

class Blog
	def initialize
    @container = []
  end
  def add_post(post)
    @container.push (post)
  end
  
  def publish_front_page
    ordered_posts = @container.sort_by(&:date).reverse do |post| #ordena en orden inverso
    post.date
    end
    ordered_posts.each do |item|
      if item.sponsor == "NO"
       puts "#{item.title}"
       puts "**************"
       puts "#{item.text}"
       puts "--------------"
      elsif 
       puts "*******#{item.title}*******"
       puts "**************"
       puts "#{item.text}"
       puts "--------------"
      end
    end
  end

  def pagination
     numPages = ((@container.length/3).floor+1)
     page = []
     i=0
     loop do
       i+=3
       page = @container[i,i+1,i+2]
       break if i>numPages
     end

    
  end

end

class Post
  attr_reader :title, :date, :text, :sponsor
	def initialize(title, date, text, sponsor)
    @title = title
    @date = date
    @text = text
    @sponsor = sponsor
  end
end

my_blog = Blog.new
post1 = Post.new("Post title 1", "1/Feb/2016", "Post 1 text", "NO")
post3 = Post.new("Post title 3", "3/Feb/2016", "Post 3 text", "NO")
post2 = Post.new("Post title 2", "2/Feb/2016", "Post 2 text", "YES")
post4 = Post.new("Post title 4", "4/Feb/2016", "Post 4 text", "NO")
post5 = Post.new("Post title 5", "5/Feb/2016", "Post 5 text", "NO")
post6 = Post.new("Post title 6", "6/Feb/2016", "Post 6 text", "YES")
post7 = Post.new("Post title 7", "7/Feb/2016", "Post 7 text", "NO")
post8 = Post.new("Post title 8", "8/Feb/2016", "Post 8 text", "YES")

my_blog.add_post(post1)
my_blog.add_post(post2)
my_blog.add_post(post3)
my_blog.add_post(post4)
my_blog.add_post(post5)
my_blog.add_post(post6)
my_blog.add_post(post7)
my_blog.add_post(post8)

my_blog.pagination
my_blog.publish_front_page










