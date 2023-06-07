insert into track (name, duration, album_id)
values ('my own', 180, 1), ('own my', 181, 2),
	     ('my', 182, 3), ('oh my God', 183, 4),
	     ('myself', 190, 5), ('by myself', 191, 6),
	     ('bemy self', 192, 7), ('myself by', 193, 8),
	     ('by myself by', 194, 9), ('beemy', 195, 10), 
	     ('premyne', 196, 11);

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
