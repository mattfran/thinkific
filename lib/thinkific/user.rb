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
  		raise 'not implemented'
  	end
  end

  def self.all
    puts "+++ all users"
    raise 'not implemented'
  end

end


