class Chirp < ApplicationRecord
	belongs_to :user

	has_many :chirp_tags
    has_many :tags, through: :chirp_tags

    before_validation :link_check, on: :create

	validates :message, presence: true 
  	validates :message, length: {maximum: 140, too_long: "A chirp is only 140 max. Everybody knows that!"}, on: :create


  	after_validation :apply_link, on: :create

  private

		  def link_check
		  	check = false
		  	if (self.message.include?("https://")) || (self.message.include?("http://")) || (self.message.include?("www."))
		  		check = true
		  	end

		  	if check == true
		    	arr = self.message.split

		      if self.message.include?("http")
		        index = arr.map{ |x| x.include? "http"}.index(true)
		        self.link = arr[index]
		      elsif self.message.include?("www")
		        index = arr.map{ |x| x.include? "www"}.index(true)
		        self.link = "https://#{arr[index]}"
		      end
		    	
		      
		        
		        if arr[index].length > 23
		    	    arr[index] = "#{arr[index][0..19]}..."	
		        end
		    				
		        self.message = arr.join(" ")
		      end
		  end#def link_check

		  def apply_link
		  	arr = self.message.split
		  	index = arr.map{|x| x.include? "http"}.index(true)
		    index = arr.map{ |x| x.include? "www"}.index(true)

		  	if index
		  		url = arr[index]
		  		arr[index] = "<a href='#{self.link}' target='_blank'>#{url} </a> "
		  	end#if

		  	self.message = arr.join(" ")
		  end#apply_link





end
