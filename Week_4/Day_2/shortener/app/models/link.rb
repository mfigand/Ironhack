class Link < ActiveRecord::Base

  def check_http(originallink)
    protocol_user = originallink.scan(/......./)[0]
    protocol = "http://"
    if protocol_user == protocol
      originallink
    else
      p = protocol + originallink
    end
  end
end
