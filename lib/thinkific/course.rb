require 'httparty'

class Thinkific::Course

  def self.all
    result = HTTParty.get "#{Thinkific::DOMAIN}/api/public/v1/courses", 
      :headers => Thinkific::HEADERS, 
      :query => { :limit => 10000 }
    rs = JSON.parse result.body
    return rs['items']
  end

  

end


