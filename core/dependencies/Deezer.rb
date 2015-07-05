require_relative "../helpers/req.rb"
class Deezer
## Artists
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

	def get_top_tracks(id)
		r = Req.new("", "GET")
		r.update_url "http://api.deezer.com/artist/" + id.to_s + "/top"
		return r.do_request["data"]
	end

	def get_related_artists(id)
		r = Req.new("", "GET")
		r.update_url "http://api.deezer.com/artist/" + id.to_s + "/related"
		return r.do_request["data"]
	end

## Album

	def get_album(id)
		r = Req.new("", "GET")
		r.update_url "http://api.deezer.com/album/" + id.to_s
		return r.do_request
	end

	def get_album_tracks(id)
		r = Req.new("", "GET")
		r.update_url "http://api.deezer.com/album/" + id.to_s + "/tracks"
		return r.do_request["data"]
	end

## Genres
	def get_genre(id) # 1..232
		r = Req.new("", "GET")
		r.update_url "http://api.deezer.com/genre/" + id.to_s
		return r.do_request
	end
 


 ## TRACKS
	def get_track(id)
		r = Req.new("", "GET")
		r.update_url "http://api.deezer.com/track/" + id.to_s
		return r.do_request
	end

## Playlists
	def get_playlist(id)
		r = Req.new("", "GET")
		r.update_url "http://api.deezer.com/playlist/" + id.to_s
		return r.do_request
	end

	def get_playlist_tracks(id)
		r = Req.new("", "GET")
		r.update_url "http://api.deezer.com/playlist/" + id.to_s + "/tracks"
		return r.do_request["data"]
	end
## Search

	def search(type, query) # track|artist|album|playlist
		list = ["track", "artist", "album", "playlist"]
		r = Req.new("", "GET")
		q = (list.include?(type)) ?  "/" + type + "?q=" + query : "?q=" + query
		puts "-----> http://api.deezer.com/search#{q}"
		r.update_url "http://api.deezer.com/search" + q
		return r.do_request["data"]
	end

end