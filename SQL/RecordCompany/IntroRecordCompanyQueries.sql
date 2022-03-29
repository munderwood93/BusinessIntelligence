/* 

select query structure

select [distint]
	T1.table_col_name1 AS WhateverVarYouWantFromTable1,
	T2.table_col_name1 AS WhateverVarYouWantFromTable2,
	T1.table_col_name2,
	T1.[table_col_name3] AS [Whatever Var You Want From Table 1]
from databsename.dbo.table_name1 T1
inner join table_name2 T2 ON T1.primkey = T2.forkey
where T1.val = 'Matt' or T2.Val = 'Alyssa'
ORDER BY T1.val DESC

*/

select * from record_company.dbo.bands;
select * from record_company.dbo.albums;

-- shows all the bands that have an album
select 
	bands.id AS BandID,
	bands.name AS BandName,
	albums.id AS AlbumID, 
	albums.name AS AlbumName,
	albums.release_year AS AlbumReleaseYear
from record_company.dbo.bands bands
inner join record_company.dbo.albums albums ON bands.id  = albums.band_id;


-- shows all the bands regardless of if they have an album or not
select 
	bands.id AS BandID,
	bands.name AS BandName,
	albums.id AS AlbumID, 
	albums.name AS AlbumName,
	albums.release_year AS AlbumReleaseYear
from record_company.dbo.bands bands
left join record_company.dbo.albums albums ON bands.id  = albums.band_id;


-- shows all the albumns regardless of if they have a corresponding band or not
-- this happens to be the same result as inner join bc all albums have corresponding bands in these two tables
select 
	bands.id AS BandID,
	bands.name AS BandName,
	albums.id AS AlbumID, 
	albums.name AS AlbumName,
	albums.release_year AS AlbumReleaseYear
from record_company.dbo.bands bands
right join record_company.dbo.albums albums ON bands.id  = albums.band_id;

-- shows all the bands that have an album where the band is Metallica 
select 
	bands.id AS BandID,
	bands.name AS BandName,
	albums.id AS AlbumID, 
	albums.name AS AlbumName,
	albums.release_year AS AlbumReleaseYear
from record_company.dbo.bands bands
inner join record_company.dbo.albums albums ON bands.id  = albums.band_id
where bands.name = 'Metallica';

select 
	bands.id AS BandID,
	bands.name AS BandName,
	albums.id AS AlbumID, 
	albums.name AS AlbumName,
	albums.release_year AS AlbumReleaseYear
from record_company.dbo.bands bands
inner join record_company.dbo.albums albums ON bands.id  = albums.band_id
where bands.id = 2;

-- shows all the bands that have an album with no release year listed
select 
	bands.id AS BandID,
	bands.name AS BandName,
	albums.id AS AlbumID, 
	albums.name AS AlbumName,
	albums.release_year AS AlbumReleaseYear
from record_company.dbo.bands bands
inner join record_company.dbo.albums albums ON bands.id  = albums.band_id
where albums.release_year is NULL;

-- shows all the bands that have an album with a valid release year listed
select 
	bands.id AS BandID,
	bands.name AS BandName,
	albums.id AS AlbumID, 
	albums.name AS AlbumName,
	albums.release_year AS AlbumReleaseYear
from record_company.dbo.bands bands
inner join record_company.dbo.albums albums ON bands.id  = albums.band_id
where albums.release_year is not NULL;

-- shows all the bands that have an album with a valid release year listed in release year descending order
select 
	bands.id AS BandID,
	bands.name AS BandName,
	albums.id AS AlbumID, 
	albums.name AS AlbumName,
	albums.release_year AS AlbumReleaseYear
from record_company.dbo.bands bands
inner join record_company.dbo.albums albums ON bands.id  = albums.band_id
where albums.release_year is not NULL
order by albums.release_year desc;


-- shows all the bands that have an album with a release year = 2018
select 
	bands.id AS BandID,
	bands.name AS BandName,
	albums.id AS AlbumID, 
	albums.name AS AlbumName,
	albums.release_year AS AlbumReleaseYear
from record_company.dbo.bands bands
inner join record_company.dbo.albums albums ON bands.id  = albums.band_id
where albums.release_year = 2018

-- shows a band and the number of albums they have and most recent album release year using group by
select 
	bands.id AS BandID,
	bands.name AS BandName,
	count(albums.id) as NumberofAlbums, 
	max(albums.release_year) as LatestReleaseYear
from record_company.dbo.bands bands
inner join record_company.dbo.albums albums ON bands.id  = albums.band_id
group by bands.id, bands.name;

-- shows a band and the number of albums they have and most recent album release year using windows functions
select distinct 
	bands.id AS BandID,
	bands.name AS BandName,
	count(albums.id) over(partition by bands.id) as NumberofAlbums, 
	max(albums.release_year) over(partition by bands.id) as LatestReleaseYear
from record_company.dbo.bands bands
inner join record_company.dbo.albums albums ON bands.id  = albums.band_id


