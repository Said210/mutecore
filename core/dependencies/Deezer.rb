require_relative "../helpers/req.rb"
class Deezer

	def get_artist(id)
		r = Req.new("", "GET")
		r.update_url "http://api.deezer.com/artist/" + id.to_s
		return r.do_request
	end

	def get_artist_albums(id)
		r = Req.new("", "GET")
		r.update_url "http://api.deezer.com/artist/" + id.to_s + "/albums"
		a = r.do_request["data"]
		return a
	end

	def get_album(id)
		r = Req.new("", "GET")
		r.update_url "http://api.deezer.com/album/" + id.to_s
		return r.do_request
	end

	def get_genre(id) # 1..232
		r = Req.new("", "GET")
		r.update_url "http://api.deezer.com/genre/" + id.to_s
		return r.do_request
	end

end