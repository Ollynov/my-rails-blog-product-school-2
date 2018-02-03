class Post < ActiveRecord::Base
  validates :title, :body, presence: true
  belongs_to :user

  def length_of_post
    length = self.body.length
    
    count = 1
    numOfWords = 1
    while count <= length
      if self.body[count] == ' '
        numOfWords = numOfWords + 1
      end
      count = count + 1
    end
    #250 words/minute is average reading time
    if numOfWords/250 < 1
      return "Under a Minute"
    else 
      return (numOfWords/250).to_s + " minutes"
    end
  end
end