module ChirpsHelper
	def get_tagged(chirp)
		message_arr = Array.new
    	message_arr = @chirp.message.split

	    message_arr.each_with_index do |word, index|
	      if word[0] == "#"
	        if Tag.pluck(:phrase).include?(word.downcase)
	          #save that Tag as a variable (to use in ChirpTag creation)
	          tag = Tag.find_by(phrase: word.downcase)
	        else
	          #create a new instance of Tag
	          tag = Tag.create(phrase: word.downcase)
	        end
	        chirp_tag = ChirpTag.create(chirp_id: @chirp.id, tag_id: tag.id)
	        message_arr[index] = "<a href='/tag_chirps?id=#{tag.id}'>#{word}</a>"
	      end
	    end
	    @chirp.update(message: message_arr.join(" "))
	    return chirp
	end
end
