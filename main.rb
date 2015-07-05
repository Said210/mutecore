require_relative "core/dependencies/Dependencies.rb"
d = Deezer.new

# for i in 1..2
# 	puts d.get_artist(i)["name"]
# 	a = d.get_artist_albums(i)
# 	for j in 0..a.count - 1
# 		puts "[#{a[j]['id']}]- " + a[j]["title"]
# 	end
# end
puts "Thing to search"
q = gets

puts d.search("", q)[0].to_s

#puts d.get_album(8110800)
