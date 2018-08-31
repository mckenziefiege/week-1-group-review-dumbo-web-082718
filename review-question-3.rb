# begin to build a simple program that models Instagram
# you should have a User class, a Photo class and a comment class
require 'pry'


class User
  attr_reader :name
  attr_accessor

  def initialize(name)
    @name = name
  end

  def photos
    Photo.all.select do |photo|
      photo.user == self
    end
  end
end

class Photo
  @@all = []

  attr_accessor :user, :comments

  def initialize
    @@all << self
    # @@comments = []
  end

  def self.all
    @@all
  end

  def comments
    Comment.all.select do |comment|
      comment.photo == self
    end
  end

  def make_comment(new_comment)
      comment = Comment.new
      comment.photo = self
      comment.text = new_comment
  end



end

class Comment

  @@all = []

  attr_accessor :photo, :text

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end
end


sandwich_photo = Photo.new
sophie = User.new("Sophie")
sandwich_photo.user = sophie
sandwich_photo.user.name
# => "Sophie"
sophie.photos
# => [#<Photo:0x00007fae2880b370>]


sandwich_photo.comments
# => []
binding.pry 
sandwich_photo.make_comment("this is such a beautiful photo of your lunch!! I love photos of other people's lunch")
sandwich_photo.comments
# => [#<Comment:0x00007fae28043700>]

Comment.all
#=> [#<Comment:0x00007fae28043700>]
