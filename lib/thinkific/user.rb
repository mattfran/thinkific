require 'httparty'

class Thinkific::User

  def self.get id
    puts "+++ get one user"
    raise 'not implemented'
  end

  # find by email
  def self.where delta={}
  	if delta[:email]
  		result = HTTParty.get "#{Thinkific::DOMAIN}/api/public/v1/users", 
        :headers => Thinkific.headers, 
        :query => Thinkific.query.merge( :query => delta )
      rs = JSON.parse result.body
      return rs['items'][0]
  	else
  		raise 'not implemented? Expecting email.'
  	end
  end

  def self.create customer={}
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

  # works
  def self.all
  	result = HTTParty.get "#{Thinkific::DOMAIN}/api/public/v1/users", 
      :headers => Thinkific.headers, 
      :query => Thinkific.query
    rs = JSON.parse result.body
    return rs['items']
  end

end


