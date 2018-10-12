# begin to build a simple program that models Instagram
# you should have a User class, a Photo class and a comment class


# USER CLASS
class User
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def photos
    Photo.all.select {|photo| photo.user == self}
  end
end

#  PHOTO CLASS
class Photo
  attr_accessor :name, :user
  @@all = []

  def initialize
    @user = user
    self.class.all << self
  end

  def self.all
    @@all
  end

  def comments
    Comment.all.select {|comment| comment.photo == self}
  end

  def make_comment(message)
    Comment.new(message, self)
  end
end

 # COMMENT CLASS
class Comment
  attr_accessor :user, :photo, :message
  @@all = []

  def initialize(message, photo)
    @photo = photo
    @message = message
    self.class.all << self
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
user.photos
# => [#<Photo:0x00007fae2880b370>]


sandwich_photo.comments
# => []

sandwich_photo.make_comment("this is such a beautiful photo of your lunch!! I love photos of other people's lunch")
sandwich_photo.comments
# => [#<Comment:0x00007fae28043700>]

Comment.all
#=> [#<Comment:0x00007fae28043700>]
