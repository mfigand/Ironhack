require 'httparty'
require 'json'
require "radio3/r3_client"

class R3client
    def intialize
      @base_url = "http://api.rtve.es/api/"
      @radio3_id = "849"
    end

    def get_programs (page)
      url = @base_url+'cadenas/'+@radio3_id+'/programas.json?page='+page.to_s
      response = HTTParty.get(url)
      JSON.parse(response.body)['page']
    end

    def get_audios(program_id)
      url = @base_url+'programas/'+program_id.to_s+'audios.json'
      JSON.parse(response.body)['page']
    end
end