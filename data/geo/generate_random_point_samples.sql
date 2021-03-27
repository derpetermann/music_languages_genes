-- In this document we generate random point samples from the polygons of the thirteen languages using PostGIS.
-- First, we import the ethnologue language polygons with the PostGIS Shapefile Import/Export Manager. Then we preprocess them and sample random locations from the (multi)-polygons. 

-- PREPROCESSING
---------------------------------

-- Subset the ethnologue polygons 
-- DROP TABLE genetic_ling.language_polygons; 
CREATE TABLE genetic_ling.language_polygons AS 
SELECT geom, nam_label 
FROM genetic_ling.ethnologue_polygons 
WHERE nam_label in ('Russia Buriat', 'Mongolia Buriat', 'Chukchi', 'Even', 'Evenki', 'Greenlandic Inuktitut',
                    'Japanese', 'Korean', 'Koryak', 'Nganasan', 'Gilyak', 'Selkup', 'Yakut', 'Northern Yukaghir');

-- Assign the correct coordinate reference system to the data
SELECT UpdateGeometrySRID('genetic_ling', 'language_polygons','geom', 4326);

-- Ainu is missing in the ethnologue data, we need to handcraft it in QGIS 
INSERT INTO genetic_ling.language_polygons (geom, nam_label)
SELECT  geom, 'Ainu' AS nam_label
FROM genetic_ling.ainu;

-- Use language names from R-script:
-- Russian Buriat and Mongolia Buriat --> Buryat
UPDATE genetic_ling.language_polygons
SET nam_label = 'Buryat'
WHERE nam_label = 'Russia Buriat'  OR nam_label = 'Mongolia Buriat';

-- Greenlandic Inuktitut --> West Greenlandic
UPDATE genetic_ling.language_polygons
SET nam_label = 'West Greenlandic'
WHERE nam_label = 'Greenlandic Inuktitut';

-- Northern Yukaghir -- > Yukagir
UPDATE genetic_ling.language_polygons
SET nam_label = 'Yukagir'
WHERE nam_label = 'Northern Yukaghir';

-- For some languages there are several polygons. Unify these to one (multi)-polygon
-- DROP TABLE genetic_ling.language_polygons_compl;
CREATE TABLE genetic_ling.language_polygons_compl AS
SELECT ST_UNION(geom) geom, nam_label
FROM genetic_ling.language_polygons
GROUP BY nam_label;

-- Add a gid 
ALTER TABLE genetic_ling.language_polygons_compl
ADD COLUMN gid SERIAL; 

-- GENERATE RANDOM LOCATIONS
----------------------------------
-- Sample ~15000 random points from each polygon 
-- DROP TABLE genetic_ling.random_sample_points_languages;
CREATE TABLE genetic_ling.random_sample_points_languages AS
SELECT (dump).geom geom, (dump).path[1] sample_id, gid, nam_label 
FROM (
    	SELECT ST_DUMP(ST_GeneratePoints(geom, 15000)) dump, gid, nam_label
		FROM genetic_ling.language_polygons_compl) a;

