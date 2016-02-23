require 'date'

class Blog
	def initialize
		@posts = []
		@formated_posts = ""
		@actual_page = 0
	end

	def save_post post
		@posts.push post
	end

	def order_by_date
		@posts.sort! { |a,b| a.date <=> b.date }
	end

	def update_page user_respond
		if user_respond.downcase == "r"
			@actual_page += 1 unless @actual_page >= 2
		elsif user_respond.downcase == "l"
			@actual_page -= 1 unless @actual_page <= 0
		end
	end

	def create_front_page
		self.order_by_date
		initial_page_post = @actual_page * 4
		final_page_post = initial_page_post + 3

		(initial_page_post..final_page_post).each do |i|
			if @posts[i].sponsored
				@formated_posts += "*****#{@posts[i].title}******\n**********\n#{@posts[i].text}\n----------\n"
			else
				@formated_posts += "#{@posts[i].title}\n**********\n#{@posts[i].text}\n----------\n"
			end
		end 
	end

	def publish_front_page
		while true do
			@formated_posts = ""
			self.create_front_page
			puts "#{@formated_posts}\n"
			print "Actual page #{@actual_page + 1}\n\n"
			print "Print R [Right] to the next page, L [Left] to the previous page\n\n"
			(1..@posts.length / 4).each do |i|
				print "#{i} "
			end
			puts ""
			self.update_page gets.chomp	
		end
	end
end

class Post
	attr_accessor :title, :date, :text, :sponsored

	def initialize title, date, text, sponsored
		@title = title
		@date = date
		@text = text
		@sponsored = sponsored
	end
end

b = Blog.new

b.save_post Post.new("First Post", Date.today, "This is our first post", true)
b.save_post Post.new("Second Post", Date.today.prev_day, "This is our second post", false)
b.save_post Post.new("Third Post", Date.today.next_day, "This is our third post", false)
b.save_post Post.new("Fourth Post", Date.today, "This is our first post", true)
b.save_post Post.new("Fifth Post", Date.today.prev_day, "This is our second post", false)
b.save_post Post.new("Sixth Post", Date.today.next_day, "This is our third post", false)
b.save_post Post.new("Seventh Post", Date.today, "This is our first post", true)
b.save_post Post.new("Eigth Post", Date.today.prev_day, "This is our second post", false)
b.save_post Post.new("Nineth Post", Date.today.next_day, "This is our third post", false)
b.save_post Post.new("Tenth Post", Date.today, "This is our first post", true)
b.save_post Post.new("Eleventh Post", Date.today.prev_day, "This is our second post", false)
b.save_post Post.new("Twelveth Post", Date.today.next_day, "This is our third post", false)

b.publish_front_page