require 'httparty'

class Thinkific::Enrollment

  # @TODO: herehere
  def self.create delta={}
  	body = {
      :first_name => customer[:first_name],
      :last_name => customer[:last_name],
      :email => customer[:email],
      :send_welcome_email => false # @TODO: should be true?
  	}
  	result = HTTParty.post "#{Thinkific::DOMAIN}/api/public/v1/users", 
  	  headers: Thinkific.headers,
  	  body: body.to_json
  	rs = JSON.parse result.body
  	if rs['errors']
  		if rs['errors']['email'][0] == 'has already been taken'
  			u = Thinkific::User.where( :email => customer[:email] )
  			return u
  		end
	  else
	  	return rs
	  end
  end

end


