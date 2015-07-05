require 'net/http'
require 'json'
class Req

	def initialize(url, method)
		@method = (method == "GET") ? 0 : 1
		@url = url
	end

	def update_url new_url
		@url = new_url
	end

	def parameters args
		@post_parameters = args
	end

	def do_request
		uri = URI(@url)
		if @method == 0
			res = Net::HTTP.get_response(uri) 
			return JSON.parse(res.body)
		else
			res = Net::HTTP.post_form(uri, @post_parameters)
			return JSON.parse(res.body)
		end
	end
end