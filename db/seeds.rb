Song.destroy_all
Artist.destroy_all

#artists -- Added the artists to an array to be able to use them randomly while creating the songs with artists.sample.
artists = []
artists << artist1 = Artist.create!( { name: "Iggy Pop"} )
artists << artist2 = Artist.create!( { name: "The Beatles"} )
artists << artist3 = Artist.create!( { name: "The Rolling Stones"} )
artists << artist4 = Artist.create!( { name: "Buena vista social club"})
artists << artist5 = Artist.create!( { name: "Bret Domino trio"} )
artists << artist6 = Artist.create!( { name: "Led Zeppelin"})

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
