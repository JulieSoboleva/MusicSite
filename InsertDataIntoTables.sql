insert into genre(name)
values ('Classical'), ('Jazz'), ('Rap'), ('Electronic'), ('Rock'), 
	   ('Disco'), ('Country'), ('Fusion'), ('Pop'), ('Heavy metal'), 
	   ('Blues'), ('Reggae'), ('Indie'), ('Chanson'), ('Folk');
	  
insert into artist(name)
values ('Ludwig van Beethoven'), ('Louis Armstrong'), ('Johnny Cash'), 
	   ('Secret Service'), ('Led Zeppelin'), ('B.B.King'), ('Joe Dassin'), 
	   ('Zaz'), ('Bob Marley'), ('Paul Mauriat'), ('Taylor Swift'), 
	   ('Mireille Mathieu'), ('Mylène Farmer'), ('Blackmore’s Night'), 
	   ('Bob Dylan'), ('Bobby Bland'); 
	  
insert into genre_artist(artist_id, genre_id)
values (1, 1), (2, 2), (2, 11), (3, 7), (3, 11), (3, 15), (4, 6), (4, 9), 
	   (4, 4), (5, 5), (5, 10), (5, 11), (5, 15), (6, 11), (7, 14), (7, 9), 
	   (8, 14), (8, 2), (8, 15), (9, 12), (10, 1), (10, 9), (11, 7),
	   (11, 9), (11, 13), (11, 15), (12, 14), (12, 9), (13, 5), 
	   (13, 9), (13, 4), (14, 15), (14, 5), (15, 7), (15, 15), (16, 11);

insert into album(name, release_year)
values ('Beethoven Greatest Hits', 1990), ('The Complete Beethoven Piano Concertos', 2023),
	   ('What A Wonderful World', 1967), ('The Ultimate Collection', 1994),
	   ('Nashville 1969', 1969), ('Aux Deux Magots', 1987), ('Led Zeppelin IV', 1971),
	   ('Bobby Bland and B. B. King Together Again', 1976), ('Les Champs-Èlysées', 1969),
	   ('Zaz', 2010), ('Natural Mystic', 1992), ('Love Is Blue', 1986),
	   ('Fearless', 2008), ('Herzlichst, Mireille', 2006), ('L’autre...', 1991),
	   ('Under a Violet Moon', 1999), ('The Village Lanterne', 2006);
	  
insert into artist_album(album_id, artist_id)
values (1, 1), (2, 1), (3, 2), (4, 2), (5, 3), (5, 15), (6, 4), (7, 5), 
	   (8, 6), (8, 16), (9, 7), (10, 8), (11, 9), (12, 10), (13, 11), 
	   (14, 12), (15, 13), (16, 14), (17, 14);
	 
insert into track(name, duration, album_id)
values ('Ruins of Athens Overture', 381, 1),
	   ('Piano Concerto No. 1 in C Major, Op. 15', 2378, 2),
	   ('What a Wonderful World', 138, 3),
	   ('Cabaret', 236, 3),
	   ('Mack the Knife', 206, 4),
	   ('That’s Alright Mama', 166, 5),
	   ('Aux Deux Magots', 249, 6),
	   ('Black Dog', 346, 7),
	   ('Let the Good Times Roll', 340, 8),
	   ('Le Chemin De Papa', 147, 9),
	   ('Je veux', 217, 10),
	   ('Don’t Rock My Boat', 270, 11),
	   ('El Bimbo', 157, 12),
	   ('Love Story', 235, 13),
	   ('Akropolis Adieu', 205, 14),
	   ('Désenchantée', 322, 15),
	   ('Under A Violet Moon', 373, 16),
	   ('Just Call My Name', 289, 17);

insert into collection(name, release_year)
values ('French Music', 2020), ('Country Music', 2008), 
	   ('Instrumental Music', 2000), ('Music for the soul', 2021);

insert into track_collection(collection_id, track_id)
values (1, 10), (1, 11), (1, 15), (1, 16),
	   (2, 6), (2, 14),
	   (3, 1), (3, 2), (3, 7), (3, 13),
	   (4, 3), (4, 4), (4, 5), (4, 16), (4, 17);
