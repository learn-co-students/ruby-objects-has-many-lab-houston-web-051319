require_relative './post.rb'

class Author
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def posts
        Post.all.select do |post|
            post.author == self
        end
    end

    def add_post(post)
        post.author = self
    end

    def add_post_by_title(post_title)
        new_post = Post.new(post_title)
        self.add_post(new_post)
    end

    def self.post_count
        post_count = 0
        @@all.each do |author|
            post_count += author.posts.count
        end
        post_count
    end

end