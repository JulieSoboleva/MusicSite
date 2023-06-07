-- Название и продолжительность самого длительного трека
select name, duration
  from track t
 where duration = (select max(duration) from track);

-- Название треков, продолжительность которых не менее 3,5 минут
select name
  from track t 
 where duration >= 210;

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно
select name
  from collection c 
 where release_year between 2018 and 2020;
 
-- Исполнители, чьё имя состоит из одного слова
select name
  from artist a 
 where (length(name) - length(replace(name, ' ', '')) + 1) = 1;

-- Количество исполнителей в каждом жанре
select g.name, count(genre_id) as count
  from genre_artist ga, genre g
 where g.id = ga.genre_id 
 group by g.name, genre_id
 order by count desc;

-- Количество треков, вошедших в альбомы 2006–2010 годов
select count(*)
  from track t
 where album_id in (select a.id
  					          from album a 
 					           where release_year between 2006 and 2010);

-- Средняя продолжительность треков по каждому альбому
select a.id, avg(t.duration)  
  from track t, album a 
 where t.album_id = a.id  
 group by a.id
 order by a.id; 
 					
-- Все исполнители, которые не выпустили альбомы в 2006 году
select a.name
  from artist a
 where a.id not in (select art.id 
  					          from album al
  					          join artist_album aa on aa.album_id = al.id 
  					          join artist art on art.id = aa.artist_id 
 			   		         where al.release_year = 2006);

-- Названия сборников, в которых присутствует конкретный исполнитель ('Mylène Farmer')
select distinct c.name
  from track t 
  join track_collection tc on tc.track_id = t.id 
  join collection c on c.id = tc.collection_id
 where t.album_id in (select al.id 
  					            from artist a
  						          join artist_album aa on aa.artist_id = a.id 
  						          join album al on al.id = aa.album_id 
 					             where a.name like 'Mylène Farmer');
 					
-- Названия альбомов, в которых присутствуют исполнители более чем одного жанра
select distinct al.name
  from (select ga.artist_id, count(ga.genre_id) 
  		    from genre_artist ga 
 		     group by ga.artist_id
		    having count(ga.genre_id) > 1) art
  join artist_album aa on art.artist_id = aa.artist_id 
  join album al on al.id = aa.album_id;
 					  
-- Наименования треков, которые не входят в сборники
select t.name
  from track t 
 where t.id not in (select tc.track_id 
 					            from track_collection tc);
  
-- Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько
select a.name
  from track t
  join artist_album aa on aa.album_id = t.album_id 
  join artist a on a.id = aa.artist_id 
 where t.duration = (select min(duration)
  					           from track);
 					 
-- Названия альбомов, содержащих наименьшее количество треков
select al.name
  from album al
  join (select album_id, count(*) n
  		    from track
         group by album_id) cnt on cnt.album_id = al.id
 where cnt.n = (select min(n) 
  				        from (select album_id, count(*) n
  		  				          from track
         		             group by album_id) sub);

-- Название треков, которые содержат слово «мой» или «my»
-- Способ 1
select name
  from track 
 where name ilike 'my %'
    or name ilike '% my'
    or name ilike '% my %'
    or name ilike 'my'
    or name ilike 'мой %'
    or name ilike '% мой'
    or name ilike '% мой %'
    or name ilike 'мой';

-- Способ 2
select name
  from track
 where string_to_array(lower(name), ' ') && array['my', 'мой']; 

-- Способ 3
select name 
  from track
 where name ~* '(\mmy )|( my\M)|( my )|(\mmy\M)|(\mмой )|( мой\M)|( мой )|(\mмой\M)';
