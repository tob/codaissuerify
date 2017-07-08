Song.destroy_all
Artist.destroy_all

#artists -- Added the artists to an array to be able to use them randomly while creating the songs with artists.sample.
artists = []
artists << artist1 = Artist.create!( { name: "Iggy Pop", image_url:"http://res.cloudinary.com/djxbktwxl/image/upload/v1499514719/6bec6f659fef26410d3df95dadff156a--iggy-pop-iggy-iggy_xag3bd.jpg"} )
artists << artist2 = Artist.create!( { name: "The Beatles", image_url:"http://res.cloudinary.com/djxbktwxl/image/upload/v1499514762/TheBeatles_bvb4na.jpg"} )
artists << artist3 = Artist.create!( { name: "The Rolling Stones", image_url:"http://res.cloudinary.com/djxbktwxl/image/upload/v1499514839/rs-134713-20131007-stones2-x306-1381179560-1381341128_on4ixz.jpg"} )
artists << artist4 = Artist.create!( { name: "Buena vista social club", image_url:"http://res.cloudinary.com/djxbktwxl/image/upload/v1499514873/Current_28792id_001_large_e3lclg.jpg"})
artists << artist5 = Artist.create!( { name: "Bret Domino trio", image_url:"http://res.cloudinary.com/djxbktwxl/image/upload/v1499514934/300x300_pfiy7k.jpg"} )
artists << artist6 = Artist.create!( { name: "Led Zeppelin", image_url:"http://res.cloudinary.com/djxbktwxl/image/upload/v1499514795/ledzeppelin1973_gruen_webuseonly_qisl6i.jpg"})

artists_count = Artist.all.length
songs_count = Song.all.length


song_titles = [
  'In Twilight', 'The Shoreline', 'The Tide', 'The Dive', 'The Swell', 'A Silver Cloud', 'Sunshine', 'In Bloom', 'Above The Auroras', 'Through The Silence', 'Into The Heavens', 'The Wind In The Trees', 'A Stillness In The Woods', 'Under The Shade', 'A Silver Cloud (Goodnight Mix)', 'In Twilight (The Dream Mix)', 'Through The Silence (The Dawn Mix)', 'Indigo', 'Violet', 'After Violet',
  'Slient Night', 'Moonlight Sonata', 'Lullaby', 'A Starless Night', 'Lull', 'Whispers', 'Prelude', 'Ghosts', 'Nostalgia', 'Finis', 'A Thousand Lights', 'Ascending', 'One And Only', 'Forever', 'The Depths Of Love', 'The End And The Beginning', 'Fathom', 'Brilliance'
]


# song0 = Song.create!({ name: song_titles[1], length: 19, artist: artists.sample})

for song in 0 ... song_titles.size
    count_length = rand(19..45)
    song = Song.create!({ name: song_titles[song], length: count_length, artist: artists.sample})
end

#start printing
divider = "*"*40
puts "#{divider} \n#{artists_count} artists were created. \n #{songs_count} songs were created. \n #{divider}"

#prints songs divided in artists
Artist.all.each do |artist|
  puts "#{divider} \nARTIST - #{artist[:name]}\n#{divider} \n"

  artist.songs.all.each do |song|
    puts "#{song[:name]}"
  end

  puts divider
  # puts Song.first.artist
  # puts Artist.first.songs
end
