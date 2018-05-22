require 'httparty'

class Thinkific::Enrollment

  # @TODO: pass :activated_at ?
  def self.create delta={}  	
 		raise 'not implemented - expecting user' if !delta[:user]
    raise 'not implemented - expecting user[:id]' if !delta[:user][:id]
    raise 'not implemented - expecting course' if !delta[:course]
    raise 'not implemented - expecting course[:id]' if !delta[:course][:id]

  	# user is id or email
=begin
    if !delta[:user][:id] && delta[:user][:email]
      u = Thinkific::User.where( :email => delta[:user][:email])
      delta[:user][:id] = u[:id]
    end
=end

    body = {
      course_id: delta[:course][:id],
      user_id: delta[:user][:id],
      activated_at: Time.now
  	}
  	result = HTTParty.post "#{Thinkific::DOMAIN}/api/public/v1/enrollments", 
  	  headers: Thinkific.headers,
  	  body: body.to_json
  	rs = JSON.parse result.body
    raise rs['errors'] if rs['errors']
    return rs
  end

end


