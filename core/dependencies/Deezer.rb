require_relative "../helpers/req.rb"
class Deezer
	r = Req.new("http://api.deezer.com/artist/1", "GET")
	for i in 1..10
		r.update_url("http://api.deezer.com/artist/" + i.to_s)
		puts r.do_request["name"]
		r.update_url("http://api.deezer.com/artist/" + i.to_s + "/albums")
		for j in 0..r.do_request["data"].count - 1
			puts "-- " + r.do_request["data"][j]["title"]
		end
	end
end