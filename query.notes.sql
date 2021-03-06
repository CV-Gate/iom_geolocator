 copy(select g.geonameid,name,latitude,longitude,fclass,fcode,g.country as country_code,c.country as country_name,c.geonameid as country_geonameid,cc2,admin1,admin2,admin3,admin4 from geoname g left outer join countryinfo as c on g.country=c.iso_alpha2 where fcode in ('ADM1','ADM2','ADM3','ADM4','ADM5','ADMD','LTER','PCL','PCLD','PCLF','PCLI','PCLIX','PCLS','PRSH','TERR','ZN','ZNB')) to '/Users/miguelmendoza/Desktop/geo_locations.csv' with CSV HEADER;

 rails g model geolocation geonameid:integer name:string latitude:float longitude:float fclass:string fcode:string country_code:string country_name:string country_geonameid:integer cc2:string admin1:string admin2:string admin3:string admin4:string

 copy(
 select
 g.geonameid,name,latitude,longitude,fclass,fcode,g.country as country_code,c.country as country_name,c.geonameid as country_geonameid,cc2,admin1,admin2,admin3,admin4,
     CASE WHEN c.geonameid = g.geonameid THEN 0 ELSE null END AS adm_level
     from geoname g
     left outer join countryinfo as c on g.country=c.iso_alpha2
     where fcode in ('ADM1','ADM2','ADM3','ADM4','ADM5','ADMD','LTER','PCL','PCLD','PCLF','PCLI','PCLIX','PCLS','PRSH','TERR','ZN','ZNB')) to '/Users/miguelmendoza/Desktop/geo_locations.csv' with CSV HEADER;
