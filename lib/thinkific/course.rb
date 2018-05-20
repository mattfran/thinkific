require 'httparty'

class Thinkific::Course

  def self.all
    result = HTTParty.get "#{Thinkific::DOMAIN}/api/public/v1/courses", :headers => self.headers, :query => { :limit => 10000 }
    byebug
    puts "+++ result", result[:items]
    return result['items']
  end

  #
  # private
  # 
  private

  def self.headers
    { 'Content-Type' => 'application/json',
      'X-Auth-Subdomain' => THINKIFIC_SUBDOMAIN,
      'X-Auth-API-Key' => THINKIFIC_KEY
    }
  end

end


