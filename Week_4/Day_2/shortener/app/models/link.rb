class Link < ActiveRecord::Base

  def self.check_http(originallink)
    protocol_user = originallink.scan(/......./)[0]
    protocol = "http://"
    if protocol_user == protocol
      originallink
    else
      protocol + originallink
    end
  end
end
