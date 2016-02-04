require 'io/console'
require 'colorize'

class Blog
	def initialize
		@theseposts = Array.new
	end

	def add_new_post(post)
		@theseposts << post
	end

	def create_front_page
		@theseposts = @theseposts.reverse
		@arraystoshow = Array.new
		@theseposts.each_slice(3) do |post|
			@arraystoshow << post
		end
	end

	def publish_front_page
		color = :green
		@arraystoshow.each_with_index do |little_array, page|
			little_array.each do|post|
				puts post.show_post(color)
			end
			puts ("*****************************THIS IS THE PAGE #{page + 1} \n\n\n").colorize(color)
			color = color_for_page(page)
			sleep 0.1 while STDIN.getch != "["
		end
	end

	def color_for_page(page)
		if page.odd?
			:green
		else
			:blue
		end	
	end
end


class Post
	attr_accessor :title
	attr_accessor :post
	def initialize(title, text)
		@title = title
		@text = text
		@date = Time.new.strftime("Published on %m/%d/%Y")
	end

	def show_post(color)
		puts (@title).colorize(color)
		puts "****************".colorize(color)
		puts (@text).colorize(color)
		puts "------------".colorize(color)
		puts (@date).colorize(color)
	end

end

class Ad < Post
	def show_post(color)
		puts "Advertise Disclaimer: This is a Paid Post".colorize(color)
		puts ("\n*********" + @title + "*********").colorize(color)
		puts (@text).colorize(color)
		puts "------------".colorize(color)
		puts (@date).colorize(color)
	end
end


my_blog = Blog.new
first_post = Post.new("Hello world", "This is my first post")
second_post = Post.new("The Second Post", "Just imagine I have something to say")
paid_post = Ad.new("GET 1000$ CASH (and a very old flipflop)", "You just have to be really annoying to get them. Hurry up!!!")
third_post = Post.new("The Third Wheel", "So you don't fall if you ride a bike")
fourth_post = Post.new("The Fourth Hockey", "The Apocallypsis Now is coming")
fifth_post = Post.new("The Fifth Element", "Well, now this is stupid and I have NOTHING to say. This should be a file")
sixth_post = Post.new("The Sixth Killer", "Six is the devil number")
paid_post_2 = Ad.new("GET 50000$ CASH", "SEND US YOUR ZIP CODE AND A GREEN MONKEY!!!")
my_blog.add_new_post(first_post)
my_blog.add_new_post(second_post)
my_blog.add_new_post(paid_post)
my_blog.add_new_post(third_post)
my_blog.add_new_post(fourth_post)
my_blog.add_new_post(fifth_post)
my_blog.add_new_post(sixth_post)
my_blog.add_new_post(paid_post_2)
my_blog.create_front_page
my_blog.publish_front_page

