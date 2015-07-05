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


								#POST REQUEST
								# query = {"user_id" => 5, "post_id" => 6}
								# r = Req.new("http://192.168.0.4:3000/p/fav", "POST")
								# r.parameters(query)

	def do_request
		uri = URI(@url)
		if @method == 0
			res = Net::HTTP.get_response(uri)
		else
			res = Net::HTTP.post_form(uri, @post_parameters)
		end

		begin
			return JSON.parse(res.body)
		rescue
			return res.body
		end
	end


	
end