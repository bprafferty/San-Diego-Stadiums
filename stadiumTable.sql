create table stadiums2019(id NUMBER(1),
    image BLOB,
    name CLOB,
    lat NUMBER(10),
    lon NUMBER(10));

DECLARE
    l_dir   VARCHAR2(10) := 'images';
    l_file1  VARCHAR2(20) := 'sdccu_stadium.jpg';
    l_file2  VARCHAR2(20) := 'petco_park.jpg';
    l_file3  VARCHAR2(20) := 'pechanga_arena.jpg';
    l_file4  VARCHAR2(20) := 'tony_gwynn_stadium.jpg';
    l_bfile BFILE;
    l_blob  BLOB;
BEGIN
    INSERT INTO stadiums2019(id,image,name,lat,lon)
    VALUES (1,empty_blob(),SDCCU Stadium,32.78,-117.12)
    RETURN image INTO l_blob;

    INSERT INTO stadiums2019(id,image,name,lat,lon)
    VALUES (2,empty_blob(),Petco Park,32.7,-117.15)
    RETURN image INTO l_blob;

    INSERT INTO stadiums2019(id,image,name,lat,lon)
    VALUES (3,empty_blob(),Pechanga Arena,32.75,-117.21)
    RETURN image INTO l_blob;

    INSERT INTO stadiums2019(id,image,name,lat,lon)
    VALUES (4,empty_blob(),Tony Gwynn Stadium,32.77,-117.07)
    RETURN image INTO l_blob;

    l_bfile := BFILENAME(l_dir, l_file);
    DBMS_LOB.fileopen(l_bfile, DBMS_LOB.file_readonly);
    DBMS_LOB.loadfromfile(l_blob, l_bfile, DBMS_LOB.getlength(l_bfile));
    DBMS_LOB.fileclose(l_bfile);

    COMMIT;
END;