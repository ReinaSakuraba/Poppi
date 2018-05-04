--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.12
-- Dumped by pg_dump version 9.5.12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: xenox; Type: SCHEMA; Schema: -; Owner: poppi
--

CREATE SCHEMA xenox;


ALTER SCHEMA xenox OWNER TO poppi;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: affixes; Type: TABLE; Schema: xenox; Owner: poppi
--

CREATE TABLE xenox.affixes (
    name text NOT NULL,
    effect text NOT NULL
);


ALTER TABLE xenox.affixes OWNER TO poppi;

--
-- Name: class_arts; Type: TABLE; Schema: xenox; Owner: poppi
--

CREATE TABLE xenox.class_arts (
    class text NOT NULL,
    art text NOT NULL,
    level smallint NOT NULL
);


ALTER TABLE xenox.class_arts OWNER TO poppi;

--
-- Name: class_promotions; Type: TABLE; Schema: xenox; Owner: poppi
--

CREATE TABLE xenox.class_promotions (
    class text NOT NULL,
    promotion text NOT NULL
);


ALTER TABLE xenox.class_promotions OWNER TO poppi;

--
-- Name: class_skills; Type: TABLE; Schema: xenox; Owner: poppi
--

CREATE TABLE xenox.class_skills (
    class text NOT NULL,
    skill text NOT NULL,
    level smallint NOT NULL
);


ALTER TABLE xenox.class_skills OWNER TO poppi;

--
-- Name: class_stats; Type: TABLE; Schema: xenox; Owner: poppi
--

CREATE TABLE xenox.class_stats (
    class text NOT NULL,
    hp numeric(3,2) NOT NULL,
    macc numeric(3,2) NOT NULL,
    racc numeric(3,2) NOT NULL,
    matk numeric(3,2) NOT NULL,
    ratk numeric(3,2) NOT NULL,
    eva numeric(3,2) NOT NULL,
    pot numeric(3,2) NOT NULL
);


ALTER TABLE xenox.class_stats OWNER TO poppi;

--
-- Name: classes; Type: TABLE; Schema: xenox; Owner: poppi
--

CREATE TABLE xenox.classes (
    name text NOT NULL,
    melee_weapon text,
    ranged_weapon text,
    skill_slots smallint,
    max_level smallint
);


ALTER TABLE xenox.classes OWNER TO poppi;

--
-- Name: skills; Type: TABLE; Schema: xenox; Owner: poppi
--

CREATE TABLE xenox.skills (
    name text NOT NULL,
    effect text
);


ALTER TABLE xenox.skills OWNER TO poppi;

--
-- Data for Name: affixes; Type: TABLE DATA; Schema: xenox; Owner: poppi
--

COPY xenox.affixes (name, effect) FROM stdin;
Max HP Up I	Boosts maximum HP by 100.
Max HP Up II	Boosts maximum HP by 150.
Max HP Up III	Boosts maximum HP by 200.
Max HP Up IV	Boosts maximum HP by 250.
Max HP Up V	Boosts maximum HP by 300.
Max HP Up VI	Boosts maximum HP by 350.
Max HP Up VII	Boosts maximum HP by 400.
Max HP Up VIII	Boosts maximum HP by 450.
Max HP Up IX	Boosts maximum HP by 500.
Max HP Up X	Boosts maximum HP by 550.
Max HP Up XI	Boosts maximum HP by 600.
Max HP Up XII	Boosts maximum HP by 650.
Max HP Up XIII	Boosts maximum HP by 700.
Max HP Up XIV	Boosts maximum HP by 750.
Max HP Up XV	Boosts maximum HP by 800.
Max HP Up XVI	Boosts maximum HP by 850.
Max HP Up XVII	Boosts maximum HP by 900.
Max HP Up XVIII	Boosts maximum HP by 950.
Max HP Up XIX	Boosts maximum HP by 1000.
Max HP Up XX	Boosts maximum HP by 1500.
Max TP Up I	Boosts maximum TP by 500.
Max TP Up II	Boosts maximum TP by 600.
Max TP Up III	Boosts maximum TP by 700.
Max TP Up IV	Boosts maximum TP by 800.
Max TP Up V	Boosts maximum TP by 900.
Max TP Up VI	Boosts maximum TP by 1000.
Max TP Up VII	Boosts maximum TP by 1100.
Max TP Up VIII	Boosts maximum TP by 1200.
Max TP Up IX	Boosts maximum TP by 1300.
Max TP Up X	Boosts maximum TP by 1400.
Max TP Up XI	Boosts maximum TP by 1500.
Max TP Up XII	Boosts maximum TP by 1600.
Max TP Up XIII	Boosts maximum TP by 1700.
Max TP Up XIV	Boosts maximum TP by 1800.
Max TP Up XV	Boosts maximum TP by 1900.
Max TP Up XVI	Boosts maximum TP by 2000.
Max TP Up XVII	Boosts maximum TP by 2100.
Max TP Up XVIII	Boosts maximum TP by 2200.
Max TP Up XIX	Boosts maximum TP by 2300.
Max TP Up XX	Boosts maximum TP by 3000.
Melee Accuracy Up I	Boosts melee accuracy by 10.
Melee Accuracy Up II	Boosts melee accuracy by 12.
Melee Accuracy Up III	Boosts melee accuracy by 14.
Melee Accuracy Up IV	Boosts melee accuracy by 16.
Melee Accuracy Up V	Boosts melee accuracy by 18.
Melee Accuracy Up VI	Boosts melee accuracy by 20.
Melee Accuracy Up VII	Boosts melee accuracy by 22.
Melee Accuracy Up VIII	Boosts melee accuracy by 24.
Melee Accuracy Up IX	Boosts melee accuracy by 26.
Melee Accuracy Up X	Boosts melee accuracy by 28.
Melee Accuracy Up XI	Boosts melee accuracy by 32.
Melee Accuracy Up XII	Boosts melee accuracy by 34.
Melee Accuracy Up XIII	Boosts melee accuracy by 36.
Melee Accuracy Up XIV	Boosts melee accuracy by 38.
Melee Accuracy Up XV	Boosts melee accuracy by 40.
Melee Accuracy Up XVI	Boosts melee accuracy by 42.
Melee Accuracy Up XVII	Boosts melee accuracy by 44.
Melee Accuracy Up XVIII	Boosts melee accuracy by 46.
Melee Accuracy Up XIX	Boosts melee accuracy by 48.
Melee Accuracy Up XX	Boosts melee accuracy by 50.
Ranged Accuracy Up I	Boosts ranged accuracy by 10.
Ranged Accuracy Up II	Boosts ranged accuracy by 12.
Ranged Accuracy Up III	Boosts ranged accuracy by 14.
Ranged Accuracy Up IV	Boosts ranged accuracy by 16.
Ranged Accuracy Up V	Boosts ranged accuracy by 18.
Ranged Accuracy Up VI	Boosts ranged accuracy by 20.
Ranged Accuracy Up VII	Boosts ranged accuracy by 22.
Ranged Accuracy Up VIII	Boosts ranged accuracy by 24.
Ranged Accuracy Up IX	Boosts ranged accuracy by 26.
Ranged Accuracy Up X	Boosts ranged accuracy by 28.
Ranged Accuracy Up XI	Boosts ranged accuracy by 32.
Ranged Accuracy Up XII	Boosts ranged accuracy by 34.
Ranged Accuracy Up XIII	Boosts ranged accuracy by 36.
Ranged Accuracy Up XIV	Boosts ranged accuracy by 38.
Ranged Accuracy Up XV	Boosts ranged accuracy by 40.
Ranged Accuracy Up XVI	Boosts ranged accuracy by 42.
Ranged Accuracy Up XVII	Boosts ranged accuracy by 44.
Ranged Accuracy Up XVIII	Boosts ranged accuracy by 46.
Ranged Accuracy Up XIX	Boosts ranged accuracy by 48.
Ranged Accuracy Up XX	Boosts ranged accuracy by 50.
Evasion Up I	Boosts evasion by 5.
Evasion Up II	Boosts evasion by 6.
Evasion Up III	Boosts evasion by 7.
Evasion Up IV	Boosts evasion by 8.
Evasion Up V	Boosts evasion by 9.
Evasion Up VI	Boosts evasion by 10.
Evasion Up VII	Boosts evasion by 11.
Evasion Up VIII	Boosts evasion by 12.
Evasion Up IX	Boosts evasion by 13.
Evasion Up X	Boosts evasion by 14.
Evasion Up XI	Boosts evasion by 16.
Evasion Up XII	Boosts evasion by 17.
Evasion Up XIII	Boosts evasion by 18.
Evasion Up XIV	Boosts evasion by 19.
Evasion Up XV	Boosts evasion by 20.
Evasion Up XVI	Boosts evasion by 21.
Evasion Up XVII	Boosts evasion by 22.
Evasion Up XVIII	Boosts evasion by 23.
Evasion Up XIX	Boosts evasion by 24.
Evasion Up XX	Boosts evasion by 25.
Melee Attack Up I	Boosts melee attack by 10.
Melee Attack Up II	Boosts melee attack by 15.
Melee Attack Up III	Boosts melee attack by 20.
Melee Attack Up IV	Boosts melee attack by 25.
Melee Attack Up V	Boosts melee attack by 30.
Melee Attack Up VI	Boosts melee attack by 35.
Melee Attack Up VII	Boosts melee attack by 40.
Melee Attack Up VIII	Boosts melee attack by 45.
Melee Attack Up IX	Boosts melee attack by 50.
Melee Attack Up X	Boosts melee attack by 55.
Melee Attack Up XI	Boosts melee attack by 60.
Melee Attack Up XII	Boosts melee attack by 65.
Melee Attack Up XIII	Boosts melee attack by 70.
Melee Attack Up XIV	Boosts melee attack by 75.
Melee Attack Up XV	Boosts melee attack by 80.
Melee Attack Up XVI	Boosts melee attack by 85.
Melee Attack Up XVII	Boosts melee attack by 90.
Melee Attack Up XVIII	Boosts melee attack by 95.
Melee Attack Up XIX	Boosts melee attack by 100.
Melee Attack Up XX	Boosts melee attack by 150.
Ranged Attack Up I	Boosts ranged attack by 10.
Ranged Attack Up II	Boosts ranged attack by 15.
Ranged Attack Up III	Boosts ranged attack by 20.
Ranged Attack Up IV	Boosts ranged attack by 25.
Ranged Attack Up V	Boosts ranged attack by 30.
Ranged Attack Up VI	Boosts ranged attack by 35.
Ranged Attack Up VII	Boosts ranged attack by 40.
Ranged Attack Up VIII	Boosts ranged attack by 45.
Ranged Attack Up IX	Boosts ranged attack by 50.
Ranged Attack Up X	Boosts ranged attack by 55.
Ranged Attack Up XI	Boosts ranged attack by 60.
Ranged Attack Up XII	Boosts ranged attack by 65.
Ranged Attack Up XIII	Boosts ranged attack by 70.
Ranged Attack Up XIV	Boosts ranged attack by 75.
Ranged Attack Up XV	Boosts ranged attack by 80.
Ranged Attack Up XVI	Boosts ranged attack by 85.
Ranged Attack Up XVII	Boosts ranged attack by 90.
Ranged Attack Up XVIII	Boosts ranged attack by 95.
Ranged Attack Up XIX	Boosts ranged attack by 100.
Ranged Attack Up XX	Boosts ranged attack by 150.
Potential Up I	Boosts potential by 4.
Potential Up II	Boosts potential by 6.
Potential Up III	Boosts potential by 8.
Potential Up IV	Boosts potential by 10.
Potential Up V	Boosts potential by 12.
Potential Up VI	Boosts potential by 14.
Potential Up VII	Boosts potential by 16.
Potential Up VIII	Boosts potential by 18.
Potential Up IX	Boosts potential by 20.
Potential Up X	Boosts potential by 22.
Potential Up XI	Boosts potential by 24.
Potential Up XII	Boosts potential by 26.
Potential Up XIII	Boosts potential by 28.
Potential Up XIV	Boosts potential by 30.
Potential Up XV	Boosts potential by 32.
Potential Up XVI	Boosts potential by 34.
Potential Up XVII	Boosts potential by 36.
Potential Up XVIII	Boosts potential by 38.
Potential Up XIX	Boosts potential by 40.
Potential Up XX	Boosts potential by 50.
Max HP Boost I	Boosts maximum HP by 5%.
Max HP Boost II	Boosts maximum HP by 6%.
Max HP Boost III	Boosts maximum HP by 7%.
Max HP Boost IV	Boosts maximum HP by 8%.
Max HP Boost V	Boosts maximum HP by 9%.
Max HP Boost VI	Boosts maximum HP by 10%.
Max HP Boost VII	Boosts maximum HP by 11%.
Max HP Boost VIII	Boosts maximum HP by 12%.
Max HP Boost IX	Boosts maximum HP by 13%.
Max HP Boost X	Boosts maximum HP by 14%.
Max HP Boost XI	Boosts maximum HP by 16%.
Max HP Boost XII	Boosts maximum HP by 17%.
Max HP Boost XIII	Boosts maximum HP by 18%.
Max HP Boost XIV	Boosts maximum HP by 19%.
Max HP Boost XV	Boosts maximum HP by 20%.
Max HP Boost XVI	Boosts maximum HP by 21%.
Max HP Boost XVII	Boosts maximum HP by 22%.
Max HP Boost XVIII	Boosts maximum HP by 23%.
Max HP Boost XIX	Boosts maximum HP by 24%.
Max HP Boost XX	Boosts maximum HP by 25%.
Max TP Boost I	Boosts maximum TP by 5%.
Max TP Boost II	Boosts maximum TP by 6%.
Max TP Boost III	Boosts maximum TP by 7%.
Max TP Boost IV	Boosts maximum TP by 8%.
Max TP Boost V	Boosts maximum TP by 9%.
Max TP Boost VI	Boosts maximum TP by 10%.
Max TP Boost VII	Boosts maximum TP by 11%.
Max TP Boost VIII	Boosts maximum TP by 12%.
Max TP Boost IX	Boosts maximum TP by 13%.
Max TP Boost X	Boosts maximum TP by 14%.
Max TP Boost XI	Boosts maximum TP by 16%.
Max TP Boost XII	Boosts maximum TP by 17%.
Max TP Boost XIII	Boosts maximum TP by 18%.
Max TP Boost XIV	Boosts maximum TP by 19%.
Max TP Boost XV	Boosts maximum TP by 20%.
Max TP Boost XVI	Boosts maximum TP by 21%.
Max TP Boost XVII	Boosts maximum TP by 22%.
Max TP Boost XVIII	Boosts maximum TP by 23%.
Max TP Boost XIX	Boosts maximum TP by 24%.
Max TP Boost XX	Boosts maximum TP by 25%.
Melee Accuracy Boost I	Boosts melee accuracy by 5%.
Melee Accuracy Boost II	Boosts melee accuracy by 6%.
Melee Accuracy Boost III	Boosts melee accuracy by 7%.
Melee Accuracy Boost IV	Boosts melee accuracy by 8%.
Melee Accuracy Boost V	Boosts melee accuracy by 9%.
Melee Accuracy Boost VI	Boosts melee accuracy by 10%.
Melee Accuracy Boost VII	Boosts melee accuracy by 11%.
Melee Accuracy Boost VIII	Boosts melee accuracy by 12%.
Melee Accuracy Boost IX	Boosts melee accuracy by 13%.
Melee Accuracy Boost X	Boosts melee accuracy by 14%.
Melee Accuracy Boost XI	Boosts melee accuracy by 16%.
Melee Accuracy Boost XII	Boosts melee accuracy by 17%.
Melee Accuracy Boost XIII	Boosts melee accuracy by 18%.
Melee Accuracy Boost XIV	Boosts melee accuracy by 19%.
Melee Accuracy Boost XV	Boosts melee accuracy by 20%.
Melee Accuracy Boost XVI	Boosts melee accuracy by 21%.
Melee Accuracy Boost XVII	Boosts melee accuracy by 22%.
Melee Accuracy Boost XVIII	Boosts melee accuracy by 23%.
Melee Accuracy Boost XIX	Boosts melee accuracy by 24%.
Melee Accuracy Boost XX	Boosts melee accuracy by 25%.
Ranged Accuracy Boost I	Boosts ranged accuracy by 5%.
Ranged Accuracy Boost II	Boosts ranged accuracy by 6%.
Ranged Accuracy Boost III	Boosts ranged accuracy by 7%.
Ranged Accuracy Boost IV	Boosts ranged accuracy by 8%.
Ranged Accuracy Boost V	Boosts ranged accuracy by 9%.
Ranged Accuracy Boost VI	Boosts ranged accuracy by 10%.
Ranged Accuracy Boost VII	Boosts ranged accuracy by 11%.
Ranged Accuracy Boost VIII	Boosts ranged accuracy by 12%.
Ranged Accuracy Boost IX	Boosts ranged accuracy by 13%.
Ranged Accuracy Boost X	Boosts ranged accuracy by 14%.
Ranged Accuracy Boost XI	Boosts ranged accuracy by 16%.
Ranged Accuracy Boost XII	Boosts ranged accuracy by 17%.
Ranged Accuracy Boost XIII	Boosts ranged accuracy by 18%.
Ranged Accuracy Boost XIV	Boosts ranged accuracy by 19%.
Ranged Accuracy Boost XV	Boosts ranged accuracy by 20%.
Ranged Accuracy Boost XVI	Boosts ranged accuracy by 21%.
Ranged Accuracy Boost XVII	Boosts ranged accuracy by 22%.
Ranged Accuracy Boost XVIII	Boosts ranged accuracy by 23%.
Ranged Accuracy Boost XIX	Boosts ranged accuracy by 24%.
Ranged Accuracy Boost XX	Boosts ranged accuracy by 25%.
Evasion Boost I	Boosts evasion by 5%.
Evasion Boost II	Boosts evasion by 6%.
Evasion Boost III	Boosts evasion by 7%.
Evasion Boost IV	Boosts evasion by 8%.
Evasion Boost V	Boosts evasion by 9%.
Evasion Boost VI	Boosts evasion by 10%.
Evasion Boost VII	Boosts evasion by 11%.
Evasion Boost VIII	Boosts evasion by 12%.
Evasion Boost IX	Boosts evasion by 13%.
Evasion Boost X	Boosts evasion by 14%.
Evasion Boost XI	Boosts evasion by 16%.
Evasion Boost XII	Boosts evasion by 17%.
Evasion Boost XIII	Boosts evasion by 18%.
Evasion Boost XIV	Boosts evasion by 19%.
Evasion Boost XV	Boosts evasion by 20%.
Evasion Boost XVI	Boosts evasion by 21%.
Evasion Boost XVII	Boosts evasion by 22%.
Evasion Boost XVIII	Boosts evasion by 23%.
Evasion Boost XIX	Boosts evasion by 24%.
Evasion Boost XX	Boosts evasion by 25%.
Melee Attack Boost I	Boosts melee attack by 5%.
Melee Attack Boost II	Boosts melee attack by 6%.
Melee Attack Boost III	Boosts melee attack by 7%.
Melee Attack Boost IV	Boosts melee attack by 8%.
Melee Attack Boost V	Boosts melee attack by 9%.
Melee Attack Boost VI	Boosts melee attack by 10%.
Melee Attack Boost VII	Boosts melee attack by 11%.
Melee Attack Boost VIII	Boosts melee attack by 12%.
Melee Attack Boost IX	Boosts melee attack by 13%.
Melee Attack Boost X	Boosts melee attack by 14%.
Melee Attack Boost XI	Boosts melee attack by 16%.
Melee Attack Boost XII	Boosts melee attack by 17%.
Melee Attack Boost XIII	Boosts melee attack by 18%.
Melee Attack Boost XIV	Boosts melee attack by 19%.
Melee Attack Boost XV	Boosts melee attack by 20%.
Melee Attack Boost XVI	Boosts melee attack by 21%.
Melee Attack Boost XVII	Boosts melee attack by 22%.
Melee Attack Boost XVIII	Boosts melee attack by 23%.
Melee Attack Boost XIX	Boosts melee attack by 24%.
Melee Attack Boost XX	Boosts melee attack by 25%.
Ranged Attack Boost I	Boosts ranged attack by 5%.
Ranged Attack Boost II	Boosts ranged attack by 6%.
Ranged Attack Boost III	Boosts ranged attack by 7%.
Ranged Attack Boost IV	Boosts ranged attack by 8%.
Ranged Attack Boost V	Boosts ranged attack by 9%.
Ranged Attack Boost VI	Boosts ranged attack by 10%.
Ranged Attack Boost VII	Boosts ranged attack by 11%.
Ranged Attack Boost VIII	Boosts ranged attack by 12%.
Ranged Attack Boost IX	Boosts ranged attack by 13%.
Ranged Attack Boost X	Boosts ranged attack by 14%.
Ranged Attack Boost XI	Boosts ranged attack by 16%.
Ranged Attack Boost XII	Boosts ranged attack by 17%.
Ranged Attack Boost XIII	Boosts ranged attack by 18%.
Ranged Attack Boost XIV	Boosts ranged attack by 19%.
Ranged Attack Boost XV	Boosts ranged attack by 20%.
Ranged Attack Boost XVI	Boosts ranged attack by 21%.
Ranged Attack Boost XVII	Boosts ranged attack by 22%.
Ranged Attack Boost XVIII	Boosts ranged attack by 23%.
Ranged Attack Boost XIX	Boosts ranged attack by 24%.
Ranged Attack Boost XX	Boosts ranged attack by 25%.
Potential Boost I	Boosts potential by 5%.
Potential Boost II	Boosts potential by 6%.
Potential Boost III	Boosts potential by 7%.
Potential Boost IV	Boosts potential by 8%.
Potential Boost V	Boosts potential by 9%.
Potential Boost VI	Boosts potential by 10%.
Potential Boost VII	Boosts potential by 11%.
Potential Boost VIII	Boosts potential by 12%.
Potential Boost IX	Boosts potential by 13%.
Potential Boost X	Boosts potential by 14%.
Potential Boost XI	Boosts potential by 16%.
Potential Boost XII	Boosts potential by 17%.
Potential Boost XIII	Boosts potential by 18%.
Potential Boost XIV	Boosts potential by 19%.
Potential Boost XV	Boosts potential by 20%.
Potential Boost XVI	Boosts potential by 21%.
Potential Boost XVII	Boosts potential by 22%.
Potential Boost XVIII	Boosts potential by 23%.
Potential Boost XIX	Boosts potential by 24%.
Potential Boost XX	Boosts potential by 25%.
Max HP Drive I	Boosts maximum Skell HP by 1%.
Max HP Drive II	Boosts maximum Skell HP by 2%.
Max HP Drive III	Boosts maximum Skell HP by 3%.
Max HP Drive IV	Boosts maximum Skell HP by 4%.
Max HP Drive V	Boosts maximum Skell HP by 5%.
Max HP Drive VI	Boosts maximum Skell HP by 6%.
Max HP Drive VII	Boosts maximum Skell HP by 7%.
Max HP Drive VIII	Boosts maximum Skell HP by 8%.
Max HP Drive IX	Boosts maximum Skell HP by 9%.
Max HP Drive X	Boosts maximum Skell HP by 10%.
Max HP Drive XI	Boosts maximum Skell HP by 11%.
Max HP Drive XII	Boosts maximum Skell HP by 12%.
Max HP Drive XIII	Boosts maximum Skell HP by 13%.
Max HP Drive XIV	Boosts maximum Skell HP by 14%.
Max HP Drive XV	Boosts maximum Skell HP by 15%.
Max HP Drive XVI	Boosts maximum Skell HP by 16%.
Max HP Drive XVII	Boosts maximum Skell HP by 17%.
Max HP Drive XVIII	Boosts maximum Skell HP by 18%.
Max HP Drive XIX	Boosts maximum Skell HP by 19%.
Max HP Drive XX	Boosts maximum Skell HP by 20%.
Max GP Drive I	Boosts maximum Skell GP by 1%.
Max GP Drive II	Boosts maximum Skell GP by 2%.
Max GP Drive III	Boosts maximum Skell GP by 3%.
Max GP Drive IV	Boosts maximum Skell GP by 4%.
Max GP Drive V	Boosts maximum Skell GP by 5%.
Max GP Drive VI	Boosts maximum Skell GP by 6%.
Max GP Drive VII	Boosts maximum Skell GP by 7%.
Max GP Drive VIII	Boosts maximum Skell GP by 8%.
Max GP Drive IX	Boosts maximum Skell GP by 9%.
Max GP Drive X	Boosts maximum Skell GP by 10%.
Max GP Drive XI	Boosts maximum Skell GP by 11%.
Max GP Drive XII	Boosts maximum Skell GP by 12%.
Max GP Drive XIII	Boosts maximum Skell GP by 13%.
Max GP Drive XIV	Boosts maximum Skell GP by 14%.
Max GP Drive XV	Boosts maximum Skell GP by 15%.
Max GP Drive XVI	Boosts maximum Skell GP by 16%.
Max GP Drive XVII	Boosts maximum Skell GP by 17%.
Max GP Drive XVIII	Boosts maximum Skell GP by 18%.
Max GP Drive XIX	Boosts maximum Skell GP by 19%.
Max GP Drive XX	Boosts maximum Skell GP by 20%.
Melee Accuracy Drive I	Boosts Skell melee accuracy by 1%.
Melee Accuracy Drive II	Boosts Skell melee accuracy by 2%.
Melee Accuracy Drive III	Boosts Skell melee accuracy by 3%.
Melee Accuracy Drive IV	Boosts Skell melee accuracy by 4%.
Melee Accuracy Drive V	Boosts Skell melee accuracy by 5%.
Melee Accuracy Drive VI	Boosts Skell melee accuracy by 6%.
Melee Accuracy Drive VII	Boosts Skell melee accuracy by 7%.
Melee Accuracy Drive VIII	Boosts Skell melee accuracy by 8%.
Melee Accuracy Drive IX	Boosts Skell melee accuracy by 9%.
Melee Accuracy Drive X	Boosts Skell melee accuracy by 10%.
Melee Accuracy Drive XI	Boosts Skell melee accuracy by 11%.
Melee Accuracy Drive XII	Boosts Skell melee accuracy by 12%.
Melee Accuracy Drive XIII	Boosts Skell melee accuracy by 13%.
Melee Accuracy Drive XIV	Boosts Skell melee accuracy by 14%.
Melee Accuracy Drive XV	Boosts Skell melee accuracy by 15%.
Melee Accuracy Drive XVI	Boosts Skell melee accuracy by 16%.
Melee Accuracy Drive XVII	Boosts Skell melee accuracy by 17%.
Melee Accuracy Drive XVIII	Boosts Skell melee accuracy by 18%.
Melee Accuracy Drive XIX	Boosts Skell melee accuracy by 19%.
Melee Accuracy Drive XX	Boosts Skell melee accuracy by 20%.
Ranged Accuracy Drive I	Boosts Skell ranged accuracy by 1%.
Ranged Accuracy Drive II	Boosts Skell ranged accuracy by 2%.
Ranged Accuracy Drive III	Boosts Skell ranged accuracy by 3%.
Ranged Accuracy Drive IV	Boosts Skell ranged accuracy by 4%.
Ranged Accuracy Drive V	Boosts Skell ranged accuracy by 5%.
Ranged Accuracy Drive VI	Boosts Skell ranged accuracy by 6%.
Ranged Accuracy Drive VII	Boosts Skell ranged accuracy by 7%.
Ranged Accuracy Drive VIII	Boosts Skell ranged accuracy by 8%.
Ranged Accuracy Drive IX	Boosts Skell ranged accuracy by 9%.
Ranged Accuracy Drive X	Boosts Skell ranged accuracy by 10%.
Ranged Accuracy Drive XI	Boosts Skell ranged accuracy by 11%.
Ranged Accuracy Drive XII	Boosts Skell ranged accuracy by 12%.
Ranged Accuracy Drive XIII	Boosts Skell ranged accuracy by 13%.
Ranged Accuracy Drive XIV	Boosts Skell ranged accuracy by 14%.
Ranged Accuracy Drive XV	Boosts Skell ranged accuracy by 15%.
Ranged Accuracy Drive XVI	Boosts Skell ranged accuracy by 16%.
Ranged Accuracy Drive XVII	Boosts Skell ranged accuracy by 17%.
Ranged Accuracy Drive XVIII	Boosts Skell ranged accuracy by 18%.
Ranged Accuracy Drive XIX	Boosts Skell ranged accuracy by 19%.
Ranged Accuracy Drive XX	Boosts Skell ranged accuracy by 20%.
Evasion Drive I	Boosts Skell evasion by 1%.
Evasion Drive II	Boosts Skell evasion by 2%.
Evasion Drive III	Boosts Skell evasion by 3%.
Evasion Drive IV	Boosts Skell evasion by 4%.
Evasion Drive V	Boosts Skell evasion by 5%.
Evasion Drive VI	Boosts Skell evasion by 6%.
Evasion Drive VII	Boosts Skell evasion by 7%.
Evasion Drive VIII	Boosts Skell evasion by 8%.
Evasion Drive IX	Boosts Skell evasion by 9%.
Evasion Drive X	Boosts Skell evasion by 10%.
Evasion Drive XI	Boosts Skell evasion by 11%.
Evasion Drive XII	Boosts Skell evasion by 12%.
Evasion Drive XIII	Boosts Skell evasion by 13%.
Evasion Drive XIV	Boosts Skell evasion by 14%.
Evasion Drive XV	Boosts Skell evasion by 15%.
Evasion Drive XVI	Boosts Skell evasion by 16%.
Evasion Drive XVII	Boosts Skell evasion by 17%.
Evasion Drive XVIII	Boosts Skell evasion by 18%.
Evasion Drive XIX	Boosts Skell evasion by 19%.
Evasion Drive XX	Boosts Skell evasion by 20%.
Melee Attack Drive I	Boosts Skell melee attack by 1%.
Melee Attack Drive II	Boosts Skell melee attack by 2%.
Melee Attack Drive III	Boosts Skell melee attack by 3%.
Melee Attack Drive IV	Boosts Skell melee attack by 4%.
Melee Attack Drive V	Boosts Skell melee attack by 5%.
Melee Attack Drive VI	Boosts Skell melee attack by 6%.
Melee Attack Drive VII	Boosts Skell melee attack by 7%.
Melee Attack Drive VIII	Boosts Skell melee attack by 8%.
Melee Attack Drive IX	Boosts Skell melee attack by 9%.
Melee Attack Drive X	Boosts Skell melee attack by 10%.
Melee Attack Drive XI	Boosts Skell melee attack by 11%.
Melee Attack Drive XII	Boosts Skell melee attack by 12%.
Melee Attack Drive XIII	Boosts Skell melee attack by 13%.
Melee Attack Drive XIV	Boosts Skell melee attack by 14%.
Melee Attack Drive XV	Boosts Skell melee attack by 15%.
Melee Attack Drive XVI	Boosts Skell melee attack by 16%.
Melee Attack Drive XVII	Boosts Skell melee attack by 17%.
Melee Attack Drive XVIII	Boosts Skell melee attack by 18%.
Melee Attack Drive XIX	Boosts Skell melee attack by 19%.
Melee Attack Drive XX	Boosts Skell melee attack by 20%.
Ranged Attack Drive I	Boosts Skell ranged attack by 1%.
Ranged Attack Drive II	Boosts Skell ranged attack by 2%.
Ranged Attack Drive III	Boosts Skell ranged attack by 3%.
Ranged Attack Drive IV	Boosts Skell ranged attack by 4%.
Ranged Attack Drive V	Boosts Skell ranged attack by 5%.
Ranged Attack Drive VI	Boosts Skell ranged attack by 6%.
Ranged Attack Drive VII	Boosts Skell ranged attack by 7%.
Ranged Attack Drive VIII	Boosts Skell ranged attack by 8%.
Ranged Attack Drive IX	Boosts Skell ranged attack by 9%.
Ranged Attack Drive X	Boosts Skell ranged attack by 10%.
Ranged Attack Drive XI	Boosts Skell ranged attack by 11%.
Ranged Attack Drive XII	Boosts Skell ranged attack by 12%.
Ranged Attack Drive XIII	Boosts Skell ranged attack by 13%.
Ranged Attack Drive XIV	Boosts Skell ranged attack by 14%.
Ranged Attack Drive XV	Boosts Skell ranged attack by 15%.
Ranged Attack Drive XVI	Boosts Skell ranged attack by 16%.
Ranged Attack Drive XVII	Boosts Skell ranged attack by 17%.
Ranged Attack Drive XVIII	Boosts Skell ranged attack by 18%.
Ranged Attack Drive XIX	Boosts Skell ranged attack by 19%.
Ranged Attack Drive XX	Boosts Skell ranged attack by 20%.
Potential Drive I	Boosts Skell potential by 1%.
Potential Drive II	Boosts Skell potential by 2%.
Potential Drive III	Boosts Skell potential by 3%.
Potential Drive IV	Boosts Skell potential by 4%.
Potential Drive V	Boosts Skell potential by 5%.
Potential Drive VI	Boosts Skell potential by 6%.
Potential Drive VII	Boosts Skell potential by 7%.
Potential Drive VIII	Boosts Skell potential by 8%.
Potential Drive IX	Boosts Skell potential by 9%.
Potential Drive X	Boosts Skell potential by 10%.
Potential Drive XI	Boosts Skell potential by 11%.
Potential Drive XII	Boosts Skell potential by 12%.
Potential Drive XIII	Boosts Skell potential by 13%.
Potential Drive XIV	Boosts Skell potential by 14%.
Potential Drive XV	Boosts Skell potential by 15%.
Potential Drive XVI	Boosts Skell potential by 16%.
Potential Drive XVII	Boosts Skell potential by 17%.
Potential Drive XVIII	Boosts Skell potential by 18%.
Potential Drive XIX	Boosts Skell potential by 19%.
Potential Drive XX	Boosts Skell potential by 20%.
Bind: Refuel I	Boosts fuel recovery by 5 unit(s) per second when binding an enemy.
Bind: Refuel II	Boosts fuel recovery by 6 unit(s) per second when binding an enemy.
Bind: Refuel III	Boosts fuel recovery by 7 unit(s) per second when binding an enemy.
Bind: Refuel IV	Boosts fuel recovery by 8 unit(s) per second when binding an enemy.
Bind: Refuel V	Boosts fuel recovery by 9 unit(s) per second when binding an enemy.
Bind: Refuel VI	Boosts fuel recovery by 10 unit(s) per second when binding an enemy.
Bind: Refuel VII	Boosts fuel recovery by 11 unit(s) per second when binding an enemy.
Bind: Refuel VIII	Boosts fuel recovery by 12 unit(s) per second when binding an enemy.
Bind: Refuel IX	Boosts fuel recovery by 13 unit(s) per second when binding an enemy.
Bind: Refuel X	Boosts fuel recovery by 14 unit(s) per second when binding an enemy.
Bind: Refuel XI	Boosts fuel recovery by 16 unit(s) per second when binding an enemy.
Bind: Refuel XII	Boosts fuel recovery by 17 unit(s) per second when binding an enemy.
Bind: Refuel XIII	Boosts fuel recovery by 18 unit(s) per second when binding an enemy.
Bind: Refuel XIV	Boosts fuel recovery by 19 unit(s) per second when binding an enemy.
Bind: Refuel XV	Boosts fuel recovery by 20 unit(s) per second when binding an enemy.
Bind: Refuel XVI	Boosts fuel recovery by 21 unit(s) per second when binding an enemy.
Bind: Refuel XVII	Boosts fuel recovery by 22 unit(s) per second when binding an enemy.
Bind: Refuel XVIII	Boosts fuel recovery by 23 unit(s) per second when binding an enemy.
Bind: Refuel XIX	Boosts fuel recovery by 24 unit(s) per second when binding an enemy.
Bind: Refuel XX	Boosts fuel recovery by 25 unit(s) per second when binding an enemy.
Fuel Efficiency Up I	Boosts fuel efficiency by 5% when fighting in a Skell.
Fuel Efficiency Up II	Boosts fuel efficiency by 10% when fighting in a Skell.
Fuel Efficiency Up III	Boosts fuel efficiency by 15% when fighting in a Skell.
Fuel Efficiency Up IV	Boosts fuel efficiency by 20% when fighting in a Skell.
Fuel Efficiency Up V	Boosts fuel efficiency by 25% when fighting in a Skell.
Fuel Efficiency Up VI	Boosts fuel efficiency by 30% when fighting in a Skell.
Fuel Efficiency Up VII	Boosts fuel efficiency by 35% when fighting in a Skell.
Fuel Efficiency Up VIII	Boosts fuel efficiency by 40% when fighting in a Skell.
Fuel Efficiency Up IX	Boosts fuel efficiency by 45% when fighting in a Skell.
Fuel Efficiency Up X	Boosts fuel efficiency by 50% when fighting in a Skell.
Fuel Efficiency Up XI	Boosts fuel efficiency by 55% when fighting in a Skell.
Fuel Efficiency Up XII	Boosts fuel efficiency by 60% when fighting in a Skell.
Fuel Efficiency Up XIII	Boosts fuel efficiency by 65% when fighting in a Skell.
Fuel Efficiency Up XIV	Boosts fuel efficiency by 70% when fighting in a Skell.
Fuel Efficiency Up XV	Boosts fuel efficiency by 75% when fighting in a Skell.
Fuel Efficiency Up XVI	Boosts fuel efficiency by 80% when fighting in a Skell.
Fuel Efficiency Up XVII	Boosts fuel efficiency by 85% when fighting in a Skell.
Fuel Efficiency Up XVIII	Boosts fuel efficiency by 90% when fighting in a Skell.
Fuel Efficiency Up XIX	Boosts fuel efficiency by 95% when fighting in a Skell.
Fuel Efficiency Up XX	Boosts fuel efficiency by 100% when fighting in a Skell.
Physical Resistance Up I	Boosts physical resistance by 5.
Physical Resistance Up II	Boosts physical resistance by 6.
Physical Resistance Up III	Boosts physical resistance by 7.
Physical Resistance Up IV	Boosts physical resistance by 8.
Physical Resistance Up V	Boosts physical resistance by 9.
Physical Resistance Up VI	Boosts physical resistance by 10.
Physical Resistance Up VII	Boosts physical resistance by 11.
Physical Resistance Up VIII	Boosts physical resistance by 12.
Physical Resistance Up IX	Boosts physical resistance by 13.
Physical Resistance Up X	Boosts physical resistance by 14.
Physical Resistance Up XI	Boosts physical resistance by 16.
Physical Resistance Up XII	Boosts physical resistance by 17.
Physical Resistance Up XIII	Boosts physical resistance by 18.
Physical Resistance Up XIV	Boosts physical resistance by 19.
Physical Resistance Up XV	Boosts physical resistance by 20.
Physical Resistance Up XVI	Boosts physical resistance by 21.
Physical Resistance Up XVII	Boosts physical resistance by 22.
Physical Resistance Up XVIII	Boosts physical resistance by 23.
Physical Resistance Up XIX	Boosts physical resistance by 24.
Physical Resistance Up XX	Boosts physical resistance by 25.
Beam Resistance Up I	Boosts beam resistance by 5.
Beam Resistance Up II	Boosts beam resistance by 6.
Beam Resistance Up III	Boosts beam resistance by 7.
Beam Resistance Up IV	Boosts beam resistance by 8.
Beam Resistance Up V	Boosts beam resistance by 9.
Beam Resistance Up VI	Boosts beam resistance by 10.
Beam Resistance Up VII	Boosts beam resistance by 11.
Beam Resistance Up VIII	Boosts beam resistance by 12.
Beam Resistance Up IX	Boosts beam resistance by 13.
Beam Resistance Up X	Boosts beam resistance by 14.
Beam Resistance Up XI	Boosts beam resistance by 16.
Beam Resistance Up XII	Boosts beam resistance by 17.
Beam Resistance Up XIII	Boosts beam resistance by 18.
Beam Resistance Up XIV	Boosts beam resistance by 19.
Beam Resistance Up XV	Boosts beam resistance by 20.
Beam Resistance Up XVI	Boosts beam resistance by 21.
Beam Resistance Up XVII	Boosts beam resistance by 22.
Beam Resistance Up XVIII	Boosts beam resistance by 23.
Beam Resistance Up XIX	Boosts beam resistance by 24.
Beam Resistance Up XX	Boosts beam resistance by 25.
Electric Resistance Up I	Boosts electric resistance by 5.
Electric Resistance Up II	Boosts electric resistance by 6.
Electric Resistance Up III	Boosts electric resistance by 7.
Electric Resistance Up IV	Boosts electric resistance by 8.
Electric Resistance Up V	Boosts electric resistance by 9.
Electric Resistance Up VI	Boosts electric resistance by 10.
Electric Resistance Up VII	Boosts electric resistance by 11.
Electric Resistance Up VIII	Boosts electric resistance by 12.
Electric Resistance Up IX	Boosts electric resistance by 13.
Electric Resistance Up X	Boosts electric resistance by 14.
Electric Resistance Up XI	Boosts electric resistance by 16.
Electric Resistance Up XII	Boosts electric resistance by 17.
Electric Resistance Up XIII	Boosts electric resistance by 18.
Electric Resistance Up XIV	Boosts electric resistance by 19.
Electric Resistance Up XV	Boosts electric resistance by 20.
Electric Resistance Up XVI	Boosts electric resistance by 21.
Electric Resistance Up XVII	Boosts electric resistance by 22.
Electric Resistance Up XVIII	Boosts electric resistance by 23.
Electric Resistance Up XIX	Boosts electric resistance by 24.
Electric Resistance Up XX	Boosts electric resistance by 25.
Thermal Resistance Up I	Boosts thermal resistance by 5.
Thermal Resistance Up II	Boosts thermal resistance by 6.
Thermal Resistance Up III	Boosts thermal resistance by 7.
Thermal Resistance Up IV	Boosts thermal resistance by 8.
Thermal Resistance Up V	Boosts thermal resistance by 9.
Thermal Resistance Up VI	Boosts thermal resistance by 10.
Thermal Resistance Up VII	Boosts thermal resistance by 11.
Thermal Resistance Up VIII	Boosts thermal resistance by 12.
Thermal Resistance Up IX	Boosts thermal resistance by 13.
Thermal Resistance Up X	Boosts thermal resistance by 14.
Thermal Resistance Up XI	Boosts thermal resistance by 16.
Thermal Resistance Up XII	Boosts thermal resistance by 17.
Thermal Resistance Up XIII	Boosts thermal resistance by 18.
Thermal Resistance Up XIV	Boosts thermal resistance by 19.
Thermal Resistance Up XV	Boosts thermal resistance by 20.
Thermal Resistance Up XVI	Boosts thermal resistance by 21.
Thermal Resistance Up XVII	Boosts thermal resistance by 22.
Thermal Resistance Up XVIII	Boosts thermal resistance by 23.
Thermal Resistance Up XIX	Boosts thermal resistance by 24.
Thermal Resistance Up XX	Boosts thermal resistance by 25.
Ether Resistance Up I	Boosts ether resistance by 5.
Ether Resistance Up II	Boosts ether resistance by 6.
Ether Resistance Up III	Boosts ether resistance by 7.
Ether Resistance Up IV	Boosts ether resistance by 8.
Ether Resistance Up V	Boosts ether resistance by 9.
Ether Resistance Up VI	Boosts ether resistance by 10.
Ether Resistance Up VII	Boosts ether resistance by 11.
Ether Resistance Up VIII	Boosts ether resistance by 12.
Ether Resistance Up IX	Boosts ether resistance by 13.
Ether Resistance Up X	Boosts ether resistance by 14.
Ether Resistance Up XI	Boosts ether resistance by 16.
Ether Resistance Up XII	Boosts ether resistance by 17.
Ether Resistance Up XIII	Boosts ether resistance by 18.
Ether Resistance Up XIV	Boosts ether resistance by 19.
Ether Resistance Up XV	Boosts ether resistance by 20.
Ether Resistance Up XVI	Boosts ether resistance by 21.
Ether Resistance Up XVII	Boosts ether resistance by 22.
Ether Resistance Up XVIII	Boosts ether resistance by 23.
Ether Resistance Up XIX	Boosts ether resistance by 24.
Ether Resistance Up XX	Boosts ether resistance by 25.
Gravity Resistance Up I	Boosts gravity resistance by 5.
Gravity Resistance Up II	Boosts gravity resistance by 6.
Gravity Resistance Up III	Boosts gravity resistance by 7.
Gravity Resistance Up IV	Boosts gravity resistance by 8.
Gravity Resistance Up V	Boosts gravity resistance by 9.
Gravity Resistance Up VI	Boosts gravity resistance by 10.
Gravity Resistance Up VII	Boosts gravity resistance by 11.
Gravity Resistance Up VIII	Boosts gravity resistance by 12.
Gravity Resistance Up IX	Boosts gravity resistance by 13.
Gravity Resistance Up X	Boosts gravity resistance by 14.
Gravity Resistance Up XI	Boosts gravity resistance by 16.
Gravity Resistance Up XII	Boosts gravity resistance by 17.
Gravity Resistance Up XIII	Boosts gravity resistance by 18.
Gravity Resistance Up XIV	Boosts gravity resistance by 19.
Gravity Resistance Up XV	Boosts gravity resistance by 20.
Gravity Resistance Up XVI	Boosts gravity resistance by 21.
Gravity Resistance Up XVII	Boosts gravity resistance by 22.
Gravity Resistance Up XVIII	Boosts gravity resistance by 23.
Gravity Resistance Up XIX	Boosts gravity resistance by 24.
Gravity Resistance Up XX	Boosts gravity resistance by 25.
Weapon Attack Power Up I	Boosts weapon attack by 5%.
Weapon Attack Power Up II	Boosts weapon attack by 10%.
Weapon Attack Power Up III	Boosts weapon attack by 15%.
Weapon Attack Power Up IV	Boosts weapon attack by 20%.
Weapon Attack Power Up V	Boosts weapon attack by 25%.
Weapon Attack Power Up VI	Boosts weapon attack by 30%.
Weapon Attack Power Up VII	Boosts weapon attack by 35%.
Weapon Attack Power Up VIII	Boosts weapon attack by 40%.
Weapon Attack Power Up IX	Boosts weapon attack by 45%.
Weapon Attack Power Up X	Boosts weapon attack by 50%.
Weapon Attack Power Up XI	Boosts weapon attack by 55%.
Weapon Attack Power Up XII	Boosts weapon attack by 60%.
Weapon Attack Power Up XIII	Boosts weapon attack by 65%.
Weapon Attack Power Up XIV	Boosts weapon attack by 70%.
Weapon Attack Power Up XV	Boosts weapon attack by 75%.
Weapon Attack Power Up XVI	Boosts weapon attack by 80%.
Weapon Attack Power Up XVII	Boosts weapon attack by 85%.
Weapon Attack Power Up XVIII	Boosts weapon attack by 90%.
Weapon Attack Power Up XIX	Boosts weapon attack by 95%.
Weapon Attack Power Up XX	Boosts weapon attack by 100%.
Stabilizer I	Boosts weapon stability by 10%.
Stabilizer II	Boosts weapon stability by 12%.
Stabilizer III	Boosts weapon stability by 14%.
Stabilizer IV	Boosts weapon stability by 16%.
Stabilizer V	Boosts weapon stability by 18%.
Stabilizer VI	Boosts weapon stability by 20%.
Stabilizer VII	Boosts weapon stability by 22%.
Stabilizer VIII	Boosts weapon stability by 24%.
Stabilizer IX	Boosts weapon stability by 26%.
Stabilizer X	Boosts weapon stability by 28%.
Stabilizer XI	Boosts weapon stability by 32%.
Stabilizer XII	Boosts weapon stability by 34%.
Stabilizer XIII	Boosts weapon stability by 36%.
Stabilizer XIV	Boosts weapon stability by 38%.
Stabilizer XV	Boosts weapon stability by 40%.
Stabilizer XVI	Boosts weapon stability by 42%.
Stabilizer XVII	Boosts weapon stability by 44%.
Stabilizer XVIII	Boosts weapon stability by 46%.
Stabilizer XIX	Boosts weapon stability by 48%.
Stabilizer XX	Boosts weapon stability by 50%.
Destabilizer I	Reduces weapon stability by 10%.
Destabilizer II	Reduces weapon stability by 12%.
Destabilizer III	Reduces weapon stability by 14%.
Destabilizer IV	Reduces weapon stability by 16%.
Destabilizer V	Reduces weapon stability by 18%.
Destabilizer VI	Reduces weapon stability by 20%.
Destabilizer VII	Reduces weapon stability by 22%.
Destabilizer VIII	Reduces weapon stability by 24%.
Destabilizer IX	Reduces weapon stability by 26%.
Destabilizer X	Reduces weapon stability by 28%.
Destabilizer XI	Reduces weapon stability by 32%.
Destabilizer XII	Reduces weapon stability by 34%.
Destabilizer XIII	Reduces weapon stability by 36%.
Destabilizer XIV	Reduces weapon stability by 38%.
Destabilizer XV	Reduces weapon stability by 40%.
Destabilizer XVI	Reduces weapon stability by 42%.
Destabilizer XVII	Reduces weapon stability by 44%.
Destabilizer XVIII	Reduces weapon stability by 46%.
Destabilizer XIX	Reduces weapon stability by 48%.
Destabilizer XX	Reduces weapon stability by 50%.
Magazine Capacity Up I	Increases magazine capacity for ranged weapons by 1.
Magazine Capacity Up II	Increases magazine capacity for ranged weapons by 2.
Magazine Capacity Up III	Increases magazine capacity for ranged weapons by 3.
Magazine Capacity Up IV	Increases magazine capacity for ranged weapons by 4.
Magazine Capacity Up V	Increases magazine capacity for ranged weapons by 5.
Magazine Capacity Up VI	Increases magazine capacity for ranged weapons by 6.
Magazine Capacity Up VII	Increases magazine capacity for ranged weapons by 7.
Magazine Capacity Up VIII	Increases magazine capacity for ranged weapons by 8.
Magazine Capacity Up IX	Increases magazine capacity for ranged weapons by 9.
Magazine Capacity Up X	Increases magazine capacity for ranged weapons by 10.
Magazine Capacity Up XI	Increases magazine capacity for ranged weapons by 11.
Magazine Capacity Up XII	Increases magazine capacity for ranged weapons by 12.
Magazine Capacity Up XIII	Increases magazine capacity for ranged weapons by 13.
Magazine Capacity Up XIV	Increases magazine capacity for ranged weapons by 14.
Magazine Capacity Up XV	Increases magazine capacity for ranged weapons by 15.
Magazine Capacity Up XVI	Increases magazine capacity for ranged weapons by 16.
Magazine Capacity Up XVII	Increases magazine capacity for ranged weapons by 17.
Magazine Capacity Up XVIII	Increases magazine capacity for ranged weapons by 18.
Magazine Capacity Up XIX	Increases magazine capacity for ranged weapons by 19.
Magazine Capacity Up XX	Increases magazine capacity for ranged weapons by 20.
Melee: TP Gain Up	Boosts TP gain for melee auto-attacks by 50.
Ranged: TP Gain Up	Boosts TP gain for ranged auto-attacks by 20.
Cooldown Reducer I	Reduces auto-attack cooldown by 2%.
Cooldown Reducer II	Reduces auto-attack cooldown by 4%.
Cooldown Reducer III	Reduces auto-attack cooldown by 6%.
Cooldown Reducer IV	Reduces auto-attack cooldown by 8%.
Cooldown Reducer V	Reduces auto-attack cooldown by 10%.
Cooldown Reducer VI	Reduces auto-attack cooldown by 12%.
Cooldown Reducer VII	Reduces auto-attack cooldown by 14%.
Cooldown Reducer VIII	Reduces auto-attack cooldown by 16%.
Cooldown Reducer IX	Reduces auto-attack cooldown by 18%.
Cooldown Reducer X	Reduces auto-attack cooldown by 20%.
Cooldown Reducer XI	Reduces auto-attack cooldown by 22%.
Cooldown Reducer XII	Reduces auto-attack cooldown by 24%.
Cooldown Reducer XIII	Reduces auto-attack cooldown by 26%.
Cooldown Reducer XIV	Reduces auto-attack cooldown by 28%.
Cooldown Reducer XV	Reduces auto-attack cooldown by 30%.
Cooldown Reducer XVI	Reduces auto-attack cooldown by 32%.
Cooldown Reducer XVII	Reduces auto-attack cooldown by 34%.
Cooldown Reducer XVIII	Reduces auto-attack cooldown by 36%.
Cooldown Reducer XIX	Reduces auto-attack cooldown by 38%.
Cooldown Reducer XX	Reduces auto-attack cooldown by 40%.
Firing Range Up I	Boosts ranged weapon range by 5m.
Firing Range Up II	Boosts ranged weapon range by 6m.
Firing Range Up III	Boosts ranged weapon range by 7m.
Firing Range Up IV	Boosts ranged weapon range by 8m.
Firing Range Up V	Boosts ranged weapon range by 9m.
Firing Range Up VI	Boosts ranged weapon range by 10m.
Firing Range Up VII	Boosts ranged weapon range by 11m.
Firing Range Up VIII	Boosts ranged weapon range by 12m.
Firing Range Up IX	Boosts ranged weapon range by 13m.
Firing Range Up X	Boosts ranged weapon range by 14m.
Firing Range Up XI	Boosts ranged weapon range by 16m.
Firing Range Up XII	Boosts ranged weapon range by 17m.
Firing Range Up XIII	Boosts ranged weapon range by 18m.
Firing Range Up XIV	Boosts ranged weapon range by 19m.
Firing Range Up XV	Boosts ranged weapon range by 20m.
Firing Range Up XVI	Boosts ranged weapon range by 21m.
Firing Range Up XVII	Boosts ranged weapon range by 22m.
Firing Range Up XVIII	Boosts ranged weapon range by 23m.
Firing Range Up XIX	Boosts ranged weapon range by 24m.
Firing Range Up XX	Boosts ranged weapon range by 25m.
Resist Stagger I	Boosts resistance to Stagger by 5.
Resist Stagger II	Boosts resistance to Stagger by 10.
Resist Stagger III	Boosts resistance to Stagger by 15.
Resist Stagger IV	Boosts resistance to Stagger by 20.
Resist Stagger V	Boosts resistance to Stagger by 25.
Resist Stagger VI	Boosts resistance to Stagger by 30.
Resist Stagger VII	Boosts resistance to Stagger by 35.
Resist Stagger VIII	Boosts resistance to Stagger by 40.
Resist Stagger IX	Boosts resistance to Stagger by 45.
Resist Stagger X	Boosts resistance to Stagger by 50.
Resist Stagger XI	Boosts resistance to Stagger by 55.
Resist Stagger XII	Boosts resistance to Stagger by 60.
Resist Stagger XIII	Boosts resistance to Stagger by 65.
Resist Stagger XIV	Boosts resistance to Stagger by 70.
Resist Stagger XV	Boosts resistance to Stagger by 75.
Resist Stagger XVI	Boosts resistance to Stagger by 80.
Resist Stagger XVII	Boosts resistance to Stagger by 85.
Resist Stagger XVIII	Boosts resistance to Stagger by 90.
Resist Stagger XIX	Boosts resistance to Stagger by 95.
Resist Stagger XX	Boosts resistance to Stagger by 100.
Resist Flinch I	Boosts resistance to Flinch by 5.
Resist Flinch II	Boosts resistance to Flinch by 10.
Resist Flinch III	Boosts resistance to Flinch by 15.
Resist Flinch IV	Boosts resistance to Flinch by 20.
Resist Flinch V	Boosts resistance to Flinch by 25.
Resist Flinch VI	Boosts resistance to Flinch by 30.
Resist Flinch VII	Boosts resistance to Flinch by 35.
Resist Flinch VIII	Boosts resistance to Flinch by 40.
Resist Flinch IX	Boosts resistance to Flinch by 45.
Resist Flinch X	Boosts resistance to Flinch by 50.
Resist Flinch XI	Boosts resistance to Flinch by 55.
Resist Flinch XII	Boosts resistance to Flinch by 60.
Resist Flinch XIII	Boosts resistance to Flinch by 65.
Resist Flinch XIV	Boosts resistance to Flinch by 70.
Resist Flinch XV	Boosts resistance to Flinch by 75.
Resist Flinch XVI	Boosts resistance to Flinch by 80.
Resist Flinch XVII	Boosts resistance to Flinch by 85.
Resist Flinch XVIII	Boosts resistance to Flinch by 90.
Resist Flinch XIX	Boosts resistance to Flinch by 95.
Resist Flinch XX	Boosts resistance to Flinch by 100.
Resist Topple I	Boosts resistance to Topple by 5.
Resist Topple II	Boosts resistance to Topple by 10.
Resist Topple III	Boosts resistance to Topple by 15.
Resist Topple IV	Boosts resistance to Topple by 20.
Resist Topple V	Boosts resistance to Topple by 25.
Resist Topple VI	Boosts resistance to Topple by 30.
Resist Topple VII	Boosts resistance to Topple by 35.
Resist Topple VIII	Boosts resistance to Topple by 40.
Resist Topple IX	Boosts resistance to Topple by 45.
Resist Topple X	Boosts resistance to Topple by 50.
Resist Topple XI	Boosts resistance to Topple by 55.
Resist Topple XII	Boosts resistance to Topple by 60.
Resist Topple XIII	Boosts resistance to Topple by 65.
Resist Topple XIV	Boosts resistance to Topple by 70.
Resist Topple XV	Boosts resistance to Topple by 75.
Resist Topple XVI	Boosts resistance to Topple by 80.
Resist Topple XVII	Boosts resistance to Topple by 85.
Resist Topple XVIII	Boosts resistance to Topple by 90.
Resist Topple XIX	Boosts resistance to Topple by 95.
Resist Topple XX	Boosts resistance to Topple by 100.
Resist Knockback I	Boosts resistance to Knockback by 5.
Resist Knockback II	Boosts resistance to Knockback by 10.
Resist Knockback III	Boosts resistance to Knockback by 15.
Resist Knockback IV	Boosts resistance to Knockback by 20.
Resist Knockback V	Boosts resistance to Knockback by 25.
Resist Knockback VI	Boosts resistance to Knockback by 30.
Resist Knockback VII	Boosts resistance to Knockback by 35.
Resist Knockback VIII	Boosts resistance to Knockback by 40.
Resist Knockback IX	Boosts resistance to Knockback by 45.
Resist Knockback X	Boosts resistance to Knockback by 50.
Resist Knockback XI	Boosts resistance to Knockback by 55.
Resist Knockback XII	Boosts resistance to Knockback by 60.
Resist Knockback XIII	Boosts resistance to Knockback by 65.
Resist Knockback XIV	Boosts resistance to Knockback by 70.
Resist Knockback XV	Boosts resistance to Knockback by 75.
Resist Knockback XVI	Boosts resistance to Knockback by 80.
Resist Knockback XVII	Boosts resistance to Knockback by 85.
Resist Knockback XVIII	Boosts resistance to Knockback by 90.
Resist Knockback XIX	Boosts resistance to Knockback by 95.
Resist Knockback XX	Boosts resistance to Knockback by 100.
Resist Launch I	Boosts resistance to Launch by 5.
Resist Launch II	Boosts resistance to Launch by 10.
Resist Launch III	Boosts resistance to Launch by 15.
Resist Launch IV	Boosts resistance to Launch by 20.
Resist Launch V	Boosts resistance to Launch by 25.
Resist Launch VI	Boosts resistance to Launch by 30.
Resist Launch VII	Boosts resistance to Launch by 35.
Resist Launch VIII	Boosts resistance to Launch by 40.
Resist Launch IX	Boosts resistance to Launch by 45.
Resist Launch X	Boosts resistance to Launch by 50.
Resist Launch XI	Boosts resistance to Launch by 55.
Resist Launch XII	Boosts resistance to Launch by 60.
Resist Launch XIII	Boosts resistance to Launch by 65.
Resist Launch XIV	Boosts resistance to Launch by 70.
Resist Launch XV	Boosts resistance to Launch by 75.
Resist Launch XVI	Boosts resistance to Launch by 80.
Resist Launch XVII	Boosts resistance to Launch by 85.
Resist Launch XVIII	Boosts resistance to Launch by 90.
Resist Launch XIX	Boosts resistance to Launch by 95.
Resist Launch XX	Boosts resistance to Launch by 100.
Resist Stun I	Boosts resistance to Stun by 5.
Resist Stun II	Boosts resistance to Stun by 10.
Resist Stun III	Boosts resistance to Stun by 15.
Resist Stun IV	Boosts resistance to Stun by 20.
Resist Stun V	Boosts resistance to Stun by 25.
Resist Stun VI	Boosts resistance to Stun by 30.
Resist Stun VII	Boosts resistance to Stun by 35.
Resist Stun VIII	Boosts resistance to Stun by 40.
Resist Stun IX	Boosts resistance to Stun by 45.
Resist Stun X	Boosts resistance to Stun by 50.
Resist Stun XI	Boosts resistance to Stun by 55.
Resist Stun XII	Boosts resistance to Stun by 60.
Resist Stun XIII	Boosts resistance to Stun by 65.
Resist Stun XIV	Boosts resistance to Stun by 70.
Resist Stun XV	Boosts resistance to Stun by 75.
Resist Stun XVI	Boosts resistance to Stun by 80.
Resist Stun XVII	Boosts resistance to Stun by 85.
Resist Stun XVIII	Boosts resistance to Stun by 90.
Resist Stun XIX	Boosts resistance to Stun by 95.
Resist Stun XX	Boosts resistance to Stun by 100.
Resist Sleep I	Boosts resistance to Sleep by 5.
Resist Sleep II	Boosts resistance to Sleep by 10.
Resist Sleep III	Boosts resistance to Sleep by 15.
Resist Sleep IV	Boosts resistance to Sleep by 20.
Resist Sleep V	Boosts resistance to Sleep by 25.
Resist Sleep VI	Boosts resistance to Sleep by 30.
Resist Sleep VII	Boosts resistance to Sleep by 35.
Resist Sleep VIII	Boosts resistance to Sleep by 40.
Resist Sleep IX	Boosts resistance to Sleep by 45.
Resist Sleep X	Boosts resistance to Sleep by 50.
Resist Sleep XI	Boosts resistance to Sleep by 55.
Resist Sleep XII	Boosts resistance to Sleep by 60.
Resist Sleep XIII	Boosts resistance to Sleep by 65.
Resist Sleep XIV	Boosts resistance to Sleep by 70.
Resist Sleep XV	Boosts resistance to Sleep by 75.
Resist Sleep XVI	Boosts resistance to Sleep by 80.
Resist Sleep XVII	Boosts resistance to Sleep by 85.
Resist Sleep XVIII	Boosts resistance to Sleep by 90.
Resist Sleep XIX	Boosts resistance to Sleep by 95.
Resist Sleep XX	Boosts resistance to Sleep by 100.
Resist Taunt I	Boosts resistance to Taunt by 5.
Resist Taunt II	Boosts resistance to Taunt by 10.
Resist Taunt III	Boosts resistance to Taunt by 15.
Resist Taunt IV	Boosts resistance to Taunt by 20.
Resist Taunt V	Boosts resistance to Taunt by 25.
Resist Taunt VI	Boosts resistance to Taunt by 30.
Resist Taunt VII	Boosts resistance to Taunt by 35.
Resist Taunt VIII	Boosts resistance to Taunt by 40.
Resist Taunt IX	Boosts resistance to Taunt by 45.
Resist Taunt X	Boosts resistance to Taunt by 50.
Resist Taunt XI	Boosts resistance to Taunt by 55.
Resist Taunt XII	Boosts resistance to Taunt by 60.
Resist Taunt XIII	Boosts resistance to Taunt by 65.
Resist Taunt XIV	Boosts resistance to Taunt by 70.
Resist Taunt XV	Boosts resistance to Taunt by 75.
Resist Taunt XVI	Boosts resistance to Taunt by 80.
Resist Taunt XVII	Boosts resistance to Taunt by 85.
Resist Taunt XVIII	Boosts resistance to Taunt by 90.
Resist Taunt XIX	Boosts resistance to Taunt by 95.
Resist Taunt XX	Boosts resistance to Taunt by 100.
Resist Control I	Boosts resistance to Control by 5.
Resist Control II	Boosts resistance to Control by 10.
Resist Control III	Boosts resistance to Control by 15.
Resist Control IV	Boosts resistance to Control by 20.
Resist Control V	Boosts resistance to Control by 25.
Resist Control VI	Boosts resistance to Control by 30.
Resist Control VII	Boosts resistance to Control by 35.
Resist Control VIII	Boosts resistance to Control by 40.
Resist Control IX	Boosts resistance to Control by 45.
Resist Control X	Boosts resistance to Control by 50.
Resist Control XI	Boosts resistance to Control by 55.
Resist Control XII	Boosts resistance to Control by 60.
Resist Control XIII	Boosts resistance to Control by 65.
Resist Control XIV	Boosts resistance to Control by 70.
Resist Control XV	Boosts resistance to Control by 75.
Resist Control XVI	Boosts resistance to Control by 80.
Resist Control XVII	Boosts resistance to Control by 85.
Resist Control XVIII	Boosts resistance to Control by 90.
Resist Control XIX	Boosts resistance to Control by 95.
Resist Control XX	Boosts resistance to Control by 100.
Resist Virus I	Boosts resistance to Virus by 5.
Resist Virus II	Boosts resistance to Virus by 10.
Resist Virus III	Boosts resistance to Virus by 15.
Resist Virus IV	Boosts resistance to Virus by 20.
Resist Virus V	Boosts resistance to Virus by 25.
Resist Virus VI	Boosts resistance to Virus by 30.
Resist Virus VII	Boosts resistance to Virus by 35.
Resist Virus VIII	Boosts resistance to Virus by 40.
Resist Virus IX	Boosts resistance to Virus by 45.
Resist Virus X	Boosts resistance to Virus by 50.
Resist Virus XI	Boosts resistance to Virus by 55.
Resist Virus XII	Boosts resistance to Virus by 60.
Resist Virus XIII	Boosts resistance to Virus by 65.
Resist Virus XIV	Boosts resistance to Virus by 70.
Resist Virus XV	Boosts resistance to Virus by 75.
Resist Virus XVI	Boosts resistance to Virus by 80.
Resist Virus XVII	Boosts resistance to Virus by 85.
Resist Virus XVIII	Boosts resistance to Virus by 90.
Resist Virus XIX	Boosts resistance to Virus by 95.
Resist Virus XX	Boosts resistance to Virus by 100.
Resist Blackout I	Boosts resistance to Blackout by 5.
Resist Blackout II	Boosts resistance to Blackout by 10.
Resist Blackout III	Boosts resistance to Blackout by 15.
Resist Blackout IV	Boosts resistance to Blackout by 20.
Resist Blackout V	Boosts resistance to Blackout by 25.
Resist Blackout VI	Boosts resistance to Blackout by 30.
Resist Blackout VII	Boosts resistance to Blackout by 35.
Resist Blackout VIII	Boosts resistance to Blackout by 40.
Resist Blackout IX	Boosts resistance to Blackout by 45.
Resist Blackout X	Boosts resistance to Blackout by 50.
Resist Blackout XI	Boosts resistance to Blackout by 55.
Resist Blackout XII	Boosts resistance to Blackout by 60.
Resist Blackout XIII	Boosts resistance to Blackout by 65.
Resist Blackout XIV	Boosts resistance to Blackout by 70.
Resist Blackout XV	Boosts resistance to Blackout by 75.
Resist Blackout XVI	Boosts resistance to Blackout by 80.
Resist Blackout XVII	Boosts resistance to Blackout by 85.
Resist Blackout XVIII	Boosts resistance to Blackout by 90.
Resist Blackout XIX	Boosts resistance to Blackout by 95.
Resist Blackout XX	Boosts resistance to Blackout by 100.
Resist Fatigue I	Boosts resistance to Fatigue by 5.
Resist Fatigue II	Boosts resistance to Fatigue by 10.
Resist Fatigue III	Boosts resistance to Fatigue by 15.
Resist Fatigue IV	Boosts resistance to Fatigue by 20.
Resist Fatigue V	Boosts resistance to Fatigue by 25.
Resist Fatigue VI	Boosts resistance to Fatigue by 30.
Resist Fatigue VII	Boosts resistance to Fatigue by 35.
Resist Fatigue VIII	Boosts resistance to Fatigue by 40.
Resist Fatigue IX	Boosts resistance to Fatigue by 45.
Resist Fatigue X	Boosts resistance to Fatigue by 50.
Resist Fatigue XI	Boosts resistance to Fatigue by 55.
Resist Fatigue XII	Boosts resistance to Fatigue by 60.
Resist Fatigue XIII	Boosts resistance to Fatigue by 65.
Resist Fatigue XIV	Boosts resistance to Fatigue by 70.
Resist Fatigue XV	Boosts resistance to Fatigue by 75.
Resist Fatigue XVI	Boosts resistance to Fatigue by 80.
Resist Fatigue XVII	Boosts resistance to Fatigue by 85.
Resist Fatigue XVIII	Boosts resistance to Fatigue by 90.
Resist Fatigue XIX	Boosts resistance to Fatigue by 95.
Resist Fatigue XX	Boosts resistance to Fatigue by 100.
Resist Slow Arts I	Boosts resistance to Slow Arts by 5.
Resist Slow Arts II	Boosts resistance to Slow Arts by 10.
Resist Slow Arts III	Boosts resistance to Slow Arts by 15.
Resist Slow Arts IV	Boosts resistance to Slow Arts by 20.
Resist Slow Arts V	Boosts resistance to Slow Arts by 25.
Resist Slow Arts VI	Boosts resistance to Slow Arts by 30.
Resist Slow Arts VII	Boosts resistance to Slow Arts by 35.
Resist Slow Arts VIII	Boosts resistance to Slow Arts by 40.
Resist Slow Arts IX	Boosts resistance to Slow Arts by 45.
Resist Slow Arts X	Boosts resistance to Slow Arts by 50.
Resist Slow Arts XI	Boosts resistance to Slow Arts by 55.
Resist Slow Arts XII	Boosts resistance to Slow Arts by 60.
Resist Slow Arts XIII	Boosts resistance to Slow Arts by 65.
Resist Slow Arts XIV	Boosts resistance to Slow Arts by 70.
Resist Slow Arts XV	Boosts resistance to Slow Arts by 75.
Resist Slow Arts XVI	Boosts resistance to Slow Arts by 80.
Resist Slow Arts XVII	Boosts resistance to Slow Arts by 85.
Resist Slow Arts XVIII	Boosts resistance to Slow Arts by 90.
Resist Slow Arts XIX	Boosts resistance to Slow Arts by 95.
Resist Slow Arts XX	Boosts resistance to Slow Arts by 100.
Resist Physical Res Down I	Boosts resistance to Physical Res Down by 5.
Resist Physical Res Down II	Boosts resistance to Physical Res Down by 10.
Resist Physical Res Down III	Boosts resistance to Physical Res Down by 15.
Resist Physical Res Down IV	Boosts resistance to Physical Res Down by 20.
Resist Physical Res Down V	Boosts resistance to Physical Res Down by 25.
Resist Physical Res Down VI	Boosts resistance to Physical Res Down by 30.
Resist Physical Res Down VII	Boosts resistance to Physical Res Down by 35.
Resist Physical Res Down VIII	Boosts resistance to Physical Res Down by 40.
Resist Physical Res Down IX	Boosts resistance to Physical Res Down by 45.
Resist Physical Res Down X	Boosts resistance to Physical Res Down by 50.
Resist Physical Res Down XI	Boosts resistance to Physical Res Down by 55.
Resist Physical Res Down XII	Boosts resistance to Physical Res Down by 60.
Resist Physical Res Down XIII	Boosts resistance to Physical Res Down by 65.
Resist Physical Res Down XIV	Boosts resistance to Physical Res Down by 70.
Resist Physical Res Down XV	Boosts resistance to Physical Res Down by 75.
Resist Physical Res Down XVI	Boosts resistance to Physical Res Down by 80.
Resist Physical Res Down XVII	Boosts resistance to Physical Res Down by 85.
Resist Physical Res Down XVIII	Boosts resistance to Physical Res Down by 90.
Resist Physical Res Down XIX	Boosts resistance to Physical Res Down by 95.
Resist Physical Res Down XX	Boosts resistance to Physical Res Down by 100.
Resist Beam Res Down I	Boosts resistance to Beam Res Down by 5.
Resist Beam Res Down II	Boosts resistance to Beam Res Down by 10.
Resist Beam Res Down III	Boosts resistance to Beam Res Down by 15.
Resist Beam Res Down IV	Boosts resistance to Beam Res Down by 20.
Resist Beam Res Down V	Boosts resistance to Beam Res Down by 25.
Resist Beam Res Down VI	Boosts resistance to Beam Res Down by 30.
Resist Beam Res Down VII	Boosts resistance to Beam Res Down by 35.
Resist Beam Res Down VIII	Boosts resistance to Beam Res Down by 40.
Resist Beam Res Down IX	Boosts resistance to Beam Res Down by 45.
Resist Beam Res Down X	Boosts resistance to Beam Res Down by 50.
Resist Beam Res Down XI	Boosts resistance to Beam Res Down by 55.
Resist Beam Res Down XII	Boosts resistance to Beam Res Down by 60.
Resist Beam Res Down XIII	Boosts resistance to Beam Res Down by 65.
Resist Beam Res Down XIV	Boosts resistance to Beam Res Down by 70.
Resist Beam Res Down XV	Boosts resistance to Beam Res Down by 75.
Resist Beam Res Down XVI	Boosts resistance to Beam Res Down by 80.
Resist Beam Res Down XVII	Boosts resistance to Beam Res Down by 85.
Resist Beam Res Down XVIII	Boosts resistance to Beam Res Down by 90.
Resist Beam Res Down XIX	Boosts resistance to Beam Res Down by 95.
Resist Beam Res Down XX	Boosts resistance to Beam Res Down by 100.
Resist Thermal Res Down I	Boosts resistance to Thermal Res Down by 5.
Resist Thermal Res Down II	Boosts resistance to Thermal Res Down by 10.
Resist Thermal Res Down III	Boosts resistance to Thermal Res Down by 15.
Resist Thermal Res Down IV	Boosts resistance to Thermal Res Down by 20.
Resist Thermal Res Down V	Boosts resistance to Thermal Res Down by 25.
Resist Thermal Res Down VI	Boosts resistance to Thermal Res Down by 30.
Resist Thermal Res Down VII	Boosts resistance to Thermal Res Down by 35.
Resist Thermal Res Down VIII	Boosts resistance to Thermal Res Down by 40.
Resist Thermal Res Down IX	Boosts resistance to Thermal Res Down by 45.
Resist Thermal Res Down X	Boosts resistance to Thermal Res Down by 50.
Resist Thermal Res Down XI	Boosts resistance to Thermal Res Down by 55.
Resist Thermal Res Down XII	Boosts resistance to Thermal Res Down by 60.
Resist Thermal Res Down XIII	Boosts resistance to Thermal Res Down by 65.
Resist Thermal Res Down XIV	Boosts resistance to Thermal Res Down by 70.
Resist Thermal Res Down XV	Boosts resistance to Thermal Res Down by 75.
Resist Thermal Res Down XVI	Boosts resistance to Thermal Res Down by 80.
Resist Thermal Res Down XVII	Boosts resistance to Thermal Res Down by 85.
Resist Thermal Res Down XVIII	Boosts resistance to Thermal Res Down by 90.
Resist Thermal Res Down XIX	Boosts resistance to Thermal Res Down by 95.
Resist Thermal Res Down XX	Boosts resistance to Thermal Res Down by 100.
Resist Electric Res Down I	Boosts resistance to Electric Res Down by 5.
Resist Electric Res Down II	Boosts resistance to Electric Res Down by 10.
Resist Electric Res Down III	Boosts resistance to Electric Res Down by 15.
Resist Electric Res Down IV	Boosts resistance to Electric Res Down by 20.
Resist Electric Res Down V	Boosts resistance to Electric Res Down by 25.
Resist Electric Res Down VI	Boosts resistance to Electric Res Down by 30.
Resist Electric Res Down VII	Boosts resistance to Electric Res Down by 35.
Resist Electric Res Down VIII	Boosts resistance to Electric Res Down by 40.
Resist Electric Res Down IX	Boosts resistance to Electric Res Down by 45.
Resist Electric Res Down X	Boosts resistance to Electric Res Down by 50.
Resist Electric Res Down XI	Boosts resistance to Electric Res Down by 55.
Resist Electric Res Down XII	Boosts resistance to Electric Res Down by 60.
Resist Electric Res Down XIII	Boosts resistance to Electric Res Down by 65.
Resist Electric Res Down XIV	Boosts resistance to Electric Res Down by 70.
Resist Electric Res Down XV	Boosts resistance to Electric Res Down by 75.
Resist Electric Res Down XVI	Boosts resistance to Electric Res Down by 80.
Resist Electric Res Down XVII	Boosts resistance to Electric Res Down by 85.
Resist Electric Res Down XVIII	Boosts resistance to Electric Res Down by 90.
Resist Electric Res Down XIX	Boosts resistance to Electric Res Down by 95.
Resist Electric Res Down XX	Boosts resistance to Electric Res Down by 100.
Resist Ether Res Down I	Boosts resistance to Ether Res Down by 5.
Resist Ether Res Down II	Boosts resistance to Ether Res Down by 10.
Resist Ether Res Down III	Boosts resistance to Ether Res Down by 15.
Resist Ether Res Down IV	Boosts resistance to Ether Res Down by 20.
Resist Ether Res Down V	Boosts resistance to Ether Res Down by 25.
Resist Ether Res Down VI	Boosts resistance to Ether Res Down by 30.
Resist Ether Res Down VII	Boosts resistance to Ether Res Down by 35.
Resist Ether Res Down VIII	Boosts resistance to Ether Res Down by 40.
Resist Ether Res Down IX	Boosts resistance to Ether Res Down by 45.
Resist Ether Res Down X	Boosts resistance to Ether Res Down by 50.
Resist Ether Res Down XI	Boosts resistance to Ether Res Down by 55.
Resist Ether Res Down XII	Boosts resistance to Ether Res Down by 60.
Resist Ether Res Down XIII	Boosts resistance to Ether Res Down by 65.
Resist Ether Res Down XIV	Boosts resistance to Ether Res Down by 70.
Resist Ether Res Down XV	Boosts resistance to Ether Res Down by 75.
Resist Ether Res Down XVI	Boosts resistance to Ether Res Down by 80.
Resist Ether Res Down XVII	Boosts resistance to Ether Res Down by 85.
Resist Ether Res Down XVIII	Boosts resistance to Ether Res Down by 90.
Resist Ether Res Down XIX	Boosts resistance to Ether Res Down by 95.
Resist Ether Res Down XX	Boosts resistance to Ether Res Down by 100.
Resist Gravity Res Down I	Boosts resistance to Gravity Res Down by 5.
Resist Gravity Res Down II	Boosts resistance to Gravity Res Down by 10.
Resist Gravity Res Down III	Boosts resistance to Gravity Res Down by 15.
Resist Gravity Res Down IV	Boosts resistance to Gravity Res Down by 20.
Resist Gravity Res Down V	Boosts resistance to Gravity Res Down by 25.
Resist Gravity Res Down VI	Boosts resistance to Gravity Res Down by 30.
Resist Gravity Res Down VII	Boosts resistance to Gravity Res Down by 35.
Resist Gravity Res Down VIII	Boosts resistance to Gravity Res Down by 40.
Resist Gravity Res Down IX	Boosts resistance to Gravity Res Down by 45.
Resist Gravity Res Down X	Boosts resistance to Gravity Res Down by 50.
Resist Gravity Res Down XI	Boosts resistance to Gravity Res Down by 55.
Resist Gravity Res Down XII	Boosts resistance to Gravity Res Down by 60.
Resist Gravity Res Down XIII	Boosts resistance to Gravity Res Down by 65.
Resist Gravity Res Down XIV	Boosts resistance to Gravity Res Down by 70.
Resist Gravity Res Down XV	Boosts resistance to Gravity Res Down by 75.
Resist Gravity Res Down XVI	Boosts resistance to Gravity Res Down by 80.
Resist Gravity Res Down XVII	Boosts resistance to Gravity Res Down by 85.
Resist Gravity Res Down XVIII	Boosts resistance to Gravity Res Down by 90.
Resist Gravity Res Down XIX	Boosts resistance to Gravity Res Down by 95.
Resist Gravity Res Down XX	Boosts resistance to Gravity Res Down by 100.
Resist Time Bomb I	Boosts resistance to Time Bomb by 5.
Resist Time Bomb II	Boosts resistance to Time Bomb by 10.
Resist Time Bomb III	Boosts resistance to Time Bomb by 15.
Resist Time Bomb IV	Boosts resistance to Time Bomb by 20.
Resist Time Bomb V	Boosts resistance to Time Bomb by 25.
Resist Time Bomb VI	Boosts resistance to Time Bomb by 30.
Resist Time Bomb VII	Boosts resistance to Time Bomb by 35.
Resist Time Bomb VIII	Boosts resistance to Time Bomb by 40.
Resist Time Bomb IX	Boosts resistance to Time Bomb by 45.
Resist Time Bomb X	Boosts resistance to Time Bomb by 50.
Resist Time Bomb XI	Boosts resistance to Time Bomb by 55.
Resist Time Bomb XII	Boosts resistance to Time Bomb by 60.
Resist Time Bomb XIII	Boosts resistance to Time Bomb by 65.
Resist Time Bomb XIV	Boosts resistance to Time Bomb by 70.
Resist Time Bomb XV	Boosts resistance to Time Bomb by 75.
Resist Time Bomb XVI	Boosts resistance to Time Bomb by 80.
Resist Time Bomb XVII	Boosts resistance to Time Bomb by 85.
Resist Time Bomb XVIII	Boosts resistance to Time Bomb by 90.
Resist Time Bomb XIX	Boosts resistance to Time Bomb by 95.
Resist Time Bomb XX	Boosts resistance to Time Bomb by 100.
Resist Debuff Res Down I	Boosts resistance to Debuff Res Down by 5.
Resist Debuff Res Down II	Boosts resistance to Debuff Res Down by 10.
Resist Debuff Res Down III	Boosts resistance to Debuff Res Down by 15.
Resist Debuff Res Down IV	Boosts resistance to Debuff Res Down by 20.
Resist Debuff Res Down V	Boosts resistance to Debuff Res Down by 25.
Resist Debuff Res Down VI	Boosts resistance to Debuff Res Down by 30.
Resist Debuff Res Down VII	Boosts resistance to Debuff Res Down by 35.
Resist Debuff Res Down VIII	Boosts resistance to Debuff Res Down by 40.
Resist Debuff Res Down IX	Boosts resistance to Debuff Res Down by 45.
Resist Debuff Res Down X	Boosts resistance to Debuff Res Down by 50.
Resist Debuff Res Down XI	Boosts resistance to Debuff Res Down by 55.
Resist Debuff Res Down XII	Boosts resistance to Debuff Res Down by 60.
Resist Debuff Res Down XIII	Boosts resistance to Debuff Res Down by 65.
Resist Debuff Res Down XIV	Boosts resistance to Debuff Res Down by 70.
Resist Debuff Res Down XV	Boosts resistance to Debuff Res Down by 75.
Resist Debuff Res Down XVI	Boosts resistance to Debuff Res Down by 80.
Resist Debuff Res Down XVII	Boosts resistance to Debuff Res Down by 85.
Resist Debuff Res Down XVIII	Boosts resistance to Debuff Res Down by 90.
Resist Debuff Res Down XIX	Boosts resistance to Debuff Res Down by 95.
Resist Debuff Res Down XX	Boosts resistance to Debuff Res Down by 100.
Resist HP Recovery Down I	Boosts resistance to HP Recovery Down by 5.
Resist HP Recovery Down II	Boosts resistance to HP Recovery Down by 10.
Resist HP Recovery Down III	Boosts resistance to HP Recovery Down by 15.
Resist HP Recovery Down IV	Boosts resistance to HP Recovery Down by 20.
Resist HP Recovery Down V	Boosts resistance to HP Recovery Down by 25.
Resist HP Recovery Down VI	Boosts resistance to HP Recovery Down by 30.
Resist HP Recovery Down VII	Boosts resistance to HP Recovery Down by 35.
Resist HP Recovery Down VIII	Boosts resistance to HP Recovery Down by 40.
Resist HP Recovery Down IX	Boosts resistance to HP Recovery Down by 45.
Resist HP Recovery Down X	Boosts resistance to HP Recovery Down by 50.
Resist HP Recovery Down XI	Boosts resistance to HP Recovery Down by 55.
Resist HP Recovery Down XII	Boosts resistance to HP Recovery Down by 60.
Resist HP Recovery Down XIII	Boosts resistance to HP Recovery Down by 65.
Resist HP Recovery Down XIV	Boosts resistance to HP Recovery Down by 70.
Resist HP Recovery Down XV	Boosts resistance to HP Recovery Down by 75.
Resist HP Recovery Down XVI	Boosts resistance to HP Recovery Down by 80.
Resist HP Recovery Down XVII	Boosts resistance to HP Recovery Down by 85.
Resist HP Recovery Down XVIII	Boosts resistance to HP Recovery Down by 90.
Resist HP Recovery Down XIX	Boosts resistance to HP Recovery Down by 95.
Resist HP Recovery Down XX	Boosts resistance to HP Recovery Down by 100.
Resist Blaze I	Boosts resistance to Blaze by 5.
Resist Blaze II	Boosts resistance to Blaze by 10.
Resist Blaze III	Boosts resistance to Blaze by 15.
Resist Blaze IV	Boosts resistance to Blaze by 20.
Resist Blaze V	Boosts resistance to Blaze by 25.
Resist Blaze VI	Boosts resistance to Blaze by 30.
Resist Blaze VII	Boosts resistance to Blaze by 35.
Resist Blaze VIII	Boosts resistance to Blaze by 40.
Resist Blaze IX	Boosts resistance to Blaze by 45.
Resist Blaze X	Boosts resistance to Blaze by 50.
Resist Blaze XI	Boosts resistance to Blaze by 55.
Resist Blaze XII	Boosts resistance to Blaze by 60.
Resist Blaze XIII	Boosts resistance to Blaze by 65.
Resist Blaze XIV	Boosts resistance to Blaze by 70.
Resist Blaze XV	Boosts resistance to Blaze by 75.
Resist Blaze XVI	Boosts resistance to Blaze by 80.
Resist Blaze XVII	Boosts resistance to Blaze by 85.
Resist Blaze XVIII	Boosts resistance to Blaze by 90.
Resist Blaze XIX	Boosts resistance to Blaze by 95.
Resist Blaze XX	Boosts resistance to Blaze by 100.
Resist Shock I	Boosts resistance to Shock by 5.
Resist Shock II	Boosts resistance to Shock by 10.
Resist Shock III	Boosts resistance to Shock by 15.
Resist Shock IV	Boosts resistance to Shock by 20.
Resist Shock V	Boosts resistance to Shock by 25.
Resist Shock VI	Boosts resistance to Shock by 30.
Resist Shock VII	Boosts resistance to Shock by 35.
Resist Shock VIII	Boosts resistance to Shock by 40.
Resist Shock IX	Boosts resistance to Shock by 45.
Resist Shock X	Boosts resistance to Shock by 50.
Resist Shock XI	Boosts resistance to Shock by 55.
Resist Shock XII	Boosts resistance to Shock by 60.
Resist Shock XIII	Boosts resistance to Shock by 65.
Resist Shock XIV	Boosts resistance to Shock by 70.
Resist Shock XV	Boosts resistance to Shock by 75.
Resist Shock XVI	Boosts resistance to Shock by 80.
Resist Shock XVII	Boosts resistance to Shock by 85.
Resist Shock XVIII	Boosts resistance to Shock by 90.
Resist Shock XIX	Boosts resistance to Shock by 95.
Resist Shock XX	Boosts resistance to Shock by 100.
Debuff Suppressor I	Reduces the duration of debuffs by 5%.
Debuff Suppressor II	Reduces the duration of debuffs by 6%.
Debuff Suppressor III	Reduces the duration of debuffs by 7%.
Debuff Suppressor IV	Reduces the duration of debuffs by 8%.
Debuff Suppressor V	Reduces the duration of debuffs by 9%.
Debuff Suppressor VI	Reduces the duration of debuffs by 10%.
Debuff Suppressor VII	Reduces the duration of debuffs by 11%.
Debuff Suppressor VIII	Reduces the duration of debuffs by 12%.
Debuff Suppressor IX	Reduces the duration of debuffs by 13%.
Debuff Suppressor X	Reduces the duration of debuffs by 14%.
Debuff Suppressor XI	Reduces the duration of debuffs by 16%.
Debuff Suppressor XII	Reduces the duration of debuffs by 17%.
Debuff Suppressor XIII	Reduces the duration of debuffs by 18%.
Debuff Suppressor XIV	Reduces the duration of debuffs by 19%.
Debuff Suppressor XV	Reduces the duration of debuffs by 20%.
Debuff Suppressor XVI	Reduces the duration of debuffs by 21%.
Debuff Suppressor XVII	Reduces the duration of debuffs by 22%.
Debuff Suppressor XVIII	Reduces the duration of debuffs by 23%.
Debuff Suppressor XIX	Reduces the duration of debuffs by 24%.
Debuff Suppressor XX	Reduces the duration of debuffs by 25%.
Critical Chance Up I	Boosts critical chance by 1.
Critical Chance Up II	Boosts critical chance by 2.
Critical Chance Up III	Boosts critical chance by 3.
Critical Chance Up IV	Boosts critical chance by 4.
Critical Chance Up V	Boosts critical chance by 5.
Critical Chance Up VI	Boosts critical chance by 6.
Critical Chance Up VII	Boosts critical chance by 7.
Critical Chance Up VIII	Boosts critical chance by 8.
Critical Chance Up IX	Boosts critical chance by 9.
Critical Chance Up X	Boosts critical chance by 10.
Critical Chance Up XI	Boosts critical chance by 11.
Critical Chance Up XII	Boosts critical chance by 12.
Critical Chance Up XIII	Boosts critical chance by 13.
Critical Chance Up XIV	Boosts critical chance by 14.
Critical Chance Up XV	Boosts critical chance by 15.
Critical Chance Up XVI	Boosts critical chance by 16.
Critical Chance Up XVII	Boosts critical chance by 17.
Critical Chance Up XVIII	Boosts critical chance by 18.
Critical Chance Up XIX	Boosts critical chance by 19.
Critical Chance Up XX	Boosts critical chance by 20.
Theroid Criticals Up I	Boosts critical chance against theroid enemies by 2.
Theroid Criticals Up II	Boosts critical chance against theroid enemies by 4.
Theroid Criticals Up III	Boosts critical chance against theroid enemies by 6.
Theroid Criticals Up IV	Boosts critical chance against theroid enemies by 8.
Theroid Criticals Up V	Boosts critical chance against theroid enemies by 10.
Theroid Criticals Up VI	Boosts critical chance against theroid enemies by 12.
Theroid Criticals Up VII	Boosts critical chance against theroid enemies by 14.
Theroid Criticals Up VIII	Boosts critical chance against theroid enemies by 16.
Theroid Criticals Up IX	Boosts critical chance against theroid enemies by 18.
Theroid Criticals Up X	Boosts critical chance against theroid enemies by 20.
Theroid Criticals Up XI	Boosts critical chance against theroid enemies by 22.
Theroid Criticals Up XII	Boosts critical chance against theroid enemies by 24.
Theroid Criticals Up XIII	Boosts critical chance against theroid enemies by 26.
Theroid Criticals Up XIV	Boosts critical chance against theroid enemies by 28.
Theroid Criticals Up XV	Boosts critical chance against theroid enemies by 30.
Theroid Criticals Up XVI	Boosts critical chance against theroid enemies by 32.
Theroid Criticals Up XVII	Boosts critical chance against theroid enemies by 34.
Theroid Criticals Up XVIII	Boosts critical chance against theroid enemies by 36.
Mechanoid Slayer VI	Boosts damage to mechanoid enemies by 20%.
Theroid Criticals Up XIX	Boosts critical chance against theroid enemies by 38.
Theroid Criticals Up XX	Boosts critical chance against theroid enemies by 50.
Insectoid Criticals Up I	Boosts critical chance against insectoid enemies by 2.
Insectoid Criticals Up II	Boosts critical chance against insectoid enemies by 4.
Insectoid Criticals Up III	Boosts critical chance against insectoid enemies by 6.
Insectoid Criticals Up IV	Boosts critical chance against insectoid enemies by 8.
Insectoid Criticals Up V	Boosts critical chance against insectoid enemies by 10.
Insectoid Criticals Up VI	Boosts critical chance against insectoid enemies by 12.
Insectoid Criticals Up VII	Boosts critical chance against insectoid enemies by 14.
Insectoid Criticals Up VIII	Boosts critical chance against insectoid enemies by 16.
Insectoid Criticals Up IX	Boosts critical chance against insectoid enemies by 18.
Insectoid Criticals Up X	Boosts critical chance against insectoid enemies by 20.
Insectoid Criticals Up XI	Boosts critical chance against insectoid enemies by 22.
Insectoid Criticals Up XII	Boosts critical chance against insectoid enemies by 24.
Insectoid Criticals Up XIII	Boosts critical chance against insectoid enemies by 26.
Insectoid Criticals Up XIV	Boosts critical chance against insectoid enemies by 28.
Insectoid Criticals Up XV	Boosts critical chance against insectoid enemies by 30.
Insectoid Criticals Up XVI	Boosts critical chance against insectoid enemies by 32.
Insectoid Criticals Up XVII	Boosts critical chance against insectoid enemies by 34.
Insectoid Criticals Up XVIII	Boosts critical chance against insectoid enemies by 36.
Insectoid Criticals Up XIX	Boosts critical chance against insectoid enemies by 38.
Insectoid Criticals Up XX	Boosts critical chance against insectoid enemies by 50.
Piscinoid Criticals Up I	Boosts critical chance against piscinoid enemies by 2.
Piscinoid Criticals Up II	Boosts critical chance against piscinoid enemies by 4.
Piscinoid Criticals Up III	Boosts critical chance against piscinoid enemies by 6.
Piscinoid Criticals Up IV	Boosts critical chance against piscinoid enemies by 8.
Piscinoid Criticals Up V	Boosts critical chance against piscinoid enemies by 10.
Piscinoid Criticals Up VI	Boosts critical chance against piscinoid enemies by 12.
Piscinoid Criticals Up VII	Boosts critical chance against piscinoid enemies by 14.
Piscinoid Criticals Up VIII	Boosts critical chance against piscinoid enemies by 16.
Piscinoid Criticals Up IX	Boosts critical chance against piscinoid enemies by 18.
Piscinoid Criticals Up X	Boosts critical chance against piscinoid enemies by 20.
Piscinoid Criticals Up XI	Boosts critical chance against piscinoid enemies by 22.
Piscinoid Criticals Up XII	Boosts critical chance against piscinoid enemies by 24.
Piscinoid Criticals Up XIII	Boosts critical chance against piscinoid enemies by 26.
Piscinoid Criticals Up XIV	Boosts critical chance against piscinoid enemies by 28.
Piscinoid Criticals Up XV	Boosts critical chance against piscinoid enemies by 30.
Piscinoid Criticals Up XVI	Boosts critical chance against piscinoid enemies by 32.
Piscinoid Criticals Up XVII	Boosts critical chance against piscinoid enemies by 34.
Piscinoid Criticals Up XVIII	Boosts critical chance against piscinoid enemies by 36.
Piscinoid Criticals Up XIX	Boosts critical chance against piscinoid enemies by 38.
Piscinoid Criticals Up XX	Boosts critical chance against piscinoid enemies by 50.
Humanoid Criticals Up I	Boosts critical chance against humanoid enemies by 2.
Humanoid Criticals Up II	Boosts critical chance against humanoid enemies by 4.
Humanoid Criticals Up III	Boosts critical chance against humanoid enemies by 6.
Humanoid Criticals Up IV	Boosts critical chance against humanoid enemies by 8.
Humanoid Criticals Up V	Boosts critical chance against humanoid enemies by 10.
Humanoid Criticals Up VI	Boosts critical chance against humanoid enemies by 12.
Humanoid Criticals Up VII	Boosts critical chance against humanoid enemies by 14.
Humanoid Criticals Up VIII	Boosts critical chance against humanoid enemies by 16.
Humanoid Criticals Up IX	Boosts critical chance against humanoid enemies by 18.
Humanoid Criticals Up X	Boosts critical chance against humanoid enemies by 20.
Humanoid Criticals Up XI	Boosts critical chance against humanoid enemies by 22.
Humanoid Criticals Up XII	Boosts critical chance against humanoid enemies by 24.
Humanoid Criticals Up XIII	Boosts critical chance against humanoid enemies by 26.
Humanoid Criticals Up XIV	Boosts critical chance against humanoid enemies by 28.
Humanoid Criticals Up XV	Boosts critical chance against humanoid enemies by 30.
Humanoid Criticals Up XVI	Boosts critical chance against humanoid enemies by 32.
Humanoid Criticals Up XVII	Boosts critical chance against humanoid enemies by 34.
Humanoid Criticals Up XVIII	Boosts critical chance against humanoid enemies by 36.
Humanoid Criticals Up XIX	Boosts critical chance against humanoid enemies by 38.
Humanoid Criticals Up XX	Boosts critical chance against humanoid enemies by 50.
Mechanoid Criticals Up I	Boosts critical chance against mechanoid enemies by 2.
Mechanoid Criticals Up II	Boosts critical chance against mechanoid enemies by 4.
Mechanoid Criticals Up III	Boosts critical chance against mechanoid enemies by 6.
Mechanoid Criticals Up IV	Boosts critical chance against mechanoid enemies by 8.
Mechanoid Criticals Up V	Boosts critical chance against mechanoid enemies by 10.
Mechanoid Criticals Up VI	Boosts critical chance against mechanoid enemies by 12.
Mechanoid Criticals Up VII	Boosts critical chance against mechanoid enemies by 14.
Mechanoid Criticals Up VIII	Boosts critical chance against mechanoid enemies by 16.
Mechanoid Criticals Up IX	Boosts critical chance against mechanoid enemies by 18.
Mechanoid Criticals Up X	Boosts critical chance against mechanoid enemies by 20.
Mechanoid Criticals Up XI	Boosts critical chance against mechanoid enemies by 22.
Mechanoid Criticals Up XII	Boosts critical chance against mechanoid enemies by 24.
Mechanoid Criticals Up XIII	Boosts critical chance against mechanoid enemies by 26.
Mechanoid Criticals Up XIV	Boosts critical chance against mechanoid enemies by 28.
Mechanoid Criticals Up XV	Boosts critical chance against mechanoid enemies by 30.
Mechanoid Criticals Up XVI	Boosts critical chance against mechanoid enemies by 32.
Mechanoid Criticals Up XVII	Boosts critical chance against mechanoid enemies by 34.
Mechanoid Criticals Up XVIII	Boosts critical chance against mechanoid enemies by 36.
Mechanoid Criticals Up XIX	Boosts critical chance against mechanoid enemies by 38.
Mechanoid Criticals Up XX	Boosts critical chance against mechanoid enemies by 50.
Chimeroid Criticals Up I	Boosts critical chance against chimeroid enemies by 2.
Chimeroid Criticals Up II	Boosts critical chance against chimeroid enemies by 4.
Chimeroid Criticals Up III	Boosts critical chance against chimeroid enemies by 6.
Chimeroid Criticals Up IV	Boosts critical chance against chimeroid enemies by 8.
Chimeroid Criticals Up V	Boosts critical chance against chimeroid enemies by 10.
Chimeroid Criticals Up VI	Boosts critical chance against chimeroid enemies by 12.
Chimeroid Criticals Up VII	Boosts critical chance against chimeroid enemies by 14.
Chimeroid Criticals Up VIII	Boosts critical chance against chimeroid enemies by 16.
Chimeroid Criticals Up IX	Boosts critical chance against chimeroid enemies by 18.
Chimeroid Criticals Up X	Boosts critical chance against chimeroid enemies by 20.
Chimeroid Criticals Up XI	Boosts critical chance against chimeroid enemies by 22.
Chimeroid Criticals Up XII	Boosts critical chance against chimeroid enemies by 24.
Chimeroid Criticals Up XIII	Boosts critical chance against chimeroid enemies by 26.
Chimeroid Criticals Up XIV	Boosts critical chance against chimeroid enemies by 28.
Chimeroid Criticals Up XV	Boosts critical chance against chimeroid enemies by 30.
Chimeroid Criticals Up XVI	Boosts critical chance against chimeroid enemies by 32.
Chimeroid Criticals Up XVII	Boosts critical chance against chimeroid enemies by 34.
Chimeroid Criticals Up XVIII	Boosts critical chance against chimeroid enemies by 36.
Chimeroid Criticals Up XIX	Boosts critical chance against chimeroid enemies by 38.
Chimeroid Criticals Up XX	Boosts critical chance against chimeroid enemies by 50.
Ultrafauna Criticals Up I	Boosts critical chance against ultrafauna enemies by 2.
Ultrafauna Criticals Up II	Boosts critical chance against ultrafauna enemies by 4.
Ultrafauna Criticals Up III	Boosts critical chance against ultrafauna enemies by 6.
Ultrafauna Criticals Up IV	Boosts critical chance against ultrafauna enemies by 8.
Ultrafauna Criticals Up V	Boosts critical chance against ultrafauna enemies by 10.
Ultrafauna Criticals Up VI	Boosts critical chance against ultrafauna enemies by 12.
Ultrafauna Criticals Up VII	Boosts critical chance against ultrafauna enemies by 14.
Ultrafauna Criticals Up VIII	Boosts critical chance against ultrafauna enemies by 16.
Ultrafauna Criticals Up IX	Boosts critical chance against ultrafauna enemies by 18.
Ultrafauna Criticals Up X	Boosts critical chance against ultrafauna enemies by 20.
Ultrafauna Criticals Up XI	Boosts critical chance against ultrafauna enemies by 22.
Ultrafauna Criticals Up XII	Boosts critical chance against ultrafauna enemies by 24.
Ultrafauna Criticals Up XIII	Boosts critical chance against ultrafauna enemies by 26.
Ultrafauna Criticals Up XIV	Boosts critical chance against ultrafauna enemies by 28.
Ultrafauna Criticals Up XV	Boosts critical chance against ultrafauna enemies by 30.
Ultrafauna Criticals Up XVI	Boosts critical chance against ultrafauna enemies by 32.
Ultrafauna Criticals Up XVII	Boosts critical chance against ultrafauna enemies by 34.
Ultrafauna Criticals Up XVIII	Boosts critical chance against ultrafauna enemies by 36.
Ultrafauna Criticals Up XIX	Boosts critical chance against ultrafauna enemies by 38.
Ultrafauna Criticals Up XX	Boosts critical chance against ultrafauna enemies by 50.
Extend Critical Power I	Extends Critical Power effects granted by your Arts by 1 second(s).
Extend Critical Power II	Extends Critical Power effects granted by your Arts by 2 second(s).
Extend Critical Power III	Extends Critical Power effects granted by your Arts by 3 second(s).
Extend Critical Power IV	Extends Critical Power effects granted by your Arts by 4 second(s).
Extend Critical Power V	Extends Critical Power effects granted by your Arts by 5 second(s).
Extend Critical Power VI	Extends Critical Power effects granted by your Arts by 6 second(s).
Extend Critical Power VII	Extends Critical Power effects granted by your Arts by 7 second(s).
Extend Critical Power VIII	Extends Critical Power effects granted by your Arts by 8 second(s).
Extend Critical Power IX	Extends Critical Power effects granted by your Arts by 9 second(s).
Extend Critical Power X	Extends Critical Power effects granted by your Arts by 10 second(s).
Extend Critical Power XI	Extends Critical Power effects granted by your Arts by 11 second(s).
Extend Critical Power XII	Extends Critical Power effects granted by your Arts by 12 second(s).
Extend Critical Power XIII	Extends Critical Power effects granted by your Arts by 13 second(s).
Extend Critical Power XIV	Extends Critical Power effects granted by your Arts by 14 second(s).
Extend Critical Power XV	Extends Critical Power effects granted by your Arts by 15 second(s).
Extend Critical Power XVI	Extends Critical Power effects granted by your Arts by 16 second(s).
Extend Critical Power XVII	Extends Critical Power effects granted by your Arts by 17 second(s).
Extend Critical Power XVIII	Extends Critical Power effects granted by your Arts by 18 second(s).
Extend Critical Power XIX	Extends Critical Power effects granted by your Arts by 19 second(s).
Extend Critical Power XX	Extends Critical Power effects granted by your Arts by 20 second(s).
Theroid Slayer I	Boosts damage to theroid enemies by 10%.
Theroid Slayer II	Boosts damage to theroid enemies by 12%.
Theroid Slayer III	Boosts damage to theroid enemies by 14%.
Theroid Slayer IV	Boosts damage to theroid enemies by 16%.
Theroid Slayer V	Boosts damage to theroid enemies by 18%.
Theroid Slayer VI	Boosts damage to theroid enemies by 20%.
Theroid Slayer VII	Boosts damage to theroid enemies by 22%.
Theroid Slayer VIII	Boosts damage to theroid enemies by 24%.
Theroid Slayer IX	Boosts damage to theroid enemies by 26%.
Theroid Slayer X	Boosts damage to theroid enemies by 28%.
Theroid Slayer XI	Boosts damage to theroid enemies by 32%.
Theroid Slayer XII	Boosts damage to theroid enemies by 34%.
Theroid Slayer XIII	Boosts damage to theroid enemies by 36%.
Theroid Slayer XIV	Boosts damage to theroid enemies by 38%.
Theroid Slayer XV	Boosts damage to theroid enemies by 40%.
Theroid Slayer XVI	Boosts damage to theroid enemies by 42%.
Theroid Slayer XVII	Boosts damage to theroid enemies by 44%.
Theroid Slayer XVIII	Boosts damage to theroid enemies by 46%.
Theroid Slayer XIX	Boosts damage to theroid enemies by 48%.
Theroid Slayer XX	Boosts damage to theroid enemies by 50%.
Insectoid Slayer I	Boosts damage to insectoid enemies by 10%.
Insectoid Slayer II	Boosts damage to insectoid enemies by 12%.
Insectoid Slayer III	Boosts damage to insectoid enemies by 14%.
Insectoid Slayer IV	Boosts damage to insectoid enemies by 16%.
Insectoid Slayer V	Boosts damage to insectoid enemies by 18%.
Insectoid Slayer VI	Boosts damage to insectoid enemies by 20%.
Insectoid Slayer VII	Boosts damage to insectoid enemies by 22%.
Insectoid Slayer VIII	Boosts damage to insectoid enemies by 24%.
Insectoid Slayer IX	Boosts damage to insectoid enemies by 26%.
Insectoid Slayer X	Boosts damage to insectoid enemies by 28%.
Insectoid Slayer XI	Boosts damage to insectoid enemies by 32%.
Insectoid Slayer XII	Boosts damage to insectoid enemies by 34%.
Insectoid Slayer XIII	Boosts damage to insectoid enemies by 36%.
Insectoid Slayer XIV	Boosts damage to insectoid enemies by 38%.
Insectoid Slayer XV	Boosts damage to insectoid enemies by 40%.
Insectoid Slayer XVI	Boosts damage to insectoid enemies by 42%.
Insectoid Slayer XVII	Boosts damage to insectoid enemies by 44%.
Insectoid Slayer XVIII	Boosts damage to insectoid enemies by 46%.
Insectoid Slayer XIX	Boosts damage to insectoid enemies by 48%.
Insectoid Slayer XX	Boosts damage to insectoid enemies by 50%.
Piscinoid Slayer I	Boosts damage to piscinoid enemies by 10%.
Piscinoid Slayer II	Boosts damage to piscinoid enemies by 12%.
Piscinoid Slayer III	Boosts damage to piscinoid enemies by 14%.
Piscinoid Slayer IV	Boosts damage to piscinoid enemies by 16%.
Piscinoid Slayer V	Boosts damage to piscinoid enemies by 18%.
Piscinoid Slayer VI	Boosts damage to piscinoid enemies by 20%.
Piscinoid Slayer VII	Boosts damage to piscinoid enemies by 22%.
Piscinoid Slayer VIII	Boosts damage to piscinoid enemies by 24%.
Piscinoid Slayer IX	Boosts damage to piscinoid enemies by 26%.
Piscinoid Slayer X	Boosts damage to piscinoid enemies by 28%.
Piscinoid Slayer XI	Boosts damage to piscinoid enemies by 32%.
Piscinoid Slayer XII	Boosts damage to piscinoid enemies by 34%.
Piscinoid Slayer XIII	Boosts damage to piscinoid enemies by 36%.
Piscinoid Slayer XIV	Boosts damage to piscinoid enemies by 38%.
Piscinoid Slayer XV	Boosts damage to piscinoid enemies by 40%.
Piscinoid Slayer XVI	Boosts damage to piscinoid enemies by 42%.
Piscinoid Slayer XVII	Boosts damage to piscinoid enemies by 44%.
Piscinoid Slayer XVIII	Boosts damage to piscinoid enemies by 46%.
Piscinoid Slayer XIX	Boosts damage to piscinoid enemies by 48%.
Piscinoid Slayer XX	Boosts damage to piscinoid enemies by 50%.
Humanoid Slayer I	Boosts damage to humanoid enemies by 10%.
Humanoid Slayer II	Boosts damage to humanoid enemies by 12%.
Humanoid Slayer III	Boosts damage to humanoid enemies by 14%.
Humanoid Slayer IV	Boosts damage to humanoid enemies by 16%.
Humanoid Slayer V	Boosts damage to humanoid enemies by 18%.
Humanoid Slayer VI	Boosts damage to humanoid enemies by 20%.
Humanoid Slayer VII	Boosts damage to humanoid enemies by 22%.
Humanoid Slayer VIII	Boosts damage to humanoid enemies by 24%.
Humanoid Slayer IX	Boosts damage to humanoid enemies by 26%.
Humanoid Slayer X	Boosts damage to humanoid enemies by 28%.
Humanoid Slayer XI	Boosts damage to humanoid enemies by 32%.
Humanoid Slayer XII	Boosts damage to humanoid enemies by 34%.
Humanoid Slayer XIII	Boosts damage to humanoid enemies by 36%.
Humanoid Slayer XIV	Boosts damage to humanoid enemies by 38%.
Humanoid Slayer XV	Boosts damage to humanoid enemies by 40%.
Humanoid Slayer XVI	Boosts damage to humanoid enemies by 42%.
Humanoid Slayer XVII	Boosts damage to humanoid enemies by 44%.
Humanoid Slayer XVIII	Boosts damage to humanoid enemies by 46%.
Humanoid Slayer XIX	Boosts damage to humanoid enemies by 48%.
Humanoid Slayer XX	Boosts damage to humanoid enemies by 50%.
Mechanoid Slayer I	Boosts damage to mechanoid enemies by 10%.
Mechanoid Slayer II	Boosts damage to mechanoid enemies by 12%.
Mechanoid Slayer III	Boosts damage to mechanoid enemies by 14%.
Mechanoid Slayer IV	Boosts damage to mechanoid enemies by 16%.
Mechanoid Slayer V	Boosts damage to mechanoid enemies by 18%.
Mechanoid Slayer VII	Boosts damage to mechanoid enemies by 22%.
Mechanoid Slayer VIII	Boosts damage to mechanoid enemies by 24%.
Mechanoid Slayer IX	Boosts damage to mechanoid enemies by 26%.
Mechanoid Slayer X	Boosts damage to mechanoid enemies by 28%.
Mechanoid Slayer XI	Boosts damage to mechanoid enemies by 32%.
Mechanoid Slayer XII	Boosts damage to mechanoid enemies by 34%.
Mechanoid Slayer XIII	Boosts damage to mechanoid enemies by 36%.
Mechanoid Slayer XIV	Boosts damage to mechanoid enemies by 38%.
Mechanoid Slayer XV	Boosts damage to mechanoid enemies by 40%.
Mechanoid Slayer XVI	Boosts damage to mechanoid enemies by 42%.
Mechanoid Slayer XVII	Boosts damage to mechanoid enemies by 44%.
Mechanoid Slayer XVIII	Boosts damage to mechanoid enemies by 46%.
Mechanoid Slayer XIX	Boosts damage to mechanoid enemies by 48%.
Mechanoid Slayer XX	Boosts damage to mechanoid enemies by 50%.
Chimeroid Slayer I	Boosts damage to chimeroid enemies by 10%.
Chimeroid Slayer II	Boosts damage to chimeroid enemies by 12%.
Chimeroid Slayer III	Boosts damage to chimeroid enemies by 14%.
Chimeroid Slayer IV	Boosts damage to chimeroid enemies by 16%.
Chimeroid Slayer V	Boosts damage to chimeroid enemies by 18%.
Chimeroid Slayer VI	Boosts damage to chimeroid enemies by 20%.
Chimeroid Slayer VII	Boosts damage to chimeroid enemies by 22%.
Chimeroid Slayer VIII	Boosts damage to chimeroid enemies by 24%.
Chimeroid Slayer IX	Boosts damage to chimeroid enemies by 26%.
Chimeroid Slayer X	Boosts damage to chimeroid enemies by 28%.
Chimeroid Slayer XI	Boosts damage to chimeroid enemies by 32%.
Chimeroid Slayer XII	Boosts damage to chimeroid enemies by 34%.
Chimeroid Slayer XIII	Boosts damage to chimeroid enemies by 36%.
Chimeroid Slayer XIV	Boosts damage to chimeroid enemies by 38%.
Chimeroid Slayer XV	Boosts damage to chimeroid enemies by 40%.
Chimeroid Slayer XVI	Boosts damage to chimeroid enemies by 42%.
Chimeroid Slayer XVII	Boosts damage to chimeroid enemies by 44%.
Chimeroid Slayer XVIII	Boosts damage to chimeroid enemies by 46%.
Chimeroid Slayer XIX	Boosts damage to chimeroid enemies by 48%.
Chimeroid Slayer XX	Boosts damage to chimeroid enemies by 50%.
Ultrafauna Slayer I	Boosts damage to ultrafauna enemies by 10%.
Ultrafauna Slayer II	Boosts damage to ultrafauna enemies by 12%.
Ultrafauna Slayer III	Boosts damage to ultrafauna enemies by 14%.
Ultrafauna Slayer IV	Boosts damage to ultrafauna enemies by 16%.
Ultrafauna Slayer V	Boosts damage to ultrafauna enemies by 18%.
Ultrafauna Slayer VI	Boosts damage to ultrafauna enemies by 20%.
Ultrafauna Slayer VII	Boosts damage to ultrafauna enemies by 22%.
Ultrafauna Slayer VIII	Boosts damage to ultrafauna enemies by 24%.
Ultrafauna Slayer IX	Boosts damage to ultrafauna enemies by 26%.
Ultrafauna Slayer X	Boosts damage to ultrafauna enemies by 28%.
Ultrafauna Slayer XI	Boosts damage to ultrafauna enemies by 32%.
Ultrafauna Slayer XII	Boosts damage to ultrafauna enemies by 34%.
Ultrafauna Slayer XIII	Boosts damage to ultrafauna enemies by 36%.
Ultrafauna Slayer XIV	Boosts damage to ultrafauna enemies by 38%.
Ultrafauna Slayer XV	Boosts damage to ultrafauna enemies by 40%.
Ultrafauna Slayer XVI	Boosts damage to ultrafauna enemies by 42%.
Ultrafauna Slayer XVII	Boosts damage to ultrafauna enemies by 44%.
Ultrafauna Slayer XVIII	Boosts damage to ultrafauna enemies by 46%.
Ultrafauna Slayer XIX	Boosts damage to ultrafauna enemies by 48%.
Ultrafauna Slayer XX	Boosts damage to ultrafauna enemies by 50%.
Physical Attack Plus I	Boosts physical damage by 10%.
Physical Attack Plus II	Boosts physical damage by 12%.
Physical Attack Plus III	Boosts physical damage by 14%.
Physical Attack Plus IV	Boosts physical damage by 16%.
Physical Attack Plus V	Boosts physical damage by 18%.
Physical Attack Plus VI	Boosts physical damage by 20%.
Physical Attack Plus VII	Boosts physical damage by 22%.
Physical Attack Plus VIII	Boosts physical damage by 24%.
Physical Attack Plus IX	Boosts physical damage by 26%.
Physical Attack Plus X	Boosts physical damage by 28%.
Physical Attack Plus XI	Boosts physical damage by 32%.
Physical Attack Plus XII	Boosts physical damage by 34%.
Physical Attack Plus XIII	Boosts physical damage by 36%.
Physical Attack Plus XIV	Boosts physical damage by 38%.
Physical Attack Plus XV	Boosts physical damage by 40%.
Physical Attack Plus XVI	Boosts physical damage by 42%.
Physical Attack Plus XVII	Boosts physical damage by 44%.
Physical Attack Plus XVIII	Boosts physical damage by 46%.
Physical Attack Plus XIX	Boosts physical damage by 48%.
Physical Attack Plus XX	Boosts physical damage by 50%.
Beam Attack Plus I	Boosts beam damage by 10%.
Beam Attack Plus II	Boosts beam damage by 12%.
Beam Attack Plus III	Boosts beam damage by 14%.
Beam Attack Plus IV	Boosts beam damage by 16%.
Beam Attack Plus V	Boosts beam damage by 18%.
Beam Attack Plus VI	Boosts beam damage by 20%.
Beam Attack Plus VII	Boosts beam damage by 22%.
Beam Attack Plus VIII	Boosts beam damage by 24%.
Beam Attack Plus IX	Boosts beam damage by 26%.
Beam Attack Plus X	Boosts beam damage by 28%.
Beam Attack Plus XI	Boosts beam damage by 32%.
Beam Attack Plus XII	Boosts beam damage by 34%.
Beam Attack Plus XIII	Boosts beam damage by 36%.
Beam Attack Plus XIV	Boosts beam damage by 38%.
Beam Attack Plus XV	Boosts beam damage by 40%.
Beam Attack Plus XVI	Boosts beam damage by 42%.
Beam Attack Plus XVII	Boosts beam damage by 44%.
Beam Attack Plus XVIII	Boosts beam damage by 46%.
Beam Attack Plus XIX	Boosts beam damage by 48%.
Beam Attack Plus XX	Boosts beam damage by 50%.
Ether Attack Plus I	Boosts ether damage by 10%.
Ether Attack Plus II	Boosts ether damage by 12%.
Ether Attack Plus III	Boosts ether damage by 14%.
Ether Attack Plus IV	Boosts ether damage by 16%.
Ether Attack Plus V	Boosts ether damage by 18%.
Ether Attack Plus VI	Boosts ether damage by 20%.
Ether Attack Plus VII	Boosts ether damage by 22%.
Ether Attack Plus VIII	Boosts ether damage by 24%.
Ether Attack Plus IX	Boosts ether damage by 26%.
Ether Attack Plus X	Boosts ether damage by 28%.
Ether Attack Plus XI	Boosts ether damage by 32%.
Ether Attack Plus XII	Boosts ether damage by 34%.
Ether Attack Plus XIII	Boosts ether damage by 36%.
Ether Attack Plus XIV	Boosts ether damage by 38%.
Ether Attack Plus XV	Boosts ether damage by 40%.
Ether Attack Plus XVI	Boosts ether damage by 42%.
Ether Attack Plus XVII	Boosts ether damage by 44%.
Ether Attack Plus XVIII	Boosts ether damage by 46%.
Ether Attack Plus XIX	Boosts ether damage by 48%.
Ether Attack Plus XX	Boosts ether damage by 50%.
Thermal Attack Plus I	Boosts thermal damage by 10%.
Thermal Attack Plus II	Boosts thermal damage by 12%.
Thermal Attack Plus III	Boosts thermal damage by 14%.
Thermal Attack Plus IV	Boosts thermal damage by 16%.
Thermal Attack Plus V	Boosts thermal damage by 18%.
Thermal Attack Plus VI	Boosts thermal damage by 20%.
Thermal Attack Plus VII	Boosts thermal damage by 22%.
Thermal Attack Plus VIII	Boosts thermal damage by 24%.
Thermal Attack Plus IX	Boosts thermal damage by 26%.
Thermal Attack Plus X	Boosts thermal damage by 28%.
Thermal Attack Plus XI	Boosts thermal damage by 32%.
Thermal Attack Plus XII	Boosts thermal damage by 34%.
Thermal Attack Plus XIII	Boosts thermal damage by 36%.
Thermal Attack Plus XIV	Boosts thermal damage by 38%.
Thermal Attack Plus XV	Boosts thermal damage by 40%.
Thermal Attack Plus XVI	Boosts thermal damage by 42%.
Thermal Attack Plus XVII	Boosts thermal damage by 44%.
Thermal Attack Plus XVIII	Boosts thermal damage by 46%.
Thermal Attack Plus XIX	Boosts thermal damage by 48%.
Thermal Attack Plus XX	Boosts thermal damage by 50%.
Electric Attack Plus I	Boosts electric damage by 10%.
Electric Attack Plus II	Boosts electric damage by 12%.
Electric Attack Plus III	Boosts electric damage by 14%.
Electric Attack Plus IV	Boosts electric damage by 16%.
Electric Attack Plus V	Boosts electric damage by 18%.
Electric Attack Plus VI	Boosts electric damage by 20%.
Electric Attack Plus VII	Boosts electric damage by 22%.
Electric Attack Plus VIII	Boosts electric damage by 24%.
Electric Attack Plus IX	Boosts electric damage by 26%.
Electric Attack Plus X	Boosts electric damage by 28%.
Electric Attack Plus XI	Boosts electric damage by 32%.
Electric Attack Plus XII	Boosts electric damage by 34%.
Electric Attack Plus XIII	Boosts electric damage by 36%.
Electric Attack Plus XIV	Boosts electric damage by 38%.
Electric Attack Plus XV	Boosts electric damage by 40%.
Electric Attack Plus XVI	Boosts electric damage by 42%.
Electric Attack Plus XVII	Boosts electric damage by 44%.
Electric Attack Plus XVIII	Boosts electric damage by 46%.
Electric Attack Plus XIX	Boosts electric damage by 48%.
Electric Attack Plus XX	Boosts electric damage by 50%.
Gravity Attack Plus I	Boosts gravity damage by 10%.
Gravity Attack Plus II	Boosts gravity damage by 12%.
Gravity Attack Plus III	Boosts gravity damage by 14%.
Gravity Attack Plus IV	Boosts gravity damage by 16%.
Gravity Attack Plus V	Boosts gravity damage by 18%.
Gravity Attack Plus VI	Boosts gravity damage by 20%.
Gravity Attack Plus VII	Boosts gravity damage by 22%.
Gravity Attack Plus VIII	Boosts gravity damage by 24%.
Gravity Attack Plus IX	Boosts gravity damage by 26%.
Gravity Attack Plus X	Boosts gravity damage by 28%.
Gravity Attack Plus XI	Boosts gravity damage by 32%.
Gravity Attack Plus XII	Boosts gravity damage by 34%.
Gravity Attack Plus XIII	Boosts gravity damage by 36%.
Gravity Attack Plus XIV	Boosts gravity damage by 38%.
Gravity Attack Plus XV	Boosts gravity damage by 40%.
Gravity Attack Plus XVI	Boosts gravity damage by 42%.
Gravity Attack Plus XVII	Boosts gravity damage by 44%.
Gravity Attack Plus XVIII	Boosts gravity damage by 46%.
Gravity Attack Plus XIX	Boosts gravity damage by 48%.
Gravity Attack Plus XX	Boosts gravity damage by 50%.
Front Attack Plus I	Boosts damage by 5% when attacking from the front.
Front Attack Plus II	Boosts damage by 6% when attacking from the front.
Front Attack Plus III	Boosts damage by 7% when attacking from the front.
Front Attack Plus IV	Boosts damage by 8% when attacking from the front.
Front Attack Plus V	Boosts damage by 9% when attacking from the front.
Front Attack Plus VI	Boosts damage by 10% when attacking from the front.
Front Attack Plus VII	Boosts damage by 11% when attacking from the front.
Front Attack Plus VIII	Boosts damage by 12% when attacking from the front.
Front Attack Plus IX	Boosts damage by 13% when attacking from the front.
Front Attack Plus X	Boosts damage by 14% when attacking from the front.
Front Attack Plus XI	Boosts damage by 16% when attacking from the front.
Front Attack Plus XII	Boosts damage by 17% when attacking from the front.
Front Attack Plus XIII	Boosts damage by 18% when attacking from the front.
Front Attack Plus XIV	Boosts damage by 19% when attacking from the front.
Front Attack Plus XV	Boosts damage by 20% when attacking from the front.
Front Attack Plus XVI	Boosts damage by 21% when attacking from the front.
Front Attack Plus XVII	Boosts damage by 22% when attacking from the front.
Front Attack Plus XVIII	Boosts damage by 23% when attacking from the front.
Front Attack Plus XIX	Boosts damage by 24% when attacking from the front.
Front Attack Plus XX	Boosts damage by 25% when attacking from the front.
Side Attack Plus I	Boosts damage by 5% when attacking from the side.
Side Attack Plus II	Boosts damage by 6% when attacking from the side.
Side Attack Plus III	Boosts damage by 7% when attacking from the side.
Side Attack Plus IV	Boosts damage by 8% when attacking from the side.
Side Attack Plus V	Boosts damage by 9% when attacking from the side.
Side Attack Plus VI	Boosts damage by 10% when attacking from the side.
Side Attack Plus VII	Boosts damage by 11% when attacking from the side.
Side Attack Plus VIII	Boosts damage by 12% when attacking from the side.
Side Attack Plus IX	Boosts damage by 13% when attacking from the side.
Side Attack Plus X	Boosts damage by 14% when attacking from the side.
Side Attack Plus XI	Boosts damage by 16% when attacking from the side.
Side Attack Plus XII	Boosts damage by 17% when attacking from the side.
Side Attack Plus XIII	Boosts damage by 18% when attacking from the side.
Side Attack Plus XIV	Boosts damage by 19% when attacking from the side.
Side Attack Plus XV	Boosts damage by 20% when attacking from the side.
Side Attack Plus XVI	Boosts damage by 21% when attacking from the side.
Side Attack Plus XVII	Boosts damage by 22% when attacking from the side.
Side Attack Plus XVIII	Boosts damage by 23% when attacking from the side.
Side Attack Plus XIX	Boosts damage by 24% when attacking from the side.
Side Attack Plus XX	Boosts damage by 25% when attacking from the side.
Back Attack Plus I	Boosts damage by 5% when attacking from behind.
Back Attack Plus II	Boosts damage by 6% when attacking from behind.
Back Attack Plus III	Boosts damage by 7% when attacking from behind.
Back Attack Plus IV	Boosts damage by 8% when attacking from behind.
Back Attack Plus V	Boosts damage by 9% when attacking from behind.
Back Attack Plus VI	Boosts damage by 10% when attacking from behind.
Back Attack Plus VII	Boosts damage by 11% when attacking from behind.
Back Attack Plus VIII	Boosts damage by 12% when attacking from behind.
Back Attack Plus IX	Boosts damage by 13% when attacking from behind.
Back Attack Plus X	Boosts damage by 14% when attacking from behind.
Back Attack Plus XI	Boosts damage by 16% when attacking from behind.
Back Attack Plus XII	Boosts damage by 17% when attacking from behind.
Back Attack Plus XIII	Boosts damage by 18% when attacking from behind.
Back Attack Plus XIV	Boosts damage by 19% when attacking from behind.
Back Attack Plus XV	Boosts damage by 20% when attacking from behind.
Back Attack Plus XVI	Boosts damage by 21% when attacking from behind.
Back Attack Plus XVII	Boosts damage by 22% when attacking from behind.
Back Attack Plus XVIII	Boosts damage by 23% when attacking from behind.
Back Attack Plus XIX	Boosts damage by 24% when attacking from behind.
Back Attack Plus XX	Boosts damage by 25% when attacking from behind.
Vantage Attack Plus I	Boosts damage by 5% when attacking from above.
Vantage Attack Plus II	Boosts damage by 6% when attacking from above.
Vantage Attack Plus III	Boosts damage by 7% when attacking from above.
Vantage Attack Plus IV	Boosts damage by 8% when attacking from above.
Vantage Attack Plus V	Boosts damage by 9% when attacking from above.
Vantage Attack Plus VI	Boosts damage by 10% when attacking from above.
Vantage Attack Plus VII	Boosts damage by 11% when attacking from above.
Vantage Attack Plus VIII	Boosts damage by 12% when attacking from above.
Vantage Attack Plus IX	Boosts damage by 13% when attacking from above.
Vantage Attack Plus X	Boosts damage by 14% when attacking from above.
Vantage Attack Plus XI	Boosts damage by 16% when attacking from above.
Vantage Attack Plus XII	Boosts damage by 17% when attacking from above.
Vantage Attack Plus XIII	Boosts damage by 18% when attacking from above.
Vantage Attack Plus XIV	Boosts damage by 19% when attacking from above.
Vantage Attack Plus XV	Boosts damage by 20% when attacking from above.
Vantage Attack Plus XVI	Boosts damage by 21% when attacking from above.
Vantage Attack Plus XVII	Boosts damage by 22% when attacking from above.
Vantage Attack Plus XVIII	Boosts damage by 23% when attacking from above.
Vantage Attack Plus XIX	Boosts damage by 24% when attacking from above.
Vantage Attack Plus XX	Boosts damage by 25% when attacking from above.
Melee: Blackout I	Grants a very low chance of inflicting Blackout I when melee auto-attacking.
Melee: Blackout II	Grants a low chance of inflicting Blackout I when melee auto-attacking.
Melee: Blackout III	Grants a chance of inflicting Blackout I when melee auto-attacking.
Melee: Blackout IV	Grants a high chance of inflicting Blackout I when melee auto-attacking.
Melee: Blackout V	Grants a very high chance of inflicting Blackout I when melee auto-attacking.
Melee: Blackout VI	Grants a very low chance of inflicting Blackout II when melee auto-attacking.
Melee: Blackout VII	Grants a low chance of inflicting Blackout II when melee auto-attacking.
Melee: Blackout VIII	Grants a chance of inflicting Blackout II when melee auto-attacking.
Melee: Blackout IX	Grants a high chance of inflicting Blackout II when melee auto-attacking.
Melee: Blackout X	Grants a very high chance of inflicting Blackout II when melee auto-attacking.
Melee: Blackout XI	Grants a very low chance of inflicting Blackout III when melee auto-attacking.
Melee: Blackout XII	Grants a low chance of inflicting Blackout III when melee auto-attacking.
Melee: Blackout XIII	Grants a chance of inflicting Blackout III when melee auto-attacking.
Melee: Blackout XIV	Grants a high chance of inflicting Blackout III when melee auto-attacking.
Melee: Blackout XV	Grants a very high chance of inflicting Blackout III when melee auto-attacking.
Melee: Blackout XVI	Grants a very low chance of inflicting Blackout IV when melee auto-attacking.
Melee: Blackout XVII	Grants a low chance of inflicting Blackout IV when melee auto-attacking.
Melee: Blackout XVIII	Grants a chance of inflicting Blackout IV when melee auto-attacking.
Melee: Blackout XIX	Grants a high chance of inflicting Blackout IV when melee auto-attacking.
Melee: Blackout XX	Grants a very high chance of inflicting Blackout IV when melee auto-attacking.
Melee: Fatigue I	Grants a very low chance of inflicting Fatigue I when melee auto-attacking.
Melee: Fatigue II	Grants a low chance of inflicting Fatigue I when melee auto-attacking.
Melee: Fatigue III	Grants a chance of inflicting Fatigue I when melee auto-attacking.
Melee: Fatigue IV	Grants a high chance of inflicting Fatigue I when melee auto-attacking.
Melee: Fatigue V	Grants a very high chance of inflicting Fatigue I when melee auto-attacking.
Melee: Fatigue VI	Grants a very low chance of inflicting Fatigue II when melee auto-attacking.
Melee: Fatigue VII	Grants a low chance of inflicting Fatigue II when melee auto-attacking.
Melee: Fatigue VIII	Grants a chance of inflicting Fatigue II when melee auto-attacking.
Melee: Fatigue IX	Grants a high chance of inflicting Fatigue II when melee auto-attacking.
Melee: Fatigue X	Grants a very high chance of inflicting Fatigue II when melee auto-attacking.
Melee: Fatigue XI	Grants a very low chance of inflicting Fatigue III when melee auto-attacking.
Melee: Fatigue XII	Grants a low chance of inflicting Fatigue III when melee auto-attacking.
Melee: Fatigue XIII	Grants a chance of inflicting Fatigue III when melee auto-attacking.
Melee: Fatigue XIV	Grants a high chance of inflicting Fatigue III when melee auto-attacking.
Melee: Fatigue XV	Grants a very high chance of inflicting Fatigue III when melee auto-attacking.
Melee: Fatigue XVI	Grants a very low chance of inflicting Fatigue IV when melee auto-attacking.
Melee: Fatigue XVII	Grants a low chance of inflicting Fatigue IV when melee auto-attacking.
Melee: Fatigue XVIII	Grants a chance of inflicting Fatigue IV when melee auto-attacking.
Melee: Fatigue XIX	Grants a high chance of inflicting Fatigue IV when melee auto-attacking.
Melee: Fatigue XX	Grants a very high chance of inflicting Fatigue IV when melee auto-attacking.
Melee: Physical Res Down I	Grants a very low chance of inflicting Physical Res Down I when melee auto-attacking.
Melee: Physical Res Down II	Grants a low chance of inflicting Physical Res Down I when melee auto-attacking.
Melee: Physical Res Down III	Grants a chance of inflicting Physical Res Down I when melee auto-attacking.
Melee: Physical Res Down IV	Grants a high chance of inflicting Physical Res Down I when melee auto-attacking.
Melee: Physical Res Down V	Grants a very high chance of inflicting Physical Res Down I when melee auto-attacking.
Melee: Physical Res Down VI	Grants a very low chance of inflicting Physical Res Down II when melee auto-attacking.
Melee: Physical Res Down VII	Grants a low chance of inflicting Physical Res Down II when melee auto-attacking.
Melee: Physical Res Down VIII	Grants a chance of inflicting Physical Res Down II when melee auto-attacking.
Melee: Physical Res Down IX	Grants a high chance of inflicting Physical Res Down II when melee auto-attacking.
Melee: Physical Res Down X	Grants a very high chance of inflicting Physical Res Down II when melee auto-attacking.
Melee: Physical Res Down XI	Grants a very low chance of inflicting Physical Res Down III when melee auto-attacking.
Melee: Physical Res Down XII	Grants a low chance of inflicting Physical Res Down III when melee auto-attacking.
Melee: Physical Res Down XIII	Grants a chance of inflicting Physical Res Down III when melee auto-attacking.
Melee: Physical Res Down XIV	Grants a high chance of inflicting Physical Res Down III when melee auto-attacking.
Melee: Physical Res Down XV	Grants a very high chance of inflicting Physical Res Down III when melee auto-attacking.
Melee: Physical Res Down XVI	Grants a very low chance of inflicting Physical Res Down IV when melee auto-attacking.
Melee: Physical Res Down XVII	Grants a low chance of inflicting Physical Res Down IV when melee auto-attacking.
Melee: Physical Res Down XVIII	Grants a chance of inflicting Physical Res Down IV when melee auto-attacking.
Melee: Physical Res Down XIX	Grants a high chance of inflicting Physical Res Down IV when melee auto-attacking.
Melee: Physical Res Down XX	Grants a very high chance of inflicting Physical Res Down IV when melee auto-attacking.
Melee: Beam Res Down I	Grants a very low chance of inflicting Beam Res Down I when melee auto-attacking.
Melee: Beam Res Down II	Grants a low chance of inflicting Beam Res Down I when melee auto-attacking.
Melee: Beam Res Down III	Grants a chance of inflicting Beam Res Down I when melee auto-attacking.
Melee: Beam Res Down IV	Grants a high chance of inflicting Beam Res Down I when melee auto-attacking.
Melee: Beam Res Down V	Grants a very high chance of inflicting Beam Res Down I when melee auto-attacking.
Melee: Beam Res Down VI	Grants a very low chance of inflicting Beam Res Down II when melee auto-attacking.
Melee: Beam Res Down VII	Grants a low chance of inflicting Beam Res Down II when melee auto-attacking.
Melee: Beam Res Down VIII	Grants a chance of inflicting Beam Res Down II when melee auto-attacking.
Melee: Beam Res Down IX	Grants a high chance of inflicting Beam Res Down II when melee auto-attacking.
Melee: Beam Res Down X	Grants a very high chance of inflicting Beam Res Down II when melee auto-attacking.
Melee: Beam Res Down XI	Grants a very low chance of inflicting Beam Res Down III when melee auto-attacking.
Melee: Beam Res Down XII	Grants a low chance of inflicting Beam Res Down III when melee auto-attacking.
Melee: Beam Res Down XIII	Grants a chance of inflicting Beam Res Down III when melee auto-attacking.
Melee: Beam Res Down XIV	Grants a high chance of inflicting Beam Res Down III when melee auto-attacking.
Melee: Beam Res Down XV	Grants a very high chance of inflicting Beam Res Down III when melee auto-attacking.
Melee: Beam Res Down XVI	Grants a very low chance of inflicting Beam Res Down IV when melee auto-attacking.
Melee: Beam Res Down XVII	Grants a low chance of inflicting Beam Res Down IV when melee auto-attacking.
Melee: Beam Res Down XVIII	Grants a chance of inflicting Beam Res Down IV when melee auto-attacking.
Melee: Beam Res Down XIX	Grants a high chance of inflicting Beam Res Down IV when melee auto-attacking.
Melee: Beam Res Down XX	Grants a very high chance of inflicting Beam Res Down IV when melee auto-attacking.
Melee: Ether Res Down I	Grants a very low chance of inflicting Ether Res Down I when melee auto-attacking.
Melee: Ether Res Down II	Grants a low chance of inflicting Ether Res Down I when melee auto-attacking.
Melee: Ether Res Down III	Grants a chance of inflicting Ether Res Down I when melee auto-attacking.
Melee: Ether Res Down IV	Grants a high chance of inflicting Ether Res Down I when melee auto-attacking.
Melee: Ether Res Down V	Grants a very high chance of inflicting Ether Res Down I when melee auto-attacking.
Melee: Ether Res Down VI	Grants a very low chance of inflicting Ether Res Down II when melee auto-attacking.
Melee: Ether Res Down VII	Grants a low chance of inflicting Ether Res Down II when melee auto-attacking.
Melee: Ether Res Down VIII	Grants a chance of inflicting Ether Res Down II when melee auto-attacking.
Melee: Ether Res Down IX	Grants a high chance of inflicting Ether Res Down II when melee auto-attacking.
Melee: Ether Res Down X	Grants a very high chance of inflicting Ether Res Down II when melee auto-attacking.
Melee: Ether Res Down XI	Grants a very low chance of inflicting Ether Res Down III when melee auto-attacking.
Melee: Ether Res Down XII	Grants a low chance of inflicting Ether Res Down III when melee auto-attacking.
Melee: Ether Res Down XIII	Grants a chance of inflicting Ether Res Down III when melee auto-attacking.
Melee: Ether Res Down XIV	Grants a high chance of inflicting Ether Res Down III when melee auto-attacking.
Melee: Ether Res Down XV	Grants a very high chance of inflicting Ether Res Down III when melee auto-attacking.
Melee: Ether Res Down XVI	Grants a very low chance of inflicting Ether Res Down IV when melee auto-attacking.
Melee: Ether Res Down XVII	Grants a low chance of inflicting Ether Res Down IV when melee auto-attacking.
Melee: Ether Res Down XVIII	Grants a chance of inflicting Ether Res Down IV when melee auto-attacking.
Melee: Ether Res Down XIX	Grants a high chance of inflicting Ether Res Down IV when melee auto-attacking.
Melee: Ether Res Down XX	Grants a very high chance of inflicting Ether Res Down IV when melee auto-attacking.
Melee: Thermal Res Down I	Grants a very low chance of inflicting Thermal Res Down I when melee auto-attacking.
Melee: Thermal Res Down II	Grants a low chance of inflicting Thermal Res Down I when melee auto-attacking.
Melee: Thermal Res Down III	Grants a chance of inflicting Thermal Res Down I when melee auto-attacking.
Melee: Thermal Res Down IV	Grants a high chance of inflicting Thermal Res Down I when melee auto-attacking.
Melee: Thermal Res Down V	Grants a very high chance of inflicting Thermal Res Down I when melee auto-attacking.
Melee: Thermal Res Down VI	Grants a very low chance of inflicting Thermal Res Down II when melee auto-attacking.
Melee: Thermal Res Down VII	Grants a low chance of inflicting Thermal Res Down II when melee auto-attacking.
Melee: Thermal Res Down VIII	Grants a chance of inflicting Thermal Res Down II when melee auto-attacking.
Melee: Thermal Res Down IX	Grants a high chance of inflicting Thermal Res Down II when melee auto-attacking.
Melee: Thermal Res Down X	Grants a very high chance of inflicting Thermal Res Down II when melee auto-attacking.
Melee: Thermal Res Down XI	Grants a very low chance of inflicting Thermal Res Down III when melee auto-attacking.
Melee: Thermal Res Down XII	Grants a low chance of inflicting Thermal Res Down III when melee auto-attacking.
Melee: Thermal Res Down XIII	Grants a chance of inflicting Thermal Res Down III when melee auto-attacking.
Melee: Thermal Res Down XIV	Grants a high chance of inflicting Thermal Res Down III when melee auto-attacking.
Melee: Thermal Res Down XV	Grants a very high chance of inflicting Thermal Res Down III when melee auto-attacking.
Melee: Thermal Res Down XVI	Grants a very low chance of inflicting Thermal Res Down IV when melee auto-attacking.
Melee: Thermal Res Down XVII	Grants a low chance of inflicting Thermal Res Down IV when melee auto-attacking.
Melee: Thermal Res Down XVIII	Grants a chance of inflicting Thermal Res Down IV when melee auto-attacking.
Melee: Thermal Res Down XIX	Grants a high chance of inflicting Thermal Res Down IV when melee auto-attacking.
Melee: Thermal Res Down XX	Grants a very high chance of inflicting Thermal Res Down IV when melee auto-attacking.
Melee: Electric Res Down I	Grants a very low chance of inflicting Electric Res Down I when melee auto-attacking.
Melee: Electric Res Down II	Grants a low chance of inflicting Electric Res Down I when melee auto-attacking.
Melee: Electric Res Down III	Grants a chance of inflicting Electric Res Down I when melee auto-attacking.
Melee: Electric Res Down IV	Grants a high chance of inflicting Electric Res Down I when melee auto-attacking.
Melee: Electric Res Down V	Grants a very high chance of inflicting Electric Res Down I when melee auto-attacking.
Melee: Electric Res Down VI	Grants a very low chance of inflicting Electric Res Down II when melee auto-attacking.
Melee: Electric Res Down VII	Grants a low chance of inflicting Electric Res Down II when melee auto-attacking.
Melee: Electric Res Down VIII	Grants a chance of inflicting Electric Res Down II when melee auto-attacking.
Melee: Electric Res Down IX	Grants a high chance of inflicting Electric Res Down II when melee auto-attacking.
Melee: Electric Res Down X	Grants a very high chance of inflicting Electric Res Down II when melee auto-attacking.
Melee: Electric Res Down XI	Grants a very low chance of inflicting Electric Res Down III when melee auto-attacking.
Melee: Electric Res Down XII	Grants a low chance of inflicting Electric Res Down III when melee auto-attacking.
Melee: Electric Res Down XIII	Grants a chance of inflicting Electric Res Down III when melee auto-attacking.
Melee: Electric Res Down XIV	Grants a high chance of inflicting Electric Res Down III when melee auto-attacking.
Melee: Electric Res Down XV	Grants a very high chance of inflicting Electric Res Down III when melee auto-attacking.
Melee: Electric Res Down XVI	Grants a very low chance of inflicting Electric Res Down IV when melee auto-attacking.
Melee: Electric Res Down XVII	Grants a low chance of inflicting Electric Res Down IV when melee auto-attacking.
Melee: Electric Res Down XVIII	Grants a chance of inflicting Electric Res Down IV when melee auto-attacking.
Melee: Electric Res Down XIX	Grants a high chance of inflicting Electric Res Down IV when melee auto-attacking.
Melee: Electric Res Down XX	Grants a very high chance of inflicting Electric Res Down IV when melee auto-attacking.
Melee: Gravity Res Down I	Grants a very low chance of inflicting Gravity Res Down I when melee auto-attacking.
Melee: Gravity Res Down II	Grants a low chance of inflicting Gravity Res Down I when melee auto-attacking.
Melee: Gravity Res Down III	Grants a chance of inflicting Gravity Res Down I when melee auto-attacking.
Melee: Gravity Res Down IV	Grants a high chance of inflicting Gravity Res Down I when melee auto-attacking.
Melee: Gravity Res Down V	Grants a very high chance of inflicting Gravity Res Down I when melee auto-attacking.
Melee: Gravity Res Down VI	Grants a very low chance of inflicting Gravity Res Down II when melee auto-attacking.
Melee: Gravity Res Down VII	Grants a low chance of inflicting Gravity Res Down II when melee auto-attacking.
Melee: Gravity Res Down VIII	Grants a chance of inflicting Gravity Res Down II when melee auto-attacking.
Melee: Gravity Res Down IX	Grants a high chance of inflicting Gravity Res Down II when melee auto-attacking.
Melee: Gravity Res Down X	Grants a very high chance of inflicting Gravity Res Down II when melee auto-attacking.
Melee: Gravity Res Down XI	Grants a very low chance of inflicting Gravity Res Down III when melee auto-attacking.
Melee: Gravity Res Down XII	Grants a low chance of inflicting Gravity Res Down III when melee auto-attacking.
Melee: Gravity Res Down XIII	Grants a chance of inflicting Gravity Res Down III when melee auto-attacking.
Melee: Gravity Res Down XIV	Grants a high chance of inflicting Gravity Res Down III when melee auto-attacking.
Melee: Gravity Res Down XV	Grants a very high chance of inflicting Gravity Res Down III when melee auto-attacking.
Melee: Gravity Res Down XVI	Grants a very low chance of inflicting Gravity Res Down IV when melee auto-attacking.
Melee: Gravity Res Down XVII	Grants a low chance of inflicting Gravity Res Down IV when melee auto-attacking.
Melee: Gravity Res Down XVIII	Grants a chance of inflicting Gravity Res Down IV when melee auto-attacking.
Melee: Gravity Res Down XIX	Grants a high chance of inflicting Gravity Res Down IV when melee auto-attacking.
Melee: Gravity Res Down XX	Grants a very high chance of inflicting Gravity Res Down IV when melee auto-attacking.
Melee: Blaze I	Grants a very low chance of inflicting Blaze I when melee auto-attacking.
Melee: Blaze II	Grants a low chance of inflicting Blaze I when melee auto-attacking.
Melee: Blaze III	Grants a chance of inflicting Blaze I when melee auto-attacking.
Melee: Blaze IV	Grants a high chance of inflicting Blaze I when melee auto-attacking.
Melee: Blaze V	Grants a very high chance of inflicting Blaze I when melee auto-attacking.
Melee: Blaze VI	Grants a very low chance of inflicting Blaze II when melee auto-attacking.
Melee: Blaze VII	Grants a low chance of inflicting Blaze II when melee auto-attacking.
Melee: Blaze VIII	Grants a chance of inflicting Blaze II when melee auto-attacking.
Melee: Blaze IX	Grants a high chance of inflicting Blaze II when melee auto-attacking.
Melee: Blaze X	Grants a very high chance of inflicting Blaze II when melee auto-attacking.
Melee: Blaze XI	Grants a very low chance of inflicting Blaze III when melee auto-attacking.
Melee: Blaze XII	Grants a low chance of inflicting Blaze III when melee auto-attacking.
Melee: Blaze XIII	Grants a chance of inflicting Blaze III when melee auto-attacking.
Melee: Blaze XIV	Grants a high chance of inflicting Blaze III when melee auto-attacking.
Melee: Blaze XV	Grants a very high chance of inflicting Blaze III when melee auto-attacking.
Melee: Blaze XVI	Grants a very low chance of inflicting Blaze IV when melee auto-attacking.
Melee: Blaze XVII	Grants a low chance of inflicting Blaze IV when melee auto-attacking.
Melee: Blaze XVIII	Grants a chance of inflicting Blaze IV when melee auto-attacking.
Melee: Blaze XIX	Grants a high chance of inflicting Blaze IV when melee auto-attacking.
Melee: Blaze XX	Grants a very high chance of inflicting Blaze IV when melee auto-attacking.
Melee: Shock I	Grants a very low chance of inflicting Shock I when melee auto-attacking.
Melee: Shock II	Grants a low chance of inflicting Shock I when melee auto-attacking.
Melee: Shock III	Grants a chance of inflicting Shock I when melee auto-attacking.
Melee: Shock IV	Grants a high chance of inflicting Shock I when melee auto-attacking.
Melee: Shock V	Grants a very high chance of inflicting Shock I when melee auto-attacking.
Melee: Shock VI	Grants a very low chance of inflicting Shock II when melee auto-attacking.
Melee: Shock VII	Grants a low chance of inflicting Shock II when melee auto-attacking.
Melee: Shock VIII	Grants a chance of inflicting Shock II when melee auto-attacking.
Melee: Shock IX	Grants a high chance of inflicting Shock II when melee auto-attacking.
Melee: Shock X	Grants a very high chance of inflicting Shock II when melee auto-attacking.
Melee: Shock XI	Grants a very low chance of inflicting Shock III when melee auto-attacking.
Melee: Shock XII	Grants a low chance of inflicting Shock III when melee auto-attacking.
Melee: Shock XIII	Grants a chance of inflicting Shock III when melee auto-attacking.
Melee: Shock XIV	Grants a high chance of inflicting Shock III when melee auto-attacking.
Melee: Shock XV	Grants a very high chance of inflicting Shock III when melee auto-attacking.
Melee: Shock XVI	Grants a very low chance of inflicting Shock IV when melee auto-attacking.
Melee: Shock XVII	Grants a low chance of inflicting Shock IV when melee auto-attacking.
Melee: Shock XVIII	Grants a chance of inflicting Shock IV when melee auto-attacking.
Melee: Shock XIX	Grants a high chance of inflicting Shock IV when melee auto-attacking.
Melee: Shock XX	Grants a very high chance of inflicting Shock IV when melee auto-attacking.
Melee: Recover HP I	Grants a high chance of recovering 10 HP when melee auto-attacking.
Melee: Recover HP II	Grants a high chance of recovering 20 HP when melee auto-attacking.
Melee: Recover HP III	Grants a high chance of recovering 30 HP when melee auto-attacking.
Melee: Recover HP IV	Grants a high chance of recovering 40 HP when melee auto-attacking.
Melee: Recover HP V	Grants a high chance of recovering 50 HP when melee auto-attacking.
Melee: Recover HP VI	Grants a high chance of recovering 60 HP when melee auto-attacking.
Melee: Recover HP VII	Grants a high chance of recovering 70 HP when melee auto-attacking.
Melee: Recover HP VIII	Grants a high chance of recovering 80 HP when melee auto-attacking.
Melee: Recover HP IX	Grants a high chance of recovering 90 HP when melee auto-attacking.
Melee: Recover HP X	Grants a high chance of recovering 100 HP when melee auto-attacking.
Melee: Recover HP XI	Grants a high chance of recovering 110 HP when melee auto-attacking.
Melee: Recover HP XII	Grants a high chance of recovering 120 HP when melee auto-attacking.
Melee: Recover HP XIII	Grants a high chance of recovering 130 HP when melee auto-attacking.
Melee: Recover HP XIV	Grants a high chance of recovering 140 HP when melee auto-attacking.
Melee: Recover HP XV	Grants a high chance of recovering 150 HP when melee auto-attacking.
Melee: Recover HP XVI	Grants a high chance of recovering 160 HP when melee auto-attacking.
Melee: Recover HP XVII	Grants a high chance of recovering 170 HP when melee auto-attacking.
Melee: Recover HP XVIII	Grants a high chance of recovering 180 HP when melee auto-attacking.
Melee: Recover HP XIX	Grants a high chance of recovering 190 HP when melee auto-attacking.
Melee: Recover HP XX	Grants a high chance of recovering 200 HP when melee auto-attacking.
Soft Touch I	Grants a 10% chance of not waking a sleeping enemy when attacking.
Soft Touch II	Grants a 12% chance of not waking a sleeping enemy when attacking.
Soft Touch III	Grants a 14% chance of not waking a sleeping enemy when attacking.
Soft Touch IV	Grants a 16% chance of not waking a sleeping enemy when attacking.
Soft Touch V	Grants a 18% chance of not waking a sleeping enemy when attacking.
Soft Touch VI	Grants a 20% chance of not waking a sleeping enemy when attacking.
Soft Touch VII	Grants a 22% chance of not waking a sleeping enemy when attacking.
Soft Touch VIII	Grants a 24% chance of not waking a sleeping enemy when attacking.
Soft Touch IX	Grants a 26% chance of not waking a sleeping enemy when attacking.
Soft Touch X	Grants a 28% chance of not waking a sleeping enemy when attacking.
Soft Touch XI	Grants a 30% chance of not waking a sleeping enemy when attacking.
Soft Touch XII	Grants a 32% chance of not waking a sleeping enemy when attacking.
Soft Touch XIII	Grants a 34% chance of not waking a sleeping enemy when attacking.
Soft Touch XIV	Grants a 36% chance of not waking a sleeping enemy when attacking.
Soft Touch XV	Grants a 38% chance of not waking a sleeping enemy when attacking.
Soft Touch XVI	Grants a 40% chance of not waking a sleeping enemy when attacking.
Soft Touch XVII	Grants a 42% chance of not waking a sleeping enemy when attacking.
Soft Touch XVIII	Grants a 44% chance of not waking a sleeping enemy when attacking.
Soft Touch XIX	Grants a 46% chance of not waking a sleeping enemy when attacking.
Soft Touch XX	Grants a 50% chance of not waking a sleeping enemy when attacking.
HP Rebound I	Grants a low chance of recovering 25 HP when taking damage.
HP Rebound II	Grants a low chance of recovering 50 HP when taking damage.
HP Rebound III	Grants a low chance of recovering 75 HP when taking damage.
HP Rebound IV	Grants a low chance of recovering 100 HP when taking damage.
HP Rebound V	Grants a low chance of recovering 125 HP when taking damage.
HP Rebound VI	Grants a low chance of recovering 150 HP when taking damage.
HP Rebound VII	Grants a low chance of recovering 175 HP when taking damage.
HP Rebound VIII	Grants a low chance of recovering 200 HP when taking damage.
HP Rebound IX	Grants a low chance of recovering 225 HP when taking damage.
HP Rebound X	Grants a low chance of recovering 250 HP when taking damage.
HP Rebound XI	Grants a low chance of recovering 275 HP when taking damage.
HP Rebound XII	Grants a low chance of recovering 300 HP when taking damage.
HP Rebound XIII	Grants a low chance of recovering 325 HP when taking damage.
HP Rebound XIV	Grants a low chance of recovering 350 HP when taking damage.
HP Rebound XV	Grants a low chance of recovering 375 HP when taking damage.
HP Rebound XVI	Grants a low chance of recovering 400 HP when taking damage.
HP Rebound XVII	Grants a low chance of recovering 425 HP when taking damage.
HP Rebound XVIII	Grants a low chance of recovering 450 HP when taking damage.
HP Rebound XIX	Grants a low chance of recovering 475 HP when taking damage.
HP Rebound XX	Grants a low chance of recovering 500 HP when taking damage.
TP Rebound I	Grants a low chance of receiving 100 TP when taking damage.
TP Rebound II	Grants a low chance of receiving 125 TP when taking damage.
TP Rebound III	Grants a low chance of receiving 150 TP when taking damage.
TP Rebound IV	Grants a low chance of receiving 175 TP when taking damage.
TP Rebound V	Grants a low chance of receiving 200 TP when taking damage.
TP Rebound VI	Grants a low chance of receiving 225 TP when taking damage.
TP Rebound VII	Grants a low chance of receiving 250 TP when taking damage.
TP Rebound VIII	Grants a low chance of receiving 275 TP when taking damage.
TP Rebound IX	Grants a low chance of receiving 300 TP when taking damage.
TP Rebound X	Grants a low chance of receiving 325 TP when taking damage.
TP Rebound XI	Grants a low chance of receiving 350 TP when taking damage.
TP Rebound XII	Grants a low chance of receiving 375 TP when taking damage.
TP Rebound XIII	Grants a low chance of receiving 400 TP when taking damage.
TP Rebound XIV	Grants a low chance of receiving 425 TP when taking damage.
TP Rebound XV	Grants a low chance of receiving 450 TP when taking damage.
TP Rebound XVI	Grants a low chance of receiving 475 TP when taking damage.
TP Rebound XVII	Grants a low chance of receiving 500 TP when taking damage.
TP Rebound XVIII	Grants a low chance of receiving 525 TP when taking damage.
TP Rebound XIX	Grants a low chance of receiving 550 TP when taking damage.
TP Rebound XX	Grants a low chance of receiving 750 TP when taking damage.
Taunt: Barrier I	Grants a very low chance of activating Barrier I when taunted.
Taunt: Barrier II	Grants a low chance of activating Barrier I when taunted.
Taunt: Barrier III	Grants a chance of activating Barrier I when taunted.
Taunt: Barrier IV	Grants a high chance of activating Barrier I when taunted.
Taunt: Barrier V	Grants a very high chance of activating Barrier I when taunted.
Taunt: Barrier VI	Grants a very low chance of activating Barrier II when taunted.
Taunt: Barrier VII	Grants a low chance of activating Barrier II when taunted.
Taunt: Barrier VIII	Grants a chance of activating Barrier II when taunted.
Taunt: Barrier IX	Grants a high chance of activating Barrier II when taunted.
Taunt: Barrier X	Grants a very high chance of activating Barrier II when taunted.
Taunt: Barrier XI	Grants a very low chance of activating Barrier III when taunted.
Taunt: Barrier XII	Grants a low chance of activating Barrier III when taunted.
Taunt: Barrier XIII	Grants a chance of activating Barrier III when taunted.
Taunt: Barrier XIV	Grants a high chance of activating Barrier III when taunted.
Taunt: Barrier XV	Grants a very high chance of activating Barrier III when taunted.
Taunt: Barrier XVI	Grants a very low chance of activating Barrier IV when taunted.
Taunt: Barrier XVII	Grants a low chance of activating Barrier IV when taunted.
Taunt: Barrier XVIII	Grants a chance of activating Barrier IV when taunted.
Taunt: Barrier XIX	Grants a high chance of activating Barrier IV when taunted.
Taunt: Barrier XX	Grants a very high chance of activating Barrier IV when taunted.
Taunt: Decoy I	Grants a very low chance of activating Decoy I when taunted.
Taunt: Decoy II	Grants a low chance of activating Decoy I when taunted.
Taunt: Decoy III	Grants a chance of activating Decoy I when taunted.
Taunt: Decoy IV	Grants a high chance of activating Decoy I when taunted.
Taunt: Decoy V	Grants a very high chance of activating Decoy I when taunted.
Taunt: Decoy VI	Grants a very low chance of activating Decoy II when taunted.
Taunt: Decoy VII	Grants a low chance of activating Decoy II when taunted.
Taunt: Decoy VIII	Grants a chance of activating Decoy II when taunted.
Taunt: Decoy IX	Grants a high chance of activating Decoy II when taunted.
Taunt: Decoy X	Grants a very high chance of activating Decoy II when taunted.
Taunt: Decoy XI	Grants a very low chance of activating Decoy III when taunted.
Taunt: Decoy XII	Grants a low chance of activating Decoy III when taunted.
Taunt: Decoy XIII	Grants a chance of activating Decoy III when taunted.
Taunt: Decoy XIV	Grants a high chance of activating Decoy III when taunted.
Taunt: Decoy XV	Grants a very high chance of activating Decoy III when taunted.
Taunt: Decoy XVI	Grants a very low chance of activating Decoy IV when taunted.
Taunt: Decoy XVII	Grants a low chance of activating Decoy IV when taunted.
Taunt: Decoy XVIII	Grants a chance of activating Decoy IV when taunted.
Taunt: Decoy XIX	Grants a high chance of activating Decoy IV when taunted.
Taunt: Decoy XX	Grants a very high chance of activating Decoy IV when taunted.
Taunt: Supercharge I	Grants a 20% chance of activating Supercharge I when taunted.
Taunt: Supercharge II	Grants a 40% chance of activating Supercharge I when taunted.
Taunt: Supercharge III	Grants a 60% chance of activating Supercharge I when taunted.
Taunt: Supercharge IV	Grants a 80% chance of activating Supercharge I when taunted.
Taunt: Supercharge V	Grants a 100% chance of activating Supercharge I when taunted.
Taunt: Supercharge VI	Grants a 20% chance of activating Supercharge II when taunted.
Taunt: Supercharge VII	Grants a 40% chance of activating Supercharge II when taunted.
Taunt: Supercharge VIII	Grants a 60% chance of activating Supercharge II when taunted.
Taunt: Supercharge IX	Grants a 80% chance of activating Supercharge II when taunted.
Taunt: Supercharge X	Grants a 100% chance of activating Supercharge II when taunted.
Taunt: Supercharge XI	Grants a 20% chance of activating Supercharge III when taunted.
Taunt: Supercharge XII	Grants a 40% chance of activating Supercharge III when taunted.
Taunt: Supercharge XIII	Grants a 60% chance of activating Supercharge III when taunted.
Taunt: Supercharge XIV	Grants a 80% chance of activating Supercharge III when taunted.
Taunt: Supercharge XV	Grants a 100% chance of activating Supercharge III when taunted.
Taunt: Supercharge XVI	Grants a 20% chance of activating Supercharge IV when taunted.
Taunt: Supercharge XVII	Grants a 40% chance of activating Supercharge IV when taunted.
Taunt: Supercharge XVIII	Grants a 60% chance of activating Supercharge IV when taunted.
Taunt: Supercharge XIX	Grants a 80% chance of activating Supercharge IV when taunted.
Taunt: Supercharge XX	Grants a 100% chance of activating Supercharge IV when taunted.
Topple: Barrier I	Grants a 20% chance of activating Barrier I when toppled.
Topple: Barrier II	Grants a 40% chance of activating Barrier I when toppled.
Topple: Barrier III	Grants a 60% chance of activating Barrier I when toppled.
Topple: Barrier IV	Grants a 80% chance of activating Barrier I when toppled.
Topple: Barrier V	Grants a 100% chance of activating Barrier I when toppled.
Topple: Barrier VI	Grants a 20% chance of activating Barrier II when toppled.
Topple: Barrier VII	Grants a 40% chance of activating Barrier II when toppled.
Topple: Barrier VIII	Grants a 60% chance of activating Barrier II when toppled.
Topple: Barrier IX	Grants a 80% chance of activating Barrier II when toppled.
Topple: Barrier X	Grants a 100% chance of activating Barrier II when toppled.
Topple: Barrier XI	Grants a 20% chance of activating Barrier III when toppled.
Topple: Barrier XII	Grants a 40% chance of activating Barrier III when toppled.
Topple: Barrier XIII	Grants a 60% chance of activating Barrier III when toppled.
Topple: Barrier XIV	Grants a 80% chance of activating Barrier III when toppled.
Topple: Barrier XV	Grants a 100% chance of activating Barrier III when toppled.
Topple: Barrier XVI	Grants a 20% chance of activating Barrier IV when toppled.
Topple: Barrier XVII	Grants a 40% chance of activating Barrier IV when toppled.
Topple: Barrier XVIII	Grants a 60% chance of activating Barrier IV when toppled.
Topple: Barrier XIX	Grants a 80% chance of activating Barrier IV when toppled.
Topple: Barrier XX	Grants a 100% chance of activating Barrier IV when toppled.
Topple: Decoy I	Grants a 20% chance of activating Decoy I when toppled.
Topple: Decoy II	Grants a 40% chance of activating Decoy I when toppled.
Topple: Decoy III	Grants a 60% chance of activating Decoy I when toppled.
Topple: Decoy IV	Grants a 80% chance of activating Decoy I when toppled.
Topple: Decoy V	Grants a 100% chance of activating Decoy I when toppled.
Topple: Decoy VI	Grants a 20% chance of activating Decoy II when toppled.
Topple: Decoy VII	Grants a 40% chance of activating Decoy II when toppled.
Topple: Decoy VIII	Grants a 60% chance of activating Decoy II when toppled.
Topple: Decoy IX	Grants a 80% chance of activating Decoy II when toppled.
Topple: Decoy X	Grants a 100% chance of activating Decoy II when toppled.
Topple: Decoy XI	Grants a 20% chance of activating Decoy III when toppled.
Topple: Decoy XII	Grants a 40% chance of activating Decoy III when toppled.
Topple: Decoy XIII	Grants a 60% chance of activating Decoy III when toppled.
Topple: Decoy XIV	Grants a 80% chance of activating Decoy III when toppled.
Topple: Decoy XV	Grants a 100% chance of activating Decoy III when toppled.
Topple: Decoy XVI	Grants a 20% chance of activating Decoy IV when toppled.
Topple: Decoy XVII	Grants a 40% chance of activating Decoy IV when toppled.
Topple: Decoy XVIII	Grants a 60% chance of activating Decoy IV when toppled.
Topple: Decoy XIX	Grants a 80% chance of activating Decoy IV when toppled.
Topple: Decoy XX	Grants a 100% chance of activating Decoy IV when toppled.
Stun: Barrier I	Grants a 20% chance of activating Barrier I when stunned.
Stun: Barrier II	Grants a 40% chance of activating Barrier I when stunned.
Stun: Barrier III	Grants a 60% chance of activating Barrier I when stunned.
Stun: Barrier IV	Grants a 80% chance of activating Barrier I when stunned.
Stun: Barrier V	Grants a 100% chance of activating Barrier I when stunned.
Stun: Barrier VI	Grants a 20% chance of activating Barrier II when stunned.
Stun: Barrier VII	Grants a 40% chance of activating Barrier II when stunned.
Stun: Barrier VIII	Grants a 60% chance of activating Barrier II when stunned.
Stun: Barrier IX	Grants a 80% chance of activating Barrier II when stunned.
Stun: Barrier X	Grants a 100% chance of activating Barrier II when stunned.
Stun: Barrier XI	Grants a 20% chance of activating Barrier III when stunned.
Stun: Barrier XII	Grants a 40% chance of activating Barrier III when stunned.
Stun: Barrier XIII	Grants a 60% chance of activating Barrier III when stunned.
Stun: Barrier XIV	Grants a 80% chance of activating Barrier III when stunned.
Stun: Barrier XV	Grants a 100% chance of activating Barrier III when stunned.
Stun: Barrier XVI	Grants a 20% chance of activating Barrier IV when stunned.
Stun: Barrier XVII	Grants a 40% chance of activating Barrier IV when stunned.
Stun: Barrier XVIII	Grants a 60% chance of activating Barrier IV when stunned.
Stun: Barrier XIX	Grants a 80% chance of activating Barrier IV when stunned.
Stun: Barrier XX	Grants a 100% chance of activating Barrier IV when stunned.
Stun: Decoy I	Grants a 20% chance of activating Decoy I when stunned.
Stun: Decoy II	Grants a 40% chance of activating Decoy I when stunned.
Stun: Decoy III	Grants a 60% chance of activating Decoy I when stunned.
Stun: Decoy IV	Grants a 80% chance of activating Decoy I when stunned.
Stun: Decoy V	Grants a 100% chance of activating Decoy I when stunned.
Stun: Decoy VI	Grants a 20% chance of activating Decoy II when stunned.
Stun: Decoy VII	Grants a 40% chance of activating Decoy II when stunned.
Stun: Decoy VIII	Grants a 60% chance of activating Decoy II when stunned.
Stun: Decoy IX	Grants a 80% chance of activating Decoy II when stunned.
Stun: Decoy X	Grants a 100% chance of activating Decoy II when stunned.
Stun: Decoy XI	Grants a 20% chance of activating Decoy III when stunned.
Stun: Decoy XII	Grants a 40% chance of activating Decoy III when stunned.
Stun: Decoy XIII	Grants a 60% chance of activating Decoy III when stunned.
Stun: Decoy XIV	Grants a 80% chance of activating Decoy III when stunned.
Stun: Decoy XV	Grants a 100% chance of activating Decoy III when stunned.
Stun: Decoy XVI	Grants a 20% chance of activating Decoy IV when stunned.
Stun: Decoy XVII	Grants a 40% chance of activating Decoy IV when stunned.
Stun: Decoy XVIII	Grants a 60% chance of activating Decoy IV when stunned.
Stun: Decoy XIX	Grants a 80% chance of activating Decoy IV when stunned.
Stun: Decoy XX	Grants a 100% chance of activating Decoy IV when stunned.
Reflect: Physical	Reflects physical attacks as well when using an Art with damage reflection.
Reflect: Beam	Reflects beam attacks as well when using an Art with damage reflection.
Reflect: Ether	Reflects ether attacks as well when using an Art with damage reflection.
Reflect: Thermal	Reflects thermal attacks as well when using an Art with damage reflection.
Reflect: Electric	Reflects electric attacks as well when using an Art with damage reflection.
Reflect: Gravity	Reflects gravity attacks as well when using an Art with damage reflection.
Reflect Damage Up I	Boosts reflect damage by 5%.
Reflect Damage Up II	Boosts reflect damage by 10%.
Reflect Damage Up III	Boosts reflect damage by 15%.
Reflect Damage Up IV	Boosts reflect damage by 20%.
Reflect Damage Up V	Boosts reflect damage by 25%.
Reflect Damage Up VI	Boosts reflect damage by 30%.
Reflect Damage Up VII	Boosts reflect damage by 35%.
Reflect Damage Up VIII	Boosts reflect damage by 40%.
Reflect Damage Up IX	Boosts reflect damage by 45%.
Reflect Damage Up X	Boosts reflect damage by 50%.
Reflect Damage Up XI	Boosts reflect damage by 55%.
Reflect Damage Up XII	Boosts reflect damage by 60%.
Reflect Damage Up XIII	Boosts reflect damage by 65%.
Reflect Damage Up XIV	Boosts reflect damage by 70%.
Reflect Damage Up XV	Boosts reflect damage by 75%.
Reflect Damage Up XVI	Boosts reflect damage by 80%.
Reflect Damage Up XVII	Boosts reflect damage by 85%.
Reflect Damage Up XVIII	Boosts reflect damage by 90%.
Reflect Damage Up XIX	Boosts reflect damage by 95%.
Reflect Damage Up XX	Boosts reflect damage by 100%.
Nullify Physical Reflect I	Grants a 5% chance of negating enemy reflection of physical attacks.
Nullify Physical Reflect II	Grants a 10% chance of negating enemy reflection of physical attacks.
Nullify Physical Reflect III	Grants a 15% chance of negating enemy reflection of physical attacks.
Nullify Physical Reflect IV	Grants a 20% chance of negating enemy reflection of physical attacks.
Nullify Physical Reflect V	Grants a 25% chance of negating enemy reflection of physical attacks.
Nullify Physical Reflect VI	Grants a 30% chance of negating enemy reflection of physical attacks.
Nullify Physical Reflect VII	Grants a 35% chance of negating enemy reflection of physical attacks.
Nullify Physical Reflect VIII	Grants a 40% chance of negating enemy reflection of physical attacks.
Nullify Physical Reflect IX	Grants a 45% chance of negating enemy reflection of physical attacks.
Nullify Physical Reflect X	Grants a 50% chance of negating enemy reflection of physical attacks.
Nullify Physical Reflect XI	Grants a 55% chance of negating enemy reflection of physical attacks.
Nullify Physical Reflect XII	Grants a 60% chance of negating enemy reflection of physical attacks.
Nullify Physical Reflect XIII	Grants a 65% chance of negating enemy reflection of physical attacks.
Nullify Physical Reflect XIV	Grants a 70% chance of negating enemy reflection of physical attacks.
Nullify Physical Reflect XV	Grants a 75% chance of negating enemy reflection of physical attacks.
Nullify Physical Reflect XVI	Grants a 80% chance of negating enemy reflection of physical attacks.
Nullify Physical Reflect XVII	Grants a 85% chance of negating enemy reflection of physical attacks.
Nullify Physical Reflect XVIII	Grants a 90% chance of negating enemy reflection of physical attacks.
Nullify Physical Reflect XIX	Grants a 95% chance of negating enemy reflection of physical attacks.
Nullify Physical Reflect XX	Grants a 100% chance of negating enemy reflection of physical attacks.
Nullify Beam Reflect I	Grants a 5% chance of negating enemy reflection of beam attacks.
Nullify Beam Reflect II	Grants a 10% chance of negating enemy reflection of beam attacks.
Nullify Beam Reflect III	Grants a 15% chance of negating enemy reflection of beam attacks.
Nullify Beam Reflect IV	Grants a 20% chance of negating enemy reflection of beam attacks.
Nullify Beam Reflect V	Grants a 25% chance of negating enemy reflection of beam attacks.
Nullify Beam Reflect VI	Grants a 30% chance of negating enemy reflection of beam attacks.
Nullify Beam Reflect VII	Grants a 35% chance of negating enemy reflection of beam attacks.
Nullify Beam Reflect VIII	Grants a 40% chance of negating enemy reflection of beam attacks.
Nullify Beam Reflect IX	Grants a 45% chance of negating enemy reflection of beam attacks.
Nullify Beam Reflect X	Grants a 50% chance of negating enemy reflection of beam attacks.
Nullify Beam Reflect XI	Grants a 55% chance of negating enemy reflection of beam attacks.
Nullify Beam Reflect XII	Grants a 60% chance of negating enemy reflection of beam attacks.
Nullify Beam Reflect XIII	Grants a 65% chance of negating enemy reflection of beam attacks.
Nullify Beam Reflect XIV	Grants a 70% chance of negating enemy reflection of beam attacks.
Aura: Refuel XIII	Recovers 34 fuel when using an aura.
Nullify Beam Reflect XV	Grants a 75% chance of negating enemy reflection of beam attacks.
Nullify Beam Reflect XVI	Grants a 80% chance of negating enemy reflection of beam attacks.
Nullify Beam Reflect XVII	Grants a 85% chance of negating enemy reflection of beam attacks.
Nullify Beam Reflect XVIII	Grants a 90% chance of negating enemy reflection of beam attacks.
Nullify Beam Reflect XIX	Grants a 95% chance of negating enemy reflection of beam attacks.
Nullify Beam Reflect XX	Grants a 100% chance of negating enemy reflection of beam attacks.
Nullify Ether Reflect I	Grants a 5% chance of negating enemy reflection of ether attacks.
Nullify Ether Reflect II	Grants a 10% chance of negating enemy reflection of ether attacks.
Nullify Ether Reflect III	Grants a 15% chance of negating enemy reflection of ether attacks.
Nullify Ether Reflect IV	Grants a 20% chance of negating enemy reflection of ether attacks.
Nullify Ether Reflect V	Grants a 25% chance of negating enemy reflection of ether attacks.
Nullify Ether Reflect VI	Grants a 30% chance of negating enemy reflection of ether attacks.
Nullify Ether Reflect VII	Grants a 35% chance of negating enemy reflection of ether attacks.
Nullify Ether Reflect VIII	Grants a 40% chance of negating enemy reflection of ether attacks.
Nullify Ether Reflect IX	Grants a 45% chance of negating enemy reflection of ether attacks.
Nullify Ether Reflect X	Grants a 50% chance of negating enemy reflection of ether attacks.
Nullify Ether Reflect XI	Grants a 55% chance of negating enemy reflection of ether attacks.
Nullify Ether Reflect XII	Grants a 60% chance of negating enemy reflection of ether attacks.
Nullify Ether Reflect XIII	Grants a 65% chance of negating enemy reflection of ether attacks.
Nullify Ether Reflect XIV	Grants a 70% chance of negating enemy reflection of ether attacks.
Nullify Ether Reflect XV	Grants a 75% chance of negating enemy reflection of ether attacks.
Nullify Ether Reflect XVI	Grants a 80% chance of negating enemy reflection of ether attacks.
Nullify Ether Reflect XVII	Grants a 85% chance of negating enemy reflection of ether attacks.
Nullify Ether Reflect XVIII	Grants a 90% chance of negating enemy reflection of ether attacks.
Nullify Ether Reflect XIX	Grants a 95% chance of negating enemy reflection of ether attacks.
Nullify Ether Reflect XX	Grants a 100% chance of negating enemy reflection of ether attacks.
Nullify Thermal Reflect I	Grants a 5% chance of negating enemy reflection of thermal attacks.
Nullify Thermal Reflect II	Grants a 10% chance of negating enemy reflection of thermal attacks.
Nullify Thermal Reflect III	Grants a 15% chance of negating enemy reflection of thermal attacks.
Nullify Thermal Reflect IV	Grants a 20% chance of negating enemy reflection of thermal attacks.
Nullify Thermal Reflect V	Grants a 25% chance of negating enemy reflection of thermal attacks.
Nullify Thermal Reflect VI	Grants a 30% chance of negating enemy reflection of thermal attacks.
Nullify Thermal Reflect VII	Grants a 35% chance of negating enemy reflection of thermal attacks.
Nullify Thermal Reflect VIII	Grants a 40% chance of negating enemy reflection of thermal attacks.
Nullify Thermal Reflect IX	Grants a 45% chance of negating enemy reflection of thermal attacks.
Nullify Thermal Reflect X	Grants a 50% chance of negating enemy reflection of thermal attacks.
Nullify Thermal Reflect XI	Grants a 55% chance of negating enemy reflection of thermal attacks.
Nullify Thermal Reflect XII	Grants a 60% chance of negating enemy reflection of thermal attacks.
Nullify Thermal Reflect XIII	Grants a 65% chance of negating enemy reflection of thermal attacks.
Nullify Thermal Reflect XIV	Grants a 70% chance of negating enemy reflection of thermal attacks.
Nullify Thermal Reflect XV	Grants a 75% chance of negating enemy reflection of thermal attacks.
Nullify Thermal Reflect XVI	Grants a 80% chance of negating enemy reflection of thermal attacks.
Nullify Thermal Reflect XVII	Grants a 85% chance of negating enemy reflection of thermal attacks.
Nullify Thermal Reflect XVIII	Grants a 90% chance of negating enemy reflection of thermal attacks.
Nullify Thermal Reflect XIX	Grants a 95% chance of negating enemy reflection of thermal attacks.
Nullify Thermal Reflect XX	Grants a 100% chance of negating enemy reflection of thermal attacks.
Nullify Electric Reflect I	Grants a 5% chance of negating enemy reflection of electric attacks.
Nullify Electric Reflect II	Grants a 10% chance of negating enemy reflection of electric attacks.
Nullify Electric Reflect III	Grants a 15% chance of negating enemy reflection of electric attacks.
Nullify Electric Reflect IV	Grants a 20% chance of negating enemy reflection of electric attacks.
Nullify Electric Reflect V	Grants a 25% chance of negating enemy reflection of electric attacks.
Nullify Electric Reflect VI	Grants a 30% chance of negating enemy reflection of electric attacks.
Nullify Electric Reflect VII	Grants a 35% chance of negating enemy reflection of electric attacks.
Nullify Electric Reflect VIII	Grants a 40% chance of negating enemy reflection of electric attacks.
Nullify Electric Reflect IX	Grants a 45% chance of negating enemy reflection of electric attacks.
Nullify Electric Reflect X	Grants a 50% chance of negating enemy reflection of electric attacks.
Nullify Electric Reflect XI	Grants a 55% chance of negating enemy reflection of electric attacks.
Nullify Electric Reflect XII	Grants a 60% chance of negating enemy reflection of electric attacks.
Nullify Electric Reflect XIII	Grants a 65% chance of negating enemy reflection of electric attacks.
Nullify Electric Reflect XIV	Grants a 70% chance of negating enemy reflection of electric attacks.
Nullify Electric Reflect XV	Grants a 75% chance of negating enemy reflection of electric attacks.
Nullify Electric Reflect XVI	Grants a 80% chance of negating enemy reflection of electric attacks.
Nullify Electric Reflect XVII	Grants a 85% chance of negating enemy reflection of electric attacks.
Nullify Electric Reflect XVIII	Grants a 90% chance of negating enemy reflection of electric attacks.
Nullify Electric Reflect XIX	Grants a 95% chance of negating enemy reflection of electric attacks.
Nullify Electric Reflect XX	Grants a 100% chance of negating enemy reflection of electric attacks.
Nullify Gravity Reflect I	Grants a 5% chance of negating enemy reflection of gravity attacks.
Nullify Gravity Reflect II	Grants a 10% chance of negating enemy reflection of gravity attacks.
Nullify Gravity Reflect III	Grants a 15% chance of negating enemy reflection of gravity attacks.
Nullify Gravity Reflect IV	Grants a 20% chance of negating enemy reflection of gravity attacks.
Nullify Gravity Reflect V	Grants a 25% chance of negating enemy reflection of gravity attacks.
Nullify Gravity Reflect VI	Grants a 30% chance of negating enemy reflection of gravity attacks.
Nullify Gravity Reflect VII	Grants a 35% chance of negating enemy reflection of gravity attacks.
Nullify Gravity Reflect VIII	Grants a 40% chance of negating enemy reflection of gravity attacks.
Nullify Gravity Reflect IX	Grants a 45% chance of negating enemy reflection of gravity attacks.
Nullify Gravity Reflect X	Grants a 50% chance of negating enemy reflection of gravity attacks.
Nullify Gravity Reflect XI	Grants a 55% chance of negating enemy reflection of gravity attacks.
Nullify Gravity Reflect XII	Grants a 60% chance of negating enemy reflection of gravity attacks.
Nullify Gravity Reflect XIII	Grants a 65% chance of negating enemy reflection of gravity attacks.
Nullify Gravity Reflect XIV	Grants a 70% chance of negating enemy reflection of gravity attacks.
Nullify Gravity Reflect XV	Grants a 75% chance of negating enemy reflection of gravity attacks.
Nullify Gravity Reflect XVI	Grants a 80% chance of negating enemy reflection of gravity attacks.
Nullify Gravity Reflect XVII	Grants a 85% chance of negating enemy reflection of gravity attacks.
Nullify Gravity Reflect XVIII	Grants a 90% chance of negating enemy reflection of gravity attacks.
Nullify Gravity Reflect XIX	Grants a 95% chance of negating enemy reflection of gravity attacks.
Nullify Gravity Reflect XX	Grants a 100% chance of negating enemy reflection of gravity attacks.
Overdrive: Recover HP I	Recovers 10% HP when activating Overdrive.
Overdrive: Recover HP II	Recovers 11% HP when activating Overdrive.
Overdrive: Recover HP III	Recovers 12% HP when activating Overdrive.
Overdrive: Recover HP IV	Recovers 13% HP when activating Overdrive.
Overdrive: Recover HP V	Recovers 14% HP when activating Overdrive.
Overdrive: Recover HP VI	Recovers 15% HP when activating Overdrive.
Overdrive: Recover HP VII	Recovers 16% HP when activating Overdrive.
Overdrive: Recover HP VIII	Recovers 17% HP when activating Overdrive.
Overdrive: Recover HP IX	Recovers 18% HP when activating Overdrive.
Overdrive: Recover HP X	Recovers 19% HP when activating Overdrive.
Overdrive: Recover HP XI	Recovers 20% HP when activating Overdrive.
Overdrive: Recover HP XII	Recovers 21% HP when activating Overdrive.
Overdrive: Recover HP XIII	Recovers 22% HP when activating Overdrive.
Overdrive: Recover HP XIV	Recovers 23% HP when activating Overdrive.
Overdrive: Recover HP XV	Recovers 24% HP when activating Overdrive.
Overdrive: Recover HP XVI	Recovers 25% HP when activating Overdrive.
Overdrive: Recover HP XVII	Recovers 26% HP when activating Overdrive.
Overdrive: Recover HP XVIII	Recovers 27% HP when activating Overdrive.
Overdrive: Recover HP XIX	Recovers 28% HP when activating Overdrive.
Overdrive: Recover HP XX	Recovers 30% HP when activating Overdrive.
Overdrive: Gain TP I	Boosts TP by 25 when activating Overdrive.
Overdrive: Gain TP II	Boosts TP by 50 when activating Overdrive.
Overdrive: Gain TP III	Boosts TP by 75 when activating Overdrive.
Overdrive: Gain TP IV	Boosts TP by 100 when activating Overdrive.
Overdrive: Gain TP V	Boosts TP by 125 when activating Overdrive.
Overdrive: Gain TP VI	Boosts TP by 150 when activating Overdrive.
Overdrive: Gain TP VII	Boosts TP by 175 when activating Overdrive.
Overdrive: Gain TP VIII	Boosts TP by 200 when activating Overdrive.
Overdrive: Gain TP IX	Boosts TP by 225 when activating Overdrive.
Overdrive: Gain TP X	Boosts TP by 250 when activating Overdrive.
Overdrive: Gain TP XI	Boosts TP by 275 when activating Overdrive.
Overdrive: Gain TP XII	Boosts TP by 300 when activating Overdrive.
Overdrive: Gain TP XIII	Boosts TP by 325 when activating Overdrive.
Overdrive: Gain TP XIV	Boosts TP by 350 when activating Overdrive.
Overdrive: Gain TP XV	Boosts TP by 375 when activating Overdrive.
Overdrive: Gain TP XVI	Boosts TP by 400 when activating Overdrive.
Overdrive: Gain TP XVII	Boosts TP by 425 when activating Overdrive.
Overdrive: Gain TP XVIII	Boosts TP by 450 when activating Overdrive.
Overdrive: Gain TP XIX	Boosts TP by 475 when activating Overdrive.
Overdrive: Gain TP XX	Boosts TP by 500 when activating Overdrive.
Overdrive Count Up I	Boosts your Overdrive count by 1 when activating Overdrive.
Overdrive Count Up II	Boosts your Overdrive count by 2 when activating Overdrive.
Overdrive Count Up III	Boosts your Overdrive count by 3 when activating Overdrive.
Overdrive Count Up IV	Boosts your Overdrive count by 4 when activating Overdrive.
Overdrive Count Up V	Boosts your Overdrive count by 5 when activating Overdrive.
Overdrive Count Up VI	Boosts your Overdrive count by 6 when activating Overdrive.
Overdrive Count Up VII	Boosts your Overdrive count by 7 when activating Overdrive.
Overdrive Count Up VIII	Boosts your Overdrive count by 8 when activating Overdrive.
Overdrive Count Up IX	Boosts your Overdrive count by 9 when activating Overdrive.
Overdrive Count Up X	Boosts your Overdrive count by 10 when activating Overdrive.
Overdrive Count Up XI	Boosts your Overdrive count by 11 when activating Overdrive.
Overdrive Count Up XII	Boosts your Overdrive count by 12 when activating Overdrive.
Overdrive Count Up XIII	Boosts your Overdrive count by 13 when activating Overdrive.
Overdrive Count Up XIV	Boosts your Overdrive count by 14 when activating Overdrive.
Overdrive Count Up XV	Boosts your Overdrive count by 15 when activating Overdrive.
Overdrive Count Up XVI	Boosts your Overdrive count by 16 when activating Overdrive.
Overdrive Count Up XVII	Boosts your Overdrive count by 17 when activating Overdrive.
Overdrive Count Up XVIII	Boosts your Overdrive count by 18 when activating Overdrive.
Overdrive Count Up XIX	Boosts your Overdrive count by 19 when activating Overdrive.
Overdrive Count Up XX	Boosts your Overdrive count by 20 when activating Overdrive.
Extend Overdrive I	Extends Overdrive duration by 3 seconds.
Extend Overdrive II	Extends Overdrive duration by 4 seconds.
Extend Overdrive III	Extends Overdrive duration by 5 seconds.
Extend Overdrive IV	Extends Overdrive duration by 6 seconds.
Extend Overdrive V	Extends Overdrive duration by 7 seconds.
Extend Overdrive VI	Extends Overdrive duration by 8 seconds.
Extend Overdrive VII	Extends Overdrive duration by 9 seconds.
Extend Overdrive VIII	Extends Overdrive duration by 10 seconds.
Extend Overdrive IX	Extends Overdrive duration by 11 seconds.
Extend Overdrive X	Extends Overdrive duration by 12 seconds.
Extend Overdrive XI	Extends Overdrive duration by 13 seconds.
Extend Overdrive XII	Extends Overdrive duration by 14 seconds.
Extend Overdrive XIII	Extends Overdrive duration by 15 seconds.
Extend Overdrive XIV	Extends Overdrive duration by 16 seconds.
Extend Overdrive XV	Extends Overdrive duration by 17 seconds.
Extend Overdrive XVI	Extends Overdrive duration by 18 seconds.
Extend Overdrive XVII	Extends Overdrive duration by 19 seconds.
Extend Overdrive XVIII	Extends Overdrive duration by 20 seconds.
Extend Overdrive XIX	Extends Overdrive duration by 21 seconds.
Extend Overdrive XX	Extends Overdrive duration by 25 seconds.
Overdrive Blue Bonus	Adds 10 to your Overdrive count when using a blue Art during Overdrive.
Overdrive Green Bonus	Adds 3 to your Overdrive count when using a green Art during Overdrive.
Extend Aura I	Extends aura effects by 1 second(s).
Extend Aura II	Extends aura effects by 2 second(s).
Extend Aura III	Extends aura effects by 3 second(s).
Extend Aura IV	Extends aura effects by 4 second(s).
Extend Aura V	Extends aura effects by 5 second(s).
Extend Aura VI	Extends aura effects by 6 second(s).
Extend Aura VII	Extends aura effects by 7 second(s).
Extend Aura VIII	Extends aura effects by 8 second(s).
Extend Aura IX	Extends aura effects by 9 second(s).
Extend Aura X	Extends aura effects by 10 second(s).
Extend Aura XI	Extends aura effects by 11 second(s).
Extend Aura XII	Extends aura effects by 12 second(s).
Extend Aura XIII	Extends aura effects by 13 second(s).
Extend Aura XIV	Extends aura effects by 14 second(s).
Extend Aura XV	Extends aura effects by 15 second(s).
Extend Aura XVI	Extends aura effects by 16 second(s).
Extend Aura XVII	Extends aura effects by 17 second(s).
Extend Aura XVIII	Extends aura effects by 18 second(s).
Extend Aura XIX	Extends aura effects by 19 second(s).
Extend Aura XX	Extends aura effects by 20 second(s).
Aura Rapid Cooldown I	Reduces an Art's cooldown by 1% when you have an aura active.
Aura Rapid Cooldown II	Reduces an Art's cooldown by 2% when you have an aura active.
Aura Rapid Cooldown III	Reduces an Art's cooldown by 3% when you have an aura active.
Aura Rapid Cooldown IV	Reduces an Art's cooldown by 4% when you have an aura active.
Aura Rapid Cooldown V	Reduces an Art's cooldown by 5% when you have an aura active.
Aura Rapid Cooldown VI	Reduces an Art's cooldown by 6% when you have an aura active.
Aura Rapid Cooldown VII	Reduces an Art's cooldown by 7% when you have an aura active.
Aura Rapid Cooldown VIII	Reduces an Art's cooldown by 8% when you have an aura active.
Aura Rapid Cooldown IX	Reduces an Art's cooldown by 9% when you have an aura active.
Aura Rapid Cooldown X	Reduces an Art's cooldown by 10% when you have an aura active.
Aura Rapid Cooldown XI	Reduces an Art's cooldown by 11% when you have an aura active.
Aura Rapid Cooldown XII	Reduces an Art's cooldown by 12% when you have an aura active.
Aura Rapid Cooldown XIII	Reduces an Art's cooldown by 13% when you have an aura active.
Aura Rapid Cooldown XIV	Reduces an Art's cooldown by 14% when you have an aura active.
Aura Rapid Cooldown XV	Reduces an Art's cooldown by 15% when you have an aura active.
Aura Rapid Cooldown XVI	Reduces an Art's cooldown by 16% when you have an aura active.
Aura Rapid Cooldown XVII	Reduces an Art's cooldown by 17% when you have an aura active.
Aura Rapid Cooldown XVIII	Reduces an Art's cooldown by 18% when you have an aura active.
Aura Rapid Cooldown XIX	Reduces an Art's cooldown by 19% when you have an aura active.
Aura Rapid Cooldown XX	Reduces an Art's cooldown by 20% when you have an aura active.
Aura: Refuel I	Recovers 10 fuel when using an aura.
Aura: Refuel II	Recovers 12 fuel when using an aura.
Aura: Refuel III	Recovers 14 fuel when using an aura.
Aura: Refuel IV	Recovers 16 fuel when using an aura.
Aura: Refuel V	Recovers 18 fuel when using an aura.
Aura: Refuel VI	Recovers 20 fuel when using an aura.
Aura: Refuel VII	Recovers 22 fuel when using an aura.
Aura: Refuel VIII	Recovers 24 fuel when using an aura.
Aura: Refuel IX	Recovers 26 fuel when using an aura.
Aura: Refuel X	Recovers 28 fuel when using an aura.
Aura: Refuel XI	Recovers 30 fuel when using an aura.
Aura: Refuel XII	Recovers 32 fuel when using an aura.
Aura: Refuel XIV	Recovers 36 fuel when using an aura.
Aura: Refuel XV	Recovers 38 fuel when using an aura.
Aura: Refuel XVI	Recovers 40 fuel when using an aura.
Aura: Refuel XVII	Recovers 42 fuel when using an aura.
Aura: Refuel XVIII	Recovers 44 fuel when using an aura.
Aura: Refuel XIX	Recovers 46 fuel when using an aura.
Aura: Refuel XX	Recovers 50 fuel when using an aura.
Arts: Gain TP I	Boosts TP by 10 when using an Art.
Arts: Gain TP II	Boosts TP by 20 when using an Art.
Arts: Gain TP III	Boosts TP by 30 when using an Art.
Arts: Gain TP IV	Boosts TP by 40 when using an Art.
Arts: Gain TP V	Boosts TP by 50 when using an Art.
Arts: Gain TP VI	Boosts TP by 60 when using an Art.
Arts: Gain TP VII	Boosts TP by 70 when using an Art.
Arts: Gain TP VIII	Boosts TP by 80 when using an Art.
Arts: Gain TP IX	Boosts TP by 90 when using an Art.
Arts: Gain TP X	Boosts TP by 100 when using an Art.
Arts: Gain TP XI	Boosts TP by 110 when using an Art.
Arts: Gain TP XII	Boosts TP by 120 when using an Art.
Arts: Gain TP XIII	Boosts TP by 130 when using an Art.
Arts: Gain TP XIV	Boosts TP by 140 when using an Art.
Arts: Gain TP XV	Boosts TP by 150 when using an Art.
Arts: Gain TP XVI	Boosts TP by 160 when using an Art.
Arts: Gain TP XVII	Boosts TP by 170 when using an Art.
Arts: Gain TP XVIII	Boosts TP by 180 when using an Art.
Arts: Gain TP XIX	Boosts TP by 190 when using an Art.
Arts: Gain TP XX	Boosts TP by 200 when using an Art.
Arts: Recover HP I	Recovers 10 HP when using an Art.
Arts: Recover HP II	Recovers 20 HP when using an Art.
Arts: Recover HP III	Recovers 30 HP when using an Art.
Arts: Recover HP IV	Recovers 40 HP when using an Art.
Arts: Recover HP V	Recovers 50 HP when using an Art.
Arts: Recover HP VI	Recovers 60 HP when using an Art.
Arts: Recover HP VII	Recovers 70 HP when using an Art.
Arts: Recover HP VIII	Recovers 80 HP when using an Art.
Arts: Recover HP IX	Recovers 90 HP when using an Art.
Arts: Recover HP X	Recovers 100 HP when using an Art.
Arts: Recover HP XI	Recovers 110 HP when using an Art.
Arts: Recover HP XII	Recovers 120 HP when using an Art.
Arts: Recover HP XIII	Recovers 130 HP when using an Art.
Arts: Recover HP XIV	Recovers 140 HP when using an Art.
Arts: Recover HP XV	Recovers 150 HP when using an Art.
Arts: Recover HP XVI	Recovers 160 HP when using an Art.
Arts: Recover HP XVII	Recovers 170 HP when using an Art.
Arts: Recover HP XVIII	Recovers 180 HP when using an Art.
Arts: Recover HP XIX	Recovers 190 HP when using an Art.
Arts: Recover HP XX	Recovers 200 HP when using an Art.
Secondary CD Reducer I	Reduces secondary cooldown by 1%.
Secondary CD Reducer II	Reduces secondary cooldown by 2%.
Secondary CD Reducer III	Reduces secondary cooldown by 3%.
Secondary CD Reducer IV	Reduces secondary cooldown by 4%.
Secondary CD Reducer V	Reduces secondary cooldown by 5%.
Secondary CD Reducer VI	Reduces secondary cooldown by 6%.
Secondary CD Reducer VII	Reduces secondary cooldown by 7%.
Secondary CD Reducer VIII	Reduces secondary cooldown by 8%.
Secondary CD Reducer IX	Reduces secondary cooldown by 9%.
Secondary CD Reducer X	Reduces secondary cooldown by 10%.
Secondary CD Reducer XI	Reduces secondary cooldown by 11%.
Secondary CD Reducer XII	Reduces secondary cooldown by 12%.
Secondary CD Reducer XIII	Reduces secondary cooldown by 13%.
Secondary CD Reducer XIV	Reduces secondary cooldown by 14%.
Secondary CD Reducer XV	Reduces secondary cooldown by 15%.
Secondary CD Reducer XVI	Reduces secondary cooldown by 16%.
Secondary CD Reducer XVII	Reduces secondary cooldown by 17%.
Secondary CD Reducer XVIII	Reduces secondary cooldown by 18%.
Secondary CD Reducer XIX	Reduces secondary cooldown by 19%.
Secondary CD Reducer XX	Reduces secondary cooldown by 20%.
Extend Taunt I	Extends Taunt effects inflicted by your Arts by 5 seconds.
Extend Taunt II	Extends Taunt effects inflicted by your Arts by 6 seconds.
Extend Taunt III	Extends Taunt effects inflicted by your Arts by 7 seconds.
Extend Taunt IV	Extends Taunt effects inflicted by your Arts by 8 seconds.
Extend Taunt V	Extends Taunt effects inflicted by your Arts by 9 seconds.
Extend Taunt VI	Extends Taunt effects inflicted by your Arts by 10 seconds.
Extend Taunt VII	Extends Taunt effects inflicted by your Arts by 11 seconds.
Extend Taunt VIII	Extends Taunt effects inflicted by your Arts by 12 seconds.
Extend Taunt IX	Extends Taunt effects inflicted by your Arts by 13 seconds.
Extend Taunt X	Extends Taunt effects inflicted by your Arts by 14 seconds.
Extend Taunt XI	Extends Taunt effects inflicted by your Arts by 15 seconds.
Extend Taunt XII	Extends Taunt effects inflicted by your Arts by 16 seconds.
Extend Taunt XIII	Extends Taunt effects inflicted by your Arts by 17 seconds.
Extend Taunt XIV	Extends Taunt effects inflicted by your Arts by 18 seconds.
Extend Taunt XV	Extends Taunt effects inflicted by your Arts by 19 seconds.
Extend Taunt XVI	Extends Taunt effects inflicted by your Arts by 20 seconds.
Extend Taunt XVII	Extends Taunt effects inflicted by your Arts by 21 seconds.
Extend Taunt XVIII	Extends Taunt effects inflicted by your Arts by 22 seconds.
Extend Taunt XIX	Extends Taunt effects inflicted by your Arts by 23 seconds.
Extend Taunt XX	Extends Taunt effects inflicted by your Arts by 25 seconds.
Extend Control I	Extends Control effects inflicted by your Arts by 1 second(s).
Extend Control II	Extends Control effects inflicted by your Arts by 2 second(s).
Extend Control III	Extends Control effects inflicted by your Arts by 3 second(s).
Extend Control IV	Extends Control effects inflicted by your Arts by 4 second(s).
Extend Control V	Extends Control effects inflicted by your Arts by 5 second(s).
Extend Control VI	Extends Control effects inflicted by your Arts by 6 second(s).
Extend Control VII	Extends Control effects inflicted by your Arts by 7 second(s).
Extend Control VIII	Extends Control effects inflicted by your Arts by 8 second(s).
Extend Control IX	Extends Control effects inflicted by your Arts by 9 second(s).
Extend Control X	Extends Control effects inflicted by your Arts by 10 second(s).
Extend Control XI	Extends Control effects inflicted by your Arts by 11 second(s).
Extend Control XII	Extends Control effects inflicted by your Arts by 12 second(s).
Extend Control XIII	Extends Control effects inflicted by your Arts by 13 second(s).
Extend Control XIV	Extends Control effects inflicted by your Arts by 14 second(s).
Extend Control XV	Extends Control effects inflicted by your Arts by 15 second(s).
Extend Control XVI	Extends Control effects inflicted by your Arts by 16 second(s).
Extend Control XVII	Extends Control effects inflicted by your Arts by 17 second(s).
Extend Control XVIII	Extends Control effects inflicted by your Arts by 18 second(s).
Extend Control XIX	Extends Control effects inflicted by your Arts by 19 second(s).
Extend Control XX	Extends Control effects inflicted by your Arts by 20 second(s).
Extend Virus I	Extends Virus effects inflicted by your Arts by 1 second(s).
Extend Virus II	Extends Virus effects inflicted by your Arts by 2 second(s).
Extend Virus III	Extends Virus effects inflicted by your Arts by 3 second(s).
Extend Virus IV	Extends Virus effects inflicted by your Arts by 4 second(s).
Extend Virus V	Extends Virus effects inflicted by your Arts by 5 second(s).
Extend Virus VI	Extends Virus effects inflicted by your Arts by 6 second(s).
Extend Virus VII	Extends Virus effects inflicted by your Arts by 7 second(s).
Extend Virus VIII	Extends Virus effects inflicted by your Arts by 8 second(s).
Extend Virus IX	Extends Virus effects inflicted by your Arts by 9 second(s).
Extend Virus X	Extends Virus effects inflicted by your Arts by 10 second(s).
Extend Virus XI	Extends Virus effects inflicted by your Arts by 11 second(s).
Extend Virus XII	Extends Virus effects inflicted by your Arts by 12 second(s).
Extend Virus XIII	Extends Virus effects inflicted by your Arts by 13 second(s).
Extend Virus XIV	Extends Virus effects inflicted by your Arts by 14 second(s).
Extend Virus XV	Extends Virus effects inflicted by your Arts by 15 second(s).
Extend Virus XVI	Extends Virus effects inflicted by your Arts by 16 second(s).
Extend Virus XVII	Extends Virus effects inflicted by your Arts by 17 second(s).
Extend Virus XVIII	Extends Virus effects inflicted by your Arts by 18 second(s).
Extend Virus XIX	Extends Virus effects inflicted by your Arts by 19 second(s).
Extend Virus XX	Extends Virus effects inflicted by your Arts by 20 second(s).
Extend Blackout I	Extends Blackout effects inflicted by your Arts by 1 second(s).
Extend Blackout II	Extends Blackout effects inflicted by your Arts by 2 second(s).
Extend Blackout III	Extends Blackout effects inflicted by your Arts by 3 second(s).
Extend Blackout IV	Extends Blackout effects inflicted by your Arts by 4 second(s).
Extend Blackout V	Extends Blackout effects inflicted by your Arts by 5 second(s).
Extend Blackout VI	Extends Blackout effects inflicted by your Arts by 6 second(s).
Extend Blackout VII	Extends Blackout effects inflicted by your Arts by 7 second(s).
Extend Blackout VIII	Extends Blackout effects inflicted by your Arts by 8 second(s).
Extend Blackout IX	Extends Blackout effects inflicted by your Arts by 9 second(s).
Extend Blackout X	Extends Blackout effects inflicted by your Arts by 10 second(s).
Extend Blackout XI	Extends Blackout effects inflicted by your Arts by 11 second(s).
Extend Blackout XII	Extends Blackout effects inflicted by your Arts by 12 second(s).
Extend Blackout XIII	Extends Blackout effects inflicted by your Arts by 13 second(s).
Extend Blackout XIV	Extends Blackout effects inflicted by your Arts by 14 second(s).
Extend Blackout XV	Extends Blackout effects inflicted by your Arts by 15 second(s).
Extend Blackout XVI	Extends Blackout effects inflicted by your Arts by 16 second(s).
Extend Blackout XVII	Extends Blackout effects inflicted by your Arts by 17 second(s).
Extend Blackout XVIII	Extends Blackout effects inflicted by your Arts by 18 second(s).
Extend Blackout XIX	Extends Blackout effects inflicted by your Arts by 19 second(s).
Extend Blackout XX	Extends Blackout effects inflicted by your Arts by 20 second(s).
Extend Fatigue I	Extends Fatigue effects inflicted by your Arts by 1 second(s).
Extend Fatigue II	Extends Fatigue effects inflicted by your Arts by 2 second(s).
Extend Fatigue III	Extends Fatigue effects inflicted by your Arts by 3 second(s).
Extend Fatigue IV	Extends Fatigue effects inflicted by your Arts by 4 second(s).
Extend Fatigue V	Extends Fatigue effects inflicted by your Arts by 5 second(s).
Extend Fatigue VI	Extends Fatigue effects inflicted by your Arts by 6 second(s).
Extend Fatigue VII	Extends Fatigue effects inflicted by your Arts by 7 second(s).
Extend Fatigue VIII	Extends Fatigue effects inflicted by your Arts by 8 second(s).
Extend Fatigue IX	Extends Fatigue effects inflicted by your Arts by 9 second(s).
Extend Fatigue X	Extends Fatigue effects inflicted by your Arts by 10 second(s).
Extend Fatigue XI	Extends Fatigue effects inflicted by your Arts by 11 second(s).
Extend Fatigue XII	Extends Fatigue effects inflicted by your Arts by 12 second(s).
Reinvigorate VII	Boosts HP recovery by 22% when revived.
Extend Fatigue XIII	Extends Fatigue effects inflicted by your Arts by 13 second(s).
Extend Fatigue XIV	Extends Fatigue effects inflicted by your Arts by 14 second(s).
Extend Fatigue XV	Extends Fatigue effects inflicted by your Arts by 15 second(s).
Extend Fatigue XVI	Extends Fatigue effects inflicted by your Arts by 16 second(s).
Extend Fatigue XVII	Extends Fatigue effects inflicted by your Arts by 17 second(s).
Extend Fatigue XVIII	Extends Fatigue effects inflicted by your Arts by 18 second(s).
Extend Fatigue XIX	Extends Fatigue effects inflicted by your Arts by 19 second(s).
Extend Fatigue XX	Extends Fatigue effects inflicted by your Arts by 20 second(s).
Extend Slow Arts I	Extends Slow Arts effects inflicted by your Arts by 1 second(s).
Extend Slow Arts II	Extends Slow Arts effects inflicted by your Arts by 2 second(s).
Extend Slow Arts III	Extends Slow Arts effects inflicted by your Arts by 3 second(s).
Extend Slow Arts IV	Extends Slow Arts effects inflicted by your Arts by 4 second(s).
Extend Slow Arts V	Extends Slow Arts effects inflicted by your Arts by 5 second(s).
Extend Slow Arts VI	Extends Slow Arts effects inflicted by your Arts by 6 second(s).
Extend Slow Arts VII	Extends Slow Arts effects inflicted by your Arts by 7 second(s).
Extend Slow Arts VIII	Extends Slow Arts effects inflicted by your Arts by 8 second(s).
Extend Slow Arts IX	Extends Slow Arts effects inflicted by your Arts by 9 second(s).
Extend Slow Arts X	Extends Slow Arts effects inflicted by your Arts by 10 second(s).
Extend Slow Arts XI	Extends Slow Arts effects inflicted by your Arts by 11 second(s).
Extend Slow Arts XII	Extends Slow Arts effects inflicted by your Arts by 12 second(s).
Extend Slow Arts XIII	Extends Slow Arts effects inflicted by your Arts by 13 second(s).
Extend Slow Arts XIV	Extends Slow Arts effects inflicted by your Arts by 14 second(s).
Extend Slow Arts XV	Extends Slow Arts effects inflicted by your Arts by 15 second(s).
Extend Slow Arts XVI	Extends Slow Arts effects inflicted by your Arts by 16 second(s).
Extend Slow Arts XVII	Extends Slow Arts effects inflicted by your Arts by 17 second(s).
Extend Slow Arts XVIII	Extends Slow Arts effects inflicted by your Arts by 18 second(s).
Extend Slow Arts XIX	Extends Slow Arts effects inflicted by your Arts by 19 second(s).
Extend Slow Arts XX	Extends Slow Arts effects inflicted by your Arts by 20 second(s).
Extend Debuff Res Down I	Extends Debuff Res Down effects inflicted by your Arts by 1 second(s).
Extend Debuff Res Down II	Extends Debuff Res Down effects inflicted by your Arts by 2 second(s).
Extend Debuff Res Down III	Extends Debuff Res Down effects inflicted by your Arts by 3 second(s).
Extend Debuff Res Down IV	Extends Debuff Res Down effects inflicted by your Arts by 4 second(s).
Extend Debuff Res Down V	Extends Debuff Res Down effects inflicted by your Arts by 5 second(s).
Extend Debuff Res Down VI	Extends Debuff Res Down effects inflicted by your Arts by 6 second(s).
Extend Debuff Res Down VII	Extends Debuff Res Down effects inflicted by your Arts by 7 second(s).
Extend Debuff Res Down VIII	Extends Debuff Res Down effects inflicted by your Arts by 8 second(s).
Extend Debuff Res Down IX	Extends Debuff Res Down effects inflicted by your Arts by 9 second(s).
Extend Debuff Res Down X	Extends Debuff Res Down effects inflicted by your Arts by 10 second(s).
Extend Debuff Res Down XI	Extends Debuff Res Down effects inflicted by your Arts by 11 second(s).
Extend Debuff Res Down XII	Extends Debuff Res Down effects inflicted by your Arts by 12 second(s).
Extend Debuff Res Down XIII	Extends Debuff Res Down effects inflicted by your Arts by 13 second(s).
Extend Debuff Res Down XIV	Extends Debuff Res Down effects inflicted by your Arts by 14 second(s).
Extend Debuff Res Down XV	Extends Debuff Res Down effects inflicted by your Arts by 15 second(s).
Extend Debuff Res Down XVI	Extends Debuff Res Down effects inflicted by your Arts by 16 second(s).
Extend Debuff Res Down XVII	Extends Debuff Res Down effects inflicted by your Arts by 17 second(s).
Extend Debuff Res Down XVIII	Extends Debuff Res Down effects inflicted by your Arts by 18 second(s).
Extend Debuff Res Down XIX	Extends Debuff Res Down effects inflicted by your Arts by 19 second(s).
Extend Debuff Res Down XX	Extends Debuff Res Down effects inflicted by your Arts by 20 second(s).
Extend Blaze I	Extends Blaze effects inflicted by your Arts by 1 second(s).
Extend Blaze II	Extends Blaze effects inflicted by your Arts by 2 second(s).
Extend Blaze III	Extends Blaze effects inflicted by your Arts by 3 second(s).
Extend Blaze IV	Extends Blaze effects inflicted by your Arts by 4 second(s).
Extend Blaze V	Extends Blaze effects inflicted by your Arts by 5 second(s).
Extend Blaze VI	Extends Blaze effects inflicted by your Arts by 6 second(s).
Extend Blaze VII	Extends Blaze effects inflicted by your Arts by 7 second(s).
Extend Blaze VIII	Extends Blaze effects inflicted by your Arts by 8 second(s).
Extend Blaze IX	Extends Blaze effects inflicted by your Arts by 9 second(s).
Extend Blaze X	Extends Blaze effects inflicted by your Arts by 10 second(s).
Extend Blaze XI	Extends Blaze effects inflicted by your Arts by 11 second(s).
Extend Blaze XII	Extends Blaze effects inflicted by your Arts by 12 second(s).
Extend Blaze XIII	Extends Blaze effects inflicted by your Arts by 13 second(s).
Extend Blaze XIV	Extends Blaze effects inflicted by your Arts by 14 second(s).
Extend Blaze XV	Extends Blaze effects inflicted by your Arts by 15 second(s).
Extend Blaze XVI	Extends Blaze effects inflicted by your Arts by 16 second(s).
Extend Blaze XVII	Extends Blaze effects inflicted by your Arts by 17 second(s).
Extend Blaze XVIII	Extends Blaze effects inflicted by your Arts by 18 second(s).
Extend Blaze XIX	Extends Blaze effects inflicted by your Arts by 19 second(s).
Extend Blaze XX	Extends Blaze effects inflicted by your Arts by 20 second(s).
Extend Shock I	Extends Shock effects inflicted by your Arts by 1 second(s).
Extend Shock II	Extends Shock effects inflicted by your Arts by 2 second(s).
Extend Shock III	Extends Shock effects inflicted by your Arts by 3 second(s).
Extend Shock IV	Extends Shock effects inflicted by your Arts by 4 second(s).
Extend Shock V	Extends Shock effects inflicted by your Arts by 5 second(s).
Extend Shock VI	Extends Shock effects inflicted by your Arts by 6 second(s).
Extend Shock VII	Extends Shock effects inflicted by your Arts by 7 second(s).
Extend Shock VIII	Extends Shock effects inflicted by your Arts by 8 second(s).
Extend Shock IX	Extends Shock effects inflicted by your Arts by 9 second(s).
Extend Shock X	Extends Shock effects inflicted by your Arts by 10 second(s).
Extend Shock XI	Extends Shock effects inflicted by your Arts by 11 second(s).
Extend Shock XII	Extends Shock effects inflicted by your Arts by 12 second(s).
Extend Shock XIII	Extends Shock effects inflicted by your Arts by 13 second(s).
Extend Shock XIV	Extends Shock effects inflicted by your Arts by 14 second(s).
Extend Shock XV	Extends Shock effects inflicted by your Arts by 15 second(s).
Extend Shock XVI	Extends Shock effects inflicted by your Arts by 16 second(s).
Extend Shock XVII	Extends Shock effects inflicted by your Arts by 17 second(s).
Extend Shock XVIII	Extends Shock effects inflicted by your Arts by 18 second(s).
Extend Shock XIX	Extends Shock effects inflicted by your Arts by 19 second(s).
Extend Shock XX	Extends Shock effects inflicted by your Arts by 20 second(s).
Extend Physical Res Down I	Extends Physical Res Down effects inflicted by your Arts by 1 second(s).
Extend Physical Res Down II	Extends Physical Res Down effects inflicted by your Arts by 2 second(s).
Extend Physical Res Down III	Extends Physical Res Down effects inflicted by your Arts by 3 second(s).
Extend Physical Res Down IV	Extends Physical Res Down effects inflicted by your Arts by 4 second(s).
Extend Physical Res Down V	Extends Physical Res Down effects inflicted by your Arts by 5 second(s).
Extend Physical Res Down VI	Extends Physical Res Down effects inflicted by your Arts by 6 second(s).
Extend Physical Res Down VII	Extends Physical Res Down effects inflicted by your Arts by 7 second(s).
Extend Physical Res Down VIII	Extends Physical Res Down effects inflicted by your Arts by 8 second(s).
Extend Physical Res Down IX	Extends Physical Res Down effects inflicted by your Arts by 9 second(s).
Extend Physical Res Down X	Extends Physical Res Down effects inflicted by your Arts by 10 second(s).
Extend Physical Res Down XI	Extends Physical Res Down effects inflicted by your Arts by 11 second(s).
Extend Physical Res Down XII	Extends Physical Res Down effects inflicted by your Arts by 12 second(s).
Extend Physical Res Down XIII	Extends Physical Res Down effects inflicted by your Arts by 13 second(s).
Extend Physical Res Down XIV	Extends Physical Res Down effects inflicted by your Arts by 14 second(s).
Extend Physical Res Down XV	Extends Physical Res Down effects inflicted by your Arts by 15 second(s).
Extend Physical Res Down XVI	Extends Physical Res Down effects inflicted by your Arts by 16 second(s).
Extend Physical Res Down XVII	Extends Physical Res Down effects inflicted by your Arts by 17 second(s).
Extend Physical Res Down XVIII	Extends Physical Res Down effects inflicted by your Arts by 18 second(s).
Extend Physical Res Down XIX	Extends Physical Res Down effects inflicted by your Arts by 19 second(s).
Extend Physical Res Down XX	Extends Physical Res Down effects inflicted by your Arts by 20 second(s).
Extend Beam Res Down I	Extends Beam Res Down effects inflicted by your Arts by 1 second(s).
Extend Beam Res Down II	Extends Beam Res Down effects inflicted by your Arts by 2 second(s).
Extend Beam Res Down III	Extends Beam Res Down effects inflicted by your Arts by 3 second(s).
Extend Beam Res Down IV	Extends Beam Res Down effects inflicted by your Arts by 4 second(s).
Extend Beam Res Down V	Extends Beam Res Down effects inflicted by your Arts by 5 second(s).
Extend Beam Res Down VI	Extends Beam Res Down effects inflicted by your Arts by 6 second(s).
Extend Beam Res Down VII	Extends Beam Res Down effects inflicted by your Arts by 7 second(s).
Extend Beam Res Down VIII	Extends Beam Res Down effects inflicted by your Arts by 8 second(s).
Extend Beam Res Down IX	Extends Beam Res Down effects inflicted by your Arts by 9 second(s).
Extend Beam Res Down X	Extends Beam Res Down effects inflicted by your Arts by 10 second(s).
Extend Beam Res Down XI	Extends Beam Res Down effects inflicted by your Arts by 11 second(s).
Extend Beam Res Down XII	Extends Beam Res Down effects inflicted by your Arts by 12 second(s).
Extend Beam Res Down XIII	Extends Beam Res Down effects inflicted by your Arts by 13 second(s).
Extend Beam Res Down XIV	Extends Beam Res Down effects inflicted by your Arts by 14 second(s).
Extend Beam Res Down XV	Extends Beam Res Down effects inflicted by your Arts by 15 second(s).
Extend Beam Res Down XVI	Extends Beam Res Down effects inflicted by your Arts by 16 second(s).
Extend Beam Res Down XVII	Extends Beam Res Down effects inflicted by your Arts by 17 second(s).
Extend Beam Res Down XVIII	Extends Beam Res Down effects inflicted by your Arts by 18 second(s).
Extend Beam Res Down XIX	Extends Beam Res Down effects inflicted by your Arts by 19 second(s).
Extend Beam Res Down XX	Extends Beam Res Down effects inflicted by your Arts by 20 second(s).
Extend Ether Res Down I	Extends Ether Res Down effects inflicted by your Arts by 1 second(s).
Extend Ether Res Down II	Extends Ether Res Down effects inflicted by your Arts by 2 second(s).
Extend Ether Res Down III	Extends Ether Res Down effects inflicted by your Arts by 3 second(s).
Extend Ether Res Down IV	Extends Ether Res Down effects inflicted by your Arts by 4 second(s).
Extend Ether Res Down V	Extends Ether Res Down effects inflicted by your Arts by 5 second(s).
Extend Ether Res Down VI	Extends Ether Res Down effects inflicted by your Arts by 6 second(s).
Extend Ether Res Down VII	Extends Ether Res Down effects inflicted by your Arts by 7 second(s).
Reinvigorate VIII	Boosts HP recovery by 24% when revived.
Extend Ether Res Down VIII	Extends Ether Res Down effects inflicted by your Arts by 8 second(s).
Extend Ether Res Down IX	Extends Ether Res Down effects inflicted by your Arts by 9 second(s).
Extend Ether Res Down X	Extends Ether Res Down effects inflicted by your Arts by 10 second(s).
Extend Ether Res Down XI	Extends Ether Res Down effects inflicted by your Arts by 11 second(s).
Extend Ether Res Down XII	Extends Ether Res Down effects inflicted by your Arts by 12 second(s).
Extend Ether Res Down XIII	Extends Ether Res Down effects inflicted by your Arts by 13 second(s).
Extend Ether Res Down XIV	Extends Ether Res Down effects inflicted by your Arts by 14 second(s).
Extend Ether Res Down XV	Extends Ether Res Down effects inflicted by your Arts by 15 second(s).
Extend Ether Res Down XVI	Extends Ether Res Down effects inflicted by your Arts by 16 second(s).
Extend Ether Res Down XVII	Extends Ether Res Down effects inflicted by your Arts by 17 second(s).
Extend Ether Res Down XVIII	Extends Ether Res Down effects inflicted by your Arts by 18 second(s).
Extend Ether Res Down XIX	Extends Ether Res Down effects inflicted by your Arts by 19 second(s).
Extend Ether Res Down XX	Extends Ether Res Down effects inflicted by your Arts by 20 second(s).
Extend Thermal Res Down I	Extends Thermal Res Down effects inflicted by your Arts by 1 second(s).
Extend Thermal Res Down II	Extends Thermal Res Down effects inflicted by your Arts by 2 second(s).
Extend Thermal Res Down III	Extends Thermal Res Down effects inflicted by your Arts by 3 second(s).
Extend Thermal Res Down IV	Extends Thermal Res Down effects inflicted by your Arts by 4 second(s).
Extend Thermal Res Down V	Extends Thermal Res Down effects inflicted by your Arts by 5 second(s).
Extend Thermal Res Down VI	Extends Thermal Res Down effects inflicted by your Arts by 6 second(s).
Extend Thermal Res Down VII	Extends Thermal Res Down effects inflicted by your Arts by 7 second(s).
Extend Thermal Res Down VIII	Extends Thermal Res Down effects inflicted by your Arts by 8 second(s).
Extend Thermal Res Down IX	Extends Thermal Res Down effects inflicted by your Arts by 9 second(s).
Extend Thermal Res Down X	Extends Thermal Res Down effects inflicted by your Arts by 10 second(s).
Extend Thermal Res Down XI	Extends Thermal Res Down effects inflicted by your Arts by 11 second(s).
Extend Thermal Res Down XII	Extends Thermal Res Down effects inflicted by your Arts by 12 second(s).
Extend Thermal Res Down XIII	Extends Thermal Res Down effects inflicted by your Arts by 13 second(s).
Extend Thermal Res Down XIV	Extends Thermal Res Down effects inflicted by your Arts by 14 second(s).
Extend Thermal Res Down XV	Extends Thermal Res Down effects inflicted by your Arts by 15 second(s).
Extend Thermal Res Down XVI	Extends Thermal Res Down effects inflicted by your Arts by 16 second(s).
Extend Thermal Res Down XVII	Extends Thermal Res Down effects inflicted by your Arts by 17 second(s).
Extend Thermal Res Down XVIII	Extends Thermal Res Down effects inflicted by your Arts by 18 second(s).
Extend Thermal Res Down XIX	Extends Thermal Res Down effects inflicted by your Arts by 19 second(s).
Extend Thermal Res Down XX	Extends Thermal Res Down effects inflicted by your Arts by 20 second(s).
Extend Electric Res Down I	Extends Electric Res Down effects inflicted by your Arts by 1 second(s).
Extend Electric Res Down II	Extends Electric Res Down effects inflicted by your Arts by 2 second(s).
Extend Electric Res Down III	Extends Electric Res Down effects inflicted by your Arts by 3 second(s).
Extend Electric Res Down IV	Extends Electric Res Down effects inflicted by your Arts by 4 second(s).
Extend Electric Res Down V	Extends Electric Res Down effects inflicted by your Arts by 5 second(s).
Extend Electric Res Down VI	Extends Electric Res Down effects inflicted by your Arts by 6 second(s).
Extend Electric Res Down VII	Extends Electric Res Down effects inflicted by your Arts by 7 second(s).
Extend Electric Res Down VIII	Extends Electric Res Down effects inflicted by your Arts by 8 second(s).
Extend Electric Res Down IX	Extends Electric Res Down effects inflicted by your Arts by 9 second(s).
Extend Electric Res Down X	Extends Electric Res Down effects inflicted by your Arts by 10 second(s).
Extend Electric Res Down XI	Extends Electric Res Down effects inflicted by your Arts by 11 second(s).
Extend Electric Res Down XII	Extends Electric Res Down effects inflicted by your Arts by 12 second(s).
Extend Electric Res Down XIII	Extends Electric Res Down effects inflicted by your Arts by 13 second(s).
Extend Electric Res Down XIV	Extends Electric Res Down effects inflicted by your Arts by 14 second(s).
Extend Electric Res Down XV	Extends Electric Res Down effects inflicted by your Arts by 15 second(s).
Extend Electric Res Down XVI	Extends Electric Res Down effects inflicted by your Arts by 16 second(s).
Extend Electric Res Down XVII	Extends Electric Res Down effects inflicted by your Arts by 17 second(s).
Extend Electric Res Down XVIII	Extends Electric Res Down effects inflicted by your Arts by 18 second(s).
Extend Electric Res Down XIX	Extends Electric Res Down effects inflicted by your Arts by 19 second(s).
Extend Electric Res Down XX	Extends Electric Res Down effects inflicted by your Arts by 20 second(s).
Extend Gravity Res Down I	Extends Gravity Res Down effects inflicted by your Arts by 1 second(s).
Extend Gravity Res Down II	Extends Gravity Res Down effects inflicted by your Arts by 2 second(s).
Extend Gravity Res Down III	Extends Gravity Res Down effects inflicted by your Arts by 3 second(s).
Extend Gravity Res Down IV	Extends Gravity Res Down effects inflicted by your Arts by 4 second(s).
Extend Gravity Res Down V	Extends Gravity Res Down effects inflicted by your Arts by 5 second(s).
Extend Gravity Res Down VI	Extends Gravity Res Down effects inflicted by your Arts by 6 second(s).
Extend Gravity Res Down VII	Extends Gravity Res Down effects inflicted by your Arts by 7 second(s).
Extend Gravity Res Down VIII	Extends Gravity Res Down effects inflicted by your Arts by 8 second(s).
Extend Gravity Res Down IX	Extends Gravity Res Down effects inflicted by your Arts by 9 second(s).
Extend Gravity Res Down X	Extends Gravity Res Down effects inflicted by your Arts by 10 second(s).
Extend Gravity Res Down XI	Extends Gravity Res Down effects inflicted by your Arts by 11 second(s).
Extend Gravity Res Down XII	Extends Gravity Res Down effects inflicted by your Arts by 12 second(s).
Extend Gravity Res Down XIII	Extends Gravity Res Down effects inflicted by your Arts by 13 second(s).
Extend Gravity Res Down XIV	Extends Gravity Res Down effects inflicted by your Arts by 14 second(s).
Extend Gravity Res Down XV	Extends Gravity Res Down effects inflicted by your Arts by 15 second(s).
Extend Gravity Res Down XVI	Extends Gravity Res Down effects inflicted by your Arts by 16 second(s).
Extend Gravity Res Down XVII	Extends Gravity Res Down effects inflicted by your Arts by 17 second(s).
Extend Gravity Res Down XVIII	Extends Gravity Res Down effects inflicted by your Arts by 18 second(s).
Extend Gravity Res Down XIX	Extends Gravity Res Down effects inflicted by your Arts by 19 second(s).
Extend Gravity Res Down XX	Extends Gravity Res Down effects inflicted by your Arts by 20 second(s).
Opening Art: Damage Up I	Boosts damage for Opening Arts by 5%.
Opening Art: Damage Up II	Boosts damage for Opening Arts by 10%.
Opening Art: Damage Up III	Boosts damage for Opening Arts by 15%.
Opening Art: Damage Up IV	Boosts damage for Opening Arts by 20%.
Opening Art: Damage Up V	Boosts damage for Opening Arts by 25%.
Opening Art: Damage Up VI	Boosts damage for Opening Arts by 30%.
Opening Art: Damage Up VII	Boosts damage for Opening Arts by 35%.
Opening Art: Damage Up VIII	Boosts damage for Opening Arts by 40%.
Opening Art: Damage Up IX	Boosts damage for Opening Arts by 45%.
Opening Art: Damage Up X	Boosts damage for Opening Arts by 50%.
Opening Art: Damage Up XI	Boosts damage for Opening Arts by 55%.
Opening Art: Damage Up XII	Boosts damage for Opening Arts by 60%.
Opening Art: Damage Up XIII	Boosts damage for Opening Arts by 65%.
Opening Art: Damage Up XIV	Boosts damage for Opening Arts by 70%.
Opening Art: Damage Up XV	Boosts damage for Opening Arts by 75%.
Opening Art: Damage Up XVI	Boosts damage for Opening Arts by 80%.
Opening Art: Damage Up XVII	Boosts damage for Opening Arts by 85%.
Opening Art: Damage Up XVIII	Boosts damage for Opening Arts by 90%.
Opening Art: Damage Up XIX	Boosts damage for Opening Arts by 95%.
Opening Art: Damage Up XX	Boosts damage for Opening Arts by 100%.
Melee Draw Surge I	Boosts chances of triggering the \\"Draw Melee\\" Soul Voice by 10%.
Melee Draw Surge II	Boosts chances of triggering the \\"Draw Melee\\" Soul Voice by 12%.
Melee Draw Surge III	Boosts chances of triggering the \\"Draw Melee\\" Soul Voice by 14%.
Melee Draw Surge IV	Boosts chances of triggering the \\"Draw Melee\\" Soul Voice by 16%.
Melee Draw Surge V	Boosts chances of triggering the \\"Draw Melee\\" Soul Voice by 18%.
Melee Draw Surge VI	Boosts chances of triggering the \\"Draw Melee\\" Soul Voice by 20%.
Melee Draw Surge VII	Boosts chances of triggering the \\"Draw Melee\\" Soul Voice by 22%.
Melee Draw Surge VIII	Boosts chances of triggering the \\"Draw Melee\\" Soul Voice by 24%.
Melee Draw Surge IX	Boosts chances of triggering the \\"Draw Melee\\" Soul Voice by 26%.
Melee Draw Surge X	Boosts chances of triggering the \\"Draw Melee\\" Soul Voice by 28%.
Melee Draw Surge XI	Boosts chances of triggering the \\"Draw Melee\\" Soul Voice by 32%.
Melee Draw Surge XII	Boosts chances of triggering the \\"Draw Melee\\" Soul Voice by 34%.
Melee Draw Surge XIII	Boosts chances of triggering the \\"Draw Melee\\" Soul Voice by 36%.
Melee Draw Surge XIV	Boosts chances of triggering the \\"Draw Melee\\" Soul Voice by 38%.
Melee Draw Surge XV	Boosts chances of triggering the \\"Draw Melee\\" Soul Voice by 40%.
Melee Draw Surge XVI	Boosts chances of triggering the \\"Draw Melee\\" Soul Voice by 42%.
Melee Draw Surge XVII	Boosts chances of triggering the \\"Draw Melee\\" Soul Voice by 44%.
Melee Draw Surge XVIII	Boosts chances of triggering the \\"Draw Melee\\" Soul Voice by 46%.
Melee Draw Surge XIX	Boosts chances of triggering the \\"Draw Melee\\" Soul Voice by 48%.
Melee Draw Surge XX	Boosts chances of triggering the \\"Draw Melee\\" Soul Voice by 50%.
Ranged Draw Surge I	Boosts chances of triggering the \\"Draw Ranged\\" Soul Voice by 10%.
Ranged Draw Surge II	Boosts chances of triggering the \\"Draw Ranged\\" Soul Voice by 12%.
Ranged Draw Surge III	Boosts chances of triggering the \\"Draw Ranged\\" Soul Voice by 14%.
Ranged Draw Surge IV	Boosts chances of triggering the \\"Draw Ranged\\" Soul Voice by 16%.
Ranged Draw Surge V	Boosts chances of triggering the \\"Draw Ranged\\" Soul Voice by 18%.
Ranged Draw Surge VI	Boosts chances of triggering the \\"Draw Ranged\\" Soul Voice by 20%.
Ranged Draw Surge VII	Boosts chances of triggering the \\"Draw Ranged\\" Soul Voice by 22%.
Ranged Draw Surge VIII	Boosts chances of triggering the \\"Draw Ranged\\" Soul Voice by 24%.
Ranged Draw Surge IX	Boosts chances of triggering the \\"Draw Ranged\\" Soul Voice by 26%.
Ranged Draw Surge X	Boosts chances of triggering the \\"Draw Ranged\\" Soul Voice by 28%.
Ranged Draw Surge XI	Boosts chances of triggering the \\"Draw Ranged\\" Soul Voice by 32%.
Ranged Draw Surge XII	Boosts chances of triggering the \\"Draw Ranged\\" Soul Voice by 34%.
Ranged Draw Surge XIII	Boosts chances of triggering the \\"Draw Ranged\\" Soul Voice by 36%.
Ranged Draw Surge XIV	Boosts chances of triggering the \\"Draw Ranged\\" Soul Voice by 38%.
Ranged Draw Surge XV	Boosts chances of triggering the \\"Draw Ranged\\" Soul Voice by 40%.
Ranged Draw Surge XVI	Boosts chances of triggering the \\"Draw Ranged\\" Soul Voice by 42%.
Ranged Draw Surge XVII	Boosts chances of triggering the \\"Draw Ranged\\" Soul Voice by 44%.
Ranged Draw Surge XVIII	Boosts chances of triggering the \\"Draw Ranged\\" Soul Voice by 46%.
Ranged Draw Surge XIX	Boosts chances of triggering the \\"Draw Ranged\\" Soul Voice by 48%.
Ranged Draw Surge XX	Boosts chances of triggering the \\"Draw Ranged\\" Soul Voice by 50%.
Art Draw Surge I	Boosts chances of triggering the \\"Opening Art\\" Soul Voice by 5%.
Art Draw Surge II	Boosts chances of triggering the \\"Opening Art\\" Soul Voice by 6%.
Art Draw Surge III	Boosts chances of triggering the \\"Opening Art\\" Soul Voice by 7%.
Art Draw Surge IV	Boosts chances of triggering the \\"Opening Art\\" Soul Voice by 8%.
Art Draw Surge V	Boosts chances of triggering the \\"Opening Art\\" Soul Voice by 9%.
Art Draw Surge VI	Boosts chances of triggering the \\"Opening Art\\" Soul Voice by 10%.
Art Draw Surge VII	Boosts chances of triggering the \\"Opening Art\\" Soul Voice by 11%.
Art Draw Surge VIII	Boosts chances of triggering the \\"Opening Art\\" Soul Voice by 12%.
Art Draw Surge IX	Boosts chances of triggering the \\"Opening Art\\" Soul Voice by 13%.
Art Draw Surge X	Boosts chances of triggering the \\"Opening Art\\" Soul Voice by 14%.
Art Draw Surge XI	Boosts chances of triggering the \\"Opening Art\\" Soul Voice by 15%.
Art Draw Surge XII	Boosts chances of triggering the \\"Opening Art\\" Soul Voice by 16%.
Art Draw Surge XIII	Boosts chances of triggering the \\"Opening Art\\" Soul Voice by 17%.
Art Draw Surge XIV	Boosts chances of triggering the \\"Opening Art\\" Soul Voice by 18%.
Art Draw Surge XV	Boosts chances of triggering the \\"Opening Art\\" Soul Voice by 19%.
Art Draw Surge XVI	Boosts chances of triggering the \\"Opening Art\\" Soul Voice by 20%.
Art Draw Surge XVII	Boosts chances of triggering the \\"Opening Art\\" Soul Voice by 21%.
Art Draw Surge XVIII	Boosts chances of triggering the \\"Opening Art\\" Soul Voice by 22%.
Art Draw Surge XIX	Boosts chances of triggering the \\"Opening Art\\" Soul Voice by 23%.
Art Draw Surge XX	Boosts chances of triggering the \\"Opening Art\\" Soul Voice by 25%.
Danger Surge I	Boosts chances of triggering the \\"HP Risk\\" Soul Voice by 5%.
Danger Surge II	Boosts chances of triggering the \\"HP Risk\\" Soul Voice by 6%.
Danger Surge III	Boosts chances of triggering the \\"HP Risk\\" Soul Voice by 7%.
Danger Surge IV	Boosts chances of triggering the \\"HP Risk\\" Soul Voice by 8%.
Danger Surge V	Boosts chances of triggering the \\"HP Risk\\" Soul Voice by 9%.
Danger Surge VI	Boosts chances of triggering the \\"HP Risk\\" Soul Voice by 10%.
Danger Surge VII	Boosts chances of triggering the \\"HP Risk\\" Soul Voice by 11%.
Danger Surge VIII	Boosts chances of triggering the \\"HP Risk\\" Soul Voice by 12%.
Danger Surge IX	Boosts chances of triggering the \\"HP Risk\\" Soul Voice by 13%.
Danger Surge X	Boosts chances of triggering the \\"HP Risk\\" Soul Voice by 14%.
Danger Surge XI	Boosts chances of triggering the \\"HP Risk\\" Soul Voice by 15%.
Danger Surge XII	Boosts chances of triggering the \\"HP Risk\\" Soul Voice by 16%.
Danger Surge XIII	Boosts chances of triggering the \\"HP Risk\\" Soul Voice by 17%.
Danger Surge XIV	Boosts chances of triggering the \\"HP Risk\\" Soul Voice by 18%.
Danger Surge XV	Boosts chances of triggering the \\"HP Risk\\" Soul Voice by 19%.
Danger Surge XVI	Boosts chances of triggering the \\"HP Risk\\" Soul Voice by 20%.
Danger Surge XVII	Boosts chances of triggering the \\"HP Risk\\" Soul Voice by 21%.
Danger Surge XVIII	Boosts chances of triggering the \\"HP Risk\\" Soul Voice by 22%.
Danger Surge XIX	Boosts chances of triggering the \\"HP Risk\\" Soul Voice by 23%.
Danger Surge XX	Boosts chances of triggering the \\"HP Risk\\" Soul Voice by 25%.
High Danger Surge I	Boosts chances of triggering the \\"HP Peril\\" Soul Voice by 5%.
High Danger Surge II	Boosts chances of triggering the \\"HP Peril\\" Soul Voice by 6%.
High Danger Surge III	Boosts chances of triggering the \\"HP Peril\\" Soul Voice by 7%.
High Danger Surge IV	Boosts chances of triggering the \\"HP Peril\\" Soul Voice by 8%.
High Danger Surge V	Boosts chances of triggering the \\"HP Peril\\" Soul Voice by 9%.
High Danger Surge VI	Boosts chances of triggering the \\"HP Peril\\" Soul Voice by 10%.
High Danger Surge VII	Boosts chances of triggering the \\"HP Peril\\" Soul Voice by 11%.
High Danger Surge VIII	Boosts chances of triggering the \\"HP Peril\\" Soul Voice by 12%.
High Danger Surge IX	Boosts chances of triggering the \\"HP Peril\\" Soul Voice by 13%.
High Danger Surge X	Boosts chances of triggering the \\"HP Peril\\" Soul Voice by 14%.
High Danger Surge XI	Boosts chances of triggering the \\"HP Peril\\" Soul Voice by 15%.
High Danger Surge XII	Boosts chances of triggering the \\"HP Peril\\" Soul Voice by 16%.
High Danger Surge XIII	Boosts chances of triggering the \\"HP Peril\\" Soul Voice by 17%.
High Danger Surge XIV	Boosts chances of triggering the \\"HP Peril\\" Soul Voice by 18%.
High Danger Surge XV	Boosts chances of triggering the \\"HP Peril\\" Soul Voice by 19%.
High Danger Surge XVI	Boosts chances of triggering the \\"HP Peril\\" Soul Voice by 20%.
High Danger Surge XVII	Boosts chances of triggering the \\"HP Peril\\" Soul Voice by 21%.
High Danger Surge XVIII	Boosts chances of triggering the \\"HP Peril\\" Soul Voice by 22%.
High Danger Surge XIX	Boosts chances of triggering the \\"HP Peril\\" Soul Voice by 23%.
High Danger Surge XX	Boosts chances of triggering the \\"HP Peril\\" Soul Voice by 25%.
Incapacitation Surge I	Boosts chances of triggering the \\"Last Words\\" Soul Voice by 5%.
Incapacitation Surge II	Boosts chances of triggering the \\"Last Words\\" Soul Voice by 6%.
Incapacitation Surge III	Boosts chances of triggering the \\"Last Words\\" Soul Voice by 7%.
Incapacitation Surge IV	Boosts chances of triggering the \\"Last Words\\" Soul Voice by 8%.
Incapacitation Surge V	Boosts chances of triggering the \\"Last Words\\" Soul Voice by 9%.
Incapacitation Surge VI	Boosts chances of triggering the \\"Last Words\\" Soul Voice by 10%.
Incapacitation Surge VII	Boosts chances of triggering the \\"Last Words\\" Soul Voice by 11%.
Incapacitation Surge VIII	Boosts chances of triggering the \\"Last Words\\" Soul Voice by 12%.
Incapacitation Surge IX	Boosts chances of triggering the \\"Last Words\\" Soul Voice by 13%.
Incapacitation Surge X	Boosts chances of triggering the \\"Last Words\\" Soul Voice by 14%.
Incapacitation Surge XI	Boosts chances of triggering the \\"Last Words\\" Soul Voice by 15%.
Incapacitation Surge XII	Boosts chances of triggering the \\"Last Words\\" Soul Voice by 16%.
Incapacitation Surge XIII	Boosts chances of triggering the \\"Last Words\\" Soul Voice by 17%.
Incapacitation Surge XIV	Boosts chances of triggering the \\"Last Words\\" Soul Voice by 18%.
Incapacitation Surge XV	Boosts chances of triggering the \\"Last Words\\" Soul Voice by 19%.
Incapacitation Surge XVI	Boosts chances of triggering the \\"Last Words\\" Soul Voice by 20%.
Incapacitation Surge XVII	Boosts chances of triggering the \\"Last Words\\" Soul Voice by 21%.
Incapacitation Surge XVIII	Boosts chances of triggering the \\"Last Words\\" Soul Voice by 22%.
Incapacitation Surge XIX	Boosts chances of triggering the \\"Last Words\\" Soul Voice by 23%.
Incapacitation Surge XX	Boosts chances of triggering the \\"Last Words\\" Soul Voice by 25%.
Critical Surge I	Boosts chances of triggering the \\"Heavy Hitter\\" Soul Voice by 10%.
Critical Surge II	Boosts chances of triggering the \\"Heavy Hitter\\" Soul Voice by 12%.
Critical Surge III	Boosts chances of triggering the \\"Heavy Hitter\\" Soul Voice by 14%.
Critical Surge IV	Boosts chances of triggering the \\"Heavy Hitter\\" Soul Voice by 16%.
Critical Surge V	Boosts chances of triggering the \\"Heavy Hitter\\" Soul Voice by 18%.
Critical Surge VI	Boosts chances of triggering the \\"Heavy Hitter\\" Soul Voice by 20%.
Critical Surge VII	Boosts chances of triggering the \\"Heavy Hitter\\" Soul Voice by 22%.
Critical Surge VIII	Boosts chances of triggering the \\"Heavy Hitter\\" Soul Voice by 24%.
Critical Surge IX	Boosts chances of triggering the \\"Heavy Hitter\\" Soul Voice by 26%.
Critical Surge X	Boosts chances of triggering the \\"Heavy Hitter\\" Soul Voice by 28%.
Critical Surge XI	Boosts chances of triggering the \\"Heavy Hitter\\" Soul Voice by 32%.
Critical Surge XII	Boosts chances of triggering the \\"Heavy Hitter\\" Soul Voice by 34%.
Critical Surge XIII	Boosts chances of triggering the \\"Heavy Hitter\\" Soul Voice by 36%.
Critical Surge XIV	Boosts chances of triggering the \\"Heavy Hitter\\" Soul Voice by 38%.
Critical Surge XV	Boosts chances of triggering the \\"Heavy Hitter\\" Soul Voice by 40%.
Critical Surge XVI	Boosts chances of triggering the \\"Heavy Hitter\\" Soul Voice by 42%.
Critical Surge XVII	Boosts chances of triggering the \\"Heavy Hitter\\" Soul Voice by 44%.
Critical Surge XVIII	Boosts chances of triggering the \\"Heavy Hitter\\" Soul Voice by 46%.
Critical Surge XIX	Boosts chances of triggering the \\"Heavy Hitter\\" Soul Voice by 48%.
Critical Surge XX	Boosts chances of triggering the \\"Heavy Hitter\\" Soul Voice by 50%.
Crush Surge I	Boosts chances of triggering the \\"Dismemberer\\" Soul Voice by 5%.
Crush Surge II	Boosts chances of triggering the \\"Dismemberer\\" Soul Voice by 6%.
Crush Surge III	Boosts chances of triggering the \\"Dismemberer\\" Soul Voice by 7%.
Crush Surge IV	Boosts chances of triggering the \\"Dismemberer\\" Soul Voice by 8%.
Crush Surge V	Boosts chances of triggering the \\"Dismemberer\\" Soul Voice by 9%.
Crush Surge VI	Boosts chances of triggering the \\"Dismemberer\\" Soul Voice by 10%.
Crush Surge VII	Boosts chances of triggering the \\"Dismemberer\\" Soul Voice by 11%.
Crush Surge VIII	Boosts chances of triggering the \\"Dismemberer\\" Soul Voice by 12%.
Crush Surge IX	Boosts chances of triggering the \\"Dismemberer\\" Soul Voice by 13%.
Crush Surge X	Boosts chances of triggering the \\"Dismemberer\\" Soul Voice by 14%.
Crush Surge XI	Boosts chances of triggering the \\"Dismemberer\\" Soul Voice by 15%.
Crush Surge XII	Boosts chances of triggering the \\"Dismemberer\\" Soul Voice by 16%.
Crush Surge XIII	Boosts chances of triggering the \\"Dismemberer\\" Soul Voice by 17%.
Crush Surge XIV	Boosts chances of triggering the \\"Dismemberer\\" Soul Voice by 18%.
Crush Surge XV	Boosts chances of triggering the \\"Dismemberer\\" Soul Voice by 19%.
Crush Surge XVI	Boosts chances of triggering the \\"Dismemberer\\" Soul Voice by 20%.
Crush Surge XVII	Boosts chances of triggering the \\"Dismemberer\\" Soul Voice by 21%.
Crush Surge XVIII	Boosts chances of triggering the \\"Dismemberer\\" Soul Voice by 22%.
Crush Surge XIX	Boosts chances of triggering the \\"Dismemberer\\" Soul Voice by 23%.
Crush Surge XX	Boosts chances of triggering the \\"Dismemberer\\" Soul Voice by 25%.
Underdog Surge I	Boosts chances of triggering the \\"Underdog\\" Soul Voice by 10%.
Underdog Surge II	Boosts chances of triggering the \\"Underdog\\" Soul Voice by 12%.
Underdog Surge III	Boosts chances of triggering the \\"Underdog\\" Soul Voice by 14%.
Underdog Surge IV	Boosts chances of triggering the \\"Underdog\\" Soul Voice by 16%.
Underdog Surge V	Boosts chances of triggering the \\"Underdog\\" Soul Voice by 18%.
Underdog Surge VI	Boosts chances of triggering the \\"Underdog\\" Soul Voice by 20%.
Underdog Surge VII	Boosts chances of triggering the \\"Underdog\\" Soul Voice by 22%.
Underdog Surge VIII	Boosts chances of triggering the \\"Underdog\\" Soul Voice by 24%.
Underdog Surge IX	Boosts chances of triggering the \\"Underdog\\" Soul Voice by 26%.
Underdog Surge X	Boosts chances of triggering the \\"Underdog\\" Soul Voice by 28%.
Underdog Surge XI	Boosts chances of triggering the \\"Underdog\\" Soul Voice by 32%.
Underdog Surge XII	Boosts chances of triggering the \\"Underdog\\" Soul Voice by 34%.
Underdog Surge XIII	Boosts chances of triggering the \\"Underdog\\" Soul Voice by 36%.
Underdog Surge XIV	Boosts chances of triggering the \\"Underdog\\" Soul Voice by 38%.
Underdog Surge XV	Boosts chances of triggering the \\"Underdog\\" Soul Voice by 40%.
Underdog Surge XVI	Boosts chances of triggering the \\"Underdog\\" Soul Voice by 42%.
Underdog Surge XVII	Boosts chances of triggering the \\"Underdog\\" Soul Voice by 44%.
Underdog Surge XVIII	Boosts chances of triggering the \\"Underdog\\" Soul Voice by 46%.
Underdog Surge XIX	Boosts chances of triggering the \\"Underdog\\" Soul Voice by 48%.
Underdog Surge XX	Boosts chances of triggering the \\"Underdog\\" Soul Voice by 50%.
Artful Execution Surge I	Boosts chances of triggering the \\"Artful Execution\\" Soul Voice by 10%.
Artful Execution Surge II	Boosts chances of triggering the \\"Artful Execution\\" Soul Voice by 12%.
Artful Execution Surge III	Boosts chances of triggering the \\"Artful Execution\\" Soul Voice by 14%.
Artful Execution Surge IV	Boosts chances of triggering the \\"Artful Execution\\" Soul Voice by 16%.
Artful Execution Surge V	Boosts chances of triggering the \\"Artful Execution\\" Soul Voice by 18%.
Artful Execution Surge VI	Boosts chances of triggering the \\"Artful Execution\\" Soul Voice by 20%.
Artful Execution Surge VII	Boosts chances of triggering the \\"Artful Execution\\" Soul Voice by 22%.
Artful Execution Surge VIII	Boosts chances of triggering the \\"Artful Execution\\" Soul Voice by 24%.
Artful Execution Surge IX	Boosts chances of triggering the \\"Artful Execution\\" Soul Voice by 26%.
Artful Execution Surge X	Boosts chances of triggering the \\"Artful Execution\\" Soul Voice by 28%.
Artful Execution Surge XI	Boosts chances of triggering the \\"Artful Execution\\" Soul Voice by 32%.
Artful Execution Surge XII	Boosts chances of triggering the \\"Artful Execution\\" Soul Voice by 34%.
Artful Execution Surge XIII	Boosts chances of triggering the \\"Artful Execution\\" Soul Voice by 36%.
Artful Execution Surge XIV	Boosts chances of triggering the \\"Artful Execution\\" Soul Voice by 38%.
Artful Execution Surge XV	Boosts chances of triggering the \\"Artful Execution\\" Soul Voice by 40%.
Artful Execution Surge XVI	Boosts chances of triggering the \\"Artful Execution\\" Soul Voice by 42%.
Artful Execution Surge XVII	Boosts chances of triggering the \\"Artful Execution\\" Soul Voice by 44%.
Artful Execution Surge XVIII	Boosts chances of triggering the \\"Artful Execution\\" Soul Voice by 46%.
Artful Execution Surge XIX	Boosts chances of triggering the \\"Artful Execution\\" Soul Voice by 48%.
Artful Execution Surge XX	Boosts chances of triggering the \\"Artful Execution\\" Soul Voice by 50%.
Aura Surge I	Boosts chances of triggering the \\"Aura Ready\\" Soul Voice by 10%.
Aura Surge II	Boosts chances of triggering the \\"Aura Ready\\" Soul Voice by 12%.
Aura Surge III	Boosts chances of triggering the \\"Aura Ready\\" Soul Voice by 14%.
Aura Surge IV	Boosts chances of triggering the \\"Aura Ready\\" Soul Voice by 16%.
Aura Surge V	Boosts chances of triggering the \\"Aura Ready\\" Soul Voice by 18%.
Aura Surge VI	Boosts chances of triggering the \\"Aura Ready\\" Soul Voice by 20%.
Aura Surge VII	Boosts chances of triggering the \\"Aura Ready\\" Soul Voice by 22%.
Aura Surge VIII	Boosts chances of triggering the \\"Aura Ready\\" Soul Voice by 24%.
Aura Surge IX	Boosts chances of triggering the \\"Aura Ready\\" Soul Voice by 26%.
Aura Surge X	Boosts chances of triggering the \\"Aura Ready\\" Soul Voice by 28%.
Aura Surge XI	Boosts chances of triggering the \\"Aura Ready\\" Soul Voice by 32%.
Aura Surge XII	Boosts chances of triggering the \\"Aura Ready\\" Soul Voice by 34%.
Aura Surge XIII	Boosts chances of triggering the \\"Aura Ready\\" Soul Voice by 36%.
Aura Surge XIV	Boosts chances of triggering the \\"Aura Ready\\" Soul Voice by 38%.
Aura Surge XV	Boosts chances of triggering the \\"Aura Ready\\" Soul Voice by 40%.
Aura Surge XVI	Boosts chances of triggering the \\"Aura Ready\\" Soul Voice by 42%.
Aura Surge XVII	Boosts chances of triggering the \\"Aura Ready\\" Soul Voice by 44%.
Aura Surge XVIII	Boosts chances of triggering the \\"Aura Ready\\" Soul Voice by 46%.
Aura Surge XIX	Boosts chances of triggering the \\"Aura Ready\\" Soul Voice by 48%.
Aura Surge XX	Boosts chances of triggering the \\"Aura Ready\\" Soul Voice by 50%.
Overdrive Surge I	Boosts chances of triggering the \\"Activate Overdrive\\" Soul Voice by 10%.
Overdrive Surge II	Boosts chances of triggering the \\"Activate Overdrive\\" Soul Voice by 12%.
Overdrive Surge III	Boosts chances of triggering the \\"Activate Overdrive\\" Soul Voice by 14%.
Overdrive Surge IV	Boosts chances of triggering the \\"Activate Overdrive\\" Soul Voice by 16%.
Overdrive Surge V	Boosts chances of triggering the \\"Activate Overdrive\\" Soul Voice by 18%.
Overdrive Surge VI	Boosts chances of triggering the \\"Activate Overdrive\\" Soul Voice by 20%.
Overdrive Surge VII	Boosts chances of triggering the \\"Activate Overdrive\\" Soul Voice by 22%.
Overdrive Surge VIII	Boosts chances of triggering the \\"Activate Overdrive\\" Soul Voice by 24%.
Overdrive Surge IX	Boosts chances of triggering the \\"Activate Overdrive\\" Soul Voice by 26%.
Overdrive Surge X	Boosts chances of triggering the \\"Activate Overdrive\\" Soul Voice by 28%.
Overdrive Surge XI	Boosts chances of triggering the \\"Activate Overdrive\\" Soul Voice by 32%.
Overdrive Surge XII	Boosts chances of triggering the \\"Activate Overdrive\\" Soul Voice by 34%.
Overdrive Surge XIII	Boosts chances of triggering the \\"Activate Overdrive\\" Soul Voice by 36%.
Overdrive Surge XIV	Boosts chances of triggering the \\"Activate Overdrive\\" Soul Voice by 38%.
Overdrive Surge XV	Boosts chances of triggering the \\"Activate Overdrive\\" Soul Voice by 40%.
Overdrive Surge XVI	Boosts chances of triggering the \\"Activate Overdrive\\" Soul Voice by 42%.
Overdrive Surge XVII	Boosts chances of triggering the \\"Activate Overdrive\\" Soul Voice by 44%.
Overdrive Surge XVIII	Boosts chances of triggering the \\"Activate Overdrive\\" Soul Voice by 46%.
Overdrive Surge XIX	Boosts chances of triggering the \\"Activate Overdrive\\" Soul Voice by 48%.
Overdrive Surge XX	Boosts chances of triggering the \\"Activate Overdrive\\" Soul Voice by 50%.
Reinvigorate I	Boosts HP recovery by 10% when revived.
Reinvigorate II	Boosts HP recovery by 12% when revived.
Reinvigorate III	Boosts HP recovery by 14% when revived.
Reinvigorate IV	Boosts HP recovery by 16% when revived.
Reinvigorate V	Boosts HP recovery by 18% when revived.
Reinvigorate VI	Boosts HP recovery by 20% when revived.
Reinvigorate IX	Boosts HP recovery by 26% when revived.
Reinvigorate X	Boosts HP recovery by 28% when revived.
Reinvigorate XI	Boosts HP recovery by 32% when revived.
Reinvigorate XII	Boosts HP recovery by 34% when revived.
Reinvigorate XIII	Boosts HP recovery by 36% when revived.
Reinvigorate XIV	Boosts HP recovery by 38% when revived.
Reinvigorate XV	Boosts HP recovery by 40% when revived.
Reinvigorate XVI	Boosts HP recovery by 42% when revived.
Reinvigorate XVII	Boosts HP recovery by 44% when revived.
Reinvigorate XVIII	Boosts HP recovery by 46% when revived.
Reinvigorate XIX	Boosts HP recovery by 48% when revived.
Reinvigorate XX	Boosts HP recovery by 50% when revived.
EXP Boost I	Boosts experience received by 10%.
EXP Boost II	Boosts experience received by 12%.
EXP Boost III	Boosts experience received by 14%.
EXP Boost IV	Boosts experience received by 16%.
EXP Boost V	Boosts experience received by 18%.
EXP Boost VI	Boosts experience received by 20%.
EXP Boost VII	Boosts experience received by 22%.
EXP Boost VIII	Boosts experience received by 24%.
EXP Boost IX	Boosts experience received by 26%.
EXP Boost X	Boosts experience received by 28%.
EXP Boost XI	Boosts experience received by 32%.
EXP Boost XII	Boosts experience received by 34%.
EXP Boost XIII	Boosts experience received by 36%.
EXP Boost XIV	Boosts experience received by 38%.
EXP Boost XV	Boosts experience received by 40%.
EXP Boost XVI	Boosts experience received by 42%.
EXP Boost XVII	Boosts experience received by 44%.
EXP Boost XVIII	Boosts experience received by 46%.
EXP Boost XIX	Boosts experience received by 48%.
EXP Boost XX	Boosts experience received by 50%.
Visual Cloaking I	Reduces detection by shrinking enemy field of view by 2%.
Visual Cloaking II	Reduces detection by shrinking enemy field of view by 4%.
Visual Cloaking III	Reduces detection by shrinking enemy field of view by 6%.
Visual Cloaking IV	Reduces detection by shrinking enemy field of view by 8%.
Visual Cloaking V	Reduces detection by shrinking enemy field of view by 10%.
Visual Cloaking VI	Reduces detection by shrinking enemy field of view by 12%.
Visual Cloaking VII	Reduces detection by shrinking enemy field of view by 14%.
Visual Cloaking VIII	Reduces detection by shrinking enemy field of view by 16%.
Visual Cloaking IX	Reduces detection by shrinking enemy field of view by 18%.
Visual Cloaking X	Reduces detection by shrinking enemy field of view by 20%.
Visual Cloaking XI	Reduces detection by shrinking enemy field of view by 22%.
Visual Cloaking XII	Reduces detection by shrinking enemy field of view by 24%.
Visual Cloaking XIII	Reduces detection by shrinking enemy field of view by 26%.
Visual Cloaking XIV	Reduces detection by shrinking enemy field of view by 28%.
Visual Cloaking XV	Reduces detection by shrinking enemy field of view by 30%.
Visual Cloaking XVI	Reduces detection by shrinking enemy field of view by 32%.
Visual Cloaking XVII	Reduces detection by shrinking enemy field of view by 34%.
Visual Cloaking XVIII	Reduces detection by shrinking enemy field of view by 36%.
Visual Cloaking XIX	Reduces detection by shrinking enemy field of view by 38%.
Visual Cloaking XX	Reduces detection by shrinking enemy field of view by 40%.
Aural Cloaking I	Reduces detection by shrinking enemy auditory range by 2%.
Aural Cloaking II	Reduces detection by shrinking enemy auditory range by 4%.
Aural Cloaking III	Reduces detection by shrinking enemy auditory range by 6%.
Aural Cloaking IV	Reduces detection by shrinking enemy auditory range by 8%.
Aural Cloaking V	Reduces detection by shrinking enemy auditory range by 10%.
Aural Cloaking VI	Reduces detection by shrinking enemy auditory range by 12%.
Aural Cloaking VII	Reduces detection by shrinking enemy auditory range by 14%.
Aural Cloaking VIII	Reduces detection by shrinking enemy auditory range by 16%.
Aural Cloaking IX	Reduces detection by shrinking enemy auditory range by 18%.
Aural Cloaking X	Reduces detection by shrinking enemy auditory range by 20%.
Aural Cloaking XI	Reduces detection by shrinking enemy auditory range by 22%.
Aural Cloaking XII	Reduces detection by shrinking enemy auditory range by 24%.
Aural Cloaking XIII	Reduces detection by shrinking enemy auditory range by 26%.
Aural Cloaking XIV	Reduces detection by shrinking enemy auditory range by 28%.
Aural Cloaking XV	Reduces detection by shrinking enemy auditory range by 30%.
Aural Cloaking XVI	Reduces detection by shrinking enemy auditory range by 32%.
Aural Cloaking XVII	Reduces detection by shrinking enemy auditory range by 34%.
Aural Cloaking XVIII	Reduces detection by shrinking enemy auditory range by 36%.
Aural Cloaking XIX	Reduces detection by shrinking enemy auditory range by 38%.
Aural Cloaking XX	Reduces detection by shrinking enemy auditory range by 40%.
Appendage Crusher	Softens enemy appendages by one tier.
Crush: Gain TP I	Boosts TP by 300 when destroying an enemy appendage.
Crush: Gain TP II	Boosts TP by 350 when destroying an enemy appendage.
Crush: Gain TP III	Boosts TP by 400 when destroying an enemy appendage.
Crush: Gain TP IV	Boosts TP by 450 when destroying an enemy appendage.
Crush: Gain TP V	Boosts TP by 500 when destroying an enemy appendage.
Crush: Gain TP VI	Boosts TP by 550 when destroying an enemy appendage.
Crush: Gain TP VII	Boosts TP by 600 when destroying an enemy appendage.
Crush: Gain TP VIII	Boosts TP by 650 when destroying an enemy appendage.
Crush: Gain TP IX	Boosts TP by 700 when destroying an enemy appendage.
Crush: Gain TP X	Boosts TP by 750 when destroying an enemy appendage.
Crush: Gain TP XI	Boosts TP by 800 when destroying an enemy appendage.
Crush: Gain TP XII	Boosts TP by 850 when destroying an enemy appendage.
Crush: Gain TP XIII	Boosts TP by 900 when destroying an enemy appendage.
Crush: Gain TP XIV	Boosts TP by 950 when destroying an enemy appendage.
Crush: Gain TP XV	Boosts TP by 1000 when destroying an enemy appendage.
Crush: Gain TP XVI	Boosts TP by 1050 when destroying an enemy appendage.
Crush: Gain TP XVII	Boosts TP by 1100 when destroying an enemy appendage.
Crush: Gain TP XVIII	Boosts TP by 1150 when destroying an enemy appendage.
Crush: Gain TP XIX	Boosts TP by 1200 when destroying an enemy appendage.
Crush: Gain TP XX	Boosts TP by 1500 when destroying an enemy appendage.
Ranged Appendage Damage I	Boosts ranged appendage damage by 20%.
Ranged Appendage Damage II	Boosts ranged appendage damage by 24%.
Ranged Appendage Damage III	Boosts ranged appendage damage by 28%.
Ranged Appendage Damage IV	Boosts ranged appendage damage by 32%.
Ranged Appendage Damage V	Boosts ranged appendage damage by 36%.
Ranged Appendage Damage VI	Boosts ranged appendage damage by 40%.
Ranged Appendage Damage VII	Boosts ranged appendage damage by 44%.
Ranged Appendage Damage VIII	Boosts ranged appendage damage by 48%.
Ranged Appendage Damage IX	Boosts ranged appendage damage by 52%.
Ranged Appendage Damage X	Boosts ranged appendage damage by 56%.
Ranged Appendage Damage XI	Boosts ranged appendage damage by 64%.
Ranged Appendage Damage XII	Boosts ranged appendage damage by 68%.
Ranged Appendage Damage XIII	Boosts ranged appendage damage by 72%.
Ranged Appendage Damage XIV	Boosts ranged appendage damage by 76%.
Ranged Appendage Damage XV	Boosts ranged appendage damage by 80%.
Ranged Appendage Damage XVI	Boosts ranged appendage damage by 84%.
Ranged Appendage Damage XVII	Boosts ranged appendage damage by 88%.
Ranged Appendage Damage XVIII	Boosts ranged appendage damage by 92%.
Ranged Appendage Damage XIX	Boosts ranged appendage damage by 96%.
Ranged Appendage Damage XX	Boosts ranged appendage damage by 100%.
Terrain Damage Reducer I	Reduces terrain damage by 5%.
Terrain Damage Reducer II	Reduces terrain damage by 10%.
Terrain Damage Reducer III	Reduces terrain damage by 15%.
Terrain Damage Reducer IV	Reduces terrain damage by 20%.
Terrain Damage Reducer V	Reduces terrain damage by 25%.
Terrain Damage Reducer VI	Reduces terrain damage by 30%.
Terrain Damage Reducer VII	Reduces terrain damage by 35%.
Terrain Damage Reducer VIII	Reduces terrain damage by 40%.
Terrain Damage Reducer IX	Reduces terrain damage by 45%.
Terrain Damage Reducer X	Reduces terrain damage by 50%.
Terrain Damage Reducer XI	Reduces terrain damage by 55%.
Terrain Damage Reducer XII	Reduces terrain damage by 60%.
Terrain Damage Reducer XIII	Reduces terrain damage by 65%.
Terrain Damage Reducer XIV	Reduces terrain damage by 70%.
Terrain Damage Reducer XV	Reduces terrain damage by 75%.
Terrain Damage Reducer XVI	Reduces terrain damage by 80%.
Terrain Damage Reducer XVII	Reduces terrain damage by 85%.
Terrain Damage Reducer XVIII	Reduces terrain damage by 90%.
Terrain Damage Reducer XIX	Reduces terrain damage by 95%.
Terrain Damage Reducer XX	Reduces terrain damage by 100%.
Antispike I	Grants a 10% chance of evading spike damage.
Antispike II	Grants a 12% chance of evading spike damage.
Antispike III	Grants a 14% chance of evading spike damage.
Antispike IV	Grants a 16% chance of evading spike damage.
Antispike V	Grants a 18% chance of evading spike damage.
Antispike VI	Grants a 20% chance of evading spike damage.
Antispike VII	Grants a 22% chance of evading spike damage.
Antispike VIII	Grants a 24% chance of evading spike damage.
Antispike IX	Grants a 26% chance of evading spike damage.
Antispike X	Grants a 28% chance of evading spike damage.
Antispike XI	Grants a 30% chance of evading spike damage.
Antispike XII	Grants a 32% chance of evading spike damage.
Antispike XIII	Grants a 34% chance of evading spike damage.
Antispike XIV	Grants a 36% chance of evading spike damage.
Antispike XV	Grants a 38% chance of evading spike damage.
Antispike XVI	Grants a 40% chance of evading spike damage.
Antispike XVII	Grants a 42% chance of evading spike damage.
Antispike XVIII	Grants a 44% chance of evading spike damage.
Antispike XIX	Grants a 46% chance of evading spike damage.
Antispike XX	Grants a 50% chance of evading spike damage.
Resistance Reducer I	Reduces enemy debuff resistance by 10% when landing an attack.
Resistance Reducer II	Reduces enemy debuff resistance by 12% when landing an attack.
Resistance Reducer III	Reduces enemy debuff resistance by 14% when landing an attack.
Resistance Reducer IV	Reduces enemy debuff resistance by 16% when landing an attack.
Resistance Reducer V	Reduces enemy debuff resistance by 18% when landing an attack.
Resistance Reducer VI	Reduces enemy debuff resistance by 20% when landing an attack.
Resistance Reducer VII	Reduces enemy debuff resistance by 22% when landing an attack.
Resistance Reducer VIII	Reduces enemy debuff resistance by 24% when landing an attack.
Resistance Reducer IX	Reduces enemy debuff resistance by 26% when landing an attack.
Resistance Reducer X	Reduces enemy debuff resistance by 28% when landing an attack.
Resistance Reducer XI	Reduces enemy debuff resistance by 32% when landing an attack.
Resistance Reducer XII	Reduces enemy debuff resistance by 34% when landing an attack.
Resistance Reducer XIII	Reduces enemy debuff resistance by 36% when landing an attack.
Resistance Reducer XIV	Reduces enemy debuff resistance by 38% when landing an attack.
Resistance Reducer XV	Reduces enemy debuff resistance by 40% when landing an attack.
Resistance Reducer XVI	Reduces enemy debuff resistance by 42% when landing an attack.
Resistance Reducer XVII	Reduces enemy debuff resistance by 44% when landing an attack.
Resistance Reducer XVIII	Reduces enemy debuff resistance by 46% when landing an attack.
Resistance Reducer XIX	Reduces enemy debuff resistance by 48% when landing an attack.
Resistance Reducer XX	Reduces enemy debuff resistance by 50% when landing an attack.
Treasure Sensor I	Boosts item drop rate by 1%.
Treasure Sensor II	Boosts item drop rate by 2%.
Treasure Sensor III	Boosts item drop rate by 3%.
Treasure Sensor IV	Boosts item drop rate by 4%.
Treasure Sensor V	Boosts item drop rate by 5%.
Treasure Sensor VI	Boosts item drop rate by 6%.
Treasure Sensor VII	Boosts item drop rate by 7%.
Treasure Sensor VIII	Boosts item drop rate by 8%.
Treasure Sensor IX	Boosts item drop rate by 9%.
Treasure Sensor X	Boosts item drop rate by 10%.
Treasure Sensor XI	Boosts item drop rate by 11%.
Treasure Sensor XII	Boosts item drop rate by 12%.
Treasure Sensor XIII	Boosts item drop rate by 13%.
Treasure Sensor XIV	Boosts item drop rate by 14%.
Treasure Sensor XV	Boosts item drop rate by 15%.
Treasure Sensor XVI	Boosts item drop rate by 16%.
Treasure Sensor XVII	Boosts item drop rate by 17%.
Treasure Sensor XVIII	Boosts item drop rate by 18%.
Treasure Sensor XIX	Boosts item drop rate by 19%.
Treasure Sensor XX	Boosts item drop rate by 20%.
Untouchable Dash I	Boosts evasion by 5% when sprinting.
Untouchable Dash II	Boosts evasion by 6% when sprinting.
Untouchable Dash III	Boosts evasion by 7% when sprinting.
Untouchable Dash IV	Boosts evasion by 8% when sprinting.
Untouchable Dash V	Boosts evasion by 9% when sprinting.
Untouchable Dash VI	Boosts evasion by 10% when sprinting.
Untouchable Dash VII	Boosts evasion by 11% when sprinting.
Untouchable Dash VIII	Boosts evasion by 12% when sprinting.
Untouchable Dash IX	Boosts evasion by 13% when sprinting.
Untouchable Dash X	Boosts evasion by 14% when sprinting.
Untouchable Dash XI	Boosts evasion by 16% when sprinting.
Untouchable Dash XII	Boosts evasion by 17% when sprinting.
Untouchable Dash XIII	Boosts evasion by 18% when sprinting.
Untouchable Dash XIV	Boosts evasion by 19% when sprinting.
Untouchable Dash XV	Boosts evasion by 20% when sprinting.
Untouchable Dash XVI	Boosts evasion by 21% when sprinting.
Untouchable Dash XVII	Boosts evasion by 22% when sprinting.
Untouchable Dash XVIII	Boosts evasion by 23% when sprinting.
Untouchable Dash XIX	Boosts evasion by 24% when sprinting.
Untouchable Dash XX	Boosts evasion by 25% when sprinting.
Night Vision I	Boosts melee and ranged accuracy by 10% during the nighttime.
Night Vision II	Boosts melee and ranged accuracy by 12% during the nighttime.
Night Vision III	Boosts melee and ranged accuracy by 14% during the nighttime.
Night Vision IV	Boosts melee and ranged accuracy by 16% during the nighttime.
Night Vision V	Boosts melee and ranged accuracy by 18% during the nighttime.
Night Vision VI	Boosts melee and ranged accuracy by 20% during the nighttime.
Night Vision VII	Boosts melee and ranged accuracy by 22% during the nighttime.
Night Vision VIII	Boosts melee and ranged accuracy by 24% during the nighttime.
Night Vision IX	Boosts melee and ranged accuracy by 26% during the nighttime.
Night Vision X	Boosts melee and ranged accuracy by 28% during the nighttime.
Night Vision XI	Boosts melee and ranged accuracy by 32% during the nighttime.
Night Vision XII	Boosts melee and ranged accuracy by 34% during the nighttime.
Night Vision XIII	Boosts melee and ranged accuracy by 36% during the nighttime.
Night Vision XIV	Boosts melee and ranged accuracy by 38% during the nighttime.
Night Vision XV	Boosts melee and ranged accuracy by 40% during the nighttime.
Night Vision XVI	Boosts melee and ranged accuracy by 42% during the nighttime.
Night Vision XVII	Boosts melee and ranged accuracy by 44% during the nighttime.
Night Vision XVIII	Boosts melee and ranged accuracy by 46% during the nighttime.
Night Vision XIX	Boosts melee and ranged accuracy by 48% during the nighttime.
Night Vision XX	Boosts melee and ranged accuracy by 50% during the nighttime.
Focused Evasion I	Boosts evasion by 5% when within enemy melee range.
Focused Evasion II	Boosts evasion by 6% when within enemy melee range.
Focused Evasion III	Boosts evasion by 7% when within enemy melee range.
Focused Evasion IV	Boosts evasion by 8% when within enemy melee range.
Focused Evasion V	Boosts evasion by 9% when within enemy melee range.
Focused Evasion VI	Boosts evasion by 10% when within enemy melee range.
Focused Evasion VII	Boosts evasion by 11% when within enemy melee range.
Focused Evasion VIII	Boosts evasion by 12% when within enemy melee range.
Focused Evasion IX	Boosts evasion by 13% when within enemy melee range.
Focused Evasion X	Boosts evasion by 14% when within enemy melee range.
Focused Evasion XI	Boosts evasion by 15% when within enemy melee range.
Focused Evasion XII	Boosts evasion by 16% when within enemy melee range.
Focused Evasion XIII	Boosts evasion by 17% when within enemy melee range.
Focused Evasion XIV	Boosts evasion by 18% when within enemy melee range.
Focused Evasion XV	Boosts evasion by 19% when within enemy melee range.
Focused Evasion XVI	Boosts evasion by 20% when within enemy melee range.
Focused Evasion XVII	Boosts evasion by 21% when within enemy melee range.
Focused Evasion XVIII	Boosts evasion by 22% when within enemy melee range.
Focused Evasion XIX	Boosts evasion by 23% when within enemy melee range.
Focused Evasion XX	Boosts evasion by 25% when within enemy melee range.
Fog Screen	Grants immunity to the effects of fog.
Rain Screen	Grants immunity to the effects of rain.
Heavy Rain Screen	Grants immunity to the effects of heavy rain.
Heat Wave Screen	Grants immunity to the effects of heat waves.
Sandstorm Screen	Grants immunity to the effects of sandstorms.
Thunderstorm Screen	Grants immunity to the effects of thunderstorms.
EM Storm Screen	Grants immunity to the effects of electromagnetic storms.
Energy Mist Screen	Grants immunity to the effects of energy mist.
Rising Energy Mist Screen	Grants immunity to the effects of rising energy mist.
Brimstone Rain Screen	Grants immunity to the effects of brimstone rain.
Aurora Screen	Grants immunity to the effects of auroras.
Crimson Aurora Screen	Grants immunity to the effects of crimson auroras.
Spore Screen	Grants immunity to the effects of spore clouds.
Meteor Shower Screen	Grants immunity to the effects of meteor showers.
Weather Master I	Reduces weather damage by 5%.
Weather Master II	Reduces weather damage by 10%.
Weather Master III	Reduces weather damage by 15%.
Weather Master IV	Reduces weather damage by 20%.
Weather Master V	Reduces weather damage by 25%.
Weather Master VI	Reduces weather damage by 30%.
Weather Master VII	Reduces weather damage by 35%.
Weather Master VIII	Reduces weather damage by 40%.
Weather Master IX	Reduces weather damage by 45%.
Weather Master X	Reduces weather damage by 50%.
Weather Master XI	Reduces weather damage by 55%.
Weather Master XII	Reduces weather damage by 60%.
Weather Master XIII	Reduces weather damage by 65%.
Weather Master XIV	Reduces weather damage by 70%.
Weather Master XV	Reduces weather damage by 75%.
Weather Master XVI	Reduces weather damage by 80%.
Weather Master XVII	Reduces weather damage by 85%.
Weather Master XVIII	Reduces weather damage by 90%.
Weather Master XIX	Reduces weather damage by 95%.
Weather Master XX	Reduces weather damage by 100%.
SpecUp.HP-MAX I	Boosts maximum Skell HP by 50.
SpecUp.HP-MAX II	Boosts maximum Skell HP by 100.
SpecUp.HP-MAX III	Boosts maximum Skell HP by 150.
SpecUp.HP-MAX IV	Boosts maximum Skell HP by 200.
SpecUp.HP-MAX V	Boosts maximum Skell HP by 250.
SpecUp.HP-MAX VI	Boosts maximum Skell HP by 300.
SpecUp.HP-MAX VII	Boosts maximum Skell HP by 350.
SpecUp.HP-MAX VIII	Boosts maximum Skell HP by 400.
SpecUp.HP-MAX IX	Boosts maximum Skell HP by 450.
SpecUp.HP-MAX X	Boosts maximum Skell HP by 500.
SpecUp.HP-MAX XI	Boosts maximum Skell HP by 550.
SpecUp.HP-MAX XII	Boosts maximum Skell HP by 600.
SpecUp.HP-MAX XIII	Boosts maximum Skell HP by 650.
SpecUp.HP-MAX XIV	Boosts maximum Skell HP by 700.
SpecUp.HP-MAX XV	Boosts maximum Skell HP by 750.
SpecUp.HP-MAX XVI	Boosts maximum Skell HP by 800.
SpecUp.HP-MAX XVII	Boosts maximum Skell HP by 850.
SpecUp.HP-MAX XVIII	Boosts maximum Skell HP by 900.
SpecUp.HP-MAX XIX	Boosts maximum Skell HP by 950.
SpecUp.HP-MAX XX	Boosts maximum Skell HP by 1000.
SpecUp.GP-MAX I	Boosts maximum Skell GP by 5.
SpecUp.GP-MAX II	Boosts maximum Skell GP by 10.
SpecUp.GP-MAX III	Boosts maximum Skell GP by 15.
SpecUp.GP-MAX IV	Boosts maximum Skell GP by 20.
SpecUp.GP-MAX V	Boosts maximum Skell GP by 25.
SpecUp.GP-MAX VI	Boosts maximum Skell GP by 30.
SpecUp.GP-MAX VII	Boosts maximum Skell GP by 35.
SpecUp.GP-MAX VIII	Boosts maximum Skell GP by 40.
SpecUp.GP-MAX IX	Boosts maximum Skell GP by 45.
SpecUp.GP-MAX X	Boosts maximum Skell GP by 50.
SpecUp.GP-MAX XI	Boosts maximum Skell GP by 55.
SpecUp.GP-MAX XII	Boosts maximum Skell GP by 60.
SpecUp.GP-MAX XIII	Boosts maximum Skell GP by 65.
SpecUp.GP-MAX XIV	Boosts maximum Skell GP by 70.
SpecUp.GP-MAX XV	Boosts maximum Skell GP by 75.
SpecUp.GP-MAX XVI	Boosts maximum Skell GP by 80.
SpecUp.GP-MAX XVII	Boosts maximum Skell GP by 85.
SpecUp.GP-MAX XVIII	Boosts maximum Skell GP by 90.
SpecUp.GP-MAX XIX	Boosts maximum Skell GP by 95.
SpecUp.GP-MAX XX	Boosts maximum Skell GP by 100.
SpecUp.M-ACC I	Boosts Skell melee accuracy by 5.
SpecUp.M-ACC II	Boosts Skell melee accuracy by 10.
SpecUp.M-ACC III	Boosts Skell melee accuracy by 15.
SpecUp.M-ACC IV	Boosts Skell melee accuracy by 20.
SpecUp.M-ACC V	Boosts Skell melee accuracy by 25.
SpecUp.M-ACC VI	Boosts Skell melee accuracy by 30.
SpecUp.M-ACC VII	Boosts Skell melee accuracy by 35.
SpecUp.M-ACC VIII	Boosts Skell melee accuracy by 40.
SpecUp.M-ACC IX	Boosts Skell melee accuracy by 45.
SpecUp.M-ACC X	Boosts Skell melee accuracy by 50.
SpecUp.M-ACC XI	Boosts Skell melee accuracy by 55.
SpecUp.M-ACC XII	Boosts Skell melee accuracy by 60.
SpecUp.M-ACC XIII	Boosts Skell melee accuracy by 65.
SpecUp.M-ACC XIV	Boosts Skell melee accuracy by 70.
SpecUp.M-ACC XV	Boosts Skell melee accuracy by 75.
SpecUp.M-ACC XVI	Boosts Skell melee accuracy by 80.
SpecUp.M-ACC XVII	Boosts Skell melee accuracy by 85.
SpecUp.M-ACC XVIII	Boosts Skell melee accuracy by 90.
SpecUp.M-ACC XIX	Boosts Skell melee accuracy by 95.
SpecUp.M-ACC XX	Boosts Skell melee accuracy by 100.
SpecUp.R-ACC I	Boosts Skell ranged accuracy by 5.
SpecUp.R-ACC II	Boosts Skell ranged accuracy by 10.
SpecUp.R-ACC III	Boosts Skell ranged accuracy by 15.
SpecUp.R-ACC IV	Boosts Skell ranged accuracy by 20.
SpecUp.R-ACC V	Boosts Skell ranged accuracy by 25.
SpecUp.R-ACC VI	Boosts Skell ranged accuracy by 30.
SpecUp.R-ACC VII	Boosts Skell ranged accuracy by 35.
SpecUp.R-ACC VIII	Boosts Skell ranged accuracy by 40.
SpecUp.R-ACC IX	Boosts Skell ranged accuracy by 45.
SpecUp.R-ACC X	Boosts Skell ranged accuracy by 50.
SpecUp.R-ACC XI	Boosts Skell ranged accuracy by 55.
SpecUp.R-ACC XII	Boosts Skell ranged accuracy by 60.
SpecUp.R-ACC XIII	Boosts Skell ranged accuracy by 65.
SpecUp.R-ACC XIV	Boosts Skell ranged accuracy by 70.
SpecUp.R-ACC XV	Boosts Skell ranged accuracy by 75.
SpecUp.R-ACC XVI	Boosts Skell ranged accuracy by 80.
SpecUp.R-ACC XVII	Boosts Skell ranged accuracy by 85.
SpecUp.R-ACC XVIII	Boosts Skell ranged accuracy by 90.
SpecUp.R-ACC XIX	Boosts Skell ranged accuracy by 95.
SpecUp.R-ACC XX	Boosts Skell ranged accuracy by 100.
SpecUp.EVA I	Boosts Skell evasion by 5.
SpecUp.EVA II	Boosts Skell evasion by 6.
SpecUp.EVA III	Boosts Skell evasion by 7.
SpecUp.EVA IV	Boosts Skell evasion by 8.
SpecUp.EVA V	Boosts Skell evasion by 9.
SpecUp.EVA VI	Boosts Skell evasion by 10.
SpecUp.EVA VII	Boosts Skell evasion by 11.
SpecUp.EVA VIII	Boosts Skell evasion by 12.
SpecUp.EVA IX	Boosts Skell evasion by 13.
SpecUp.EVA X	Boosts Skell evasion by 14.
SpecUp.EVA XI	Boosts Skell evasion by 16.
SpecUp.EVA XII	Boosts Skell evasion by 17.
SpecUp.EVA XIII	Boosts Skell evasion by 18.
SpecUp.EVA XIV	Boosts Skell evasion by 19.
SpecUp.EVA XV	Boosts Skell evasion by 20.
SpecUp.EVA XVI	Boosts Skell evasion by 21.
SpecUp.EVA XVII	Boosts Skell evasion by 22.
SpecUp.EVA XVIII	Boosts Skell evasion by 23.
SpecUp.EVA XIX	Boosts Skell evasion by 24.
SpecUp.EVA XX	Boosts Skell evasion by 25.
SpecUp.M-ATK I	Boosts Skell melee attack by 5.
SpecUp.M-ATK II	Boosts Skell melee attack by 10.
SpecUp.M-ATK III	Boosts Skell melee attack by 15.
SpecUp.M-ATK IV	Boosts Skell melee attack by 20.
SpecUp.M-ATK V	Boosts Skell melee attack by 25.
SpecUp.M-ATK VI	Boosts Skell melee attack by 30.
SpecUp.M-ATK VII	Boosts Skell melee attack by 35.
SpecUp.M-ATK VIII	Boosts Skell melee attack by 40.
SpecUp.M-ATK IX	Boosts Skell melee attack by 45.
SpecUp.M-ATK X	Boosts Skell melee attack by 50.
SpecUp.M-ATK XI	Boosts Skell melee attack by 55.
SpecUp.M-ATK XII	Boosts Skell melee attack by 60.
SpecUp.M-ATK XIII	Boosts Skell melee attack by 65.
SpecUp.M-ATK XIV	Boosts Skell melee attack by 70.
SpecUp.M-ATK XV	Boosts Skell melee attack by 75.
SpecUp.M-ATK XVI	Boosts Skell melee attack by 80.
SpecUp.M-ATK XVII	Boosts Skell melee attack by 85.
SpecUp.M-ATK XVIII	Boosts Skell melee attack by 90.
SpecUp.M-ATK XIX	Boosts Skell melee attack by 95.
SpecUp.M-ATK XX	Boosts Skell melee attack by 100.
SpecUp.R-ATK I	Boosts Skell ranged attack by 5.
SpecUp.R-ATK II	Boosts Skell ranged attack by 10.
SpecUp.R-ATK III	Boosts Skell ranged attack by 15.
SpecUp.R-ATK IV	Boosts Skell ranged attack by 20.
SpecUp.R-ATK V	Boosts Skell ranged attack by 25.
SpecUp.R-ATK VI	Boosts Skell ranged attack by 30.
SpecUp.R-ATK VII	Boosts Skell ranged attack by 35.
SpecUp.R-ATK VIII	Boosts Skell ranged attack by 40.
SpecUp.R-ATK IX	Boosts Skell ranged attack by 45.
SpecUp.R-ATK X	Boosts Skell ranged attack by 50.
SpecUp.R-ATK XI	Boosts Skell ranged attack by 55.
SpecUp.R-ATK XII	Boosts Skell ranged attack by 60.
SpecUp.R-ATK XIII	Boosts Skell ranged attack by 65.
SpecUp.R-ATK XIV	Boosts Skell ranged attack by 70.
SpecUp.R-ATK XV	Boosts Skell ranged attack by 75.
SpecUp.R-ATK XVI	Boosts Skell ranged attack by 80.
SpecUp.R-ATK XVII	Boosts Skell ranged attack by 85.
SpecUp.R-ATK XVIII	Boosts Skell ranged attack by 90.
SpecUp.R-ATK XIX	Boosts Skell ranged attack by 95.
SpecUp.R-ATK XX	Boosts Skell ranged attack by 100.
SpecUp.PTL I	Boosts Skell potential by 5.
SpecUp.PTL II	Boosts Skell potential by 10.
SpecUp.PTL III	Boosts Skell potential by 15.
SpecUp.PTL IV	Boosts Skell potential by 20.
SpecUp.PTL V	Boosts Skell potential by 25.
SpecUp.PTL VI	Boosts Skell potential by 30.
SpecUp.PTL VII	Boosts Skell potential by 35.
SpecUp.PTL VIII	Boosts Skell potential by 40.
SpecUp.PTL IX	Boosts Skell potential by 45.
SpecUp.PTL X	Boosts Skell potential by 50.
SpecUp.PTL XI	Boosts Skell potential by 55.
SpecUp.PTL XII	Boosts Skell potential by 60.
SpecUp.PTL XIII	Boosts Skell potential by 65.
SpecUp.PTL XIV	Boosts Skell potential by 70.
SpecUp.PTL XV	Boosts Skell potential by 75.
SpecUp.PTL XVI	Boosts Skell potential by 80.
SpecUp.PTL XVII	Boosts Skell potential by 85.
SpecUp.PTL XVIII	Boosts Skell potential by 90.
SpecUp.PTL XIX	Boosts Skell potential by 95.
SpecUp.PTL XX	Boosts Skell potential by 100.
SpecUp.APP-HP I	Boosts maximum HP for the appendage this is equipped to by 50.
SpecUp.APP-HP II	Boosts maximum HP for the appendage this is equipped to by 100.
SpecUp.APP-HP III	Boosts maximum HP for the appendage this is equipped to by 150.
SpecUp.APP-HP IV	Boosts maximum HP for the appendage this is equipped to by 200.
SpecUp.APP-HP V	Boosts maximum HP for the appendage this is equipped to by 250.
SpecUp.APP-HP VI	Boosts maximum HP for the appendage this is equipped to by 300.
SpecUp.APP-HP VII	Boosts maximum HP for the appendage this is equipped to by 350.
SpecUp.APP-HP VIII	Boosts maximum HP for the appendage this is equipped to by 400.
SpecUp.APP-HP IX	Boosts maximum HP for the appendage this is equipped to by 450.
SpecUp.APP-HP X	Boosts maximum HP for the appendage this is equipped to by 500.
SpecUp.APP-HP XI	Boosts maximum HP for the appendage this is equipped to by 550.
SpecUp.APP-HP XII	Boosts maximum HP for the appendage this is equipped to by 600.
SpecUp.APP-HP XIII	Boosts maximum HP for the appendage this is equipped to by 650.
SpecUp.APP-HP XIV	Boosts maximum HP for the appendage this is equipped to by 700.
SpecUp.APP-HP XV	Boosts maximum HP for the appendage this is equipped to by 750.
SpecUp.APP-HP XVI	Boosts maximum HP for the appendage this is equipped to by 800.
SpecUp.APP-HP XVII	Boosts maximum HP for the appendage this is equipped to by 850.
SpecUp.APP-HP XVIII	Boosts maximum HP for the appendage this is equipped to by 900.
SpecUp.APP-HP XIX	Boosts maximum HP for the appendage this is equipped to by 950.
SpecUp.APP-HP XX	Boosts maximum HP for the appendage this is equipped to by 1000.
Boost.HP-MAX I	Boosts maximum Skell HP by 5%.
Boost.HP-MAX II	Boosts maximum Skell HP by 6%.
Boost.HP-MAX III	Boosts maximum Skell HP by 7%.
Boost.HP-MAX IV	Boosts maximum Skell HP by 8%.
Boost.HP-MAX V	Boosts maximum Skell HP by 9%.
Boost.HP-MAX VI	Boosts maximum Skell HP by 10%.
Boost.HP-MAX VII	Boosts maximum Skell HP by 11%.
Boost.HP-MAX VIII	Boosts maximum Skell HP by 12%.
Boost.HP-MAX IX	Boosts maximum Skell HP by 13%.
Boost.HP-MAX X	Boosts maximum Skell HP by 14%.
Boost.HP-MAX XI	Boosts maximum Skell HP by 16%.
Boost.HP-MAX XII	Boosts maximum Skell HP by 17%.
Boost.HP-MAX XIII	Boosts maximum Skell HP by 18%.
Boost.HP-MAX XIV	Boosts maximum Skell HP by 19%.
Boost.HP-MAX XV	Boosts maximum Skell HP by 20%.
Boost.HP-MAX XVI	Boosts maximum Skell HP by 21%.
Boost.HP-MAX XVII	Boosts maximum Skell HP by 22%.
Boost.HP-MAX XVIII	Boosts maximum Skell HP by 23%.
Boost.HP-MAX XIX	Boosts maximum Skell HP by 24%.
Boost.HP-MAX XX	Boosts maximum Skell HP by 25%.
Boost.GP-MAX I	Boosts maximum Skell GP by 5%.
Boost.GP-MAX II	Boosts maximum Skell GP by 6%.
Boost.GP-MAX III	Boosts maximum Skell GP by 7%.
Boost.GP-MAX IV	Boosts maximum Skell GP by 8%.
Boost.GP-MAX V	Boosts maximum Skell GP by 9%.
Boost.GP-MAX VI	Boosts maximum Skell GP by 10%.
Boost.GP-MAX VII	Boosts maximum Skell GP by 11%.
Boost.GP-MAX VIII	Boosts maximum Skell GP by 12%.
Boost.GP-MAX IX	Boosts maximum Skell GP by 13%.
Boost.GP-MAX X	Boosts maximum Skell GP by 14%.
Boost.GP-MAX XI	Boosts maximum Skell GP by 16%.
Boost.GP-MAX XII	Boosts maximum Skell GP by 17%.
Boost.GP-MAX XIII	Boosts maximum Skell GP by 18%.
Boost.GP-MAX XIV	Boosts maximum Skell GP by 19%.
Boost.GP-MAX XV	Boosts maximum Skell GP by 20%.
Boost.GP-MAX XVI	Boosts maximum Skell GP by 21%.
Boost.GP-MAX XVII	Boosts maximum Skell GP by 22%.
Boost.GP-MAX XVIII	Boosts maximum Skell GP by 23%.
Boost.GP-MAX XIX	Boosts maximum Skell GP by 24%.
Boost.GP-MAX XX	Boosts maximum Skell GP by 25%.
Boost.M-ACC I	Boosts Skell melee accuracy by 5%.
Boost.M-ACC II	Boosts Skell melee accuracy by 6%.
Boost.M-ACC III	Boosts Skell melee accuracy by 7%.
Boost.M-ACC IV	Boosts Skell melee accuracy by 8%.
Boost.M-ACC V	Boosts Skell melee accuracy by 9%.
Boost.M-ACC VI	Boosts Skell melee accuracy by 10%.
Boost.M-ACC VII	Boosts Skell melee accuracy by 11%.
Boost.M-ACC VIII	Boosts Skell melee accuracy by 12%.
Boost.M-ACC IX	Boosts Skell melee accuracy by 13%.
Boost.M-ACC X	Boosts Skell melee accuracy by 14%.
Boost.M-ACC XI	Boosts Skell melee accuracy by 16%.
Boost.M-ACC XII	Boosts Skell melee accuracy by 17%.
Boost.M-ACC XIII	Boosts Skell melee accuracy by 18%.
Boost.M-ACC XIV	Boosts Skell melee accuracy by 19%.
Boost.M-ACC XV	Boosts Skell melee accuracy by 20%.
Boost.M-ACC XVI	Boosts Skell melee accuracy by 21%.
Boost.M-ACC XVII	Boosts Skell melee accuracy by 22%.
Boost.M-ACC XVIII	Boosts Skell melee accuracy by 23%.
Boost.M-ACC XIX	Boosts Skell melee accuracy by 24%.
Boost.M-ACC XX	Boosts Skell melee accuracy by 25%.
Boost.R-ACC I	Boosts Skell ranged accuracy by 5%.
Boost.R-ACC II	Boosts Skell ranged accuracy by 6%.
Boost.R-ACC III	Boosts Skell ranged accuracy by 7%.
Boost.R-ACC IV	Boosts Skell ranged accuracy by 8%.
Boost.R-ACC V	Boosts Skell ranged accuracy by 9%.
Boost.R-ACC VI	Boosts Skell ranged accuracy by 10%.
Boost.R-ACC VII	Boosts Skell ranged accuracy by 11%.
Boost.R-ACC VIII	Boosts Skell ranged accuracy by 12%.
Boost.R-ACC IX	Boosts Skell ranged accuracy by 13%.
Boost.R-ACC X	Boosts Skell ranged accuracy by 14%.
Boost.R-ACC XI	Boosts Skell ranged accuracy by 16%.
Boost.R-ACC XII	Boosts Skell ranged accuracy by 17%.
Boost.R-ACC XIII	Boosts Skell ranged accuracy by 18%.
Boost.R-ACC XIV	Boosts Skell ranged accuracy by 19%.
Boost.R-ACC XV	Boosts Skell ranged accuracy by 20%.
Boost.R-ACC XVI	Boosts Skell ranged accuracy by 21%.
Boost.R-ACC XVII	Boosts Skell ranged accuracy by 22%.
Boost.R-ACC XVIII	Boosts Skell ranged accuracy by 23%.
Boost.R-ACC XIX	Boosts Skell ranged accuracy by 24%.
Boost.R-ACC XX	Boosts Skell ranged accuracy by 25%.
Boost.EVA I	Boosts Skell evasion by 5%.
Boost.EVA II	Boosts Skell evasion by 6%.
Boost.EVA III	Boosts Skell evasion by 7%.
Boost.EVA IV	Boosts Skell evasion by 8%.
Boost.EVA V	Boosts Skell evasion by 9%.
Boost.EVA VI	Boosts Skell evasion by 10%.
Boost.EVA VII	Boosts Skell evasion by 11%.
Boost.EVA VIII	Boosts Skell evasion by 12%.
Boost.EVA IX	Boosts Skell evasion by 13%.
Boost.EVA X	Boosts Skell evasion by 14%.
Boost.EVA XI	Boosts Skell evasion by 16%.
Boost.EVA XII	Boosts Skell evasion by 17%.
Boost.EVA XIII	Boosts Skell evasion by 18%.
Boost.EVA XIV	Boosts Skell evasion by 19%.
Boost.EVA XV	Boosts Skell evasion by 20%.
Boost.EVA XVI	Boosts Skell evasion by 21%.
Boost.EVA XVII	Boosts Skell evasion by 22%.
Boost.EVA XVIII	Boosts Skell evasion by 23%.
Boost.EVA XIX	Boosts Skell evasion by 24%.
Boost.EVA XX	Boosts Skell evasion by 25%.
Boost.M-ATK I	Boosts Skell melee attack by 5%.
Boost.M-ATK II	Boosts Skell melee attack by 6%.
Boost.M-ATK III	Boosts Skell melee attack by 7%.
Boost.M-ATK IV	Boosts Skell melee attack by 8%.
Boost.M-ATK V	Boosts Skell melee attack by 9%.
Boost.M-ATK VI	Boosts Skell melee attack by 10%.
Boost.M-ATK VII	Boosts Skell melee attack by 11%.
Boost.M-ATK VIII	Boosts Skell melee attack by 12%.
Boost.M-ATK IX	Boosts Skell melee attack by 13%.
Boost.M-ATK X	Boosts Skell melee attack by 14%.
Boost.M-ATK XI	Boosts Skell melee attack by 16%.
Boost.M-ATK XII	Boosts Skell melee attack by 17%.
Boost.M-ATK XIII	Boosts Skell melee attack by 18%.
Boost.M-ATK XIV	Boosts Skell melee attack by 19%.
Boost.M-ATK XV	Boosts Skell melee attack by 20%.
Boost.M-ATK XVI	Boosts Skell melee attack by 21%.
Boost.M-ATK XVII	Boosts Skell melee attack by 22%.
Boost.M-ATK XVIII	Boosts Skell melee attack by 23%.
Boost.M-ATK XIX	Boosts Skell melee attack by 24%.
Boost.M-ATK XX	Boosts Skell melee attack by 25%.
Boost.R-ATK I	Boosts Skell ranged attack by 5%.
Boost.R-ATK II	Boosts Skell ranged attack by 6%.
Boost.R-ATK III	Boosts Skell ranged attack by 7%.
Boost.R-ATK IV	Boosts Skell ranged attack by 8%.
Boost.R-ATK V	Boosts Skell ranged attack by 9%.
Boost.R-ATK VI	Boosts Skell ranged attack by 10%.
Boost.R-ATK VII	Boosts Skell ranged attack by 11%.
Boost.R-ATK VIII	Boosts Skell ranged attack by 12%.
Boost.R-ATK IX	Boosts Skell ranged attack by 13%.
Boost.R-ATK X	Boosts Skell ranged attack by 14%.
Boost.R-ATK XI	Boosts Skell ranged attack by 16%.
Boost.R-ATK XII	Boosts Skell ranged attack by 17%.
Boost.R-ATK XIII	Boosts Skell ranged attack by 18%.
Boost.R-ATK XIV	Boosts Skell ranged attack by 19%.
Boost.R-ATK XV	Boosts Skell ranged attack by 20%.
Boost.R-ATK XVI	Boosts Skell ranged attack by 21%.
Boost.R-ATK XVII	Boosts Skell ranged attack by 22%.
Boost.R-ATK XVIII	Boosts Skell ranged attack by 23%.
Boost.R-ATK XIX	Boosts Skell ranged attack by 24%.
Boost.R-ATK XX	Boosts Skell ranged attack by 25%.
Boost.PTL I	Boosts Skell potential by 5%.
Boost.PTL II	Boosts Skell potential by 6%.
Boost.PTL III	Boosts Skell potential by 7%.
Boost.PTL IV	Boosts Skell potential by 8%.
Boost.PTL V	Boosts Skell potential by 9%.
Boost.PTL VI	Boosts Skell potential by 10%.
Boost.PTL VII	Boosts Skell potential by 11%.
Boost.PTL VIII	Boosts Skell potential by 12%.
Boost.PTL IX	Boosts Skell potential by 13%.
Boost.PTL X	Boosts Skell potential by 14%.
Boost.PTL XI	Boosts Skell potential by 16%.
Boost.PTL XII	Boosts Skell potential by 17%.
Boost.PTL XIII	Boosts Skell potential by 18%.
Boost.PTL XIV	Boosts Skell potential by 19%.
Boost.PTL XV	Boosts Skell potential by 20%.
Boost.PTL XVI	Boosts Skell potential by 21%.
Boost.PTL XVII	Boosts Skell potential by 22%.
Boost.PTL XVIII	Boosts Skell potential by 23%.
Boost.PTL XIX	Boosts Skell potential by 24%.
Boost.PTL XX	Boosts Skell potential by 25%.
SpecUp.PHYS-RES I	Boosts Skell physical resistance by 1.
SpecUp.PHYS-RES II	Boosts Skell physical resistance by 2.
SpecUp.PHYS-RES III	Boosts Skell physical resistance by 3.
SpecUp.PHYS-RES IV	Boosts Skell physical resistance by 4.
SpecUp.PHYS-RES V	Boosts Skell physical resistance by 5.
SpecUp.PHYS-RES VI	Boosts Skell physical resistance by 6.
SpecUp.PHYS-RES VII	Boosts Skell physical resistance by 7.
SpecUp.PHYS-RES VIII	Boosts Skell physical resistance by 8.
SpecUp.PHYS-RES IX	Boosts Skell physical resistance by 9.
SpecUp.PHYS-RES X	Boosts Skell physical resistance by 10.
SpecUp.PHYS-RES XI	Boosts Skell physical resistance by 11.
SpecUp.PHYS-RES XII	Boosts Skell physical resistance by 12.
SpecUp.PHYS-RES XIII	Boosts Skell physical resistance by 13.
SpecUp.PHYS-RES XIV	Boosts Skell physical resistance by 14.
SpecUp.PHYS-RES XV	Boosts Skell physical resistance by 15.
SpecUp.PHYS-RES XVI	Boosts Skell physical resistance by 16.
SpecUp.PHYS-RES XVII	Boosts Skell physical resistance by 17.
SpecUp.PHYS-RES XVIII	Boosts Skell physical resistance by 18.
SpecUp.PHYS-RES XIX	Boosts Skell physical resistance by 19.
SpecUp.PHYS-RES XX	Boosts Skell physical resistance by 20.
SpecUp.BEAM-RES I	Boosts Skell beam resistance by 1.
SpecUp.BEAM-RES II	Boosts Skell beam resistance by 2.
SpecUp.BEAM-RES III	Boosts Skell beam resistance by 3.
SpecUp.BEAM-RES IV	Boosts Skell beam resistance by 4.
SpecUp.BEAM-RES V	Boosts Skell beam resistance by 5.
SpecUp.BEAM-RES VI	Boosts Skell beam resistance by 6.
SpecUp.BEAM-RES VII	Boosts Skell beam resistance by 7.
SpecUp.BEAM-RES VIII	Boosts Skell beam resistance by 8.
SpecUp.BEAM-RES IX	Boosts Skell beam resistance by 9.
SpecUp.BEAM-RES X	Boosts Skell beam resistance by 10.
SpecUp.BEAM-RES XI	Boosts Skell beam resistance by 11.
SpecUp.BEAM-RES XII	Boosts Skell beam resistance by 12.
SpecUp.BEAM-RES XIII	Boosts Skell beam resistance by 13.
SpecUp.BEAM-RES XIV	Boosts Skell beam resistance by 14.
SpecUp.BEAM-RES XV	Boosts Skell beam resistance by 15.
SpecUp.BEAM-RES XVI	Boosts Skell beam resistance by 16.
SpecUp.BEAM-RES XVII	Boosts Skell beam resistance by 17.
SpecUp.BEAM-RES XVIII	Boosts Skell beam resistance by 18.
SpecUp.BEAM-RES XIX	Boosts Skell beam resistance by 19.
SpecUp.BEAM-RES XX	Boosts Skell beam resistance by 20.
SpecUp.ELEC-RES I	Boosts Skell electric resistance by 1.
SpecUp.ELEC-RES II	Boosts Skell electric resistance by 2.
SpecUp.ELEC-RES III	Boosts Skell electric resistance by 3.
SpecUp.ELEC-RES IV	Boosts Skell electric resistance by 4.
SpecUp.ELEC-RES V	Boosts Skell electric resistance by 5.
SpecUp.ELEC-RES VI	Boosts Skell electric resistance by 6.
SpecUp.ELEC-RES VII	Boosts Skell electric resistance by 7.
SpecUp.ELEC-RES VIII	Boosts Skell electric resistance by 8.
SpecUp.ELEC-RES IX	Boosts Skell electric resistance by 9.
SpecUp.ELEC-RES X	Boosts Skell electric resistance by 10.
SpecUp.ELEC-RES XI	Boosts Skell electric resistance by 11.
SpecUp.ELEC-RES XII	Boosts Skell electric resistance by 12.
SpecUp.ELEC-RES XIII	Boosts Skell electric resistance by 13.
SpecUp.ELEC-RES XIV	Boosts Skell electric resistance by 14.
SpecUp.ELEC-RES XV	Boosts Skell electric resistance by 15.
SpecUp.ELEC-RES XVI	Boosts Skell electric resistance by 16.
SpecUp.ELEC-RES XVII	Boosts Skell electric resistance by 17.
SpecUp.ELEC-RES XVIII	Boosts Skell electric resistance by 18.
SpecUp.ELEC-RES XIX	Boosts Skell electric resistance by 19.
SpecUp.ELEC-RES XX	Boosts Skell electric resistance by 20.
SpecUp.THERM-RES I	Boosts Skell thermal resistance by 1.
SpecUp.THERM-RES II	Boosts Skell thermal resistance by 2.
SpecUp.THERM-RES III	Boosts Skell thermal resistance by 3.
SpecUp.THERM-RES IV	Boosts Skell thermal resistance by 4.
SpecUp.THERM-RES V	Boosts Skell thermal resistance by 5.
SpecUp.THERM-RES VI	Boosts Skell thermal resistance by 6.
SpecUp.THERM-RES VII	Boosts Skell thermal resistance by 7.
SpecUp.THERM-RES VIII	Boosts Skell thermal resistance by 8.
SpecUp.THERM-RES IX	Boosts Skell thermal resistance by 9.
SpecUp.THERM-RES X	Boosts Skell thermal resistance by 10.
SpecUp.THERM-RES XI	Boosts Skell thermal resistance by 11.
SpecUp.THERM-RES XII	Boosts Skell thermal resistance by 12.
SpecUp.THERM-RES XIII	Boosts Skell thermal resistance by 13.
SpecUp.THERM-RES XIV	Boosts Skell thermal resistance by 14.
SpecUp.THERM-RES XV	Boosts Skell thermal resistance by 15.
SpecUp.THERM-RES XVI	Boosts Skell thermal resistance by 16.
SpecUp.THERM-RES XVII	Boosts Skell thermal resistance by 17.
SpecUp.THERM-RES XVIII	Boosts Skell thermal resistance by 18.
SpecUp.THERM-RES XIX	Boosts Skell thermal resistance by 19.
SpecUp.THERM-RES XX	Boosts Skell thermal resistance by 20.
SpecUp.ETHER-RES I	Boosts Skell ether resistance by 1.
SpecUp.ETHER-RES II	Boosts Skell ether resistance by 2.
SpecUp.ETHER-RES III	Boosts Skell ether resistance by 3.
SpecUp.ETHER-RES IV	Boosts Skell ether resistance by 4.
SpecUp.ETHER-RES V	Boosts Skell ether resistance by 5.
SpecUp.ETHER-RES VI	Boosts Skell ether resistance by 6.
SpecUp.ETHER-RES VII	Boosts Skell ether resistance by 7.
SpecUp.ETHER-RES VIII	Boosts Skell ether resistance by 8.
SpecUp.ETHER-RES IX	Boosts Skell ether resistance by 9.
SpecUp.ETHER-RES X	Boosts Skell ether resistance by 10.
SpecUp.ETHER-RES XI	Boosts Skell ether resistance by 11.
SpecUp.ETHER-RES XII	Boosts Skell ether resistance by 12.
SpecUp.ETHER-RES XIII	Boosts Skell ether resistance by 13.
SpecUp.ETHER-RES XIV	Boosts Skell ether resistance by 14.
SpecUp.ETHER-RES XV	Boosts Skell ether resistance by 15.
SpecUp.ETHER-RES XVI	Boosts Skell ether resistance by 16.
SpecUp.ETHER-RES XVII	Boosts Skell ether resistance by 17.
SpecUp.ETHER-RES XVIII	Boosts Skell ether resistance by 18.
SpecUp.ETHER-RES XIX	Boosts Skell ether resistance by 19.
SpecUp.ETHER-RES XX	Boosts Skell ether resistance by 20.
SpecUp.GRAV-RES I	Boosts Skell gravity resistance by 1.
SpecUp.GRAV-RES II	Boosts Skell gravity resistance by 2.
SpecUp.GRAV-RES III	Boosts Skell gravity resistance by 3.
SpecUp.GRAV-RES IV	Boosts Skell gravity resistance by 4.
SpecUp.GRAV-RES V	Boosts Skell gravity resistance by 5.
SpecUp.GRAV-RES VI	Boosts Skell gravity resistance by 6.
SpecUp.GRAV-RES VII	Boosts Skell gravity resistance by 7.
SpecUp.GRAV-RES VIII	Boosts Skell gravity resistance by 8.
SpecUp.GRAV-RES IX	Boosts Skell gravity resistance by 9.
SpecUp.GRAV-RES X	Boosts Skell gravity resistance by 10.
SpecUp.GRAV-RES XI	Boosts Skell gravity resistance by 11.
SpecUp.GRAV-RES XII	Boosts Skell gravity resistance by 12.
SpecUp.GRAV-RES XIII	Boosts Skell gravity resistance by 13.
SpecUp.GRAV-RES XIV	Boosts Skell gravity resistance by 14.
SpecUp.GRAV-RES XV	Boosts Skell gravity resistance by 15.
SpecUp.GRAV-RES XVI	Boosts Skell gravity resistance by 16.
SpecUp.GRAV-RES XVII	Boosts Skell gravity resistance by 17.
SpecUp.GRAV-RES XVIII	Boosts Skell gravity resistance by 18.
SpecUp.GRAV-RES XIX	Boosts Skell gravity resistance by 19.
SpecUp.GRAV-RES XX	Boosts Skell gravity resistance by 20.
SpecUp.FUEL-MAX I	Boosts Skell fuel capacity by 500.
SpecUp.FUEL-MAX II	Boosts Skell fuel capacity by 550.
SpecUp.FUEL-MAX III	Boosts Skell fuel capacity by 600.
SpecUp.FUEL-MAX IV	Boosts Skell fuel capacity by 650.
SpecUp.FUEL-MAX V	Boosts Skell fuel capacity by 700.
SpecUp.FUEL-MAX VI	Boosts Skell fuel capacity by 750.
SpecUp.FUEL-MAX VII	Boosts Skell fuel capacity by 800.
SpecUp.FUEL-MAX VIII	Boosts Skell fuel capacity by 850.
SpecUp.FUEL-MAX IX	Boosts Skell fuel capacity by 900.
SpecUp.FUEL-MAX X	Boosts Skell fuel capacity by 950.
SpecUp.FUEL-MAX XI	Boosts Skell fuel capacity by 1000.
SpecUp.FUEL-MAX XII	Boosts Skell fuel capacity by 1050.
SpecUp.FUEL-MAX XIII	Boosts Skell fuel capacity by 1100.
SpecUp.FUEL-MAX XIV	Boosts Skell fuel capacity by 1150.
SpecUp.FUEL-MAX XV	Boosts Skell fuel capacity by 1200.
SpecUp.FUEL-MAX XVI	Boosts Skell fuel capacity by 1250.
SpecUp.FUEL-MAX XVII	Boosts Skell fuel capacity by 1300.
SpecUp.FUEL-MAX XVIII	Boosts Skell fuel capacity by 1350.
SpecUp.FUEL-MAX XIX	Boosts Skell fuel capacity by 1400.
SpecUp.FUEL-MAX XX	Boosts Skell fuel capacity by 1500.
SpecUp.FUEL-COST I	Boosts fuel efficiency by 5% when fighting in a Skell.
SpecUp.FUEL-COST II	Boosts fuel efficiency by 10% when fighting in a Skell.
SpecUp.FUEL-COST III	Boosts fuel efficiency by 15% when fighting in a Skell.
SpecUp.FUEL-COST IV	Boosts fuel efficiency by 20% when fighting in a Skell.
SpecUp.FUEL-COST V	Boosts fuel efficiency by 25% when fighting in a Skell.
SpecUp.FUEL-COST VI	Boosts fuel efficiency by 30% when fighting in a Skell.
SpecUp.FUEL-COST VII	Boosts fuel efficiency by 35% when fighting in a Skell.
SpecUp.FUEL-COST VIII	Boosts fuel efficiency by 40% when fighting in a Skell.
SpecUp.FUEL-COST IX	Boosts fuel efficiency by 45% when fighting in a Skell.
SpecUp.FUEL-COST X	Boosts fuel efficiency by 50% when fighting in a Skell.
SpecUp.FUEL-COST XI	Boosts fuel efficiency by 55% when fighting in a Skell.
SpecUp.FUEL-COST XII	Boosts fuel efficiency by 60% when fighting in a Skell.
SpecUp.FUEL-COST XIII	Boosts fuel efficiency by 65% when fighting in a Skell.
SpecUp.FUEL-COST XIV	Boosts fuel efficiency by 70% when fighting in a Skell.
SpecUp.FUEL-COST XV	Boosts fuel efficiency by 75% when fighting in a Skell.
SpecUp.FUEL-COST XVI	Boosts fuel efficiency by 80% when fighting in a Skell.
SpecUp.FUEL-COST XVII	Boosts fuel efficiency by 85% when fighting in a Skell.
SpecUp.FUEL-COST XVIII	Boosts fuel efficiency by 90% when fighting in a Skell.
SpecUp.FUEL-COST XIX	Boosts fuel efficiency by 95% when fighting in a Skell.
SpecUp.FUEL-COST XX	Boosts fuel efficiency by 100% when fighting in a Skell.
SpecUp.FUEL-PARK I	Boosts fuel recovery by 1 unit(s) per 10 seconds when your Skell is parked.
SpecUp.FUEL-PARK II	Boosts fuel recovery by 2 unit(s) per 10 seconds when your Skell is parked.
SpecUp.FUEL-PARK III	Boosts fuel recovery by 3 unit(s) per 10 seconds when your Skell is parked.
SpecUp.FUEL-PARK IV	Boosts fuel recovery by 4 unit(s) per 10 seconds when your Skell is parked.
SpecUp.FUEL-PARK V	Boosts fuel recovery by 5 unit(s) per 10 seconds when your Skell is parked.
SpecUp.FUEL-PARK VI	Boosts fuel recovery by 6 unit(s) per 10 seconds when your Skell is parked.
SpecUp.FUEL-PARK VII	Boosts fuel recovery by 7 unit(s) per 10 seconds when your Skell is parked.
SpecUp.FUEL-PARK VIII	Boosts fuel recovery by 8 unit(s) per 10 seconds when your Skell is parked.
SpecUp.FUEL-PARK IX	Boosts fuel recovery by 9 unit(s) per 10 seconds when your Skell is parked.
SpecUp.FUEL-PARK X	Boosts fuel recovery by 10 unit(s) per 10 seconds when your Skell is parked.
SpecUp.FUEL-PARK XI	Boosts fuel recovery by 11 unit(s) per 10 seconds when your Skell is parked.
SpecUp.FUEL-PARK XII	Boosts fuel recovery by 12 unit(s) per 10 seconds when your Skell is parked.
SpecUp.FUEL-PARK XIII	Boosts fuel recovery by 13 unit(s) per 10 seconds when your Skell is parked.
SpecUp.FUEL-PARK XIV	Boosts fuel recovery by 14 unit(s) per 10 seconds when your Skell is parked.
SpecUp.FUEL-PARK XV	Boosts fuel recovery by 15 unit(s) per 10 seconds when your Skell is parked.
SpecUp.FUEL-PARK XVI	Boosts fuel recovery by 16 unit(s) per 10 seconds when your Skell is parked.
SpecUp.FUEL-PARK XVII	Boosts fuel recovery by 17 unit(s) per 10 seconds when your Skell is parked.
SpecUp.FUEL-PARK XVIII	Boosts fuel recovery by 18 unit(s) per 10 seconds when your Skell is parked.
SpecUp.FUEL-PARK XIX	Boosts fuel recovery by 19 unit(s) per 10 seconds when your Skell is parked.
SpecUp.FUEL-PARK XX	Boosts fuel recovery by 20 unit(s) per 10 seconds when your Skell is parked.
SpecUp.FUEL-BIND I	Boosts fuel recovery by 1 unit(s) per second when your Skell is binding an enemy.
SpecUp.FUEL-BIND II	Boosts fuel recovery by 2 unit(s) per second when your Skell is binding an enemy.
SpecUp.FUEL-BIND III	Boosts fuel recovery by 3 unit(s) per second when your Skell is binding an enemy.
SpecUp.FUEL-BIND IV	Boosts fuel recovery by 4 unit(s) per second when your Skell is binding an enemy.
SpecUp.FUEL-BIND V	Boosts fuel recovery by 5 unit(s) per second when your Skell is binding an enemy.
SpecUp.FUEL-BIND VI	Boosts fuel recovery by 6 unit(s) per second when your Skell is binding an enemy.
SpecUp.FUEL-BIND VII	Boosts fuel recovery by 7 unit(s) per second when your Skell is binding an enemy.
SpecUp.FUEL-BIND VIII	Boosts fuel recovery by 8 unit(s) per second when your Skell is binding an enemy.
SpecUp.FUEL-BIND IX	Boosts fuel recovery by 9 unit(s) per second when your Skell is binding an enemy.
SpecUp.FUEL-BIND X	Boosts fuel recovery by 10 unit(s) per second when your Skell is binding an enemy.
SpecUp.FUEL-BIND XI	Boosts fuel recovery by 11 unit(s) per second when your Skell is binding an enemy.
SpecUp.FUEL-BIND XII	Boosts fuel recovery by 12 unit(s) per second when your Skell is binding an enemy.
SpecUp.FUEL-BIND XIII	Boosts fuel recovery by 13 unit(s) per second when your Skell is binding an enemy.
SpecUp.FUEL-BIND XIV	Boosts fuel recovery by 14 unit(s) per second when your Skell is binding an enemy.
SpecUp.FUEL-BIND XV	Boosts fuel recovery by 15 unit(s) per second when your Skell is binding an enemy.
SpecUp.FUEL-BIND XVI	Boosts fuel recovery by 16 unit(s) per second when your Skell is binding an enemy.
SpecUp.FUEL-BIND XVII	Boosts fuel recovery by 17 unit(s) per second when your Skell is binding an enemy.
SpecUp.FUEL-BIND XVIII	Boosts fuel recovery by 18 unit(s) per second when your Skell is binding an enemy.
SpecUp.FUEL-BIND XIX	Boosts fuel recovery by 19 unit(s) per second when your Skell is binding an enemy.
SpecUp.FUEL-BIND XX	Boosts fuel recovery by 20 unit(s) per second when your Skell is binding an enemy.
SpecUp.FUEL-OD I	Recovers 50 fuel when activating Overdrive.
SpecUp.FUEL-OD II	Recovers 60 fuel when activating Overdrive.
SpecUp.FUEL-OD III	Recovers 70 fuel when activating Overdrive.
SpecUp.FUEL-OD IV	Recovers 80 fuel when activating Overdrive.
SpecUp.FUEL-OD V	Recovers 90 fuel when activating Overdrive.
SpecUp.FUEL-OD VI	Recovers 100 fuel when activating Overdrive.
SpecUp.FUEL-OD VII	Recovers 110 fuel when activating Overdrive.
SpecUp.FUEL-OD VIII	Recovers 120 fuel when activating Overdrive.
SpecUp.FUEL-OD IX	Recovers 130 fuel when activating Overdrive.
SpecUp.FUEL-OD X	Recovers 140 fuel when activating Overdrive.
SpecUp.FUEL-OD XI	Recovers 150 fuel when activating Overdrive.
SpecUp.FUEL-OD XII	Recovers 160 fuel when activating Overdrive.
SpecUp.FUEL-OD XIII	Recovers 170 fuel when activating Overdrive.
SpecUp.FUEL-OD XIV	Recovers 180 fuel when activating Overdrive.
SpecUp.FUEL-OD XV	Recovers 190 fuel when activating Overdrive.
SpecUp.FUEL-OD XVI	Recovers 200 fuel when activating Overdrive.
SpecUp.FUEL-OD XVII	Recovers 210 fuel when activating Overdrive.
SpecUp.FUEL-OD XVIII	Recovers 220 fuel when activating Overdrive.
SpecUp.FUEL-OD XIX	Recovers 230 fuel when activating Overdrive.
SpecUp.FUEL-OD XX	Recovers 250 fuel when activating Overdrive.
Custom.WP-ATK I	Boosts Skell weapon attack by 2%.
Custom.WP-ATK II	Boosts Skell weapon attack by 4%.
Custom.WP-ATK III	Boosts Skell weapon attack by 6%.
Custom.WP-ATK IV	Boosts Skell weapon attack by 8%.
Custom.WP-ATK V	Boosts Skell weapon attack by 10%.
Custom.WP-ATK VI	Boosts Skell weapon attack by 12%.
Custom.WP-ATK VII	Boosts Skell weapon attack by 14%.
Custom.WP-ATK VIII	Boosts Skell weapon attack by 16%.
Custom.WP-ATK IX	Boosts Skell weapon attack by 18%.
Custom.WP-ATK X	Boosts Skell weapon attack by 20%.
Custom.WP-ATK XI	Boosts Skell weapon attack by 22%.
Custom.WP-ATK XII	Boosts Skell weapon attack by 24%.
Custom.WP-ATK XIII	Boosts Skell weapon attack by 26%.
Custom.WP-ATK XIV	Boosts Skell weapon attack by 28%.
Custom.WP-ATK XV	Boosts Skell weapon attack by 30%.
Custom.WP-ATK XVI	Boosts Skell weapon attack by 32%.
Custom.WP-ATK XVII	Boosts Skell weapon attack by 34%.
Custom.WP-ATK XVIII	Boosts Skell weapon attack by 36%.
Custom.WP-ATK XIX	Boosts Skell weapon attack by 38%.
Custom.WP-ATK XX	Boosts Skell weapon attack by 40%.
Custom.WP-STABLE I	Boosts Skell weapon stability by 10%.
Custom.WP-STABLE II	Boosts Skell weapon stability by 12%.
Custom.WP-STABLE III	Boosts Skell weapon stability by 14%.
Custom.WP-STABLE IV	Boosts Skell weapon stability by 16%.
Custom.WP-STABLE V	Boosts Skell weapon stability by 18%.
Custom.WP-STABLE VI	Boosts Skell weapon stability by 20%.
Custom.WP-STABLE VII	Boosts Skell weapon stability by 22%.
Custom.WP-STABLE VIII	Boosts Skell weapon stability by 24%.
Custom.WP-STABLE IX	Boosts Skell weapon stability by 26%.
Custom.WP-STABLE X	Boosts Skell weapon stability by 28%.
Custom.WP-STABLE XI	Boosts Skell weapon stability by 32%.
Custom.WP-STABLE XII	Boosts Skell weapon stability by 34%.
Custom.WP-STABLE XIII	Boosts Skell weapon stability by 36%.
Custom.WP-STABLE XIV	Boosts Skell weapon stability by 38%.
Custom.WP-STABLE XV	Boosts Skell weapon stability by 40%.
Custom.WP-STABLE XVI	Boosts Skell weapon stability by 42%.
Custom.WP-STABLE XVII	Boosts Skell weapon stability by 44%.
Custom.WP-STABLE XVIII	Boosts Skell weapon stability by 46%.
Custom.WP-STABLE XIX	Boosts Skell weapon stability by 48%.
Custom.WP-STABLE XX	Boosts Skell weapon stability by 50%.
Custom.WP-DESTABLE I	Reduces Skell weapon stability by 10%.
Custom.WP-DESTABLE II	Reduces Skell weapon stability by 12%.
Custom.WP-DESTABLE III	Reduces Skell weapon stability by 14%.
Custom.WP-DESTABLE IV	Reduces Skell weapon stability by 16%.
Custom.WP-DESTABLE V	Reduces Skell weapon stability by 18%.
Custom.WP-DESTABLE VI	Reduces Skell weapon stability by 20%.
Custom.WP-DESTABLE VII	Reduces Skell weapon stability by 22%.
Custom.WP-DESTABLE VIII	Reduces Skell weapon stability by 24%.
Custom.WP-DESTABLE IX	Reduces Skell weapon stability by 26%.
Custom.WP-DESTABLE X	Reduces Skell weapon stability by 28%.
Custom.WP-DESTABLE XI	Reduces Skell weapon stability by 32%.
Custom.WP-DESTABLE XII	Reduces Skell weapon stability by 34%.
Custom.WP-DESTABLE XIII	Reduces Skell weapon stability by 36%.
Custom.WP-DESTABLE XIV	Reduces Skell weapon stability by 38%.
Custom.WP-DESTABLE XV	Reduces Skell weapon stability by 40%.
Custom.WP-DESTABLE XVI	Reduces Skell weapon stability by 42%.
Custom.WP-DESTABLE XVII	Reduces Skell weapon stability by 44%.
Custom.WP-DESTABLE XVIII	Reduces Skell weapon stability by 46%.
Custom.WP-DESTABLE XIX	Reduces Skell weapon stability by 48%.
Custom.WP-DESTABLE XX	Reduces Skell weapon stability by 50%.
Custom.WP-RFL-MAG I	Increases magazine capacity for Skell rifle-type armaments by 1.
Custom.WP-RFL-MAG II	Increases magazine capacity for Skell rifle-type armaments by 2.
Custom.WP-RFL-MAG III	Increases magazine capacity for Skell rifle-type armaments by 3.
Custom.WP-RFL-MAG IV	Increases magazine capacity for Skell rifle-type armaments by 4.
Custom.WP-RFL-MAG V	Increases magazine capacity for Skell rifle-type armaments by 5.
Custom.WP-RFL-MAG VI	Increases magazine capacity for Skell rifle-type armaments by 6.
Custom.WP-RFL-MAG VII	Increases magazine capacity for Skell rifle-type armaments by 7.
Custom.WP-RFL-MAG VIII	Increases magazine capacity for Skell rifle-type armaments by 8.
Custom.WP-RFL-MAG IX	Increases magazine capacity for Skell rifle-type armaments by 9.
Custom.WP-RFL-MAG X	Increases magazine capacity for Skell rifle-type armaments by 10.
Custom.WP-RFL-MAG XI	Increases magazine capacity for Skell rifle-type armaments by 11.
Custom.WP-RFL-MAG XII	Increases magazine capacity for Skell rifle-type armaments by 12.
Custom.WP-RFL-MAG XIII	Increases magazine capacity for Skell rifle-type armaments by 13.
Custom.WP-RFL-MAG XIV	Increases magazine capacity for Skell rifle-type armaments by 14.
Custom.WP-RFL-MAG XV	Increases magazine capacity for Skell rifle-type armaments by 15.
Custom.WP-RFL-MAG XVI	Increases magazine capacity for Skell rifle-type armaments by 16.
Custom.WP-RFL-MAG XVII	Increases magazine capacity for Skell rifle-type armaments by 17.
Custom.WP-RFL-MAG XVIII	Increases magazine capacity for Skell rifle-type armaments by 18.
Custom.WP-RFL-MAG XIX	Increases magazine capacity for Skell rifle-type armaments by 19.
Custom.WP-RFL-MAG XX	Increases magazine capacity for Skell rifle-type armaments by 20.
Custom.WP-MSL-MAG I	Increases magazine capacity for Skell missile-type armaments by 1.
Custom.WP-MSL-MAG II	Increases magazine capacity for Skell missile-type armaments by 2.
Custom.WP-MSL-MAG III	Increases magazine capacity for Skell missile-type armaments by 3.
Custom.WP-MSL-MAG IV	Increases magazine capacity for Skell missile-type armaments by 4.
Custom.WP-MSL-MAG V	Increases magazine capacity for Skell missile-type armaments by 5.
Custom.WP-MSL-MAG VI	Increases magazine capacity for Skell missile-type armaments by 6.
Custom.WP-MSL-MAG VII	Increases magazine capacity for Skell missile-type armaments by 7.
Custom.WP-MSL-MAG VIII	Increases magazine capacity for Skell missile-type armaments by 8.
Custom.WP-MSL-MAG IX	Increases magazine capacity for Skell missile-type armaments by 9.
Custom.WP-MSL-MAG X	Increases magazine capacity for Skell missile-type armaments by 10.
Custom.WP-MSL-MAG XI	Increases magazine capacity for Skell missile-type armaments by 11.
Custom.WP-MSL-MAG XII	Increases magazine capacity for Skell missile-type armaments by 12.
Custom.WP-MSL-MAG XIII	Increases magazine capacity for Skell missile-type armaments by 13.
Custom.WP-MSL-MAG XIV	Increases magazine capacity for Skell missile-type armaments by 14.
Custom.WP-MSL-MAG XV	Increases magazine capacity for Skell missile-type armaments by 15.
Custom.WP-MSL-MAG XVI	Increases magazine capacity for Skell missile-type armaments by 16.
Custom.WP-MSL-MAG XVII	Increases magazine capacity for Skell missile-type armaments by 17.
Custom.WP-MSL-MAG XVIII	Increases magazine capacity for Skell missile-type armaments by 18.
Custom.WP-MSL-MAG XIX	Increases magazine capacity for Skell missile-type armaments by 19.
Custom.WP-MSL-MAG XX	Increases magazine capacity for Skell missile-type armaments by 20.
Custom.WP-M-GP	Boosts GP gain for Skell melee weapons by 50.
Custom.WP-R-GP	Boosts GP gain for Skell ranged weapons by 5.
Custom.WP-SPEED I	Reduces Skell weapon cooldown by 5%.
Custom.WP-SPEED II	Reduces Skell weapon cooldown by 6%.
Custom.WP-SPEED III	Reduces Skell weapon cooldown by 7%.
Custom.WP-SPEED IV	Reduces Skell weapon cooldown by 8%.
Custom.WP-SPEED V	Reduces Skell weapon cooldown by 9%.
Custom.WP-SPEED VI	Reduces Skell weapon cooldown by 10%.
Custom.WP-SPEED VII	Reduces Skell weapon cooldown by 11%.
Custom.WP-SPEED VIII	Reduces Skell weapon cooldown by 12%.
Custom.WP-SPEED IX	Reduces Skell weapon cooldown by 13%.
Custom.WP-SPEED X	Reduces Skell weapon cooldown by 14%.
Custom.WP-SPEED XI	Reduces Skell weapon cooldown by 16%.
Custom.WP-SPEED XII	Reduces Skell weapon cooldown by 17%.
Custom.WP-SPEED XIII	Reduces Skell weapon cooldown by 18%.
Custom.WP-SPEED XIV	Reduces Skell weapon cooldown by 19%.
Custom.WP-SPEED XV	Reduces Skell weapon cooldown by 20%.
Custom.WP-SPEED XVI	Reduces Skell weapon cooldown by 21%.
Custom.WP-SPEED XVII	Reduces Skell weapon cooldown by 22%.
Custom.WP-SPEED XVIII	Reduces Skell weapon cooldown by 23%.
Custom.WP-SPEED XIX	Reduces Skell weapon cooldown by 24%.
Custom.WP-SPEED XX	Reduces Skell weapon cooldown by 25%.
Custom.WP-R-RANGE I	Boosts Skell ranged weapon range by 2m.
Custom.WP-R-RANGE II	Boosts Skell ranged weapon range by 4m.
Custom.WP-R-RANGE III	Boosts Skell ranged weapon range by 6m.
Custom.WP-R-RANGE IV	Boosts Skell ranged weapon range by 8m.
Custom.WP-R-RANGE V	Boosts Skell ranged weapon range by 10m.
Custom.WP-R-RANGE VI	Boosts Skell ranged weapon range by 12m.
Custom.WP-R-RANGE VII	Boosts Skell ranged weapon range by 14m.
Custom.WP-R-RANGE VIII	Boosts Skell ranged weapon range by 16m.
Custom.WP-R-RANGE IX	Boosts Skell ranged weapon range by 18m.
Custom.WP-R-RANGE X	Boosts Skell ranged weapon range by 20m.
Custom.WP-R-RANGE XI	Boosts Skell ranged weapon range by 22m.
Custom.WP-R-RANGE XII	Boosts Skell ranged weapon range by 24m.
Custom.WP-R-RANGE XIII	Boosts Skell ranged weapon range by 26m.
Custom.WP-R-RANGE XIV	Boosts Skell ranged weapon range by 28m.
Custom.WP-R-RANGE XV	Boosts Skell ranged weapon range by 30m.
Custom.WP-R-RANGE XVI	Boosts Skell ranged weapon range by 32m.
Custom.WP-R-RANGE XVII	Boosts Skell ranged weapon range by 34m.
Custom.WP-R-RANGE XVIII	Boosts Skell ranged weapon range by 36m.
Custom.WP-R-RANGE XIX	Boosts Skell ranged weapon range by 38m.
Custom.WP-R-RANGE XX	Boosts Skell ranged weapon range by 40m.
Custom.WP-FUEL I	Reduces Skell Art fuel consumption by 1%.
Custom.WP-FUEL II	Reduces Skell Art fuel consumption by 2%.
Custom.WP-FUEL III	Reduces Skell Art fuel consumption by 3%.
Custom.WP-FUEL IV	Reduces Skell Art fuel consumption by 4%.
Custom.WP-FUEL V	Reduces Skell Art fuel consumption by 5%.
Custom.WP-FUEL VI	Reduces Skell Art fuel consumption by 6%.
Custom.WP-FUEL VII	Reduces Skell Art fuel consumption by 7%.
Custom.WP-FUEL VIII	Reduces Skell Art fuel consumption by 8%.
Custom.WP-FUEL IX	Reduces Skell Art fuel consumption by 9%.
Custom.WP-FUEL X	Reduces Skell Art fuel consumption by 10%.
Custom.WP-FUEL XI	Reduces Skell Art fuel consumption by 11%.
Custom.WP-FUEL XII	Reduces Skell Art fuel consumption by 12%.
Custom.WP-FUEL XIII	Reduces Skell Art fuel consumption by 13%.
Custom.WP-FUEL XIV	Reduces Skell Art fuel consumption by 14%.
Custom.WP-FUEL XV	Reduces Skell Art fuel consumption by 15%.
Custom.WP-FUEL XVI	Reduces Skell Art fuel consumption by 16%.
Custom.WP-FUEL XVII	Reduces Skell Art fuel consumption by 17%.
Custom.WP-FUEL XVIII	Reduces Skell Art fuel consumption by 18%.
Custom.WP-FUEL XIX	Reduces Skell Art fuel consumption by 19%.
Custom.WP-FUEL XX	Reduces Skell Art fuel consumption by 20%.
Resist.STAGGER I	Boosts Skell resistance to Stagger by 5.
Resist.STAGGER II	Boosts Skell resistance to Stagger by 10.
Resist.STAGGER III	Boosts Skell resistance to Stagger by 15.
Resist.STAGGER IV	Boosts Skell resistance to Stagger by 20.
Resist.STAGGER V	Boosts Skell resistance to Stagger by 25.
Resist.STAGGER VI	Boosts Skell resistance to Stagger by 30.
Resist.STAGGER VII	Boosts Skell resistance to Stagger by 35.
Resist.STAGGER VIII	Boosts Skell resistance to Stagger by 40.
Resist.STAGGER IX	Boosts Skell resistance to Stagger by 45.
Resist.STAGGER X	Boosts Skell resistance to Stagger by 50.
Resist.STAGGER XI	Boosts Skell resistance to Stagger by 55.
Resist.STAGGER XII	Boosts Skell resistance to Stagger by 60.
Resist.STAGGER XIII	Boosts Skell resistance to Stagger by 65.
Resist.STAGGER XIV	Boosts Skell resistance to Stagger by 70.
Resist.STAGGER XV	Boosts Skell resistance to Stagger by 75.
Resist.STAGGER XVI	Boosts Skell resistance to Stagger by 80.
Resist.STAGGER XVII	Boosts Skell resistance to Stagger by 85.
Resist.STAGGER XVIII	Boosts Skell resistance to Stagger by 90.
Resist.STAGGER XIX	Boosts Skell resistance to Stagger by 95.
Resist.STAGGER XX	Boosts Skell resistance to Stagger by 100.
Resist.FLINCH I	Boosts Skell resistance to Flinch by 5.
Resist.FLINCH II	Boosts Skell resistance to Flinch by 10.
Resist.FLINCH III	Boosts Skell resistance to Flinch by 15.
Resist.FLINCH IV	Boosts Skell resistance to Flinch by 20.
Resist.FLINCH V	Boosts Skell resistance to Flinch by 25.
Resist.FLINCH VI	Boosts Skell resistance to Flinch by 30.
Resist.FLINCH VII	Boosts Skell resistance to Flinch by 35.
Resist.FLINCH VIII	Boosts Skell resistance to Flinch by 40.
Resist.FLINCH IX	Boosts Skell resistance to Flinch by 45.
Resist.FLINCH X	Boosts Skell resistance to Flinch by 50.
Resist.FLINCH XI	Boosts Skell resistance to Flinch by 55.
Resist.FLINCH XII	Boosts Skell resistance to Flinch by 60.
Resist.FLINCH XIII	Boosts Skell resistance to Flinch by 65.
Resist.FLINCH XIV	Boosts Skell resistance to Flinch by 70.
Resist.FLINCH XV	Boosts Skell resistance to Flinch by 75.
Resist.FLINCH XVI	Boosts Skell resistance to Flinch by 80.
Resist.FLINCH XVII	Boosts Skell resistance to Flinch by 85.
Resist.FLINCH XVIII	Boosts Skell resistance to Flinch by 90.
Resist.FLINCH XIX	Boosts Skell resistance to Flinch by 95.
Resist.FLINCH XX	Boosts Skell resistance to Flinch by 100.
Resist.TOPPLE I	Boosts Skell resistance to Topple by 5.
Resist.TOPPLE II	Boosts Skell resistance to Topple by 10.
Resist.TOPPLE III	Boosts Skell resistance to Topple by 15.
Resist.TOPPLE IV	Boosts Skell resistance to Topple by 20.
Resist.TOPPLE V	Boosts Skell resistance to Topple by 25.
Resist.TOPPLE VI	Boosts Skell resistance to Topple by 30.
Resist.TOPPLE VII	Boosts Skell resistance to Topple by 35.
Resist.TOPPLE VIII	Boosts Skell resistance to Topple by 40.
Resist.TOPPLE IX	Boosts Skell resistance to Topple by 45.
Resist.TOPPLE X	Boosts Skell resistance to Topple by 50.
Resist.TOPPLE XI	Boosts Skell resistance to Topple by 55.
Resist.TOPPLE XII	Boosts Skell resistance to Topple by 60.
Resist.TOPPLE XIII	Boosts Skell resistance to Topple by 65.
Resist.TOPPLE XIV	Boosts Skell resistance to Topple by 70.
Resist.TOPPLE XV	Boosts Skell resistance to Topple by 75.
Resist.TOPPLE XVI	Boosts Skell resistance to Topple by 80.
Resist.TOPPLE XVII	Boosts Skell resistance to Topple by 85.
Resist.TOPPLE XVIII	Boosts Skell resistance to Topple by 90.
Resist.TOPPLE XIX	Boosts Skell resistance to Topple by 95.
Resist.TOPPLE XX	Boosts Skell resistance to Topple by 100.
Resist.KNOCKBACK I	Boosts Skell resistance to Knockback by 5.
Resist.KNOCKBACK II	Boosts Skell resistance to Knockback by 10.
Resist.KNOCKBACK III	Boosts Skell resistance to Knockback by 15.
Resist.KNOCKBACK IV	Boosts Skell resistance to Knockback by 20.
Resist.KNOCKBACK V	Boosts Skell resistance to Knockback by 25.
Resist.KNOCKBACK VI	Boosts Skell resistance to Knockback by 30.
Resist.KNOCKBACK VII	Boosts Skell resistance to Knockback by 35.
Resist.KNOCKBACK VIII	Boosts Skell resistance to Knockback by 40.
Resist.KNOCKBACK IX	Boosts Skell resistance to Knockback by 45.
Resist.KNOCKBACK X	Boosts Skell resistance to Knockback by 50.
Resist.KNOCKBACK XI	Boosts Skell resistance to Knockback by 55.
Resist.KNOCKBACK XII	Boosts Skell resistance to Knockback by 60.
Resist.KNOCKBACK XIII	Boosts Skell resistance to Knockback by 65.
Resist.KNOCKBACK XIV	Boosts Skell resistance to Knockback by 70.
Resist.KNOCKBACK XV	Boosts Skell resistance to Knockback by 75.
Resist.KNOCKBACK XVI	Boosts Skell resistance to Knockback by 80.
Resist.KNOCKBACK XVII	Boosts Skell resistance to Knockback by 85.
Resist.KNOCKBACK XVIII	Boosts Skell resistance to Knockback by 90.
Resist.KNOCKBACK XIX	Boosts Skell resistance to Knockback by 95.
Resist.KNOCKBACK XX	Boosts Skell resistance to Knockback by 100.
Resist.LAUNCH I	Boosts Skell resistance to Launch by 5.
Resist.LAUNCH II	Boosts Skell resistance to Launch by 10.
Resist.LAUNCH III	Boosts Skell resistance to Launch by 15.
Resist.LAUNCH IV	Boosts Skell resistance to Launch by 20.
Resist.LAUNCH V	Boosts Skell resistance to Launch by 25.
Resist.LAUNCH VI	Boosts Skell resistance to Launch by 30.
Resist.LAUNCH VII	Boosts Skell resistance to Launch by 35.
Resist.LAUNCH VIII	Boosts Skell resistance to Launch by 40.
Resist.LAUNCH IX	Boosts Skell resistance to Launch by 45.
Resist.LAUNCH X	Boosts Skell resistance to Launch by 50.
Resist.LAUNCH XI	Boosts Skell resistance to Launch by 55.
Resist.LAUNCH XII	Boosts Skell resistance to Launch by 60.
Resist.LAUNCH XIII	Boosts Skell resistance to Launch by 65.
Resist.LAUNCH XIV	Boosts Skell resistance to Launch by 70.
Resist.LAUNCH XV	Boosts Skell resistance to Launch by 75.
Resist.LAUNCH XVI	Boosts Skell resistance to Launch by 80.
Resist.LAUNCH XVII	Boosts Skell resistance to Launch by 85.
Resist.LAUNCH XVIII	Boosts Skell resistance to Launch by 90.
Resist.LAUNCH XIX	Boosts Skell resistance to Launch by 95.
Resist.LAUNCH XX	Boosts Skell resistance to Launch by 100.
Resist.STUN I	Boosts Skell resistance to Stun by 5.
Resist.STUN II	Boosts Skell resistance to Stun by 10.
Resist.STUN III	Boosts Skell resistance to Stun by 15.
Resist.STUN IV	Boosts Skell resistance to Stun by 20.
Resist.STUN V	Boosts Skell resistance to Stun by 25.
Resist.STUN VI	Boosts Skell resistance to Stun by 30.
Resist.STUN VII	Boosts Skell resistance to Stun by 35.
Resist.STUN VIII	Boosts Skell resistance to Stun by 40.
Resist.STUN IX	Boosts Skell resistance to Stun by 45.
Resist.STUN X	Boosts Skell resistance to Stun by 50.
Resist.STUN XI	Boosts Skell resistance to Stun by 55.
Resist.STUN XII	Boosts Skell resistance to Stun by 60.
Resist.STUN XIII	Boosts Skell resistance to Stun by 65.
Resist.STUN XIV	Boosts Skell resistance to Stun by 70.
Resist.STUN XV	Boosts Skell resistance to Stun by 75.
Resist.STUN XVI	Boosts Skell resistance to Stun by 80.
Resist.STUN XVII	Boosts Skell resistance to Stun by 85.
Resist.STUN XVIII	Boosts Skell resistance to Stun by 90.
Resist.STUN XIX	Boosts Skell resistance to Stun by 95.
Resist.STUN XX	Boosts Skell resistance to Stun by 100.
Resist.SLEEP I	Boosts Skell resistance to Sleep by 5.
Resist.SLEEP II	Boosts Skell resistance to Sleep by 10.
Resist.SLEEP III	Boosts Skell resistance to Sleep by 15.
Resist.SLEEP IV	Boosts Skell resistance to Sleep by 20.
Resist.SLEEP V	Boosts Skell resistance to Sleep by 25.
Resist.SLEEP VI	Boosts Skell resistance to Sleep by 30.
Resist.SLEEP VII	Boosts Skell resistance to Sleep by 35.
Resist.SLEEP VIII	Boosts Skell resistance to Sleep by 40.
Resist.SLEEP IX	Boosts Skell resistance to Sleep by 45.
Resist.SLEEP X	Boosts Skell resistance to Sleep by 50.
Resist.SLEEP XI	Boosts Skell resistance to Sleep by 55.
Resist.SLEEP XII	Boosts Skell resistance to Sleep by 60.
Resist.SLEEP XIII	Boosts Skell resistance to Sleep by 65.
Resist.SLEEP XIV	Boosts Skell resistance to Sleep by 70.
Resist.SLEEP XV	Boosts Skell resistance to Sleep by 75.
Resist.SLEEP XVI	Boosts Skell resistance to Sleep by 80.
Resist.SLEEP XVII	Boosts Skell resistance to Sleep by 85.
Resist.SLEEP XVIII	Boosts Skell resistance to Sleep by 90.
Resist.SLEEP XIX	Boosts Skell resistance to Sleep by 95.
Resist.SLEEP XX	Boosts Skell resistance to Sleep by 100.
Resist.TAUNT I	Boosts Skell resistance to Taunt by 5.
Resist.TAUNT II	Boosts Skell resistance to Taunt by 10.
Resist.TAUNT III	Boosts Skell resistance to Taunt by 15.
Resist.TAUNT IV	Boosts Skell resistance to Taunt by 20.
Resist.TAUNT V	Boosts Skell resistance to Taunt by 25.
Resist.TAUNT VI	Boosts Skell resistance to Taunt by 30.
Resist.TAUNT VII	Boosts Skell resistance to Taunt by 35.
Resist.TAUNT VIII	Boosts Skell resistance to Taunt by 40.
Resist.TAUNT IX	Boosts Skell resistance to Taunt by 45.
Resist.TAUNT X	Boosts Skell resistance to Taunt by 50.
Resist.TAUNT XI	Boosts Skell resistance to Taunt by 55.
Resist.TAUNT XII	Boosts Skell resistance to Taunt by 60.
Resist.TAUNT XIII	Boosts Skell resistance to Taunt by 65.
Resist.TAUNT XIV	Boosts Skell resistance to Taunt by 70.
Resist.TAUNT XV	Boosts Skell resistance to Taunt by 75.
Resist.TAUNT XVI	Boosts Skell resistance to Taunt by 80.
Resist.TAUNT XVII	Boosts Skell resistance to Taunt by 85.
Resist.TAUNT XVIII	Boosts Skell resistance to Taunt by 90.
Resist.TAUNT XIX	Boosts Skell resistance to Taunt by 95.
Resist.TAUNT XX	Boosts Skell resistance to Taunt by 100.
Resist.CONTROL I	Boosts Skell resistance to Control by 5.
Resist.CONTROL II	Boosts Skell resistance to Control by 10.
Resist.CONTROL III	Boosts Skell resistance to Control by 15.
Resist.CONTROL IV	Boosts Skell resistance to Control by 20.
Resist.CONTROL V	Boosts Skell resistance to Control by 25.
Resist.CONTROL VI	Boosts Skell resistance to Control by 30.
Resist.CONTROL VII	Boosts Skell resistance to Control by 35.
Resist.CONTROL VIII	Boosts Skell resistance to Control by 40.
Resist.CONTROL IX	Boosts Skell resistance to Control by 45.
Resist.CONTROL X	Boosts Skell resistance to Control by 50.
Resist.CONTROL XI	Boosts Skell resistance to Control by 55.
Resist.CONTROL XII	Boosts Skell resistance to Control by 60.
Resist.CONTROL XIII	Boosts Skell resistance to Control by 65.
Resist.CONTROL XIV	Boosts Skell resistance to Control by 70.
Resist.CONTROL XV	Boosts Skell resistance to Control by 75.
Resist.CONTROL XVI	Boosts Skell resistance to Control by 80.
Resist.CONTROL XVII	Boosts Skell resistance to Control by 85.
Resist.CONTROL XVIII	Boosts Skell resistance to Control by 90.
Resist.CONTROL XIX	Boosts Skell resistance to Control by 95.
Resist.CONTROL XX	Boosts Skell resistance to Control by 100.
Resist.VIRUS I	Boosts Skell resistance to Virus by 5.
Resist.VIRUS II	Boosts Skell resistance to Virus by 10.
Resist.VIRUS III	Boosts Skell resistance to Virus by 15.
Resist.VIRUS IV	Boosts Skell resistance to Virus by 20.
Resist.VIRUS V	Boosts Skell resistance to Virus by 25.
Resist.VIRUS VI	Boosts Skell resistance to Virus by 30.
Resist.VIRUS VII	Boosts Skell resistance to Virus by 35.
Resist.VIRUS VIII	Boosts Skell resistance to Virus by 40.
Resist.VIRUS IX	Boosts Skell resistance to Virus by 45.
Resist.VIRUS X	Boosts Skell resistance to Virus by 50.
Resist.VIRUS XI	Boosts Skell resistance to Virus by 55.
Resist.VIRUS XII	Boosts Skell resistance to Virus by 60.
Resist.VIRUS XIII	Boosts Skell resistance to Virus by 65.
Resist.VIRUS XIV	Boosts Skell resistance to Virus by 70.
Resist.VIRUS XV	Boosts Skell resistance to Virus by 75.
Resist.VIRUS XVI	Boosts Skell resistance to Virus by 80.
Resist.VIRUS XVII	Boosts Skell resistance to Virus by 85.
Resist.VIRUS XVIII	Boosts Skell resistance to Virus by 90.
Resist.VIRUS XIX	Boosts Skell resistance to Virus by 95.
Resist.VIRUS XX	Boosts Skell resistance to Virus by 100.
Resist.BLACKOUT I	Boosts Skell resistance to Blackout by 5.
Resist.BLACKOUT II	Boosts Skell resistance to Blackout by 10.
Resist.BLACKOUT III	Boosts Skell resistance to Blackout by 15.
Resist.BLACKOUT IV	Boosts Skell resistance to Blackout by 20.
Resist.BLACKOUT V	Boosts Skell resistance to Blackout by 25.
Resist.BLACKOUT VI	Boosts Skell resistance to Blackout by 30.
Resist.BLACKOUT VII	Boosts Skell resistance to Blackout by 35.
Resist.BLACKOUT VIII	Boosts Skell resistance to Blackout by 40.
Resist.BLACKOUT IX	Boosts Skell resistance to Blackout by 45.
Resist.BLACKOUT X	Boosts Skell resistance to Blackout by 50.
Resist.BLACKOUT XI	Boosts Skell resistance to Blackout by 55.
Resist.BLACKOUT XII	Boosts Skell resistance to Blackout by 60.
Resist.BLACKOUT XIII	Boosts Skell resistance to Blackout by 65.
Resist.BLACKOUT XIV	Boosts Skell resistance to Blackout by 70.
Resist.BLACKOUT XV	Boosts Skell resistance to Blackout by 75.
Resist.BLACKOUT XVI	Boosts Skell resistance to Blackout by 80.
Resist.BLACKOUT XVII	Boosts Skell resistance to Blackout by 85.
Resist.BLACKOUT XVIII	Boosts Skell resistance to Blackout by 90.
Resist.BLACKOUT XIX	Boosts Skell resistance to Blackout by 95.
Resist.BLACKOUT XX	Boosts Skell resistance to Blackout by 100.
Resist.FATIGUE I	Boosts Skell resistance to Fatigue by 5.
Resist.FATIGUE II	Boosts Skell resistance to Fatigue by 10.
Resist.FATIGUE III	Boosts Skell resistance to Fatigue by 15.
Resist.FATIGUE IV	Boosts Skell resistance to Fatigue by 20.
Resist.FATIGUE V	Boosts Skell resistance to Fatigue by 25.
Resist.FATIGUE VI	Boosts Skell resistance to Fatigue by 30.
Resist.FATIGUE VII	Boosts Skell resistance to Fatigue by 35.
Resist.FATIGUE VIII	Boosts Skell resistance to Fatigue by 40.
Resist.FATIGUE IX	Boosts Skell resistance to Fatigue by 45.
Resist.FATIGUE X	Boosts Skell resistance to Fatigue by 50.
Resist.FATIGUE XI	Boosts Skell resistance to Fatigue by 55.
Resist.FATIGUE XII	Boosts Skell resistance to Fatigue by 60.
Resist.FATIGUE XIII	Boosts Skell resistance to Fatigue by 65.
Resist.FATIGUE XIV	Boosts Skell resistance to Fatigue by 70.
Resist.FATIGUE XV	Boosts Skell resistance to Fatigue by 75.
Resist.FATIGUE XVI	Boosts Skell resistance to Fatigue by 80.
Resist.FATIGUE XVII	Boosts Skell resistance to Fatigue by 85.
Resist.FATIGUE XVIII	Boosts Skell resistance to Fatigue by 90.
Resist.FATIGUE XIX	Boosts Skell resistance to Fatigue by 95.
Resist.FATIGUE XX	Boosts Skell resistance to Fatigue by 100.
Resist.SLOW-ARTS I	Boosts Skell resistance to Slow Arts by 5.
Resist.SLOW-ARTS II	Boosts Skell resistance to Slow Arts by 10.
Resist.SLOW-ARTS III	Boosts Skell resistance to Slow Arts by 15.
Resist.SLOW-ARTS IV	Boosts Skell resistance to Slow Arts by 20.
Resist.SLOW-ARTS V	Boosts Skell resistance to Slow Arts by 25.
Resist.SLOW-ARTS VI	Boosts Skell resistance to Slow Arts by 30.
Resist.SLOW-ARTS VII	Boosts Skell resistance to Slow Arts by 35.
Resist.SLOW-ARTS VIII	Boosts Skell resistance to Slow Arts by 40.
Resist.SLOW-ARTS IX	Boosts Skell resistance to Slow Arts by 45.
Resist.SLOW-ARTS X	Boosts Skell resistance to Slow Arts by 50.
Resist.SLOW-ARTS XI	Boosts Skell resistance to Slow Arts by 55.
Resist.SLOW-ARTS XII	Boosts Skell resistance to Slow Arts by 60.
Resist.SLOW-ARTS XIII	Boosts Skell resistance to Slow Arts by 65.
Resist.SLOW-ARTS XIV	Boosts Skell resistance to Slow Arts by 70.
Resist.SLOW-ARTS XV	Boosts Skell resistance to Slow Arts by 75.
Resist.SLOW-ARTS XVI	Boosts Skell resistance to Slow Arts by 80.
Resist.SLOW-ARTS XVII	Boosts Skell resistance to Slow Arts by 85.
Resist.SLOW-ARTS XVIII	Boosts Skell resistance to Slow Arts by 90.
Resist.SLOW-ARTS XIX	Boosts Skell resistance to Slow Arts by 95.
Resist.SLOW-ARTS XX	Boosts Skell resistance to Slow Arts by 100.
Resist.PHYS-DOWN I	Boosts Skell resistance to Physical Res Down by 5.
Resist.PHYS-DOWN II	Boosts Skell resistance to Physical Res Down by 10.
Resist.PHYS-DOWN III	Boosts Skell resistance to Physical Res Down by 15.
Resist.PHYS-DOWN IV	Boosts Skell resistance to Physical Res Down by 20.
Resist.PHYS-DOWN V	Boosts Skell resistance to Physical Res Down by 25.
Resist.PHYS-DOWN VI	Boosts Skell resistance to Physical Res Down by 30.
Resist.PHYS-DOWN VII	Boosts Skell resistance to Physical Res Down by 35.
Resist.PHYS-DOWN VIII	Boosts Skell resistance to Physical Res Down by 40.
Resist.PHYS-DOWN IX	Boosts Skell resistance to Physical Res Down by 45.
Resist.PHYS-DOWN X	Boosts Skell resistance to Physical Res Down by 50.
Resist.PHYS-DOWN XI	Boosts Skell resistance to Physical Res Down by 55.
Resist.PHYS-DOWN XII	Boosts Skell resistance to Physical Res Down by 60.
Resist.PHYS-DOWN XIII	Boosts Skell resistance to Physical Res Down by 65.
Resist.PHYS-DOWN XIV	Boosts Skell resistance to Physical Res Down by 70.
Resist.PHYS-DOWN XV	Boosts Skell resistance to Physical Res Down by 75.
Resist.PHYS-DOWN XVI	Boosts Skell resistance to Physical Res Down by 80.
Resist.PHYS-DOWN XVII	Boosts Skell resistance to Physical Res Down by 85.
Resist.PHYS-DOWN XVIII	Boosts Skell resistance to Physical Res Down by 90.
Resist.PHYS-DOWN XIX	Boosts Skell resistance to Physical Res Down by 95.
Resist.PHYS-DOWN XX	Boosts Skell resistance to Physical Res Down by 100.
Resist.BEAM-DOWN I	Boosts Skell resistance to Beam Res Down by 5.
Resist.BEAM-DOWN II	Boosts Skell resistance to Beam Res Down by 10.
Resist.BEAM-DOWN III	Boosts Skell resistance to Beam Res Down by 15.
Resist.BEAM-DOWN IV	Boosts Skell resistance to Beam Res Down by 20.
Resist.BEAM-DOWN V	Boosts Skell resistance to Beam Res Down by 25.
Resist.BEAM-DOWN VI	Boosts Skell resistance to Beam Res Down by 30.
Resist.BEAM-DOWN VII	Boosts Skell resistance to Beam Res Down by 35.
Resist.BEAM-DOWN VIII	Boosts Skell resistance to Beam Res Down by 40.
Resist.BEAM-DOWN IX	Boosts Skell resistance to Beam Res Down by 45.
Resist.BEAM-DOWN X	Boosts Skell resistance to Beam Res Down by 50.
Resist.BEAM-DOWN XI	Boosts Skell resistance to Beam Res Down by 55.
Resist.BEAM-DOWN XII	Boosts Skell resistance to Beam Res Down by 60.
Resist.BEAM-DOWN XIII	Boosts Skell resistance to Beam Res Down by 65.
Resist.BEAM-DOWN XIV	Boosts Skell resistance to Beam Res Down by 70.
Resist.BEAM-DOWN XV	Boosts Skell resistance to Beam Res Down by 75.
Resist.BEAM-DOWN XVI	Boosts Skell resistance to Beam Res Down by 80.
Resist.BEAM-DOWN XVII	Boosts Skell resistance to Beam Res Down by 85.
Resist.BEAM-DOWN XVIII	Boosts Skell resistance to Beam Res Down by 90.
Resist.BEAM-DOWN XIX	Boosts Skell resistance to Beam Res Down by 95.
Resist.BEAM-DOWN XX	Boosts Skell resistance to Beam Res Down by 100.
Resist.THERM-DOWN I	Boosts Skell resistance to Thermal Res Down by 5.
Resist.THERM-DOWN II	Boosts Skell resistance to Thermal Res Down by 10.
Resist.THERM-DOWN III	Boosts Skell resistance to Thermal Res Down by 15.
Resist.THERM-DOWN IV	Boosts Skell resistance to Thermal Res Down by 20.
Resist.THERM-DOWN V	Boosts Skell resistance to Thermal Res Down by 25.
Resist.THERM-DOWN VI	Boosts Skell resistance to Thermal Res Down by 30.
Resist.THERM-DOWN VII	Boosts Skell resistance to Thermal Res Down by 35.
Resist.THERM-DOWN VIII	Boosts Skell resistance to Thermal Res Down by 40.
Resist.THERM-DOWN IX	Boosts Skell resistance to Thermal Res Down by 45.
Resist.THERM-DOWN X	Boosts Skell resistance to Thermal Res Down by 50.
Resist.THERM-DOWN XI	Boosts Skell resistance to Thermal Res Down by 55.
Resist.THERM-DOWN XII	Boosts Skell resistance to Thermal Res Down by 60.
Resist.THERM-DOWN XIII	Boosts Skell resistance to Thermal Res Down by 65.
Resist.THERM-DOWN XIV	Boosts Skell resistance to Thermal Res Down by 70.
Resist.THERM-DOWN XV	Boosts Skell resistance to Thermal Res Down by 75.
Resist.THERM-DOWN XVI	Boosts Skell resistance to Thermal Res Down by 80.
Resist.THERM-DOWN XVII	Boosts Skell resistance to Thermal Res Down by 85.
Resist.THERM-DOWN XVIII	Boosts Skell resistance to Thermal Res Down by 90.
Resist.THERM-DOWN XIX	Boosts Skell resistance to Thermal Res Down by 95.
Resist.THERM-DOWN XX	Boosts Skell resistance to Thermal Res Down by 100.
Resist.ELEC-DOWN I	Boosts Skell resistance to Electric Res Down by 5.
Resist.ELEC-DOWN II	Boosts Skell resistance to Electric Res Down by 10.
Resist.ELEC-DOWN III	Boosts Skell resistance to Electric Res Down by 15.
Resist.ELEC-DOWN IV	Boosts Skell resistance to Electric Res Down by 20.
Resist.ELEC-DOWN V	Boosts Skell resistance to Electric Res Down by 25.
Resist.ELEC-DOWN VI	Boosts Skell resistance to Electric Res Down by 30.
Resist.ELEC-DOWN VII	Boosts Skell resistance to Electric Res Down by 35.
Resist.ELEC-DOWN VIII	Boosts Skell resistance to Electric Res Down by 40.
Resist.ELEC-DOWN IX	Boosts Skell resistance to Electric Res Down by 45.
Resist.ELEC-DOWN X	Boosts Skell resistance to Electric Res Down by 50.
Resist.ELEC-DOWN XI	Boosts Skell resistance to Electric Res Down by 55.
Resist.ELEC-DOWN XII	Boosts Skell resistance to Electric Res Down by 60.
Resist.ELEC-DOWN XIII	Boosts Skell resistance to Electric Res Down by 65.
Resist.ELEC-DOWN XIV	Boosts Skell resistance to Electric Res Down by 70.
Resist.ELEC-DOWN XV	Boosts Skell resistance to Electric Res Down by 75.
Resist.ELEC-DOWN XVI	Boosts Skell resistance to Electric Res Down by 80.
Resist.ELEC-DOWN XVII	Boosts Skell resistance to Electric Res Down by 85.
Resist.ELEC-DOWN XVIII	Boosts Skell resistance to Electric Res Down by 90.
Resist.ELEC-DOWN XIX	Boosts Skell resistance to Electric Res Down by 95.
Resist.ELEC-DOWN XX	Boosts Skell resistance to Electric Res Down by 100.
Resist.ETHER-DOWN I	Boosts Skell resistance to Ether Res Down by 5.
Resist.ETHER-DOWN II	Boosts Skell resistance to Ether Res Down by 10.
Resist.ETHER-DOWN III	Boosts Skell resistance to Ether Res Down by 15.
Resist.ETHER-DOWN IV	Boosts Skell resistance to Ether Res Down by 20.
Resist.ETHER-DOWN V	Boosts Skell resistance to Ether Res Down by 25.
Resist.ETHER-DOWN VI	Boosts Skell resistance to Ether Res Down by 30.
Resist.ETHER-DOWN VII	Boosts Skell resistance to Ether Res Down by 35.
Resist.ETHER-DOWN VIII	Boosts Skell resistance to Ether Res Down by 40.
Resist.ETHER-DOWN IX	Boosts Skell resistance to Ether Res Down by 45.
Resist.ETHER-DOWN X	Boosts Skell resistance to Ether Res Down by 50.
Resist.ETHER-DOWN XI	Boosts Skell resistance to Ether Res Down by 55.
Resist.ETHER-DOWN XII	Boosts Skell resistance to Ether Res Down by 60.
Resist.ETHER-DOWN XIII	Boosts Skell resistance to Ether Res Down by 65.
Resist.ETHER-DOWN XIV	Boosts Skell resistance to Ether Res Down by 70.
Resist.ETHER-DOWN XV	Boosts Skell resistance to Ether Res Down by 75.
Resist.ETHER-DOWN XVI	Boosts Skell resistance to Ether Res Down by 80.
Resist.ETHER-DOWN XVII	Boosts Skell resistance to Ether Res Down by 85.
Resist.ETHER-DOWN XVIII	Boosts Skell resistance to Ether Res Down by 90.
Resist.ETHER-DOWN XIX	Boosts Skell resistance to Ether Res Down by 95.
Resist.ETHER-DOWN XX	Boosts Skell resistance to Ether Res Down by 100.
Resist.GRAV-DOWN I	Boosts Skell resistance to Gravity Res Down by 5.
Resist.GRAV-DOWN II	Boosts Skell resistance to Gravity Res Down by 10.
Resist.GRAV-DOWN III	Boosts Skell resistance to Gravity Res Down by 15.
Resist.GRAV-DOWN IV	Boosts Skell resistance to Gravity Res Down by 20.
Resist.GRAV-DOWN V	Boosts Skell resistance to Gravity Res Down by 25.
Resist.GRAV-DOWN VI	Boosts Skell resistance to Gravity Res Down by 30.
Resist.GRAV-DOWN VII	Boosts Skell resistance to Gravity Res Down by 35.
Resist.GRAV-DOWN VIII	Boosts Skell resistance to Gravity Res Down by 40.
Resist.GRAV-DOWN IX	Boosts Skell resistance to Gravity Res Down by 45.
Resist.GRAV-DOWN X	Boosts Skell resistance to Gravity Res Down by 50.
Resist.GRAV-DOWN XI	Boosts Skell resistance to Gravity Res Down by 55.
Resist.GRAV-DOWN XII	Boosts Skell resistance to Gravity Res Down by 60.
Resist.GRAV-DOWN XIII	Boosts Skell resistance to Gravity Res Down by 65.
Resist.GRAV-DOWN XIV	Boosts Skell resistance to Gravity Res Down by 70.
Resist.GRAV-DOWN XV	Boosts Skell resistance to Gravity Res Down by 75.
Resist.GRAV-DOWN XVI	Boosts Skell resistance to Gravity Res Down by 80.
Resist.GRAV-DOWN XVII	Boosts Skell resistance to Gravity Res Down by 85.
Resist.GRAV-DOWN XVIII	Boosts Skell resistance to Gravity Res Down by 90.
Resist.GRAV-DOWN XIX	Boosts Skell resistance to Gravity Res Down by 95.
Resist.GRAV-DOWN XX	Boosts Skell resistance to Gravity Res Down by 100.
Resist.TIME-BOMB I	Boosts Skell resistance to Time Bomb by 5.
Resist.TIME-BOMB II	Boosts Skell resistance to Time Bomb by 10.
Resist.TIME-BOMB III	Boosts Skell resistance to Time Bomb by 15.
Resist.TIME-BOMB IV	Boosts Skell resistance to Time Bomb by 20.
Resist.TIME-BOMB V	Boosts Skell resistance to Time Bomb by 25.
Resist.TIME-BOMB VI	Boosts Skell resistance to Time Bomb by 30.
Resist.TIME-BOMB VII	Boosts Skell resistance to Time Bomb by 35.
Resist.TIME-BOMB VIII	Boosts Skell resistance to Time Bomb by 40.
Resist.TIME-BOMB IX	Boosts Skell resistance to Time Bomb by 45.
Resist.TIME-BOMB X	Boosts Skell resistance to Time Bomb by 50.
Resist.TIME-BOMB XI	Boosts Skell resistance to Time Bomb by 55.
Resist.TIME-BOMB XII	Boosts Skell resistance to Time Bomb by 60.
Resist.TIME-BOMB XIII	Boosts Skell resistance to Time Bomb by 65.
Resist.TIME-BOMB XIV	Boosts Skell resistance to Time Bomb by 70.
Resist.TIME-BOMB XV	Boosts Skell resistance to Time Bomb by 75.
Resist.TIME-BOMB XVI	Boosts Skell resistance to Time Bomb by 80.
Resist.TIME-BOMB XVII	Boosts Skell resistance to Time Bomb by 85.
Resist.TIME-BOMB XVIII	Boosts Skell resistance to Time Bomb by 90.
Resist.TIME-BOMB XIX	Boosts Skell resistance to Time Bomb by 95.
Resist.TIME-BOMB XX	Boosts Skell resistance to Time Bomb by 100.
Resist.DEBUFF-DOWN I	Boosts Skell resistance to Debuff Res Down by 5.
Resist.DEBUFF-DOWN II	Boosts Skell resistance to Debuff Res Down by 10.
Resist.DEBUFF-DOWN III	Boosts Skell resistance to Debuff Res Down by 15.
Resist.DEBUFF-DOWN IV	Boosts Skell resistance to Debuff Res Down by 20.
Resist.DEBUFF-DOWN V	Boosts Skell resistance to Debuff Res Down by 25.
Resist.DEBUFF-DOWN VI	Boosts Skell resistance to Debuff Res Down by 30.
Resist.DEBUFF-DOWN VII	Boosts Skell resistance to Debuff Res Down by 35.
Resist.DEBUFF-DOWN VIII	Boosts Skell resistance to Debuff Res Down by 40.
Resist.DEBUFF-DOWN IX	Boosts Skell resistance to Debuff Res Down by 45.
Resist.DEBUFF-DOWN X	Boosts Skell resistance to Debuff Res Down by 50.
Resist.DEBUFF-DOWN XI	Boosts Skell resistance to Debuff Res Down by 55.
Resist.DEBUFF-DOWN XII	Boosts Skell resistance to Debuff Res Down by 60.
Resist.DEBUFF-DOWN XIII	Boosts Skell resistance to Debuff Res Down by 65.
Resist.DEBUFF-DOWN XIV	Boosts Skell resistance to Debuff Res Down by 70.
Resist.DEBUFF-DOWN XV	Boosts Skell resistance to Debuff Res Down by 75.
Resist.DEBUFF-DOWN XVI	Boosts Skell resistance to Debuff Res Down by 80.
Resist.DEBUFF-DOWN XVII	Boosts Skell resistance to Debuff Res Down by 85.
Resist.DEBUFF-DOWN XVIII	Boosts Skell resistance to Debuff Res Down by 90.
Resist.DEBUFF-DOWN XIX	Boosts Skell resistance to Debuff Res Down by 95.
Resist.DEBUFF-DOWN XX	Boosts Skell resistance to Debuff Res Down by 100.
Resist.RECOV-DOWN I	Boosts Skell resistance to HP Recovery Down by 5.
Resist.RECOV-DOWN II	Boosts Skell resistance to HP Recovery Down by 10.
Resist.RECOV-DOWN III	Boosts Skell resistance to HP Recovery Down by 15.
Resist.RECOV-DOWN IV	Boosts Skell resistance to HP Recovery Down by 20.
Resist.RECOV-DOWN V	Boosts Skell resistance to HP Recovery Down by 25.
Resist.RECOV-DOWN VI	Boosts Skell resistance to HP Recovery Down by 30.
Resist.RECOV-DOWN VII	Boosts Skell resistance to HP Recovery Down by 35.
Resist.RECOV-DOWN VIII	Boosts Skell resistance to HP Recovery Down by 40.
Resist.RECOV-DOWN IX	Boosts Skell resistance to HP Recovery Down by 45.
Resist.RECOV-DOWN X	Boosts Skell resistance to HP Recovery Down by 50.
Resist.RECOV-DOWN XI	Boosts Skell resistance to HP Recovery Down by 55.
Resist.RECOV-DOWN XII	Boosts Skell resistance to HP Recovery Down by 60.
Resist.RECOV-DOWN XIII	Boosts Skell resistance to HP Recovery Down by 65.
Resist.RECOV-DOWN XIV	Boosts Skell resistance to HP Recovery Down by 70.
Resist.RECOV-DOWN XV	Boosts Skell resistance to HP Recovery Down by 75.
Resist.RECOV-DOWN XVI	Boosts Skell resistance to HP Recovery Down by 80.
Resist.RECOV-DOWN XVII	Boosts Skell resistance to HP Recovery Down by 85.
Resist.RECOV-DOWN XVIII	Boosts Skell resistance to HP Recovery Down by 90.
Resist.RECOV-DOWN XIX	Boosts Skell resistance to HP Recovery Down by 95.
Resist.RECOV-DOWN XX	Boosts Skell resistance to HP Recovery Down by 100.
Resist.BLAZE I	Boosts Skell resistance to Blaze by 5.
Resist.BLAZE II	Boosts Skell resistance to Blaze by 10.
Resist.BLAZE III	Boosts Skell resistance to Blaze by 15.
Resist.BLAZE IV	Boosts Skell resistance to Blaze by 20.
Resist.BLAZE V	Boosts Skell resistance to Blaze by 25.
Resist.BLAZE VI	Boosts Skell resistance to Blaze by 30.
Resist.BLAZE VII	Boosts Skell resistance to Blaze by 35.
Resist.BLAZE VIII	Boosts Skell resistance to Blaze by 40.
Resist.BLAZE IX	Boosts Skell resistance to Blaze by 45.
Resist.BLAZE X	Boosts Skell resistance to Blaze by 50.
Resist.BLAZE XI	Boosts Skell resistance to Blaze by 55.
Resist.BLAZE XII	Boosts Skell resistance to Blaze by 60.
Resist.BLAZE XIII	Boosts Skell resistance to Blaze by 65.
Resist.BLAZE XIV	Boosts Skell resistance to Blaze by 70.
Resist.BLAZE XV	Boosts Skell resistance to Blaze by 75.
Resist.BLAZE XVI	Boosts Skell resistance to Blaze by 80.
Resist.BLAZE XVII	Boosts Skell resistance to Blaze by 85.
Resist.BLAZE XVIII	Boosts Skell resistance to Blaze by 90.
Resist.BLAZE XIX	Boosts Skell resistance to Blaze by 95.
Resist.BLAZE XX	Boosts Skell resistance to Blaze by 100.
Resist.SHOCK I	Boosts Skell resistance to Shock by 5.
Resist.SHOCK II	Boosts Skell resistance to Shock by 10.
Resist.SHOCK III	Boosts Skell resistance to Shock by 15.
Resist.SHOCK IV	Boosts Skell resistance to Shock by 20.
Resist.SHOCK V	Boosts Skell resistance to Shock by 25.
Resist.SHOCK VI	Boosts Skell resistance to Shock by 30.
Resist.SHOCK VII	Boosts Skell resistance to Shock by 35.
Resist.SHOCK VIII	Boosts Skell resistance to Shock by 40.
Resist.SHOCK IX	Boosts Skell resistance to Shock by 45.
Resist.SHOCK X	Boosts Skell resistance to Shock by 50.
Resist.SHOCK XI	Boosts Skell resistance to Shock by 55.
Resist.SHOCK XII	Boosts Skell resistance to Shock by 60.
Resist.SHOCK XIII	Boosts Skell resistance to Shock by 65.
Resist.SHOCK XIV	Boosts Skell resistance to Shock by 70.
Resist.SHOCK XV	Boosts Skell resistance to Shock by 75.
Resist.SHOCK XVI	Boosts Skell resistance to Shock by 80.
Resist.SHOCK XVII	Boosts Skell resistance to Shock by 85.
Resist.SHOCK XVIII	Boosts Skell resistance to Shock by 90.
Resist.SHOCK XIX	Boosts Skell resistance to Shock by 95.
Resist.SHOCK XX	Boosts Skell resistance to Shock by 100.
CutTime.DEBUFF I	Reduces the duration of debuffs your Skell incurs by 5%.
CutTime.DEBUFF II	Reduces the duration of debuffs your Skell incurs by 6%.
CutTime.DEBUFF III	Reduces the duration of debuffs your Skell incurs by 7%.
CutTime.DEBUFF IV	Reduces the duration of debuffs your Skell incurs by 8%.
CutTime.DEBUFF V	Reduces the duration of debuffs your Skell incurs by 9%.
CutTime.DEBUFF VI	Reduces the duration of debuffs your Skell incurs by 10%.
CutTime.DEBUFF VII	Reduces the duration of debuffs your Skell incurs by 11%.
CutTime.DEBUFF VIII	Reduces the duration of debuffs your Skell incurs by 12%.
CutTime.DEBUFF IX	Reduces the duration of debuffs your Skell incurs by 13%.
CutTime.DEBUFF X	Reduces the duration of debuffs your Skell incurs by 14%.
CutTime.DEBUFF XI	Reduces the duration of debuffs your Skell incurs by 16%.
CutTime.DEBUFF XII	Reduces the duration of debuffs your Skell incurs by 17%.
CutTime.DEBUFF XIII	Reduces the duration of debuffs your Skell incurs by 18%.
CutTime.DEBUFF XIV	Reduces the duration of debuffs your Skell incurs by 19%.
CutTime.DEBUFF XV	Reduces the duration of debuffs your Skell incurs by 20%.
CutTime.DEBUFF XVI	Reduces the duration of debuffs your Skell incurs by 21%.
CutTime.DEBUFF XVII	Reduces the duration of debuffs your Skell incurs by 22%.
CutTime.DEBUFF XVIII	Reduces the duration of debuffs your Skell incurs by 23%.
CutTime.DEBUFF XIX	Reduces the duration of debuffs your Skell incurs by 24%.
CutTime.DEBUFF XX	Reduces the duration of debuffs your Skell incurs by 25%.
CriticalUp I	Boosts Skell critical chance by 1.
CriticalUp II	Boosts Skell critical chance by 2.
CriticalUp III	Boosts Skell critical chance by 3.
CriticalUp IV	Boosts Skell critical chance by 4.
CriticalUp V	Boosts Skell critical chance by 5.
CriticalUp VI	Boosts Skell critical chance by 6.
CriticalUp VII	Boosts Skell critical chance by 7.
CriticalUp VIII	Boosts Skell critical chance by 8.
CriticalUp IX	Boosts Skell critical chance by 9.
CriticalUp X	Boosts Skell critical chance by 10.
CriticalUp XI	Boosts Skell critical chance by 11.
CriticalUp XII	Boosts Skell critical chance by 12.
CriticalUp XIII	Boosts Skell critical chance by 13.
CriticalUp XIV	Boosts Skell critical chance by 14.
CriticalUp XV	Boosts Skell critical chance by 15.
CriticalUp XVI	Boosts Skell critical chance by 16.
CriticalUp XVII	Boosts Skell critical chance by 17.
CriticalUp XVIII	Boosts Skell critical chance by 18.
CriticalUp XIX	Boosts Skell critical chance by 19.
CriticalUp XX	Boosts Skell critical chance by 20.
CritUp.THEROID I	Boosts Skell critical chance against theroid enemies by 1.
CritUp.THEROID II	Boosts Skell critical chance against theroid enemies by 2.
CritUp.THEROID III	Boosts Skell critical chance against theroid enemies by 3.
CritUp.THEROID IV	Boosts Skell critical chance against theroid enemies by 4.
CritUp.THEROID V	Boosts Skell critical chance against theroid enemies by 5.
CritUp.THEROID VI	Boosts Skell critical chance against theroid enemies by 6.
CritUp.THEROID VII	Boosts Skell critical chance against theroid enemies by 7.
CritUp.THEROID VIII	Boosts Skell critical chance against theroid enemies by 8.
CritUp.THEROID IX	Boosts Skell critical chance against theroid enemies by 9.
CritUp.THEROID X	Boosts Skell critical chance against theroid enemies by 10.
CritUp.THEROID XI	Boosts Skell critical chance against theroid enemies by 11.
CritUp.THEROID XII	Boosts Skell critical chance against theroid enemies by 12.
CritUp.THEROID XIII	Boosts Skell critical chance against theroid enemies by 13.
CritUp.THEROID XIV	Boosts Skell critical chance against theroid enemies by 14.
CritUp.THEROID XV	Boosts Skell critical chance against theroid enemies by 15.
CritUp.THEROID XVI	Boosts Skell critical chance against theroid enemies by 16.
CritUp.THEROID XVII	Boosts Skell critical chance against theroid enemies by 17.
CritUp.THEROID XVIII	Boosts Skell critical chance against theroid enemies by 18.
CritUp.THEROID XIX	Boosts Skell critical chance against theroid enemies by 19.
CritUp.THEROID XX	Boosts Skell critical chance against theroid enemies by 20.
CritUp.INSECTOID I	Boosts Skell critical chance against insectoid enemies by 1.
CritUp.INSECTOID II	Boosts Skell critical chance against insectoid enemies by 2.
CritUp.INSECTOID III	Boosts Skell critical chance against insectoid enemies by 3.
CritUp.INSECTOID IV	Boosts Skell critical chance against insectoid enemies by 4.
CritUp.INSECTOID V	Boosts Skell critical chance against insectoid enemies by 5.
CritUp.INSECTOID VI	Boosts Skell critical chance against insectoid enemies by 6.
CritUp.INSECTOID VII	Boosts Skell critical chance against insectoid enemies by 7.
CritUp.INSECTOID VIII	Boosts Skell critical chance against insectoid enemies by 8.
CritUp.INSECTOID IX	Boosts Skell critical chance against insectoid enemies by 9.
CritUp.INSECTOID X	Boosts Skell critical chance against insectoid enemies by 10.
CritUp.INSECTOID XI	Boosts Skell critical chance against insectoid enemies by 11.
CritUp.INSECTOID XII	Boosts Skell critical chance against insectoid enemies by 12.
CritUp.INSECTOID XIII	Boosts Skell critical chance against insectoid enemies by 13.
CritUp.INSECTOID XIV	Boosts Skell critical chance against insectoid enemies by 14.
CritUp.INSECTOID XV	Boosts Skell critical chance against insectoid enemies by 15.
CritUp.INSECTOID XVI	Boosts Skell critical chance against insectoid enemies by 16.
CritUp.INSECTOID XVII	Boosts Skell critical chance against insectoid enemies by 17.
CritUp.INSECTOID XVIII	Boosts Skell critical chance against insectoid enemies by 18.
CritUp.INSECTOID XIX	Boosts Skell critical chance against insectoid enemies by 19.
CritUp.INSECTOID XX	Boosts Skell critical chance against insectoid enemies by 20.
CritUp.PISCINOID I	Boosts Skell critical chance against piscinoid enemies by 1.
CritUp.PISCINOID II	Boosts Skell critical chance against piscinoid enemies by 2.
CritUp.PISCINOID III	Boosts Skell critical chance against piscinoid enemies by 3.
CritUp.PISCINOID IV	Boosts Skell critical chance against piscinoid enemies by 4.
CritUp.PISCINOID V	Boosts Skell critical chance against piscinoid enemies by 5.
CritUp.PISCINOID VI	Boosts Skell critical chance against piscinoid enemies by 6.
CritUp.PISCINOID VII	Boosts Skell critical chance against piscinoid enemies by 7.
CritUp.PISCINOID VIII	Boosts Skell critical chance against piscinoid enemies by 8.
CritUp.PISCINOID IX	Boosts Skell critical chance against piscinoid enemies by 9.
CritUp.PISCINOID X	Boosts Skell critical chance against piscinoid enemies by 10.
CritUp.PISCINOID XI	Boosts Skell critical chance against piscinoid enemies by 11.
CritUp.PISCINOID XII	Boosts Skell critical chance against piscinoid enemies by 12.
CritUp.PISCINOID XIII	Boosts Skell critical chance against piscinoid enemies by 13.
CritUp.PISCINOID XIV	Boosts Skell critical chance against piscinoid enemies by 14.
CritUp.PISCINOID XV	Boosts Skell critical chance against piscinoid enemies by 15.
CritUp.PISCINOID XVI	Boosts Skell critical chance against piscinoid enemies by 16.
CritUp.PISCINOID XVII	Boosts Skell critical chance against piscinoid enemies by 17.
CritUp.PISCINOID XVIII	Boosts Skell critical chance against piscinoid enemies by 18.
CritUp.PISCINOID XIX	Boosts Skell critical chance against piscinoid enemies by 19.
CritUp.PISCINOID XX	Boosts Skell critical chance against piscinoid enemies by 20.
CritUp.HUMANOID I	Boosts Skell critical chance against humanoid enemies by 1.
CritUp.HUMANOID II	Boosts Skell critical chance against humanoid enemies by 2.
CritUp.HUMANOID III	Boosts Skell critical chance against humanoid enemies by 3.
CritUp.HUMANOID IV	Boosts Skell critical chance against humanoid enemies by 4.
CritUp.HUMANOID V	Boosts Skell critical chance against humanoid enemies by 5.
CritUp.HUMANOID VI	Boosts Skell critical chance against humanoid enemies by 6.
CritUp.HUMANOID VII	Boosts Skell critical chance against humanoid enemies by 7.
CritUp.HUMANOID VIII	Boosts Skell critical chance against humanoid enemies by 8.
CritUp.HUMANOID IX	Boosts Skell critical chance against humanoid enemies by 9.
CritUp.HUMANOID X	Boosts Skell critical chance against humanoid enemies by 10.
CritUp.HUMANOID XI	Boosts Skell critical chance against humanoid enemies by 11.
CritUp.HUMANOID XII	Boosts Skell critical chance against humanoid enemies by 12.
CritUp.HUMANOID XIII	Boosts Skell critical chance against humanoid enemies by 13.
CritUp.HUMANOID XIV	Boosts Skell critical chance against humanoid enemies by 14.
CritUp.HUMANOID XV	Boosts Skell critical chance against humanoid enemies by 15.
CritUp.HUMANOID XVI	Boosts Skell critical chance against humanoid enemies by 16.
CritUp.HUMANOID XVII	Boosts Skell critical chance against humanoid enemies by 17.
CritUp.HUMANOID XVIII	Boosts Skell critical chance against humanoid enemies by 18.
CritUp.HUMANOID XIX	Boosts Skell critical chance against humanoid enemies by 19.
CritUp.HUMANOID XX	Boosts Skell critical chance against humanoid enemies by 20.
CritUp.MECHANOID I	Boosts Skell critical chance against mechanoid enemies by 1.
CritUp.MECHANOID II	Boosts Skell critical chance against mechanoid enemies by 2.
CritUp.MECHANOID III	Boosts Skell critical chance against mechanoid enemies by 3.
CritUp.MECHANOID IV	Boosts Skell critical chance against mechanoid enemies by 4.
CritUp.MECHANOID V	Boosts Skell critical chance against mechanoid enemies by 5.
CritUp.MECHANOID VI	Boosts Skell critical chance against mechanoid enemies by 6.
CritUp.MECHANOID VII	Boosts Skell critical chance against mechanoid enemies by 7.
CritUp.MECHANOID VIII	Boosts Skell critical chance against mechanoid enemies by 8.
CritUp.MECHANOID IX	Boosts Skell critical chance against mechanoid enemies by 9.
CritUp.MECHANOID X	Boosts Skell critical chance against mechanoid enemies by 10.
CritUp.MECHANOID XI	Boosts Skell critical chance against mechanoid enemies by 11.
CritUp.MECHANOID XII	Boosts Skell critical chance against mechanoid enemies by 12.
CritUp.MECHANOID XIII	Boosts Skell critical chance against mechanoid enemies by 13.
CritUp.MECHANOID XIV	Boosts Skell critical chance against mechanoid enemies by 14.
CritUp.MECHANOID XV	Boosts Skell critical chance against mechanoid enemies by 15.
CritUp.MECHANOID XVI	Boosts Skell critical chance against mechanoid enemies by 16.
CritUp.MECHANOID XVII	Boosts Skell critical chance against mechanoid enemies by 17.
CritUp.MECHANOID XVIII	Boosts Skell critical chance against mechanoid enemies by 18.
CritUp.MECHANOID XIX	Boosts Skell critical chance against mechanoid enemies by 19.
CritUp.MECHANOID XX	Boosts Skell critical chance against mechanoid enemies by 20.
CritUp.CHIMEROID I	Boosts Skell critical chance against chimeroid enemies by 1.
CritUp.CHIMEROID II	Boosts Skell critical chance against chimeroid enemies by 2.
CritUp.CHIMEROID III	Boosts Skell critical chance against chimeroid enemies by 3.
CritUp.CHIMEROID IV	Boosts Skell critical chance against chimeroid enemies by 4.
CritUp.CHIMEROID V	Boosts Skell critical chance against chimeroid enemies by 5.
CritUp.CHIMEROID VI	Boosts Skell critical chance against chimeroid enemies by 6.
CritUp.CHIMEROID VII	Boosts Skell critical chance against chimeroid enemies by 7.
CritUp.CHIMEROID VIII	Boosts Skell critical chance against chimeroid enemies by 8.
CritUp.CHIMEROID IX	Boosts Skell critical chance against chimeroid enemies by 9.
CritUp.CHIMEROID X	Boosts Skell critical chance against chimeroid enemies by 10.
CritUp.CHIMEROID XI	Boosts Skell critical chance against chimeroid enemies by 11.
CritUp.CHIMEROID XII	Boosts Skell critical chance against chimeroid enemies by 12.
CritUp.CHIMEROID XIII	Boosts Skell critical chance against chimeroid enemies by 13.
CritUp.CHIMEROID XIV	Boosts Skell critical chance against chimeroid enemies by 14.
CritUp.CHIMEROID XV	Boosts Skell critical chance against chimeroid enemies by 15.
CritUp.CHIMEROID XVI	Boosts Skell critical chance against chimeroid enemies by 16.
CritUp.CHIMEROID XVII	Boosts Skell critical chance against chimeroid enemies by 17.
CritUp.CHIMEROID XVIII	Boosts Skell critical chance against chimeroid enemies by 18.
CritUp.CHIMEROID XIX	Boosts Skell critical chance against chimeroid enemies by 19.
CritUp.CHIMEROID XX	Boosts Skell critical chance against chimeroid enemies by 20.
CritUp.ULTRAFAUNA I	Boosts Skell critical chance against ultrafauna enemies by 1.
CritUp.ULTRAFAUNA II	Boosts Skell critical chance against ultrafauna enemies by 2.
CritUp.ULTRAFAUNA III	Boosts Skell critical chance against ultrafauna enemies by 3.
CritUp.ULTRAFAUNA IV	Boosts Skell critical chance against ultrafauna enemies by 4.
CritUp.ULTRAFAUNA V	Boosts Skell critical chance against ultrafauna enemies by 5.
CritUp.ULTRAFAUNA VI	Boosts Skell critical chance against ultrafauna enemies by 6.
CritUp.ULTRAFAUNA VII	Boosts Skell critical chance against ultrafauna enemies by 7.
CritUp.ULTRAFAUNA VIII	Boosts Skell critical chance against ultrafauna enemies by 8.
CritUp.ULTRAFAUNA IX	Boosts Skell critical chance against ultrafauna enemies by 9.
CritUp.ULTRAFAUNA X	Boosts Skell critical chance against ultrafauna enemies by 10.
CritUp.ULTRAFAUNA XI	Boosts Skell critical chance against ultrafauna enemies by 11.
CritUp.ULTRAFAUNA XII	Boosts Skell critical chance against ultrafauna enemies by 12.
CritUp.ULTRAFAUNA XIII	Boosts Skell critical chance against ultrafauna enemies by 13.
CritUp.ULTRAFAUNA XIV	Boosts Skell critical chance against ultrafauna enemies by 14.
CritUp.ULTRAFAUNA XV	Boosts Skell critical chance against ultrafauna enemies by 15.
CritUp.ULTRAFAUNA XVI	Boosts Skell critical chance against ultrafauna enemies by 16.
CritUp.ULTRAFAUNA XVII	Boosts Skell critical chance against ultrafauna enemies by 17.
CritUp.ULTRAFAUNA XVIII	Boosts Skell critical chance against ultrafauna enemies by 18.
CritUp.ULTRAFAUNA XIX	Boosts Skell critical chance against ultrafauna enemies by 19.
CritUp.ULTRAFAUNA XX	Boosts Skell critical chance against ultrafauna enemies by 20.
Slayer.THEROID I	Boosts Skell damage to theroid enemies by 2%.
Slayer.THEROID II	Boosts Skell damage to theroid enemies by 4%.
Slayer.THEROID III	Boosts Skell damage to theroid enemies by 6%.
Slayer.THEROID IV	Boosts Skell damage to theroid enemies by 8%.
Slayer.THEROID V	Boosts Skell damage to theroid enemies by 10%.
Slayer.THEROID VI	Boosts Skell damage to theroid enemies by 12%.
Slayer.THEROID VII	Boosts Skell damage to theroid enemies by 14%.
Slayer.THEROID VIII	Boosts Skell damage to theroid enemies by 16%.
Slayer.THEROID IX	Boosts Skell damage to theroid enemies by 18%.
Slayer.THEROID X	Boosts Skell damage to theroid enemies by 20%.
Slayer.THEROID XI	Boosts Skell damage to theroid enemies by 22%.
Slayer.THEROID XII	Boosts Skell damage to theroid enemies by 24%.
Slayer.THEROID XIII	Boosts Skell damage to theroid enemies by 26%.
Slayer.THEROID XIV	Boosts Skell damage to theroid enemies by 28%.
Slayer.THEROID XV	Boosts Skell damage to theroid enemies by 30%.
Slayer.THEROID XVI	Boosts Skell damage to theroid enemies by 32%.
Slayer.THEROID XVII	Boosts Skell damage to theroid enemies by 34%.
Slayer.THEROID XVIII	Boosts Skell damage to theroid enemies by 36%.
Slayer.THEROID XIX	Boosts Skell damage to theroid enemies by 38%.
Slayer.THEROID XX	Boosts Skell damage to theroid enemies by 40%.
Slayer.INSECTOID I	Boosts Skell damage to insectoid enemies by 2%.
Slayer.INSECTOID II	Boosts Skell damage to insectoid enemies by 4%.
Slayer.INSECTOID III	Boosts Skell damage to insectoid enemies by 6%.
Slayer.INSECTOID IV	Boosts Skell damage to insectoid enemies by 8%.
Slayer.INSECTOID V	Boosts Skell damage to insectoid enemies by 10%.
Slayer.INSECTOID VI	Boosts Skell damage to insectoid enemies by 12%.
Slayer.INSECTOID VII	Boosts Skell damage to insectoid enemies by 14%.
Slayer.INSECTOID VIII	Boosts Skell damage to insectoid enemies by 16%.
Slayer.INSECTOID IX	Boosts Skell damage to insectoid enemies by 18%.
Slayer.INSECTOID X	Boosts Skell damage to insectoid enemies by 20%.
Slayer.INSECTOID XI	Boosts Skell damage to insectoid enemies by 22%.
Slayer.INSECTOID XII	Boosts Skell damage to insectoid enemies by 24%.
Slayer.INSECTOID XIII	Boosts Skell damage to insectoid enemies by 26%.
Slayer.INSECTOID XIV	Boosts Skell damage to insectoid enemies by 28%.
Slayer.INSECTOID XV	Boosts Skell damage to insectoid enemies by 30%.
Slayer.INSECTOID XVI	Boosts Skell damage to insectoid enemies by 32%.
Slayer.INSECTOID XVII	Boosts Skell damage to insectoid enemies by 34%.
Slayer.INSECTOID XVIII	Boosts Skell damage to insectoid enemies by 36%.
Slayer.INSECTOID XIX	Boosts Skell damage to insectoid enemies by 38%.
Slayer.INSECTOID XX	Boosts Skell damage to insectoid enemies by 40%.
Slayer.PISCINOID I	Boosts Skell damage to piscinoid enemies by 2%.
Slayer.PISCINOID II	Boosts Skell damage to piscinoid enemies by 4%.
Slayer.PISCINOID III	Boosts Skell damage to piscinoid enemies by 6%.
Slayer.PISCINOID IV	Boosts Skell damage to piscinoid enemies by 8%.
Slayer.PISCINOID V	Boosts Skell damage to piscinoid enemies by 10%.
Slayer.PISCINOID VI	Boosts Skell damage to piscinoid enemies by 12%.
Slayer.PISCINOID VII	Boosts Skell damage to piscinoid enemies by 14%.
Slayer.PISCINOID VIII	Boosts Skell damage to piscinoid enemies by 16%.
Slayer.PISCINOID IX	Boosts Skell damage to piscinoid enemies by 18%.
Slayer.PISCINOID X	Boosts Skell damage to piscinoid enemies by 20%.
Slayer.PISCINOID XI	Boosts Skell damage to piscinoid enemies by 22%.
Slayer.PISCINOID XII	Boosts Skell damage to piscinoid enemies by 24%.
Slayer.PISCINOID XIII	Boosts Skell damage to piscinoid enemies by 26%.
Slayer.PISCINOID XIV	Boosts Skell damage to piscinoid enemies by 28%.
Slayer.PISCINOID XV	Boosts Skell damage to piscinoid enemies by 30%.
Slayer.PISCINOID XVI	Boosts Skell damage to piscinoid enemies by 32%.
Slayer.PISCINOID XVII	Boosts Skell damage to piscinoid enemies by 34%.
Slayer.PISCINOID XVIII	Boosts Skell damage to piscinoid enemies by 36%.
Slayer.PISCINOID XIX	Boosts Skell damage to piscinoid enemies by 38%.
Slayer.PISCINOID XX	Boosts Skell damage to piscinoid enemies by 40%.
Slayer.HUMANOID I	Boosts Skell damage to humanoid enemies by 2%.
Slayer.HUMANOID II	Boosts Skell damage to humanoid enemies by 4%.
Slayer.HUMANOID III	Boosts Skell damage to humanoid enemies by 6%.
Slayer.HUMANOID IV	Boosts Skell damage to humanoid enemies by 8%.
Slayer.HUMANOID V	Boosts Skell damage to humanoid enemies by 10%.
Slayer.HUMANOID VI	Boosts Skell damage to humanoid enemies by 12%.
Slayer.HUMANOID VII	Boosts Skell damage to humanoid enemies by 14%.
Slayer.HUMANOID VIII	Boosts Skell damage to humanoid enemies by 16%.
Slayer.HUMANOID IX	Boosts Skell damage to humanoid enemies by 18%.
Slayer.HUMANOID X	Boosts Skell damage to humanoid enemies by 20%.
Slayer.HUMANOID XI	Boosts Skell damage to humanoid enemies by 22%.
Slayer.HUMANOID XII	Boosts Skell damage to humanoid enemies by 24%.
Slayer.HUMANOID XIII	Boosts Skell damage to humanoid enemies by 26%.
Slayer.HUMANOID XIV	Boosts Skell damage to humanoid enemies by 28%.
Slayer.HUMANOID XV	Boosts Skell damage to humanoid enemies by 30%.
Slayer.HUMANOID XVI	Boosts Skell damage to humanoid enemies by 32%.
Slayer.HUMANOID XVII	Boosts Skell damage to humanoid enemies by 34%.
Slayer.HUMANOID XVIII	Boosts Skell damage to humanoid enemies by 36%.
Slayer.HUMANOID XIX	Boosts Skell damage to humanoid enemies by 38%.
Slayer.HUMANOID XX	Boosts Skell damage to humanoid enemies by 40%.
Slayer.MECHANOID I	Boosts Skell damage to mechanoid enemies by 2%.
Slayer.MECHANOID II	Boosts Skell damage to mechanoid enemies by 4%.
Slayer.MECHANOID III	Boosts Skell damage to mechanoid enemies by 6%.
Slayer.MECHANOID IV	Boosts Skell damage to mechanoid enemies by 8%.
Slayer.MECHANOID V	Boosts Skell damage to mechanoid enemies by 10%.
Slayer.MECHANOID VI	Boosts Skell damage to mechanoid enemies by 12%.
Slayer.MECHANOID VII	Boosts Skell damage to mechanoid enemies by 14%.
Slayer.MECHANOID VIII	Boosts Skell damage to mechanoid enemies by 16%.
Slayer.MECHANOID IX	Boosts Skell damage to mechanoid enemies by 18%.
Slayer.MECHANOID X	Boosts Skell damage to mechanoid enemies by 20%.
Slayer.MECHANOID XI	Boosts Skell damage to mechanoid enemies by 22%.
Slayer.MECHANOID XII	Boosts Skell damage to mechanoid enemies by 24%.
Slayer.MECHANOID XIII	Boosts Skell damage to mechanoid enemies by 26%.
Slayer.MECHANOID XIV	Boosts Skell damage to mechanoid enemies by 28%.
Slayer.MECHANOID XV	Boosts Skell damage to mechanoid enemies by 30%.
Slayer.MECHANOID XVI	Boosts Skell damage to mechanoid enemies by 32%.
Slayer.MECHANOID XVII	Boosts Skell damage to mechanoid enemies by 34%.
Slayer.MECHANOID XVIII	Boosts Skell damage to mechanoid enemies by 36%.
Slayer.MECHANOID XIX	Boosts Skell damage to mechanoid enemies by 38%.
Slayer.MECHANOID XX	Boosts Skell damage to mechanoid enemies by 40%.
Slayer.CHIMEROID I	Boosts Skell damage to chimeroid enemies by 2%.
Slayer.CHIMEROID II	Boosts Skell damage to chimeroid enemies by 4%.
Slayer.CHIMEROID III	Boosts Skell damage to chimeroid enemies by 6%.
Slayer.CHIMEROID IV	Boosts Skell damage to chimeroid enemies by 8%.
Slayer.CHIMEROID V	Boosts Skell damage to chimeroid enemies by 10%.
Slayer.CHIMEROID VI	Boosts Skell damage to chimeroid enemies by 12%.
Slayer.CHIMEROID VII	Boosts Skell damage to chimeroid enemies by 14%.
Slayer.CHIMEROID VIII	Boosts Skell damage to chimeroid enemies by 16%.
Slayer.CHIMEROID IX	Boosts Skell damage to chimeroid enemies by 18%.
Slayer.CHIMEROID X	Boosts Skell damage to chimeroid enemies by 20%.
Slayer.CHIMEROID XI	Boosts Skell damage to chimeroid enemies by 22%.
Slayer.CHIMEROID XII	Boosts Skell damage to chimeroid enemies by 24%.
Slayer.CHIMEROID XIII	Boosts Skell damage to chimeroid enemies by 26%.
Slayer.CHIMEROID XIV	Boosts Skell damage to chimeroid enemies by 28%.
Slayer.CHIMEROID XV	Boosts Skell damage to chimeroid enemies by 30%.
Slayer.CHIMEROID XVI	Boosts Skell damage to chimeroid enemies by 32%.
Slayer.CHIMEROID XVII	Boosts Skell damage to chimeroid enemies by 34%.
Slayer.CHIMEROID XVIII	Boosts Skell damage to chimeroid enemies by 36%.
Slayer.CHIMEROID XIX	Boosts Skell damage to chimeroid enemies by 38%.
Slayer.CHIMEROID XX	Boosts Skell damage to chimeroid enemies by 40%.
Slayer.ULTRAFAUNA I	Boosts Skell damage to ultrafauna enemies by 2%.
Slayer.ULTRAFAUNA II	Boosts Skell damage to ultrafauna enemies by 4%.
Slayer.ULTRAFAUNA III	Boosts Skell damage to ultrafauna enemies by 6%.
Slayer.ULTRAFAUNA IV	Boosts Skell damage to ultrafauna enemies by 8%.
Slayer.ULTRAFAUNA V	Boosts Skell damage to ultrafauna enemies by 10%.
Slayer.ULTRAFAUNA VI	Boosts Skell damage to ultrafauna enemies by 12%.
Slayer.ULTRAFAUNA VII	Boosts Skell damage to ultrafauna enemies by 14%.
Slayer.ULTRAFAUNA VIII	Boosts Skell damage to ultrafauna enemies by 16%.
Slayer.ULTRAFAUNA IX	Boosts Skell damage to ultrafauna enemies by 18%.
Slayer.ULTRAFAUNA X	Boosts Skell damage to ultrafauna enemies by 20%.
Slayer.ULTRAFAUNA XI	Boosts Skell damage to ultrafauna enemies by 22%.
Slayer.ULTRAFAUNA XII	Boosts Skell damage to ultrafauna enemies by 24%.
Slayer.ULTRAFAUNA XIII	Boosts Skell damage to ultrafauna enemies by 26%.
Slayer.ULTRAFAUNA XIV	Boosts Skell damage to ultrafauna enemies by 28%.
Slayer.ULTRAFAUNA XV	Boosts Skell damage to ultrafauna enemies by 30%.
Slayer.ULTRAFAUNA XVI	Boosts Skell damage to ultrafauna enemies by 32%.
Slayer.ULTRAFAUNA XVII	Boosts Skell damage to ultrafauna enemies by 34%.
Slayer.ULTRAFAUNA XVIII	Boosts Skell damage to ultrafauna enemies by 36%.
Slayer.ULTRAFAUNA XIX	Boosts Skell damage to ultrafauna enemies by 38%.
Slayer.ULTRAFAUNA XX	Boosts Skell damage to ultrafauna enemies by 40%.
AttributeDmg.PHYS I	Boosts Skell physical damage by 10%.
AttributeDmg.PHYS II	Boosts Skell physical damage by 12%.
AttributeDmg.PHYS III	Boosts Skell physical damage by 14%.
AttributeDmg.PHYS IV	Boosts Skell physical damage by 16%.
AttributeDmg.PHYS V	Boosts Skell physical damage by 18%.
AttributeDmg.PHYS VI	Boosts Skell physical damage by 20%.
AttributeDmg.PHYS VII	Boosts Skell physical damage by 22%.
AttributeDmg.PHYS VIII	Boosts Skell physical damage by 24%.
AttributeDmg.PHYS IX	Boosts Skell physical damage by 26%.
AttributeDmg.PHYS X	Boosts Skell physical damage by 28%.
AttributeDmg.PHYS XI	Boosts Skell physical damage by 30%.
AttributeDmg.PHYS XII	Boosts Skell physical damage by 32%.
AttributeDmg.PHYS XIII	Boosts Skell physical damage by 34%.
AttributeDmg.PHYS XIV	Boosts Skell physical damage by 36%.
AttributeDmg.PHYS XV	Boosts Skell physical damage by 38%.
AttributeDmg.PHYS XVI	Boosts Skell physical damage by 40%.
AttributeDmg.PHYS XVII	Boosts Skell physical damage by 42%.
AttributeDmg.PHYS XVIII	Boosts Skell physical damage by 44%.
AttributeDmg.PHYS XIX	Boosts Skell physical damage by 46%.
AttributeDmg.PHYS XX	Boosts Skell physical damage by 50%.
AttributeDmg.BEAM I	Boosts Skell beam damage by 10%.
AttributeDmg.BEAM II	Boosts Skell beam damage by 12%.
AttributeDmg.BEAM III	Boosts Skell beam damage by 14%.
AttributeDmg.BEAM IV	Boosts Skell beam damage by 16%.
AttributeDmg.BEAM V	Boosts Skell beam damage by 18%.
AttributeDmg.BEAM VI	Boosts Skell beam damage by 20%.
AttributeDmg.BEAM VII	Boosts Skell beam damage by 22%.
AttributeDmg.BEAM VIII	Boosts Skell beam damage by 24%.
AttributeDmg.BEAM IX	Boosts Skell beam damage by 26%.
AttributeDmg.BEAM X	Boosts Skell beam damage by 28%.
AttributeDmg.BEAM XI	Boosts Skell beam damage by 30%.
AttributeDmg.BEAM XII	Boosts Skell beam damage by 32%.
AttributeDmg.BEAM XIII	Boosts Skell beam damage by 34%.
AttributeDmg.BEAM XIV	Boosts Skell beam damage by 36%.
AttributeDmg.BEAM XV	Boosts Skell beam damage by 38%.
AttributeDmg.BEAM XVI	Boosts Skell beam damage by 40%.
AttributeDmg.BEAM XVII	Boosts Skell beam damage by 42%.
AttributeDmg.BEAM XVIII	Boosts Skell beam damage by 44%.
AttributeDmg.BEAM XIX	Boosts Skell beam damage by 46%.
AttributeDmg.BEAM XX	Boosts Skell beam damage by 50%.
AttributeDmg.ETHER I	Boosts Skell ether damage by 10%.
AttributeDmg.ETHER II	Boosts Skell ether damage by 12%.
AttributeDmg.ETHER III	Boosts Skell ether damage by 14%.
AttributeDmg.ETHER IV	Boosts Skell ether damage by 16%.
AttributeDmg.ETHER V	Boosts Skell ether damage by 18%.
AttributeDmg.ETHER VI	Boosts Skell ether damage by 20%.
AttributeDmg.ETHER VII	Boosts Skell ether damage by 22%.
AttributeDmg.ETHER VIII	Boosts Skell ether damage by 24%.
AttributeDmg.ETHER IX	Boosts Skell ether damage by 26%.
AttributeDmg.ETHER X	Boosts Skell ether damage by 28%.
AttributeDmg.ETHER XI	Boosts Skell ether damage by 30%.
AttributeDmg.ETHER XII	Boosts Skell ether damage by 32%.
AttributeDmg.ETHER XIII	Boosts Skell ether damage by 34%.
AttributeDmg.ETHER XIV	Boosts Skell ether damage by 36%.
AttributeDmg.ETHER XV	Boosts Skell ether damage by 38%.
AttributeDmg.ETHER XVI	Boosts Skell ether damage by 40%.
AttributeDmg.ETHER XVII	Boosts Skell ether damage by 42%.
AttributeDmg.ETHER XVIII	Boosts Skell ether damage by 44%.
AttributeDmg.ETHER XIX	Boosts Skell ether damage by 46%.
AttributeDmg.ETHER XX	Boosts Skell ether damage by 50%.
AttributeDmg.THERM I	Boosts Skell thermal damage by 10%.
AttributeDmg.THERM II	Boosts Skell thermal damage by 12%.
AttributeDmg.THERM III	Boosts Skell thermal damage by 14%.
AttributeDmg.THERM IV	Boosts Skell thermal damage by 16%.
AttributeDmg.THERM V	Boosts Skell thermal damage by 18%.
AttributeDmg.THERM VI	Boosts Skell thermal damage by 20%.
AttributeDmg.THERM VII	Boosts Skell thermal damage by 22%.
AttributeDmg.THERM VIII	Boosts Skell thermal damage by 24%.
AttributeDmg.THERM IX	Boosts Skell thermal damage by 26%.
AttributeDmg.THERM X	Boosts Skell thermal damage by 28%.
AttributeDmg.THERM XI	Boosts Skell thermal damage by 30%.
AttributeDmg.THERM XII	Boosts Skell thermal damage by 32%.
AttributeDmg.THERM XIII	Boosts Skell thermal damage by 34%.
AttributeDmg.THERM XIV	Boosts Skell thermal damage by 36%.
AttributeDmg.THERM XV	Boosts Skell thermal damage by 38%.
AttributeDmg.THERM XVI	Boosts Skell thermal damage by 40%.
AttributeDmg.THERM XVII	Boosts Skell thermal damage by 42%.
AttributeDmg.THERM XVIII	Boosts Skell thermal damage by 44%.
AttributeDmg.THERM XIX	Boosts Skell thermal damage by 46%.
AttributeDmg.THERM XX	Boosts Skell thermal damage by 50%.
AttributeDmg.ELEC I	Boosts Skell electric damage by 10%.
AttributeDmg.ELEC II	Boosts Skell electric damage by 12%.
AttributeDmg.ELEC III	Boosts Skell electric damage by 14%.
AttributeDmg.ELEC IV	Boosts Skell electric damage by 16%.
AttributeDmg.ELEC V	Boosts Skell electric damage by 18%.
AttributeDmg.ELEC VI	Boosts Skell electric damage by 20%.
AttributeDmg.ELEC VII	Boosts Skell electric damage by 22%.
AttributeDmg.ELEC VIII	Boosts Skell electric damage by 24%.
AttributeDmg.ELEC IX	Boosts Skell electric damage by 26%.
AttributeDmg.ELEC X	Boosts Skell electric damage by 28%.
AttributeDmg.ELEC XI	Boosts Skell electric damage by 30%.
AttributeDmg.ELEC XII	Boosts Skell electric damage by 32%.
AttributeDmg.ELEC XIII	Boosts Skell electric damage by 34%.
AttributeDmg.ELEC XIV	Boosts Skell electric damage by 36%.
AttributeDmg.ELEC XV	Boosts Skell electric damage by 38%.
AttributeDmg.ELEC XVI	Boosts Skell electric damage by 40%.
AttributeDmg.ELEC XVII	Boosts Skell electric damage by 42%.
AttributeDmg.ELEC XVIII	Boosts Skell electric damage by 44%.
AttributeDmg.ELEC XIX	Boosts Skell electric damage by 46%.
AttributeDmg.ELEC XX	Boosts Skell electric damage by 50%.
AttributeDmg.GRAV I	Boosts Skell gravity damage by 10%.
AttributeDmg.GRAV II	Boosts Skell gravity damage by 12%.
AttributeDmg.GRAV III	Boosts Skell gravity damage by 14%.
AttributeDmg.GRAV IV	Boosts Skell gravity damage by 16%.
AttributeDmg.GRAV V	Boosts Skell gravity damage by 18%.
AttributeDmg.GRAV VI	Boosts Skell gravity damage by 20%.
AttributeDmg.GRAV VII	Boosts Skell gravity damage by 22%.
AttributeDmg.GRAV VIII	Boosts Skell gravity damage by 24%.
AttributeDmg.GRAV IX	Boosts Skell gravity damage by 26%.
AttributeDmg.GRAV X	Boosts Skell gravity damage by 28%.
AttributeDmg.GRAV XI	Boosts Skell gravity damage by 30%.
AttributeDmg.GRAV XII	Boosts Skell gravity damage by 32%.
AttributeDmg.GRAV XIII	Boosts Skell gravity damage by 34%.
AttributeDmg.GRAV XIV	Boosts Skell gravity damage by 36%.
AttributeDmg.GRAV XV	Boosts Skell gravity damage by 38%.
AttributeDmg.GRAV XVI	Boosts Skell gravity damage by 40%.
AttributeDmg.GRAV XVII	Boosts Skell gravity damage by 42%.
AttributeDmg.GRAV XVIII	Boosts Skell gravity damage by 44%.
AttributeDmg.GRAV XIX	Boosts Skell gravity damage by 46%.
AttributeDmg.GRAV XX	Boosts Skell gravity damage by 50%.
PositionDmg.FRONT I	Boosts Skell damage by 10% when attacking from the front.
PositionDmg.FRONT II	Boosts Skell damage by 12% when attacking from the front.
PositionDmg.FRONT III	Boosts Skell damage by 14% when attacking from the front.
PositionDmg.FRONT IV	Boosts Skell damage by 16% when attacking from the front.
PositionDmg.FRONT V	Boosts Skell damage by 18% when attacking from the front.
PositionDmg.FRONT VI	Boosts Skell damage by 20% when attacking from the front.
PositionDmg.FRONT VII	Boosts Skell damage by 22% when attacking from the front.
PositionDmg.FRONT VIII	Boosts Skell damage by 24% when attacking from the front.
PositionDmg.FRONT IX	Boosts Skell damage by 26% when attacking from the front.
PositionDmg.FRONT X	Boosts Skell damage by 28% when attacking from the front.
PositionDmg.FRONT XI	Boosts Skell damage by 30% when attacking from the front.
PositionDmg.FRONT XII	Boosts Skell damage by 32% when attacking from the front.
PositionDmg.FRONT XIII	Boosts Skell damage by 34% when attacking from the front.
PositionDmg.FRONT XIV	Boosts Skell damage by 36% when attacking from the front.
PositionDmg.FRONT XV	Boosts Skell damage by 38% when attacking from the front.
PositionDmg.FRONT XVI	Boosts Skell damage by 40% when attacking from the front.
PositionDmg.FRONT XVII	Boosts Skell damage by 42% when attacking from the front.
PositionDmg.FRONT XVIII	Boosts Skell damage by 44% when attacking from the front.
PositionDmg.FRONT XIX	Boosts Skell damage by 46% when attacking from the front.
PositionDmg.FRONT XX	Boosts Skell damage by 50% when attacking from the front.
PositionDmg.SIDE I	Boosts Skell damage by 10% when attacking from the side.
PositionDmg.SIDE II	Boosts Skell damage by 12% when attacking from the side.
PositionDmg.SIDE III	Boosts Skell damage by 14% when attacking from the side.
PositionDmg.SIDE IV	Boosts Skell damage by 16% when attacking from the side.
PositionDmg.SIDE V	Boosts Skell damage by 18% when attacking from the side.
PositionDmg.SIDE VI	Boosts Skell damage by 20% when attacking from the side.
PositionDmg.SIDE VII	Boosts Skell damage by 22% when attacking from the side.
PositionDmg.SIDE VIII	Boosts Skell damage by 24% when attacking from the side.
PositionDmg.SIDE IX	Boosts Skell damage by 26% when attacking from the side.
PositionDmg.SIDE X	Boosts Skell damage by 28% when attacking from the side.
PositionDmg.SIDE XI	Boosts Skell damage by 30% when attacking from the side.
PositionDmg.SIDE XII	Boosts Skell damage by 32% when attacking from the side.
PositionDmg.SIDE XIII	Boosts Skell damage by 34% when attacking from the side.
PositionDmg.SIDE XIV	Boosts Skell damage by 36% when attacking from the side.
PositionDmg.SIDE XV	Boosts Skell damage by 38% when attacking from the side.
PositionDmg.SIDE XVI	Boosts Skell damage by 40% when attacking from the side.
PositionDmg.SIDE XVII	Boosts Skell damage by 42% when attacking from the side.
PositionDmg.SIDE XVIII	Boosts Skell damage by 44% when attacking from the side.
PositionDmg.SIDE XIX	Boosts Skell damage by 46% when attacking from the side.
PositionDmg.SIDE XX	Boosts Skell damage by 50% when attacking from the side.
PositionDmg.BACK I	Boosts Skell damage by 10% when attacking from behind.
PositionDmg.BACK II	Boosts Skell damage by 12% when attacking from behind.
PositionDmg.BACK III	Boosts Skell damage by 14% when attacking from behind.
PositionDmg.BACK IV	Boosts Skell damage by 16% when attacking from behind.
PositionDmg.BACK V	Boosts Skell damage by 18% when attacking from behind.
PositionDmg.BACK VI	Boosts Skell damage by 20% when attacking from behind.
PositionDmg.BACK VII	Boosts Skell damage by 22% when attacking from behind.
PositionDmg.BACK VIII	Boosts Skell damage by 24% when attacking from behind.
PositionDmg.BACK IX	Boosts Skell damage by 26% when attacking from behind.
PositionDmg.BACK X	Boosts Skell damage by 28% when attacking from behind.
PositionDmg.BACK XI	Boosts Skell damage by 30% when attacking from behind.
PositionDmg.BACK XII	Boosts Skell damage by 32% when attacking from behind.
PositionDmg.BACK XIII	Boosts Skell damage by 34% when attacking from behind.
PositionDmg.BACK XIV	Boosts Skell damage by 36% when attacking from behind.
PositionDmg.BACK XV	Boosts Skell damage by 38% when attacking from behind.
PositionDmg.BACK XVI	Boosts Skell damage by 40% when attacking from behind.
PositionDmg.BACK XVII	Boosts Skell damage by 42% when attacking from behind.
PositionDmg.BACK XVIII	Boosts Skell damage by 44% when attacking from behind.
PositionDmg.BACK XIX	Boosts Skell damage by 46% when attacking from behind.
PositionDmg.BACK XX	Boosts Skell damage by 50% when attacking from behind.
PositionDmg.ABOVE I	Boosts Skell damage by 10% when attacking from above.
PositionDmg.ABOVE II	Boosts Skell damage by 12% when attacking from above.
PositionDmg.ABOVE III	Boosts Skell damage by 14% when attacking from above.
PositionDmg.ABOVE IV	Boosts Skell damage by 16% when attacking from above.
PositionDmg.ABOVE V	Boosts Skell damage by 18% when attacking from above.
PositionDmg.ABOVE VI	Boosts Skell damage by 20% when attacking from above.
PositionDmg.ABOVE VII	Boosts Skell damage by 22% when attacking from above.
PositionDmg.ABOVE VIII	Boosts Skell damage by 24% when attacking from above.
PositionDmg.ABOVE IX	Boosts Skell damage by 26% when attacking from above.
PositionDmg.ABOVE X	Boosts Skell damage by 28% when attacking from above.
PositionDmg.ABOVE XI	Boosts Skell damage by 30% when attacking from above.
PositionDmg.ABOVE XII	Boosts Skell damage by 32% when attacking from above.
PositionDmg.ABOVE XIII	Boosts Skell damage by 34% when attacking from above.
PositionDmg.ABOVE XIV	Boosts Skell damage by 36% when attacking from above.
PositionDmg.ABOVE XV	Boosts Skell damage by 38% when attacking from above.
PositionDmg.ABOVE XVI	Boosts Skell damage by 40% when attacking from above.
PositionDmg.ABOVE XVII	Boosts Skell damage by 42% when attacking from above.
PositionDmg.ABOVE XVIII	Boosts Skell damage by 44% when attacking from above.
PositionDmg.ABOVE XIX	Boosts Skell damage by 46% when attacking from above.
PositionDmg.ABOVE XX	Boosts Skell damage by 50% when attacking from above.
M-Auto.BLACKOUT I	Grants a 5% chance of inflicting Blackout I when melee auto-attacking with your Skell.
M-Auto.BLACKOUT II	Grants a 6% chance of inflicting Blackout I when melee auto-attacking with your Skell.
M-Auto.BLACKOUT III	Grants a 7% chance of inflicting Blackout I when melee auto-attacking with your Skell.
M-Auto.BLACKOUT IV	Grants a 8% chance of inflicting Blackout I when melee auto-attacking with your Skell.
M-Auto.BLACKOUT V	Grants a 10% chance of inflicting Blackout I when melee auto-attacking with your Skell.
M-Auto.BLACKOUT VI	Grants a 5% chance of inflicting Blackout II when melee auto-attacking with your Skell.
M-Auto.BLACKOUT VII	Grants a 6% chance of inflicting Blackout II when melee auto-attacking with your Skell.
M-Auto.BLACKOUT VIII	Grants a 7% chance of inflicting Blackout II when melee auto-attacking with your Skell.
M-Auto.BLACKOUT IX	Grants a 8% chance of inflicting Blackout II when melee auto-attacking with your Skell.
M-Auto.BLACKOUT X	Grants a 10% chance of inflicting Blackout II when melee auto-attacking with your Skell.
M-Auto.BLACKOUT XI	Grants a 5% chance of inflicting Blackout III when melee auto-attacking with your Skell.
M-Auto.BLACKOUT XII	Grants a 6% chance of inflicting Blackout III when melee auto-attacking with your Skell.
M-Auto.BLACKOUT XIII	Grants a 7% chance of inflicting Blackout III when melee auto-attacking with your Skell.
M-Auto.BLACKOUT XIV	Grants a 8% chance of inflicting Blackout III when melee auto-attacking with your Skell.
M-Auto.BLACKOUT XV	Grants a 10% chance of inflicting Blackout III when melee auto-attacking with your Skell.
M-Auto.BLACKOUT XVI	Grants a 5% chance of inflicting Blackout IV when melee auto-attacking with your Skell.
M-Auto.BLACKOUT XVII	Grants a 6% chance of inflicting Blackout IV when melee auto-attacking with your Skell.
M-Auto.BLACKOUT XVIII	Grants a 7% chance of inflicting Blackout IV when melee auto-attacking with your Skell.
M-Auto.BLACKOUT XIX	Grants a 8% chance of inflicting Blackout IV when melee auto-attacking with your Skell.
M-Auto.BLACKOUT XX	Grants a 10% chance of inflicting Blackout IV when melee auto-attacking with your Skell.
M-Auto.FATIGUE I	Grants a 5% chance of inflicting Fatigue I when melee auto-attacking with your Skell.
M-Auto.FATIGUE II	Grants a 6% chance of inflicting Fatigue I when melee auto-attacking with your Skell.
M-Auto.FATIGUE III	Grants a 7% chance of inflicting Fatigue I when melee auto-attacking with your Skell.
M-Auto.FATIGUE IV	Grants a 8% chance of inflicting Fatigue I when melee auto-attacking with your Skell.
M-Auto.FATIGUE V	Grants a 10% chance of inflicting Fatigue I when melee auto-attacking with your Skell.
M-Auto.FATIGUE VI	Grants a 5% chance of inflicting Fatigue II when melee auto-attacking with your Skell.
M-Auto.FATIGUE VII	Grants a 6% chance of inflicting Fatigue II when melee auto-attacking with your Skell.
M-Auto.FATIGUE VIII	Grants a 7% chance of inflicting Fatigue II when melee auto-attacking with your Skell.
M-Auto.FATIGUE IX	Grants a 8% chance of inflicting Fatigue II when melee auto-attacking with your Skell.
M-Auto.FATIGUE X	Grants a 10% chance of inflicting Fatigue II when melee auto-attacking with your Skell.
M-Auto.FATIGUE XI	Grants a 5% chance of inflicting Fatigue III when melee auto-attacking with your Skell.
M-Auto.FATIGUE XII	Grants a 6% chance of inflicting Fatigue III when melee auto-attacking with your Skell.
M-Auto.FATIGUE XIII	Grants a 7% chance of inflicting Fatigue III when melee auto-attacking with your Skell.
M-Auto.FATIGUE XIV	Grants a 8% chance of inflicting Fatigue III when melee auto-attacking with your Skell.
M-Auto.FATIGUE XV	Grants a 10% chance of inflicting Fatigue III when melee auto-attacking with your Skell.
M-Auto.FATIGUE XVI	Grants a 5% chance of inflicting Fatigue IV when melee auto-attacking with your Skell.
M-Auto.FATIGUE XVII	Grants a 6% chance of inflicting Fatigue IV when melee auto-attacking with your Skell.
M-Auto.FATIGUE XVIII	Grants a 7% chance of inflicting Fatigue IV when melee auto-attacking with your Skell.
M-Auto.FATIGUE XIX	Grants a 8% chance of inflicting Fatigue IV when melee auto-attacking with your Skell.
M-Auto.FATIGUE XX	Grants a 10% chance of inflicting Fatigue IV when melee auto-attacking with your Skell.
M-Auto.PHYS-DOWN I	Grants a 5% chance of inflicting Physical Res Down I when melee auto-attacking with your Skell.
M-Auto.PHYS-DOWN II	Grants a 6% chance of inflicting Physical Res Down I when melee auto-attacking with your Skell.
M-Auto.PHYS-DOWN III	Grants a 7% chance of inflicting Physical Res Down I when melee auto-attacking with your Skell.
M-Auto.PHYS-DOWN IV	Grants a 8% chance of inflicting Physical Res Down I when melee auto-attacking with your Skell.
M-Auto.PHYS-DOWN V	Grants a 10% chance of inflicting Physical Res Down I when melee auto-attacking with your Skell.
M-Auto.PHYS-DOWN VI	Grants a 5% chance of inflicting Physical Res Down II when melee auto-attacking with your Skell.
M-Auto.PHYS-DOWN VII	Grants a 6% chance of inflicting Physical Res Down II when melee auto-attacking with your Skell.
M-Auto.PHYS-DOWN VIII	Grants a 7% chance of inflicting Physical Res Down II when melee auto-attacking with your Skell.
M-Auto.PHYS-DOWN IX	Grants a 8% chance of inflicting Physical Res Down II when melee auto-attacking with your Skell.
M-Auto.PHYS-DOWN X	Grants a 10% chance of inflicting Physical Res Down II when melee auto-attacking with your Skell.
M-Auto.PHYS-DOWN XI	Grants a 5% chance of inflicting Physical Res Down III when melee auto-attacking with your Skell.
M-Auto.PHYS-DOWN XII	Grants a 6% chance of inflicting Physical Res Down III when melee auto-attacking with your Skell.
M-Auto.PHYS-DOWN XIII	Grants a 7% chance of inflicting Physical Res Down III when melee auto-attacking with your Skell.
M-Auto.PHYS-DOWN XIV	Grants a 8% chance of inflicting Physical Res Down III when melee auto-attacking with your Skell.
M-Auto.PHYS-DOWN XV	Grants a 10% chance of inflicting Physical Res Down III when melee auto-attacking with your Skell.
M-Auto.PHYS-DOWN XVI	Grants a 5% chance of inflicting Physical Res Down IV when melee auto-attacking with your Skell.
M-Auto.PHYS-DOWN XVII	Grants a 6% chance of inflicting Physical Res Down IV when melee auto-attacking with your Skell.
M-Auto.PHYS-DOWN XVIII	Grants a 7% chance of inflicting Physical Res Down IV when melee auto-attacking with your Skell.
M-Auto.PHYS-DOWN XIX	Grants a 8% chance of inflicting Physical Res Down IV when melee auto-attacking with your Skell.
M-Auto.PHYS-DOWN XX	Grants a 10% chance of inflicting Physical Res Down IV when melee auto-attacking with your Skell.
M-Auto.BEAM-DOWN I	Grants a 5% chance of inflicting Beam Res Down I when melee auto-attacking with your Skell.
M-Auto.BEAM-DOWN II	Grants a 6% chance of inflicting Beam Res Down I when melee auto-attacking with your Skell.
M-Auto.BEAM-DOWN III	Grants a 7% chance of inflicting Beam Res Down I when melee auto-attacking with your Skell.
M-Auto.BEAM-DOWN IV	Grants a 8% chance of inflicting Beam Res Down I when melee auto-attacking with your Skell.
M-Auto.BEAM-DOWN V	Grants a 10% chance of inflicting Beam Res Down I when melee auto-attacking with your Skell.
M-Auto.BEAM-DOWN VI	Grants a 5% chance of inflicting Beam Res Down II when melee auto-attacking with your Skell.
M-Auto.BEAM-DOWN VII	Grants a 6% chance of inflicting Beam Res Down II when melee auto-attacking with your Skell.
M-Auto.BEAM-DOWN VIII	Grants a 7% chance of inflicting Beam Res Down II when melee auto-attacking with your Skell.
M-Auto.BEAM-DOWN IX	Grants a 8% chance of inflicting Beam Res Down II when melee auto-attacking with your Skell.
M-Auto.BEAM-DOWN X	Grants a 10% chance of inflicting Beam Res Down II when melee auto-attacking with your Skell.
M-Auto.BEAM-DOWN XI	Grants a 5% chance of inflicting Beam Res Down III when melee auto-attacking with your Skell.
M-Auto.BEAM-DOWN XII	Grants a 6% chance of inflicting Beam Res Down III when melee auto-attacking with your Skell.
M-Auto.SHOCK V	Grants a 10% chance of inflicting Shock I when melee auto-attacking with your Skell.
M-Auto.BEAM-DOWN XIII	Grants a 7% chance of inflicting Beam Res Down III when melee auto-attacking with your Skell.
M-Auto.BEAM-DOWN XIV	Grants a 8% chance of inflicting Beam Res Down III when melee auto-attacking with your Skell.
M-Auto.BEAM-DOWN XV	Grants a 10% chance of inflicting Beam Res Down III when melee auto-attacking with your Skell.
M-Auto.BEAM-DOWN XVI	Grants a 5% chance of inflicting Beam Res Down IV when melee auto-attacking with your Skell.
M-Auto.BEAM-DOWN XVII	Grants a 6% chance of inflicting Beam Res Down IV when melee auto-attacking with your Skell.
M-Auto.BEAM-DOWN XVIII	Grants a 7% chance of inflicting Beam Res Down IV when melee auto-attacking with your Skell.
M-Auto.BEAM-DOWN XIX	Grants a 8% chance of inflicting Beam Res Down IV when melee auto-attacking with your Skell.
M-Auto.BEAM-DOWN XX	Grants a 10% chance of inflicting Beam Res Down IV when melee auto-attacking with your Skell.
M-Auto.ETHER-DOWN I	Grants a 5% chance of inflicting Ether Res Down I when melee auto-attacking with your Skell.
M-Auto.ETHER-DOWN II	Grants a 6% chance of inflicting Ether Res Down I when melee auto-attacking with your Skell.
M-Auto.ETHER-DOWN III	Grants a 7% chance of inflicting Ether Res Down I when melee auto-attacking with your Skell.
M-Auto.ETHER-DOWN IV	Grants a 8% chance of inflicting Ether Res Down I when melee auto-attacking with your Skell.
M-Auto.ETHER-DOWN V	Grants a 10% chance of inflicting Ether Res Down I when melee auto-attacking with your Skell.
M-Auto.ETHER-DOWN VI	Grants a 5% chance of inflicting Ether Res Down II when melee auto-attacking with your Skell.
M-Auto.ETHER-DOWN VII	Grants a 6% chance of inflicting Ether Res Down II when melee auto-attacking with your Skell.
M-Auto.ETHER-DOWN VIII	Grants a 7% chance of inflicting Ether Res Down II when melee auto-attacking with your Skell.
M-Auto.ETHER-DOWN IX	Grants a 8% chance of inflicting Ether Res Down II when melee auto-attacking with your Skell.
M-Auto.ETHER-DOWN X	Grants a 10% chance of inflicting Ether Res Down II when melee auto-attacking with your Skell.
M-Auto.ETHER-DOWN XI	Grants a 5% chance of inflicting Ether Res Down III when melee auto-attacking with your Skell.
M-Auto.ETHER-DOWN XII	Grants a 6% chance of inflicting Ether Res Down III when melee auto-attacking with your Skell.
M-Auto.ETHER-DOWN XIII	Grants a 7% chance of inflicting Ether Res Down III when melee auto-attacking with your Skell.
M-Auto.ETHER-DOWN XIV	Grants a 8% chance of inflicting Ether Res Down III when melee auto-attacking with your Skell.
M-Auto.ETHER-DOWN XV	Grants a 10% chance of inflicting Ether Res Down III when melee auto-attacking with your Skell.
M-Auto.ETHER-DOWN XVI	Grants a 5% chance of inflicting Ether Res Down IV when melee auto-attacking with your Skell.
M-Auto.ETHER-DOWN XVII	Grants a 6% chance of inflicting Ether Res Down IV when melee auto-attacking with your Skell.
M-Auto.ETHER-DOWN XVIII	Grants a 7% chance of inflicting Ether Res Down IV when melee auto-attacking with your Skell.
M-Auto.ETHER-DOWN XIX	Grants a 8% chance of inflicting Ether Res Down IV when melee auto-attacking with your Skell.
M-Auto.ETHER-DOWN XX	Grants a 10% chance of inflicting Ether Res Down IV when melee auto-attacking with your Skell.
M-Auto.THERM-DOWN I	Grants a 5% chance of inflicting Thermal Res Down I when melee auto-attacking with your Skell.
M-Auto.THERM-DOWN II	Grants a 6% chance of inflicting Thermal Res Down I when melee auto-attacking with your Skell.
M-Auto.THERM-DOWN III	Grants a 7% chance of inflicting Thermal Res Down I when melee auto-attacking with your Skell.
M-Auto.THERM-DOWN IV	Grants a 8% chance of inflicting Thermal Res Down I when melee auto-attacking with your Skell.
M-Auto.THERM-DOWN V	Grants a 10% chance of inflicting Thermal Res Down I when melee auto-attacking with your Skell.
M-Auto.THERM-DOWN VI	Grants a 5% chance of inflicting Thermal Res Down II when melee auto-attacking with your Skell.
M-Auto.THERM-DOWN VII	Grants a 6% chance of inflicting Thermal Res Down II when melee auto-attacking with your Skell.
M-Auto.THERM-DOWN VIII	Grants a 7% chance of inflicting Thermal Res Down II when melee auto-attacking with your Skell.
M-Auto.THERM-DOWN IX	Grants a 8% chance of inflicting Thermal Res Down II when melee auto-attacking with your Skell.
M-Auto.THERM-DOWN X	Grants a 10% chance of inflicting Thermal Res Down II when melee auto-attacking with your Skell.
M-Auto.THERM-DOWN XI	Grants a 5% chance of inflicting Thermal Res Down III when melee auto-attacking with your Skell.
M-Auto.THERM-DOWN XII	Grants a 6% chance of inflicting Thermal Res Down III when melee auto-attacking with your Skell.
M-Auto.THERM-DOWN XIII	Grants a 7% chance of inflicting Thermal Res Down III when melee auto-attacking with your Skell.
M-Auto.THERM-DOWN XIV	Grants a 8% chance of inflicting Thermal Res Down III when melee auto-attacking with your Skell.
M-Auto.THERM-DOWN XV	Grants a 10% chance of inflicting Thermal Res Down III when melee auto-attacking with your Skell.
M-Auto.THERM-DOWN XVI	Grants a 5% chance of inflicting Thermal Res Down IV when melee auto-attacking with your Skell.
M-Auto.THERM-DOWN XVII	Grants a 6% chance of inflicting Thermal Res Down IV when melee auto-attacking with your Skell.
M-Auto.THERM-DOWN XVIII	Grants a 7% chance of inflicting Thermal Res Down IV when melee auto-attacking with your Skell.
M-Auto.THERM-DOWN XIX	Grants a 8% chance of inflicting Thermal Res Down IV when melee auto-attacking with your Skell.
M-Auto.THERM-DOWN XX	Grants a 10% chance of inflicting Thermal Res Down IV when melee auto-attacking with your Skell.
M-Auto.ELEC-DOWN I	Grants a 5% chance of inflicting Electric Res Down I when melee auto-attacking with your Skell.
M-Auto.ELEC-DOWN II	Grants a 6% chance of inflicting Electric Res Down I when melee auto-attacking with your Skell.
M-Auto.ELEC-DOWN III	Grants a 7% chance of inflicting Electric Res Down I when melee auto-attacking with your Skell.
M-Auto.ELEC-DOWN IV	Grants a 8% chance of inflicting Electric Res Down I when melee auto-attacking with your Skell.
M-Auto.ELEC-DOWN V	Grants a 10% chance of inflicting Electric Res Down I when melee auto-attacking with your Skell.
M-Auto.ELEC-DOWN VI	Grants a 5% chance of inflicting Electric Res Down II when melee auto-attacking with your Skell.
M-Auto.ELEC-DOWN VII	Grants a 6% chance of inflicting Electric Res Down II when melee auto-attacking with your Skell.
M-Auto.ELEC-DOWN VIII	Grants a 7% chance of inflicting Electric Res Down II when melee auto-attacking with your Skell.
M-Auto.ELEC-DOWN IX	Grants a 8% chance of inflicting Electric Res Down II when melee auto-attacking with your Skell.
M-Auto.ELEC-DOWN X	Grants a 10% chance of inflicting Electric Res Down II when melee auto-attacking with your Skell.
M-Auto.ELEC-DOWN XI	Grants a 5% chance of inflicting Electric Res Down III when melee auto-attacking with your Skell.
M-Auto.ELEC-DOWN XII	Grants a 6% chance of inflicting Electric Res Down III when melee auto-attacking with your Skell.
M-Auto.ELEC-DOWN XIII	Grants a 7% chance of inflicting Electric Res Down III when melee auto-attacking with your Skell.
M-Auto.ELEC-DOWN XIV	Grants a 8% chance of inflicting Electric Res Down III when melee auto-attacking with your Skell.
M-Auto.ELEC-DOWN XV	Grants a 10% chance of inflicting Electric Res Down III when melee auto-attacking with your Skell.
M-Auto.ELEC-DOWN XVI	Grants a 5% chance of inflicting Electric Res Down IV when melee auto-attacking with your Skell.
M-Auto.ELEC-DOWN XVII	Grants a 6% chance of inflicting Electric Res Down IV when melee auto-attacking with your Skell.
M-Auto.ELEC-DOWN XVIII	Grants a 7% chance of inflicting Electric Res Down IV when melee auto-attacking with your Skell.
M-Auto.ELEC-DOWN XIX	Grants a 8% chance of inflicting Electric Res Down IV when melee auto-attacking with your Skell.
M-Auto.ELEC-DOWN XX	Grants a 10% chance of inflicting Electric Res Down IV when melee auto-attacking with your Skell.
M-Auto.GRAV-DOWN I	Grants a 5% chance of inflicting Gravity Res Down I when melee auto-attacking with your Skell.
M-Auto.GRAV-DOWN II	Grants a 6% chance of inflicting Gravity Res Down I when melee auto-attacking with your Skell.
M-Auto.GRAV-DOWN III	Grants a 7% chance of inflicting Gravity Res Down I when melee auto-attacking with your Skell.
M-Auto.GRAV-DOWN IV	Grants a 8% chance of inflicting Gravity Res Down I when melee auto-attacking with your Skell.
M-Auto.GRAV-DOWN V	Grants a 10% chance of inflicting Gravity Res Down I when melee auto-attacking with your Skell.
M-Auto.GRAV-DOWN VI	Grants a 5% chance of inflicting Gravity Res Down II when melee auto-attacking with your Skell.
M-Auto.GRAV-DOWN VII	Grants a 6% chance of inflicting Gravity Res Down II when melee auto-attacking with your Skell.
M-Auto.GRAV-DOWN VIII	Grants a 7% chance of inflicting Gravity Res Down II when melee auto-attacking with your Skell.
M-Auto.GRAV-DOWN IX	Grants a 8% chance of inflicting Gravity Res Down II when melee auto-attacking with your Skell.
M-Auto.GRAV-DOWN X	Grants a 10% chance of inflicting Gravity Res Down II when melee auto-attacking with your Skell.
M-Auto.GRAV-DOWN XI	Grants a 5% chance of inflicting Gravity Res Down III when melee auto-attacking with your Skell.
M-Auto.GRAV-DOWN XII	Grants a 6% chance of inflicting Gravity Res Down III when melee auto-attacking with your Skell.
M-Auto.GRAV-DOWN XIII	Grants a 7% chance of inflicting Gravity Res Down III when melee auto-attacking with your Skell.
M-Auto.GRAV-DOWN XIV	Grants a 8% chance of inflicting Gravity Res Down III when melee auto-attacking with your Skell.
M-Auto.GRAV-DOWN XV	Grants a 10% chance of inflicting Gravity Res Down III when melee auto-attacking with your Skell.
M-Auto.GRAV-DOWN XVI	Grants a 5% chance of inflicting Gravity Res Down IV when melee auto-attacking with your Skell.
M-Auto.GRAV-DOWN XVII	Grants a 6% chance of inflicting Gravity Res Down IV when melee auto-attacking with your Skell.
M-Auto.GRAV-DOWN XVIII	Grants a 7% chance of inflicting Gravity Res Down IV when melee auto-attacking with your Skell.
M-Auto.GRAV-DOWN XIX	Grants a 8% chance of inflicting Gravity Res Down IV when melee auto-attacking with your Skell.
M-Auto.GRAV-DOWN XX	Grants a 10% chance of inflicting Gravity Res Down IV when melee auto-attacking with your Skell.
M-Auto.BLAZE I	Grants a 5% chance of inflicting Blaze I when melee auto-attacking with your Skell.
M-Auto.BLAZE II	Grants a 6% chance of inflicting Blaze I when melee auto-attacking with your Skell.
M-Auto.BLAZE III	Grants a 7% chance of inflicting Blaze I when melee auto-attacking with your Skell.
M-Auto.BLAZE IV	Grants a 8% chance of inflicting Blaze I when melee auto-attacking with your Skell.
M-Auto.BLAZE V	Grants a 10% chance of inflicting Blaze I when melee auto-attacking with your Skell.
M-Auto.BLAZE VI	Grants a 5% chance of inflicting Blaze II when melee auto-attacking with your Skell.
M-Auto.BLAZE VII	Grants a 6% chance of inflicting Blaze II when melee auto-attacking with your Skell.
M-Auto.BLAZE VIII	Grants a 7% chance of inflicting Blaze II when melee auto-attacking with your Skell.
M-Auto.BLAZE IX	Grants a 8% chance of inflicting Blaze II when melee auto-attacking with your Skell.
M-Auto.BLAZE X	Grants a 10% chance of inflicting Blaze II when melee auto-attacking with your Skell.
M-Auto.BLAZE XI	Grants a 5% chance of inflicting Blaze III when melee auto-attacking with your Skell.
M-Auto.BLAZE XII	Grants a 6% chance of inflicting Blaze III when melee auto-attacking with your Skell.
M-Auto.BLAZE XIII	Grants a 7% chance of inflicting Blaze III when melee auto-attacking with your Skell.
M-Auto.BLAZE XIV	Grants a 8% chance of inflicting Blaze III when melee auto-attacking with your Skell.
M-Auto.BLAZE XV	Grants a 10% chance of inflicting Blaze III when melee auto-attacking with your Skell.
M-Auto.BLAZE XVI	Grants a 5% chance of inflicting Blaze IV when melee auto-attacking with your Skell.
M-Auto.BLAZE XVII	Grants a 6% chance of inflicting Blaze IV when melee auto-attacking with your Skell.
M-Auto.BLAZE XVIII	Grants a 7% chance of inflicting Blaze IV when melee auto-attacking with your Skell.
M-Auto.BLAZE XIX	Grants a 8% chance of inflicting Blaze IV when melee auto-attacking with your Skell.
M-Auto.BLAZE XX	Grants a 10% chance of inflicting Blaze IV when melee auto-attacking with your Skell.
M-Auto.SHOCK I	Grants a 5% chance of inflicting Shock I when melee auto-attacking with your Skell.
M-Auto.SHOCK II	Grants a 6% chance of inflicting Shock I when melee auto-attacking with your Skell.
M-Auto.SHOCK III	Grants a 7% chance of inflicting Shock I when melee auto-attacking with your Skell.
M-Auto.SHOCK IV	Grants a 8% chance of inflicting Shock I when melee auto-attacking with your Skell.
Overdrive.EXTEND VI	Boosts Overdrive sustainment rate by 6%.
M-Auto.SHOCK VI	Grants a 5% chance of inflicting Shock II when melee auto-attacking with your Skell.
M-Auto.SHOCK VII	Grants a 6% chance of inflicting Shock II when melee auto-attacking with your Skell.
M-Auto.SHOCK VIII	Grants a 7% chance of inflicting Shock II when melee auto-attacking with your Skell.
M-Auto.SHOCK IX	Grants a 8% chance of inflicting Shock II when melee auto-attacking with your Skell.
M-Auto.SHOCK X	Grants a 10% chance of inflicting Shock II when melee auto-attacking with your Skell.
M-Auto.SHOCK XI	Grants a 5% chance of inflicting Shock III when melee auto-attacking with your Skell.
M-Auto.SHOCK XII	Grants a 6% chance of inflicting Shock III when melee auto-attacking with your Skell.
M-Auto.SHOCK XIII	Grants a 7% chance of inflicting Shock III when melee auto-attacking with your Skell.
M-Auto.SHOCK XIV	Grants a 8% chance of inflicting Shock III when melee auto-attacking with your Skell.
M-Auto.SHOCK XV	Grants a 10% chance of inflicting Shock III when melee auto-attacking with your Skell.
M-Auto.SHOCK XVI	Grants a 5% chance of inflicting Shock IV when melee auto-attacking with your Skell.
M-Auto.SHOCK XVII	Grants a 6% chance of inflicting Shock IV when melee auto-attacking with your Skell.
M-Auto.SHOCK XVIII	Grants a 7% chance of inflicting Shock IV when melee auto-attacking with your Skell.
M-Auto.SHOCK XIX	Grants a 8% chance of inflicting Shock IV when melee auto-attacking with your Skell.
M-Auto.SHOCK XX	Grants a 10% chance of inflicting Shock IV when melee auto-attacking with your Skell.
M-Auto.HP-RECOV I	Grants a 50% chance of recovering 25 HP when melee auto-attacking with your Skell.
M-Auto.HP-RECOV II	Grants a 50% chance of recovering 50 HP when melee auto-attacking with your Skell.
M-Auto.HP-RECOV III	Grants a 50% chance of recovering 75 HP when melee auto-attacking with your Skell.
M-Auto.HP-RECOV IV	Grants a 50% chance of recovering 100 HP when melee auto-attacking with your Skell.
M-Auto.HP-RECOV V	Grants a 50% chance of recovering 125 HP when melee auto-attacking with your Skell.
M-Auto.HP-RECOV VI	Grants a 50% chance of recovering 150 HP when melee auto-attacking with your Skell.
M-Auto.HP-RECOV VII	Grants a 50% chance of recovering 175 HP when melee auto-attacking with your Skell.
M-Auto.HP-RECOV VIII	Grants a 50% chance of recovering 200 HP when melee auto-attacking with your Skell.
M-Auto.HP-RECOV IX	Grants a 50% chance of recovering 225 HP when melee auto-attacking with your Skell.
M-Auto.HP-RECOV X	Grants a 50% chance of recovering 250 HP when melee auto-attacking with your Skell.
M-Auto.HP-RECOV XI	Grants a 50% chance of recovering 275 HP when melee auto-attacking with your Skell.
M-Auto.HP-RECOV XII	Grants a 50% chance of recovering 300 HP when melee auto-attacking with your Skell.
M-Auto.HP-RECOV XIII	Grants a 50% chance of recovering 325 HP when melee auto-attacking with your Skell.
M-Auto.HP-RECOV XIV	Grants a 50% chance of recovering 350 HP when melee auto-attacking with your Skell.
M-Auto.HP-RECOV XV	Grants a 50% chance of recovering 375 HP when melee auto-attacking with your Skell.
M-Auto.HP-RECOV XVI	Grants a 50% chance of recovering 400 HP when melee auto-attacking with your Skell.
M-Auto.HP-RECOV XVII	Grants a 50% chance of recovering 425 HP when melee auto-attacking with your Skell.
M-Auto.HP-RECOV XVIII	Grants a 50% chance of recovering 450 HP when melee auto-attacking with your Skell.
M-Auto.HP-RECOV XIX	Grants a 50% chance of recovering 475 HP when melee auto-attacking with your Skell.
M-Auto.HP-RECOV XX	Grants a 50% chance of recovering 500 HP when melee auto-attacking with your Skell.
Damage.GP-GAIN I	Grants a 15% chance of receiving 20 GP when taking Skell damage.
Damage.GP-GAIN II	Grants a 15% chance of receiving 40 GP when taking Skell damage.
Damage.GP-GAIN III	Grants a 15% chance of receiving 60 GP when taking Skell damage.
Damage.GP-GAIN IV	Grants a 15% chance of receiving 80 GP when taking Skell damage.
Damage.GP-GAIN V	Grants a 15% chance of receiving 100 GP when taking Skell damage.
Damage.GP-GAIN VI	Grants a 15% chance of receiving 120 GP when taking Skell damage.
Damage.GP-GAIN VII	Grants a 15% chance of receiving 140 GP when taking Skell damage.
Damage.GP-GAIN VIII	Grants a 15% chance of receiving 160 GP when taking Skell damage.
Damage.GP-GAIN IX	Grants a 15% chance of receiving 180 GP when taking Skell damage.
Damage.GP-GAIN X	Grants a 15% chance of receiving 200 GP when taking Skell damage.
Damage.GP-GAIN XI	Grants a 15% chance of receiving 220 GP when taking Skell damage.
Damage.GP-GAIN XII	Grants a 15% chance of receiving 240 GP when taking Skell damage.
Damage.GP-GAIN XIII	Grants a 15% chance of receiving 260 GP when taking Skell damage.
Damage.GP-GAIN XIV	Grants a 15% chance of receiving 280 GP when taking Skell damage.
Damage.GP-GAIN XV	Grants a 15% chance of receiving 300 GP when taking Skell damage.
Damage.GP-GAIN XVI	Grants a 15% chance of receiving 320 GP when taking Skell damage.
Damage.GP-GAIN XVII	Grants a 15% chance of receiving 340 GP when taking Skell damage.
Damage.GP-GAIN XVIII	Grants a 15% chance of receiving 360 GP when taking Skell damage.
Damage.GP-GAIN XIX	Grants a 15% chance of receiving 380 GP when taking Skell damage.
Damage.GP-GAIN XX	Grants a 15% chance of receiving 400 GP when taking Skell damage.
Damage.APPEND I	Grants a 15% chance of reducing appendage damage by 10% when your Skell takes a hit.
Damage.APPEND II	Grants a 15% chance of reducing appendage damage by 12% when your Skell takes a hit.
Damage.APPEND III	Grants a 15% chance of reducing appendage damage by 14% when your Skell takes a hit.
Damage.APPEND IV	Grants a 15% chance of reducing appendage damage by 16% when your Skell takes a hit.
Damage.APPEND V	Grants a 15% chance of reducing appendage damage by 18% when your Skell takes a hit.
Damage.APPEND VI	Grants a 15% chance of reducing appendage damage by 20% when your Skell takes a hit.
Damage.APPEND VII	Grants a 15% chance of reducing appendage damage by 22% when your Skell takes a hit.
Damage.APPEND VIII	Grants a 15% chance of reducing appendage damage by 24% when your Skell takes a hit.
Damage.APPEND IX	Grants a 15% chance of reducing appendage damage by 26% when your Skell takes a hit.
Damage.APPEND X	Grants a 15% chance of reducing appendage damage by 28% when your Skell takes a hit.
Damage.APPEND XI	Grants a 15% chance of reducing appendage damage by 30% when your Skell takes a hit.
Damage.APPEND XII	Grants a 15% chance of reducing appendage damage by 32% when your Skell takes a hit.
Damage.APPEND XIII	Grants a 15% chance of reducing appendage damage by 34% when your Skell takes a hit.
Damage.APPEND XIV	Grants a 15% chance of reducing appendage damage by 36% when your Skell takes a hit.
Damage.APPEND XV	Grants a 15% chance of reducing appendage damage by 38% when your Skell takes a hit.
Damage.APPEND XVI	Grants a 15% chance of reducing appendage damage by 40% when your Skell takes a hit.
Damage.APPEND XVII	Grants a 15% chance of reducing appendage damage by 42% when your Skell takes a hit.
Damage.APPEND XVIII	Grants a 15% chance of reducing appendage damage by 44% when your Skell takes a hit.
Damage.APPEND XIX	Grants a 15% chance of reducing appendage damage by 46% when your Skell takes a hit.
Damage.APPEND XX	Grants a 15% chance of reducing appendage damage by 50% when your Skell takes a hit.
Jamming I	Boosts Skell evasion against homing attacks by 10%.
Jamming II	Boosts Skell evasion against homing attacks by 12%.
Jamming III	Boosts Skell evasion against homing attacks by 14%.
Jamming IV	Boosts Skell evasion against homing attacks by 16%.
Jamming V	Boosts Skell evasion against homing attacks by 18%.
Jamming VI	Boosts Skell evasion against homing attacks by 20%.
Jamming VII	Boosts Skell evasion against homing attacks by 22%.
Jamming VIII	Boosts Skell evasion against homing attacks by 24%.
Jamming IX	Boosts Skell evasion against homing attacks by 26%.
Jamming X	Boosts Skell evasion against homing attacks by 28%.
Jamming XI	Boosts Skell evasion against homing attacks by 30%.
Jamming XII	Boosts Skell evasion against homing attacks by 32%.
Jamming XIII	Boosts Skell evasion against homing attacks by 34%.
Jamming XIV	Boosts Skell evasion against homing attacks by 36%.
Jamming XV	Boosts Skell evasion against homing attacks by 38%.
Jamming XVI	Boosts Skell evasion against homing attacks by 40%.
Jamming XVII	Boosts Skell evasion against homing attacks by 42%.
Jamming XVIII	Boosts Skell evasion against homing attacks by 44%.
Jamming XIX	Boosts Skell evasion against homing attacks by 46%.
Jamming XX	Boosts Skell evasion against homing attacks by 50%.
AppendLost.ATK-UP I	Boosts damage by 10% for each Skell appendage lost.
AppendLost.ATK-UP II	Boosts damage by 12% for each Skell appendage lost.
AppendLost.ATK-UP III	Boosts damage by 14% for each Skell appendage lost.
AppendLost.ATK-UP IV	Boosts damage by 16% for each Skell appendage lost.
AppendLost.ATK-UP V	Boosts damage by 18% for each Skell appendage lost.
AppendLost.ATK-UP VI	Boosts damage by 20% for each Skell appendage lost.
AppendLost.ATK-UP VII	Boosts damage by 22% for each Skell appendage lost.
AppendLost.ATK-UP VIII	Boosts damage by 24% for each Skell appendage lost.
AppendLost.ATK-UP IX	Boosts damage by 26% for each Skell appendage lost.
AppendLost.ATK-UP X	Boosts damage by 28% for each Skell appendage lost.
AppendLost.ATK-UP XI	Boosts damage by 30% for each Skell appendage lost.
AppendLost.ATK-UP XII	Boosts damage by 32% for each Skell appendage lost.
AppendLost.ATK-UP XIII	Boosts damage by 34% for each Skell appendage lost.
AppendLost.ATK-UP XIV	Boosts damage by 36% for each Skell appendage lost.
AppendLost.ATK-UP XV	Boosts damage by 38% for each Skell appendage lost.
AppendLost.ATK-UP XVI	Boosts damage by 40% for each Skell appendage lost.
AppendLost.ATK-UP XVII	Boosts damage by 42% for each Skell appendage lost.
AppendLost.ATK-UP XVIII	Boosts damage by 44% for each Skell appendage lost.
AppendLost.ATK-UP XIX	Boosts damage by 46% for each Skell appendage lost.
AppendLost.ATK-UP XX	Boosts damage by 50% for each Skell appendage lost.
AppendLost.EVA-UP I	Boosts evasion by 2% for each Skell appendage lost.
AppendLost.EVA-UP II	Boosts evasion by 4% for each Skell appendage lost.
AppendLost.EVA-UP III	Boosts evasion by 6% for each Skell appendage lost.
AppendLost.EVA-UP IV	Boosts evasion by 8% for each Skell appendage lost.
AppendLost.EVA-UP V	Boosts evasion by 10% for each Skell appendage lost.
AppendLost.EVA-UP VI	Boosts evasion by 12% for each Skell appendage lost.
AppendLost.EVA-UP VII	Boosts evasion by 14% for each Skell appendage lost.
AppendLost.EVA-UP VIII	Boosts evasion by 16% for each Skell appendage lost.
AppendLost.EVA-UP IX	Boosts evasion by 18% for each Skell appendage lost.
AppendLost.EVA-UP X	Boosts evasion by 20% for each Skell appendage lost.
AppendLost.EVA-UP XI	Boosts evasion by 22% for each Skell appendage lost.
AppendLost.EVA-UP XII	Boosts evasion by 24% for each Skell appendage lost.
AppendLost.EVA-UP XIII	Boosts evasion by 26% for each Skell appendage lost.
AppendLost.EVA-UP XIV	Boosts evasion by 28% for each Skell appendage lost.
AppendLost.EVA-UP XV	Boosts evasion by 30% for each Skell appendage lost.
AppendLost.EVA-UP XVI	Boosts evasion by 32% for each Skell appendage lost.
AppendLost.EVA-UP XVII	Boosts evasion by 34% for each Skell appendage lost.
AppendLost.EVA-UP XVIII	Boosts evasion by 36% for each Skell appendage lost.
AppendLost.EVA-UP XIX	Boosts evasion by 38% for each Skell appendage lost.
AppendLost.EVA-UP XX	Boosts evasion by 40% for each Skell appendage lost.
AppendLost.GP I	Prevents GP loss and boosts GP by 50 when an appendage is destroyed.
AppendLost.GP II	Prevents GP loss and boosts GP by 60 when an appendage is destroyed.
AppendLost.GP III	Prevents GP loss and boosts GP by 70 when an appendage is destroyed.
AppendLost.GP IV	Prevents GP loss and boosts GP by 80 when an appendage is destroyed.
AppendLost.GP V	Prevents GP loss and boosts GP by 90 when an appendage is destroyed.
AppendLost.GP VI	Prevents GP loss and boosts GP by 100 when an appendage is destroyed.
AppendLost.GP VII	Prevents GP loss and boosts GP by 110 when an appendage is destroyed.
AppendLost.GP VIII	Prevents GP loss and boosts GP by 120 when an appendage is destroyed.
AppendLost.GP IX	Prevents GP loss and boosts GP by 130 when an appendage is destroyed.
AppendLost.GP X	Prevents GP loss and boosts GP by 140 when an appendage is destroyed.
AppendLost.GP XI	Prevents GP loss and boosts GP by 150 when an appendage is destroyed.
AppendLost.GP XII	Prevents GP loss and boosts GP by 160 when an appendage is destroyed.
AppendLost.GP XIII	Prevents GP loss and boosts GP by 170 when an appendage is destroyed.
AppendLost.GP XIV	Prevents GP loss and boosts GP by 180 when an appendage is destroyed.
AppendLost.GP XV	Prevents GP loss and boosts GP by 190 when an appendage is destroyed.
AppendLost.GP XVI	Prevents GP loss and boosts GP by 200 when an appendage is destroyed.
AppendLost.GP XVII	Prevents GP loss and boosts GP by 210 when an appendage is destroyed.
AppendLost.GP XVIII	Prevents GP loss and boosts GP by 220 when an appendage is destroyed.
AppendLost.GP XIX	Prevents GP loss and boosts GP by 230 when an appendage is destroyed.
AppendLost.GP XX	Prevents GP loss and boosts GP by 250 when an appendage is destroyed.
Reflect.ADD-PHYS	Reflects physical attacks as well when your Skell reflects damage.
Reflect.ADD-BEAM	Reflects beam attacks as well when your Skell reflects damage.
Reflect.ADD-ETHER	Reflects ether attacks as well when your Skell reflects damage.
Reflect.ADD-THERM	Reflects thermal attacks as well when your Skell reflects damage.
Reflect.ADD-ELEC	Reflects electric attacks as well when your Skell reflects damage.
Reflect.ADD-GRAV	Reflects gravity attacks as well when your Skell reflects damage.
Reflect.DAMAGE-UP I	Boosts Skell reflect damage by 5%.
Reflect.DAMAGE-UP II	Boosts Skell reflect damage by 10%.
Reflect.DAMAGE-UP III	Boosts Skell reflect damage by 15%.
Reflect.DAMAGE-UP IV	Boosts Skell reflect damage by 20%.
Reflect.DAMAGE-UP V	Boosts Skell reflect damage by 25%.
Reflect.DAMAGE-UP VI	Boosts Skell reflect damage by 30%.
Reflect.DAMAGE-UP VII	Boosts Skell reflect damage by 35%.
Reflect.DAMAGE-UP VIII	Boosts Skell reflect damage by 40%.
Reflect.DAMAGE-UP IX	Boosts Skell reflect damage by 45%.
Reflect.DAMAGE-UP X	Boosts Skell reflect damage by 50%.
Reflect.DAMAGE-UP XI	Boosts Skell reflect damage by 55%.
Reflect.DAMAGE-UP XII	Boosts Skell reflect damage by 60%.
Reflect.DAMAGE-UP XIII	Boosts Skell reflect damage by 65%.
Reflect.DAMAGE-UP XIV	Boosts Skell reflect damage by 70%.
Reflect.DAMAGE-UP XV	Boosts Skell reflect damage by 75%.
Reflect.DAMAGE-UP XVI	Boosts Skell reflect damage by 80%.
Reflect.DAMAGE-UP XVII	Boosts Skell reflect damage by 85%.
Reflect.DAMAGE-UP XVIII	Boosts Skell reflect damage by 90%.
Reflect.DAMAGE-UP XIX	Boosts Skell reflect damage by 95%.
Reflect.DAMAGE-UP XX	Boosts Skell reflect damage by 100%.
Reflect.NEG-PHYS I	Grants a 5% chance of negating enemy reflection of Skell physical attacks.
Reflect.NEG-PHYS II	Grants a 10% chance of negating enemy reflection of Skell physical attacks.
Reflect.NEG-PHYS III	Grants a 15% chance of negating enemy reflection of Skell physical attacks.
Reflect.NEG-PHYS IV	Grants a 20% chance of negating enemy reflection of Skell physical attacks.
Reflect.NEG-PHYS V	Grants a 25% chance of negating enemy reflection of Skell physical attacks.
Reflect.NEG-PHYS VI	Grants a 30% chance of negating enemy reflection of Skell physical attacks.
Reflect.NEG-PHYS VII	Grants a 35% chance of negating enemy reflection of Skell physical attacks.
Reflect.NEG-PHYS VIII	Grants a 40% chance of negating enemy reflection of Skell physical attacks.
Reflect.NEG-PHYS IX	Grants a 45% chance of negating enemy reflection of Skell physical attacks.
Reflect.NEG-PHYS X	Grants a 50% chance of negating enemy reflection of Skell physical attacks.
Reflect.NEG-PHYS XI	Grants a 55% chance of negating enemy reflection of Skell physical attacks.
Reflect.NEG-PHYS XII	Grants a 60% chance of negating enemy reflection of Skell physical attacks.
Reflect.NEG-PHYS XIII	Grants a 65% chance of negating enemy reflection of Skell physical attacks.
Reflect.NEG-PHYS XIV	Grants a 70% chance of negating enemy reflection of Skell physical attacks.
Reflect.NEG-PHYS XV	Grants a 75% chance of negating enemy reflection of Skell physical attacks.
Reflect.NEG-PHYS XVI	Grants a 80% chance of negating enemy reflection of Skell physical attacks.
Reflect.NEG-PHYS XVII	Grants a 85% chance of negating enemy reflection of Skell physical attacks.
Reflect.NEG-PHYS XVIII	Grants a 90% chance of negating enemy reflection of Skell physical attacks.
Reflect.NEG-PHYS XIX	Grants a 95% chance of negating enemy reflection of Skell physical attacks.
Reflect.NEG-PHYS XX	Grants a 100% chance of negating enemy reflection of Skell physical attacks.
Reflect.NEG-BEAM I	Grants a 5% chance of negating enemy reflection of Skell beam attacks.
Reflect.NEG-BEAM II	Grants a 10% chance of negating enemy reflection of Skell beam attacks.
Reflect.NEG-BEAM III	Grants a 15% chance of negating enemy reflection of Skell beam attacks.
Reflect.NEG-BEAM IV	Grants a 20% chance of negating enemy reflection of Skell beam attacks.
Reflect.NEG-BEAM V	Grants a 25% chance of negating enemy reflection of Skell beam attacks.
Reflect.NEG-BEAM VI	Grants a 30% chance of negating enemy reflection of Skell beam attacks.
Reflect.NEG-BEAM VII	Grants a 35% chance of negating enemy reflection of Skell beam attacks.
Reflect.NEG-BEAM VIII	Grants a 40% chance of negating enemy reflection of Skell beam attacks.
Reflect.NEG-BEAM IX	Grants a 45% chance of negating enemy reflection of Skell beam attacks.
Reflect.NEG-BEAM X	Grants a 50% chance of negating enemy reflection of Skell beam attacks.
Reflect.NEG-BEAM XI	Grants a 55% chance of negating enemy reflection of Skell beam attacks.
Reflect.NEG-BEAM XII	Grants a 60% chance of negating enemy reflection of Skell beam attacks.
Reflect.NEG-BEAM XIII	Grants a 65% chance of negating enemy reflection of Skell beam attacks.
Reflect.NEG-BEAM XIV	Grants a 70% chance of negating enemy reflection of Skell beam attacks.
Reflect.NEG-BEAM XV	Grants a 75% chance of negating enemy reflection of Skell beam attacks.
Reflect.NEG-BEAM XVI	Grants a 80% chance of negating enemy reflection of Skell beam attacks.
Reflect.NEG-BEAM XVII	Grants a 85% chance of negating enemy reflection of Skell beam attacks.
Reflect.NEG-BEAM XVIII	Grants a 90% chance of negating enemy reflection of Skell beam attacks.
Reflect.NEG-BEAM XIX	Grants a 95% chance of negating enemy reflection of Skell beam attacks.
Reflect.NEG-BEAM XX	Grants a 100% chance of negating enemy reflection of Skell beam attacks.
Reflect.NEG-ETHER I	Grants a 5% chance of negating enemy reflection of Skell ether attacks.
Reflect.NEG-ETHER II	Grants a 10% chance of negating enemy reflection of Skell ether attacks.
Reflect.NEG-ETHER III	Grants a 15% chance of negating enemy reflection of Skell ether attacks.
Reflect.NEG-ETHER IV	Grants a 20% chance of negating enemy reflection of Skell ether attacks.
Reflect.NEG-ETHER V	Grants a 25% chance of negating enemy reflection of Skell ether attacks.
Reflect.NEG-ETHER VI	Grants a 30% chance of negating enemy reflection of Skell ether attacks.
Reflect.NEG-ETHER VII	Grants a 35% chance of negating enemy reflection of Skell ether attacks.
Reflect.NEG-ETHER VIII	Grants a 40% chance of negating enemy reflection of Skell ether attacks.
Reflect.NEG-ETHER IX	Grants a 45% chance of negating enemy reflection of Skell ether attacks.
Reflect.NEG-ETHER X	Grants a 50% chance of negating enemy reflection of Skell ether attacks.
Reflect.NEG-ETHER XI	Grants a 55% chance of negating enemy reflection of Skell ether attacks.
Reflect.NEG-ETHER XII	Grants a 60% chance of negating enemy reflection of Skell ether attacks.
Reflect.NEG-ETHER XIII	Grants a 65% chance of negating enemy reflection of Skell ether attacks.
Reflect.NEG-ETHER XIV	Grants a 70% chance of negating enemy reflection of Skell ether attacks.
Reflect.NEG-ETHER XV	Grants a 75% chance of negating enemy reflection of Skell ether attacks.
Reflect.NEG-ETHER XVI	Grants a 80% chance of negating enemy reflection of Skell ether attacks.
Reflect.NEG-ETHER XVII	Grants a 85% chance of negating enemy reflection of Skell ether attacks.
Reflect.NEG-ETHER XVIII	Grants a 90% chance of negating enemy reflection of Skell ether attacks.
Reflect.NEG-ETHER XIX	Grants a 95% chance of negating enemy reflection of Skell ether attacks.
Reflect.NEG-ETHER XX	Grants a 100% chance of negating enemy reflection of Skell ether attacks.
Reflect.NEG-THERM I	Grants a 5% chance of negating enemy reflection of Skell thermal attacks.
Reflect.NEG-THERM II	Grants a 10% chance of negating enemy reflection of Skell thermal attacks.
Reflect.NEG-THERM III	Grants a 15% chance of negating enemy reflection of Skell thermal attacks.
Reflect.NEG-THERM IV	Grants a 20% chance of negating enemy reflection of Skell thermal attacks.
Reflect.NEG-THERM V	Grants a 25% chance of negating enemy reflection of Skell thermal attacks.
Reflect.NEG-THERM VI	Grants a 30% chance of negating enemy reflection of Skell thermal attacks.
Reflect.NEG-THERM VII	Grants a 35% chance of negating enemy reflection of Skell thermal attacks.
Reflect.NEG-THERM VIII	Grants a 40% chance of negating enemy reflection of Skell thermal attacks.
Reflect.NEG-THERM IX	Grants a 45% chance of negating enemy reflection of Skell thermal attacks.
Reflect.NEG-THERM X	Grants a 50% chance of negating enemy reflection of Skell thermal attacks.
Reflect.NEG-THERM XI	Grants a 55% chance of negating enemy reflection of Skell thermal attacks.
Reflect.NEG-THERM XII	Grants a 60% chance of negating enemy reflection of Skell thermal attacks.
Reflect.NEG-THERM XIII	Grants a 65% chance of negating enemy reflection of Skell thermal attacks.
Reflect.NEG-THERM XIV	Grants a 70% chance of negating enemy reflection of Skell thermal attacks.
Reflect.NEG-THERM XV	Grants a 75% chance of negating enemy reflection of Skell thermal attacks.
Reflect.NEG-THERM XVI	Grants a 80% chance of negating enemy reflection of Skell thermal attacks.
Reflect.NEG-THERM XVII	Grants a 85% chance of negating enemy reflection of Skell thermal attacks.
Reflect.NEG-THERM XVIII	Grants a 90% chance of negating enemy reflection of Skell thermal attacks.
Reflect.NEG-THERM XIX	Grants a 95% chance of negating enemy reflection of Skell thermal attacks.
Reflect.NEG-THERM XX	Grants a 100% chance of negating enemy reflection of Skell thermal attacks.
Reflect.NEG-ELEC I	Grants a 5% chance of negating enemy reflection of Skell electric attacks.
Reflect.NEG-ELEC II	Grants a 10% chance of negating enemy reflection of Skell electric attacks.
Reflect.NEG-ELEC III	Grants a 15% chance of negating enemy reflection of Skell electric attacks.
Reflect.NEG-ELEC IV	Grants a 20% chance of negating enemy reflection of Skell electric attacks.
Reflect.NEG-ELEC V	Grants a 25% chance of negating enemy reflection of Skell electric attacks.
Reflect.NEG-ELEC VI	Grants a 30% chance of negating enemy reflection of Skell electric attacks.
Reflect.NEG-ELEC VII	Grants a 35% chance of negating enemy reflection of Skell electric attacks.
Reflect.NEG-ELEC VIII	Grants a 40% chance of negating enemy reflection of Skell electric attacks.
Reflect.NEG-ELEC IX	Grants a 45% chance of negating enemy reflection of Skell electric attacks.
Reflect.NEG-ELEC X	Grants a 50% chance of negating enemy reflection of Skell electric attacks.
Reflect.NEG-ELEC XI	Grants a 55% chance of negating enemy reflection of Skell electric attacks.
Reflect.NEG-ELEC XII	Grants a 60% chance of negating enemy reflection of Skell electric attacks.
Reflect.NEG-ELEC XIII	Grants a 65% chance of negating enemy reflection of Skell electric attacks.
Reflect.NEG-ELEC XIV	Grants a 70% chance of negating enemy reflection of Skell electric attacks.
Reflect.NEG-ELEC XV	Grants a 75% chance of negating enemy reflection of Skell electric attacks.
Reflect.NEG-ELEC XVI	Grants a 80% chance of negating enemy reflection of Skell electric attacks.
Reflect.NEG-ELEC XVII	Grants a 85% chance of negating enemy reflection of Skell electric attacks.
Reflect.NEG-ELEC XVIII	Grants a 90% chance of negating enemy reflection of Skell electric attacks.
Reflect.NEG-ELEC XIX	Grants a 95% chance of negating enemy reflection of Skell electric attacks.
Reflect.NEG-ELEC XX	Grants a 100% chance of negating enemy reflection of Skell electric attacks.
Reflect.NEG-GRAV I	Grants a 5% chance of negating enemy reflection of Skell gravity attacks.
Reflect.NEG-GRAV II	Grants a 10% chance of negating enemy reflection of Skell gravity attacks.
Reflect.NEG-GRAV III	Grants a 15% chance of negating enemy reflection of Skell gravity attacks.
Reflect.NEG-GRAV IV	Grants a 20% chance of negating enemy reflection of Skell gravity attacks.
Reflect.NEG-GRAV V	Grants a 25% chance of negating enemy reflection of Skell gravity attacks.
Reflect.NEG-GRAV VI	Grants a 30% chance of negating enemy reflection of Skell gravity attacks.
Reflect.NEG-GRAV VII	Grants a 35% chance of negating enemy reflection of Skell gravity attacks.
Reflect.NEG-GRAV VIII	Grants a 40% chance of negating enemy reflection of Skell gravity attacks.
Reflect.NEG-GRAV IX	Grants a 45% chance of negating enemy reflection of Skell gravity attacks.
Reflect.NEG-GRAV X	Grants a 50% chance of negating enemy reflection of Skell gravity attacks.
Reflect.NEG-GRAV XI	Grants a 55% chance of negating enemy reflection of Skell gravity attacks.
Reflect.NEG-GRAV XII	Grants a 60% chance of negating enemy reflection of Skell gravity attacks.
Reflect.NEG-GRAV XIII	Grants a 65% chance of negating enemy reflection of Skell gravity attacks.
Reflect.NEG-GRAV XIV	Grants a 70% chance of negating enemy reflection of Skell gravity attacks.
Reflect.NEG-GRAV XV	Grants a 75% chance of negating enemy reflection of Skell gravity attacks.
Reflect.NEG-GRAV XVI	Grants a 80% chance of negating enemy reflection of Skell gravity attacks.
Reflect.NEG-GRAV XVII	Grants a 85% chance of negating enemy reflection of Skell gravity attacks.
Reflect.NEG-GRAV XVIII	Grants a 90% chance of negating enemy reflection of Skell gravity attacks.
Reflect.NEG-GRAV XIX	Grants a 95% chance of negating enemy reflection of Skell gravity attacks.
Reflect.NEG-GRAV XX	Grants a 100% chance of negating enemy reflection of Skell gravity attacks.
Overdrive.FRAME-HP I	Recovers 1% HP when activating Overdrive.
Overdrive.FRAME-HP II	Recovers 2% HP when activating Overdrive.
Overdrive.FRAME-HP III	Recovers 3% HP when activating Overdrive.
Overdrive.FRAME-HP IV	Recovers 4% HP when activating Overdrive.
Overdrive.FRAME-HP V	Recovers 5% HP when activating Overdrive.
Overdrive.FRAME-HP VI	Recovers 6% HP when activating Overdrive.
Overdrive.FRAME-HP VII	Recovers 7% HP when activating Overdrive.
Overdrive.FRAME-HP VIII	Recovers 8% HP when activating Overdrive.
Overdrive.FRAME-HP IX	Recovers 9% HP when activating Overdrive.
Overdrive.FRAME-HP X	Recovers 10% HP when activating Overdrive.
Overdrive.FRAME-HP XI	Recovers 11% HP when activating Overdrive.
Overdrive.FRAME-HP XII	Recovers 12% HP when activating Overdrive.
Overdrive.FRAME-HP XIII	Recovers 13% HP when activating Overdrive.
Overdrive.FRAME-HP XIV	Recovers 14% HP when activating Overdrive.
Overdrive.FRAME-HP XV	Recovers 15% HP when activating Overdrive.
Overdrive.FRAME-HP XVI	Recovers 16% HP when activating Overdrive.
Overdrive.FRAME-HP XVII	Recovers 17% HP when activating Overdrive.
Overdrive.FRAME-HP XVIII	Recovers 18% HP when activating Overdrive.
Overdrive.FRAME-HP XIX	Recovers 19% HP when activating Overdrive.
Overdrive.FRAME-HP XX	Recovers 20% HP when activating Overdrive.
Overdrive.APPEND-HP I	Recovers 1% HP to all appendages when activating Overdrive.
Overdrive.APPEND-HP II	Recovers 2% HP to all appendages when activating Overdrive.
Overdrive.APPEND-HP III	Recovers 3% HP to all appendages when activating Overdrive.
Overdrive.APPEND-HP IV	Recovers 4% HP to all appendages when activating Overdrive.
Overdrive.APPEND-HP V	Recovers 5% HP to all appendages when activating Overdrive.
Overdrive.APPEND-HP VI	Recovers 6% HP to all appendages when activating Overdrive.
Overdrive.APPEND-HP VII	Recovers 7% HP to all appendages when activating Overdrive.
Overdrive.APPEND-HP VIII	Recovers 8% HP to all appendages when activating Overdrive.
Overdrive.APPEND-HP IX	Recovers 9% HP to all appendages when activating Overdrive.
Overdrive.APPEND-HP X	Recovers 10% HP to all appendages when activating Overdrive.
Overdrive.APPEND-HP XI	Recovers 11% HP to all appendages when activating Overdrive.
Overdrive.APPEND-HP XII	Recovers 12% HP to all appendages when activating Overdrive.
Overdrive.APPEND-HP XIII	Recovers 13% HP to all appendages when activating Overdrive.
Overdrive.APPEND-HP XIV	Recovers 14% HP to all appendages when activating Overdrive.
Overdrive.APPEND-HP XV	Recovers 15% HP to all appendages when activating Overdrive.
Overdrive.APPEND-HP XVI	Recovers 16% HP to all appendages when activating Overdrive.
Overdrive.APPEND-HP XVII	Recovers 17% HP to all appendages when activating Overdrive.
Overdrive.APPEND-HP XVIII	Recovers 18% HP to all appendages when activating Overdrive.
Overdrive.APPEND-HP XIX	Recovers 19% HP to all appendages when activating Overdrive.
Overdrive.APPEND-HP XX	Recovers 20% HP to all appendages when activating Overdrive.
Overdrive.EXTEND I	Boosts Overdrive sustainment rate by 1%.
Overdrive.EXTEND II	Boosts Overdrive sustainment rate by 2%.
Overdrive.EXTEND III	Boosts Overdrive sustainment rate by 3%.
Overdrive.EXTEND IV	Boosts Overdrive sustainment rate by 4%.
Overdrive.EXTEND V	Boosts Overdrive sustainment rate by 5%.
Overdrive.EXTEND VII	Boosts Overdrive sustainment rate by 7%.
Overdrive.EXTEND VIII	Boosts Overdrive sustainment rate by 8%.
Overdrive.EXTEND IX	Boosts Overdrive sustainment rate by 9%.
Overdrive.EXTEND X	Boosts Overdrive sustainment rate by 10%.
Overdrive.EXTEND XI	Boosts Overdrive sustainment rate by 11%.
Overdrive.EXTEND XII	Boosts Overdrive sustainment rate by 12%.
Overdrive.EXTEND XIII	Boosts Overdrive sustainment rate by 13%.
Overdrive.EXTEND XIV	Boosts Overdrive sustainment rate by 14%.
Overdrive.EXTEND XV	Boosts Overdrive sustainment rate by 15%.
Overdrive.EXTEND XVI	Boosts Overdrive sustainment rate by 16%.
Overdrive.EXTEND XVII	Boosts Overdrive sustainment rate by 17%.
Overdrive.EXTEND XVIII	Boosts Overdrive sustainment rate by 18%.
Overdrive.EXTEND XIX	Boosts Overdrive sustainment rate by 19%.
Overdrive.EXTEND XX	Boosts Overdrive sustainment rate by 20%.
Arts.GP I	Boosts GP by 10 when using Skell Arts.
Arts.GP II	Boosts GP by 20 when using Skell Arts.
Arts.GP III	Boosts GP by 30 when using Skell Arts.
Arts.GP IV	Boosts GP by 40 when using Skell Arts.
Arts.GP V	Boosts GP by 50 when using Skell Arts.
Arts.GP VI	Boosts GP by 60 when using Skell Arts.
Arts.GP VII	Boosts GP by 70 when using Skell Arts.
Arts.GP VIII	Boosts GP by 80 when using Skell Arts.
Arts.GP IX	Boosts GP by 90 when using Skell Arts.
Arts.GP X	Boosts GP by 100 when using Skell Arts.
Arts.GP XI	Boosts GP by 110 when using Skell Arts.
Arts.GP XII	Boosts GP by 120 when using Skell Arts.
Arts.GP XIII	Boosts GP by 130 when using Skell Arts.
Arts.GP XIV	Boosts GP by 140 when using Skell Arts.
Arts.GP XV	Boosts GP by 150 when using Skell Arts.
Arts.GP XVI	Boosts GP by 160 when using Skell Arts.
Arts.GP XVII	Boosts GP by 170 when using Skell Arts.
Arts.GP XVIII	Boosts GP by 180 when using Skell Arts.
Arts.GP XIX	Boosts GP by 190 when using Skell Arts.
Arts.GP XX	Boosts GP by 200 when using Skell Arts.
TimeEx.TAUNT I	Extends Taunt effects inflicted by your Arts by 1 second(s).
TimeEx.TAUNT II	Extends Taunt effects inflicted by your Arts by 2 second(s).
TimeEx.TAUNT III	Extends Taunt effects inflicted by your Arts by 3 second(s).
TimeEx.TAUNT IV	Extends Taunt effects inflicted by your Arts by 4 second(s).
TimeEx.TAUNT V	Extends Taunt effects inflicted by your Arts by 5 second(s).
TimeEx.TAUNT VI	Extends Taunt effects inflicted by your Arts by 6 second(s).
TimeEx.TAUNT VII	Extends Taunt effects inflicted by your Arts by 7 second(s).
TimeEx.TAUNT VIII	Extends Taunt effects inflicted by your Arts by 8 second(s).
TimeEx.TAUNT IX	Extends Taunt effects inflicted by your Arts by 9 second(s).
TimeEx.TAUNT X	Extends Taunt effects inflicted by your Arts by 10 second(s).
TimeEx.TAUNT XI	Extends Taunt effects inflicted by your Arts by 11 second(s).
TimeEx.TAUNT XII	Extends Taunt effects inflicted by your Arts by 12 second(s).
TimeEx.TAUNT XIII	Extends Taunt effects inflicted by your Arts by 13 second(s).
TimeEx.TAUNT XIV	Extends Taunt effects inflicted by your Arts by 14 second(s).
TimeEx.TAUNT XV	Extends Taunt effects inflicted by your Arts by 15 second(s).
TimeEx.TAUNT XVI	Extends Taunt effects inflicted by your Arts by 16 second(s).
TimeEx.TAUNT XVII	Extends Taunt effects inflicted by your Arts by 17 second(s).
TimeEx.TAUNT XVIII	Extends Taunt effects inflicted by your Arts by 18 second(s).
TimeEx.TAUNT XIX	Extends Taunt effects inflicted by your Arts by 19 second(s).
TimeEx.TAUNT XX	Extends Taunt effects inflicted by your Arts by 20 second(s).
TimeEx.CONTROL I	Extends Control effects inflicted by your Arts by 1 second(s).
TimeEx.CONTROL II	Extends Control effects inflicted by your Arts by 2 second(s).
TimeEx.CONTROL III	Extends Control effects inflicted by your Arts by 3 second(s).
TimeEx.CONTROL IV	Extends Control effects inflicted by your Arts by 4 second(s).
TimeEx.CONTROL V	Extends Control effects inflicted by your Arts by 5 second(s).
TimeEx.CONTROL VI	Extends Control effects inflicted by your Arts by 6 second(s).
TimeEx.CONTROL VII	Extends Control effects inflicted by your Arts by 7 second(s).
TimeEx.CONTROL VIII	Extends Control effects inflicted by your Arts by 8 second(s).
TimeEx.CONTROL IX	Extends Control effects inflicted by your Arts by 9 second(s).
TimeEx.CONTROL X	Extends Control effects inflicted by your Arts by 10 second(s).
TimeEx.CONTROL XI	Extends Control effects inflicted by your Arts by 11 second(s).
TimeEx.CONTROL XII	Extends Control effects inflicted by your Arts by 12 second(s).
TimeEx.CONTROL XIII	Extends Control effects inflicted by your Arts by 13 second(s).
TimeEx.CONTROL XIV	Extends Control effects inflicted by your Arts by 14 second(s).
TimeEx.CONTROL XV	Extends Control effects inflicted by your Arts by 15 second(s).
TimeEx.CONTROL XVI	Extends Control effects inflicted by your Arts by 16 second(s).
TimeEx.CONTROL XVII	Extends Control effects inflicted by your Arts by 17 second(s).
TimeEx.CONTROL XVIII	Extends Control effects inflicted by your Arts by 18 second(s).
TimeEx.CONTROL XIX	Extends Control effects inflicted by your Arts by 19 second(s).
TimeEx.CONTROL XX	Extends Control effects inflicted by your Arts by 20 second(s).
TimeEx.SLEEP I	Extends Sleep effects inflicted by your Arts by 1 second(s).
TimeEx.SLEEP II	Extends Sleep effects inflicted by your Arts by 2 second(s).
TimeEx.SLEEP III	Extends Sleep effects inflicted by your Arts by 3 second(s).
TimeEx.SLEEP IV	Extends Sleep effects inflicted by your Arts by 4 second(s).
TimeEx.SLEEP V	Extends Sleep effects inflicted by your Arts by 5 second(s).
TimeEx.SLEEP VI	Extends Sleep effects inflicted by your Arts by 6 second(s).
TimeEx.SLEEP VII	Extends Sleep effects inflicted by your Arts by 7 second(s).
TimeEx.SLEEP VIII	Extends Sleep effects inflicted by your Arts by 8 second(s).
TimeEx.SLEEP IX	Extends Sleep effects inflicted by your Arts by 9 second(s).
TimeEx.SLEEP X	Extends Sleep effects inflicted by your Arts by 10 second(s).
TimeEx.SLEEP XI	Extends Sleep effects inflicted by your Arts by 11 second(s).
TimeEx.SLEEP XII	Extends Sleep effects inflicted by your Arts by 12 second(s).
TimeEx.SLEEP XIII	Extends Sleep effects inflicted by your Arts by 13 second(s).
TimeEx.SLEEP XIV	Extends Sleep effects inflicted by your Arts by 14 second(s).
TimeEx.SLEEP XV	Extends Sleep effects inflicted by your Arts by 15 second(s).
TimeEx.SLEEP XVI	Extends Sleep effects inflicted by your Arts by 16 second(s).
TimeEx.SLEEP XVII	Extends Sleep effects inflicted by your Arts by 17 second(s).
TimeEx.SLEEP XVIII	Extends Sleep effects inflicted by your Arts by 18 second(s).
TimeEx.SLEEP XIX	Extends Sleep effects inflicted by your Arts by 19 second(s).
TimeEx.SLEEP XX	Extends Sleep effects inflicted by your Arts by 20 second(s).
TimeEx.VIRUS I	Extends Virus effects inflicted by your Arts by 1 second(s).
TimeEx.VIRUS II	Extends Virus effects inflicted by your Arts by 2 second(s).
TimeEx.VIRUS III	Extends Virus effects inflicted by your Arts by 3 second(s).
TimeEx.VIRUS IV	Extends Virus effects inflicted by your Arts by 4 second(s).
TimeEx.VIRUS V	Extends Virus effects inflicted by your Arts by 5 second(s).
TimeEx.VIRUS VI	Extends Virus effects inflicted by your Arts by 6 second(s).
TimeEx.VIRUS VII	Extends Virus effects inflicted by your Arts by 7 second(s).
TimeEx.VIRUS VIII	Extends Virus effects inflicted by your Arts by 8 second(s).
TimeEx.VIRUS IX	Extends Virus effects inflicted by your Arts by 9 second(s).
TimeEx.VIRUS X	Extends Virus effects inflicted by your Arts by 10 second(s).
TimeEx.VIRUS XI	Extends Virus effects inflicted by your Arts by 11 second(s).
TimeEx.VIRUS XII	Extends Virus effects inflicted by your Arts by 12 second(s).
TimeEx.VIRUS XIII	Extends Virus effects inflicted by your Arts by 13 second(s).
TimeEx.VIRUS XIV	Extends Virus effects inflicted by your Arts by 14 second(s).
TimeEx.VIRUS XV	Extends Virus effects inflicted by your Arts by 15 second(s).
TimeEx.VIRUS XVI	Extends Virus effects inflicted by your Arts by 16 second(s).
TimeEx.VIRUS XVII	Extends Virus effects inflicted by your Arts by 17 second(s).
TimeEx.VIRUS XVIII	Extends Virus effects inflicted by your Arts by 18 second(s).
TimeEx.VIRUS XIX	Extends Virus effects inflicted by your Arts by 19 second(s).
TimeEx.VIRUS XX	Extends Virus effects inflicted by your Arts by 20 second(s).
TimeEx.BLACKOUT I	Extends Blackout effects inflicted by your Arts by 1 second(s).
TimeEx.BLACKOUT II	Extends Blackout effects inflicted by your Arts by 2 second(s).
TimeEx.BLACKOUT III	Extends Blackout effects inflicted by your Arts by 3 second(s).
TimeEx.BLACKOUT IV	Extends Blackout effects inflicted by your Arts by 4 second(s).
TimeEx.BLACKOUT V	Extends Blackout effects inflicted by your Arts by 5 second(s).
TimeEx.BLACKOUT VI	Extends Blackout effects inflicted by your Arts by 6 second(s).
TimeEx.BLACKOUT VII	Extends Blackout effects inflicted by your Arts by 7 second(s).
TimeEx.BLACKOUT VIII	Extends Blackout effects inflicted by your Arts by 8 second(s).
TimeEx.BLACKOUT IX	Extends Blackout effects inflicted by your Arts by 9 second(s).
TimeEx.BLACKOUT X	Extends Blackout effects inflicted by your Arts by 10 second(s).
TimeEx.BLACKOUT XI	Extends Blackout effects inflicted by your Arts by 11 second(s).
TimeEx.BLACKOUT XII	Extends Blackout effects inflicted by your Arts by 12 second(s).
TimeEx.BLACKOUT XIII	Extends Blackout effects inflicted by your Arts by 13 second(s).
TimeEx.BLACKOUT XIV	Extends Blackout effects inflicted by your Arts by 14 second(s).
TimeEx.BLACKOUT XV	Extends Blackout effects inflicted by your Arts by 15 second(s).
TimeEx.BLACKOUT XVI	Extends Blackout effects inflicted by your Arts by 16 second(s).
TimeEx.BLACKOUT XVII	Extends Blackout effects inflicted by your Arts by 17 second(s).
TimeEx.BLACKOUT XVIII	Extends Blackout effects inflicted by your Arts by 18 second(s).
TimeEx.BLACKOUT XIX	Extends Blackout effects inflicted by your Arts by 19 second(s).
TimeEx.BLACKOUT XX	Extends Blackout effects inflicted by your Arts by 20 second(s).
TimeEx.FATIGUE I	Extends Fatigue effects inflicted by your Arts by 1 second(s).
TimeEx.FATIGUE II	Extends Fatigue effects inflicted by your Arts by 2 second(s).
TimeEx.FATIGUE III	Extends Fatigue effects inflicted by your Arts by 3 second(s).
TimeEx.FATIGUE IV	Extends Fatigue effects inflicted by your Arts by 4 second(s).
TimeEx.FATIGUE V	Extends Fatigue effects inflicted by your Arts by 5 second(s).
TimeEx.FATIGUE VI	Extends Fatigue effects inflicted by your Arts by 6 second(s).
TimeEx.FATIGUE VII	Extends Fatigue effects inflicted by your Arts by 7 second(s).
TimeEx.FATIGUE VIII	Extends Fatigue effects inflicted by your Arts by 8 second(s).
TimeEx.FATIGUE IX	Extends Fatigue effects inflicted by your Arts by 9 second(s).
TimeEx.FATIGUE X	Extends Fatigue effects inflicted by your Arts by 10 second(s).
TimeEx.FATIGUE XI	Extends Fatigue effects inflicted by your Arts by 11 second(s).
TimeEx.FATIGUE XII	Extends Fatigue effects inflicted by your Arts by 12 second(s).
TimeEx.FATIGUE XIII	Extends Fatigue effects inflicted by your Arts by 13 second(s).
TimeEx.FATIGUE XIV	Extends Fatigue effects inflicted by your Arts by 14 second(s).
TimeEx.FATIGUE XV	Extends Fatigue effects inflicted by your Arts by 15 second(s).
TimeEx.FATIGUE XVI	Extends Fatigue effects inflicted by your Arts by 16 second(s).
TimeEx.FATIGUE XVII	Extends Fatigue effects inflicted by your Arts by 17 second(s).
TimeEx.FATIGUE XVIII	Extends Fatigue effects inflicted by your Arts by 18 second(s).
TimeEx.FATIGUE XIX	Extends Fatigue effects inflicted by your Arts by 19 second(s).
TimeEx.FATIGUE XX	Extends Fatigue effects inflicted by your Arts by 20 second(s).
TimeEx.SLOW-ARTS I	Extends Slow Arts effects inflicted by your Arts by 1 second(s).
TimeEx.SLOW-ARTS II	Extends Slow Arts effects inflicted by your Arts by 2 second(s).
TimeEx.SLOW-ARTS III	Extends Slow Arts effects inflicted by your Arts by 3 second(s).
TimeEx.SLOW-ARTS IV	Extends Slow Arts effects inflicted by your Arts by 4 second(s).
TimeEx.SLOW-ARTS V	Extends Slow Arts effects inflicted by your Arts by 5 second(s).
TimeEx.SLOW-ARTS VI	Extends Slow Arts effects inflicted by your Arts by 6 second(s).
TimeEx.SLOW-ARTS VII	Extends Slow Arts effects inflicted by your Arts by 7 second(s).
TimeEx.SLOW-ARTS VIII	Extends Slow Arts effects inflicted by your Arts by 8 second(s).
TimeEx.SLOW-ARTS IX	Extends Slow Arts effects inflicted by your Arts by 9 second(s).
TimeEx.SLOW-ARTS X	Extends Slow Arts effects inflicted by your Arts by 10 second(s).
TimeEx.SLOW-ARTS XI	Extends Slow Arts effects inflicted by your Arts by 11 second(s).
TimeEx.SLOW-ARTS XII	Extends Slow Arts effects inflicted by your Arts by 12 second(s).
TimeEx.SLOW-ARTS XIII	Extends Slow Arts effects inflicted by your Arts by 13 second(s).
TimeEx.SLOW-ARTS XIV	Extends Slow Arts effects inflicted by your Arts by 14 second(s).
TimeEx.SLOW-ARTS XV	Extends Slow Arts effects inflicted by your Arts by 15 second(s).
TimeEx.SLOW-ARTS XVI	Extends Slow Arts effects inflicted by your Arts by 16 second(s).
TimeEx.SLOW-ARTS XVII	Extends Slow Arts effects inflicted by your Arts by 17 second(s).
TimeEx.SLOW-ARTS XVIII	Extends Slow Arts effects inflicted by your Arts by 18 second(s).
TimeEx.SLOW-ARTS XIX	Extends Slow Arts effects inflicted by your Arts by 19 second(s).
TimeEx.SLOW-ARTS XX	Extends Slow Arts effects inflicted by your Arts by 20 second(s).
TimeEx.DEBUFF-DOWN I	Extends Debuff Res Down effects inflicted by your Arts by 1 second(s).
TimeEx.DEBUFF-DOWN II	Extends Debuff Res Down effects inflicted by your Arts by 2 second(s).
TimeEx.DEBUFF-DOWN III	Extends Debuff Res Down effects inflicted by your Arts by 3 second(s).
TimeEx.DEBUFF-DOWN IV	Extends Debuff Res Down effects inflicted by your Arts by 4 second(s).
TimeEx.DEBUFF-DOWN V	Extends Debuff Res Down effects inflicted by your Arts by 5 second(s).
TimeEx.DEBUFF-DOWN VI	Extends Debuff Res Down effects inflicted by your Arts by 6 second(s).
TimeEx.DEBUFF-DOWN VII	Extends Debuff Res Down effects inflicted by your Arts by 7 second(s).
TimeEx.DEBUFF-DOWN VIII	Extends Debuff Res Down effects inflicted by your Arts by 8 second(s).
TimeEx.DEBUFF-DOWN IX	Extends Debuff Res Down effects inflicted by your Arts by 9 second(s).
TimeEx.DEBUFF-DOWN X	Extends Debuff Res Down effects inflicted by your Arts by 10 second(s).
TimeEx.DEBUFF-DOWN XI	Extends Debuff Res Down effects inflicted by your Arts by 11 second(s).
TimeEx.DEBUFF-DOWN XII	Extends Debuff Res Down effects inflicted by your Arts by 12 second(s).
TimeEx.DEBUFF-DOWN XIII	Extends Debuff Res Down effects inflicted by your Arts by 13 second(s).
TimeEx.DEBUFF-DOWN XIV	Extends Debuff Res Down effects inflicted by your Arts by 14 second(s).
TimeEx.DEBUFF-DOWN XV	Extends Debuff Res Down effects inflicted by your Arts by 15 second(s).
TimeEx.DEBUFF-DOWN XVI	Extends Debuff Res Down effects inflicted by your Arts by 16 second(s).
TimeEx.DEBUFF-DOWN XVII	Extends Debuff Res Down effects inflicted by your Arts by 17 second(s).
TimeEx.DEBUFF-DOWN XVIII	Extends Debuff Res Down effects inflicted by your Arts by 18 second(s).
TimeEx.DEBUFF-DOWN XIX	Extends Debuff Res Down effects inflicted by your Arts by 19 second(s).
TimeEx.DEBUFF-DOWN XX	Extends Debuff Res Down effects inflicted by your Arts by 20 second(s).
TimeEx.RECOV-DOWN I	Extends HP Recovery Down effects inflicted by your Arts by 1 second(s).
TimeEx.RECOV-DOWN II	Extends HP Recovery Down effects inflicted by your Arts by 2 second(s).
TimeEx.RECOV-DOWN III	Extends HP Recovery Down effects inflicted by your Arts by 3 second(s).
TimeEx.RECOV-DOWN IV	Extends HP Recovery Down effects inflicted by your Arts by 4 second(s).
TimeEx.RECOV-DOWN V	Extends HP Recovery Down effects inflicted by your Arts by 5 second(s).
TimeEx.RECOV-DOWN VI	Extends HP Recovery Down effects inflicted by your Arts by 6 second(s).
TimeEx.RECOV-DOWN VII	Extends HP Recovery Down effects inflicted by your Arts by 7 second(s).
TimeEx.RECOV-DOWN VIII	Extends HP Recovery Down effects inflicted by your Arts by 8 second(s).
TimeEx.RECOV-DOWN IX	Extends HP Recovery Down effects inflicted by your Arts by 9 second(s).
TimeEx.RECOV-DOWN X	Extends HP Recovery Down effects inflicted by your Arts by 10 second(s).
TimeEx.RECOV-DOWN XI	Extends HP Recovery Down effects inflicted by your Arts by 11 second(s).
TimeEx.RECOV-DOWN XII	Extends HP Recovery Down effects inflicted by your Arts by 12 second(s).
TimeEx.RECOV-DOWN XIII	Extends HP Recovery Down effects inflicted by your Arts by 13 second(s).
TimeEx.RECOV-DOWN XIV	Extends HP Recovery Down effects inflicted by your Arts by 14 second(s).
TimeEx.RECOV-DOWN XV	Extends HP Recovery Down effects inflicted by your Arts by 15 second(s).
TimeEx.RECOV-DOWN XVI	Extends HP Recovery Down effects inflicted by your Arts by 16 second(s).
TimeEx.RECOV-DOWN XVII	Extends HP Recovery Down effects inflicted by your Arts by 17 second(s).
TimeEx.RECOV-DOWN XVIII	Extends HP Recovery Down effects inflicted by your Arts by 18 second(s).
TimeEx.RECOV-DOWN XIX	Extends HP Recovery Down effects inflicted by your Arts by 19 second(s).
TimeEx.RECOV-DOWN XX	Extends HP Recovery Down effects inflicted by your Arts by 20 second(s).
TimeEx.BLAZE I	Extends Blaze effects inflicted by your Arts by 1 second(s).
TimeEx.BLAZE II	Extends Blaze effects inflicted by your Arts by 2 second(s).
TimeEx.BLAZE III	Extends Blaze effects inflicted by your Arts by 3 second(s).
TimeEx.BLAZE IV	Extends Blaze effects inflicted by your Arts by 4 second(s).
TimeEx.BLAZE V	Extends Blaze effects inflicted by your Arts by 5 second(s).
TimeEx.BLAZE VI	Extends Blaze effects inflicted by your Arts by 6 second(s).
TimeEx.BLAZE VII	Extends Blaze effects inflicted by your Arts by 7 second(s).
TimeEx.BLAZE VIII	Extends Blaze effects inflicted by your Arts by 8 second(s).
TimeEx.BLAZE IX	Extends Blaze effects inflicted by your Arts by 9 second(s).
TimeEx.BLAZE X	Extends Blaze effects inflicted by your Arts by 10 second(s).
TimeEx.BLAZE XI	Extends Blaze effects inflicted by your Arts by 11 second(s).
TimeEx.BLAZE XII	Extends Blaze effects inflicted by your Arts by 12 second(s).
TimeEx.BLAZE XIII	Extends Blaze effects inflicted by your Arts by 13 second(s).
TimeEx.BLAZE XIV	Extends Blaze effects inflicted by your Arts by 14 second(s).
TimeEx.BLAZE XV	Extends Blaze effects inflicted by your Arts by 15 second(s).
TimeEx.BLAZE XVI	Extends Blaze effects inflicted by your Arts by 16 second(s).
TimeEx.BLAZE XVII	Extends Blaze effects inflicted by your Arts by 17 second(s).
TimeEx.BLAZE XVIII	Extends Blaze effects inflicted by your Arts by 18 second(s).
TimeEx.BLAZE XIX	Extends Blaze effects inflicted by your Arts by 19 second(s).
TimeEx.BLAZE XX	Extends Blaze effects inflicted by your Arts by 20 second(s).
TimeEx.SHOCK I	Extends Shock effects inflicted by your Arts by 1 second(s).
TimeEx.SHOCK II	Extends Shock effects inflicted by your Arts by 2 second(s).
TimeEx.SHOCK III	Extends Shock effects inflicted by your Arts by 3 second(s).
TimeEx.SHOCK IV	Extends Shock effects inflicted by your Arts by 4 second(s).
TimeEx.SHOCK V	Extends Shock effects inflicted by your Arts by 5 second(s).
TimeEx.SHOCK VI	Extends Shock effects inflicted by your Arts by 6 second(s).
TimeEx.SHOCK VII	Extends Shock effects inflicted by your Arts by 7 second(s).
TimeEx.SHOCK VIII	Extends Shock effects inflicted by your Arts by 8 second(s).
TimeEx.SHOCK IX	Extends Shock effects inflicted by your Arts by 9 second(s).
TimeEx.SHOCK X	Extends Shock effects inflicted by your Arts by 10 second(s).
TimeEx.SHOCK XI	Extends Shock effects inflicted by your Arts by 11 second(s).
TimeEx.SHOCK XII	Extends Shock effects inflicted by your Arts by 12 second(s).
TimeEx.SHOCK XIII	Extends Shock effects inflicted by your Arts by 13 second(s).
TimeEx.SHOCK XIV	Extends Shock effects inflicted by your Arts by 14 second(s).
TimeEx.SHOCK XV	Extends Shock effects inflicted by your Arts by 15 second(s).
TimeEx.SHOCK XVI	Extends Shock effects inflicted by your Arts by 16 second(s).
TimeEx.SHOCK XVII	Extends Shock effects inflicted by your Arts by 17 second(s).
TimeEx.SHOCK XVIII	Extends Shock effects inflicted by your Arts by 18 second(s).
TimeEx.SHOCK XIX	Extends Shock effects inflicted by your Arts by 19 second(s).
TimeEx.SHOCK XX	Extends Shock effects inflicted by your Arts by 20 second(s).
TimeEx.PHYS-DOWN I	Extends Physical Res Down effects inflicted by your Arts by 1 second(s).
TimeEx.PHYS-DOWN II	Extends Physical Res Down effects inflicted by your Arts by 2 second(s).
TimeEx.PHYS-DOWN III	Extends Physical Res Down effects inflicted by your Arts by 3 second(s).
TimeEx.PHYS-DOWN IV	Extends Physical Res Down effects inflicted by your Arts by 4 second(s).
TimeEx.PHYS-DOWN V	Extends Physical Res Down effects inflicted by your Arts by 5 second(s).
TimeEx.PHYS-DOWN VI	Extends Physical Res Down effects inflicted by your Arts by 6 second(s).
TimeEx.PHYS-DOWN VII	Extends Physical Res Down effects inflicted by your Arts by 7 second(s).
TimeEx.PHYS-DOWN VIII	Extends Physical Res Down effects inflicted by your Arts by 8 second(s).
TimeEx.PHYS-DOWN IX	Extends Physical Res Down effects inflicted by your Arts by 9 second(s).
TimeEx.PHYS-DOWN X	Extends Physical Res Down effects inflicted by your Arts by 10 second(s).
TimeEx.PHYS-DOWN XI	Extends Physical Res Down effects inflicted by your Arts by 11 second(s).
TimeEx.PHYS-DOWN XII	Extends Physical Res Down effects inflicted by your Arts by 12 second(s).
TimeEx.PHYS-DOWN XIII	Extends Physical Res Down effects inflicted by your Arts by 13 second(s).
TimeEx.PHYS-DOWN XIV	Extends Physical Res Down effects inflicted by your Arts by 14 second(s).
TimeEx.PHYS-DOWN XV	Extends Physical Res Down effects inflicted by your Arts by 15 second(s).
TimeEx.PHYS-DOWN XVI	Extends Physical Res Down effects inflicted by your Arts by 16 second(s).
TimeEx.PHYS-DOWN XVII	Extends Physical Res Down effects inflicted by your Arts by 17 second(s).
TimeEx.PHYS-DOWN XVIII	Extends Physical Res Down effects inflicted by your Arts by 18 second(s).
TimeEx.PHYS-DOWN XIX	Extends Physical Res Down effects inflicted by your Arts by 19 second(s).
TimeEx.PHYS-DOWN XX	Extends Physical Res Down effects inflicted by your Arts by 20 second(s).
TimeEx.BEAM-DOWN I	Extends Beam Res Down effects inflicted by your Arts by 1 second(s).
TimeEx.BEAM-DOWN II	Extends Beam Res Down effects inflicted by your Arts by 2 second(s).
TimeEx.BEAM-DOWN III	Extends Beam Res Down effects inflicted by your Arts by 3 second(s).
TimeEx.BEAM-DOWN IV	Extends Beam Res Down effects inflicted by your Arts by 4 second(s).
TimeEx.BEAM-DOWN V	Extends Beam Res Down effects inflicted by your Arts by 5 second(s).
TimeEx.BEAM-DOWN VI	Extends Beam Res Down effects inflicted by your Arts by 6 second(s).
TimeEx.BEAM-DOWN VII	Extends Beam Res Down effects inflicted by your Arts by 7 second(s).
TimeEx.BEAM-DOWN VIII	Extends Beam Res Down effects inflicted by your Arts by 8 second(s).
TimeEx.BEAM-DOWN IX	Extends Beam Res Down effects inflicted by your Arts by 9 second(s).
TimeEx.BEAM-DOWN X	Extends Beam Res Down effects inflicted by your Arts by 10 second(s).
TimeEx.BEAM-DOWN XI	Extends Beam Res Down effects inflicted by your Arts by 11 second(s).
TimeEx.BEAM-DOWN XII	Extends Beam Res Down effects inflicted by your Arts by 12 second(s).
TimeEx.BEAM-DOWN XIII	Extends Beam Res Down effects inflicted by your Arts by 13 second(s).
TimeEx.BEAM-DOWN XIV	Extends Beam Res Down effects inflicted by your Arts by 14 second(s).
TimeEx.BEAM-DOWN XV	Extends Beam Res Down effects inflicted by your Arts by 15 second(s).
TimeEx.BEAM-DOWN XVI	Extends Beam Res Down effects inflicted by your Arts by 16 second(s).
TimeEx.BEAM-DOWN XVII	Extends Beam Res Down effects inflicted by your Arts by 17 second(s).
TimeEx.BEAM-DOWN XVIII	Extends Beam Res Down effects inflicted by your Arts by 18 second(s).
TimeEx.BEAM-DOWN XIX	Extends Beam Res Down effects inflicted by your Arts by 19 second(s).
TimeEx.BEAM-DOWN XX	Extends Beam Res Down effects inflicted by your Arts by 20 second(s).
TimeEx.ETHER-DOWN I	Extends Ether Res Down effects inflicted by your Arts by 1 second(s).
TimeEx.ETHER-DOWN II	Extends Ether Res Down effects inflicted by your Arts by 2 second(s).
TimeEx.ETHER-DOWN III	Extends Ether Res Down effects inflicted by your Arts by 3 second(s).
TimeEx.ETHER-DOWN IV	Extends Ether Res Down effects inflicted by your Arts by 4 second(s).
TimeEx.ETHER-DOWN V	Extends Ether Res Down effects inflicted by your Arts by 5 second(s).
TimeEx.ETHER-DOWN VI	Extends Ether Res Down effects inflicted by your Arts by 6 second(s).
TimeEx.ETHER-DOWN VII	Extends Ether Res Down effects inflicted by your Arts by 7 second(s).
TimeEx.ETHER-DOWN VIII	Extends Ether Res Down effects inflicted by your Arts by 8 second(s).
TimeEx.ETHER-DOWN IX	Extends Ether Res Down effects inflicted by your Arts by 9 second(s).
TimeEx.ETHER-DOWN X	Extends Ether Res Down effects inflicted by your Arts by 10 second(s).
TimeEx.ETHER-DOWN XI	Extends Ether Res Down effects inflicted by your Arts by 11 second(s).
TimeEx.ETHER-DOWN XII	Extends Ether Res Down effects inflicted by your Arts by 12 second(s).
TimeEx.ETHER-DOWN XIII	Extends Ether Res Down effects inflicted by your Arts by 13 second(s).
TimeEx.ETHER-DOWN XIV	Extends Ether Res Down effects inflicted by your Arts by 14 second(s).
TimeEx.ETHER-DOWN XV	Extends Ether Res Down effects inflicted by your Arts by 15 second(s).
TimeEx.ETHER-DOWN XVI	Extends Ether Res Down effects inflicted by your Arts by 16 second(s).
TimeEx.ETHER-DOWN XVII	Extends Ether Res Down effects inflicted by your Arts by 17 second(s).
TimeEx.ETHER-DOWN XVIII	Extends Ether Res Down effects inflicted by your Arts by 18 second(s).
TimeEx.ETHER-DOWN XIX	Extends Ether Res Down effects inflicted by your Arts by 19 second(s).
TimeEx.ETHER-DOWN XX	Extends Ether Res Down effects inflicted by your Arts by 20 second(s).
TimeEx.THERM-DOWN I	Extends Thermal Res Down effects inflicted by your Arts by 1 second(s).
TimeEx.THERM-DOWN II	Extends Thermal Res Down effects inflicted by your Arts by 2 second(s).
TimeEx.THERM-DOWN III	Extends Thermal Res Down effects inflicted by your Arts by 3 second(s).
TimeEx.THERM-DOWN IV	Extends Thermal Res Down effects inflicted by your Arts by 4 second(s).
TimeEx.THERM-DOWN V	Extends Thermal Res Down effects inflicted by your Arts by 5 second(s).
TimeEx.THERM-DOWN VI	Extends Thermal Res Down effects inflicted by your Arts by 6 second(s).
TimeEx.THERM-DOWN VII	Extends Thermal Res Down effects inflicted by your Arts by 7 second(s).
TimeEx.THERM-DOWN VIII	Extends Thermal Res Down effects inflicted by your Arts by 8 second(s).
TimeEx.THERM-DOWN IX	Extends Thermal Res Down effects inflicted by your Arts by 9 second(s).
TimeEx.THERM-DOWN X	Extends Thermal Res Down effects inflicted by your Arts by 10 second(s).
TimeEx.THERM-DOWN XI	Extends Thermal Res Down effects inflicted by your Arts by 11 second(s).
TimeEx.THERM-DOWN XII	Extends Thermal Res Down effects inflicted by your Arts by 12 second(s).
TimeEx.THERM-DOWN XIII	Extends Thermal Res Down effects inflicted by your Arts by 13 second(s).
TimeEx.THERM-DOWN XIV	Extends Thermal Res Down effects inflicted by your Arts by 14 second(s).
TimeEx.THERM-DOWN XV	Extends Thermal Res Down effects inflicted by your Arts by 15 second(s).
TimeEx.THERM-DOWN XVI	Extends Thermal Res Down effects inflicted by your Arts by 16 second(s).
TimeEx.THERM-DOWN XVII	Extends Thermal Res Down effects inflicted by your Arts by 17 second(s).
TimeEx.THERM-DOWN XVIII	Extends Thermal Res Down effects inflicted by your Arts by 18 second(s).
TimeEx.THERM-DOWN XIX	Extends Thermal Res Down effects inflicted by your Arts by 19 second(s).
TimeEx.THERM-DOWN XX	Extends Thermal Res Down effects inflicted by your Arts by 20 second(s).
TimeEx.ELEC-DOWN I	Extends Electric Res Down effects inflicted by your Arts by 1 second(s).
TimeEx.ELEC-DOWN II	Extends Electric Res Down effects inflicted by your Arts by 2 second(s).
TimeEx.ELEC-DOWN III	Extends Electric Res Down effects inflicted by your Arts by 3 second(s).
TimeEx.ELEC-DOWN IV	Extends Electric Res Down effects inflicted by your Arts by 4 second(s).
TimeEx.ELEC-DOWN V	Extends Electric Res Down effects inflicted by your Arts by 5 second(s).
TimeEx.ELEC-DOWN VI	Extends Electric Res Down effects inflicted by your Arts by 6 second(s).
TimeEx.ELEC-DOWN VII	Extends Electric Res Down effects inflicted by your Arts by 7 second(s).
TimeEx.ELEC-DOWN VIII	Extends Electric Res Down effects inflicted by your Arts by 8 second(s).
TimeEx.ELEC-DOWN IX	Extends Electric Res Down effects inflicted by your Arts by 9 second(s).
TimeEx.ELEC-DOWN X	Extends Electric Res Down effects inflicted by your Arts by 10 second(s).
TimeEx.ELEC-DOWN XI	Extends Electric Res Down effects inflicted by your Arts by 11 second(s).
TimeEx.ELEC-DOWN XII	Extends Electric Res Down effects inflicted by your Arts by 12 second(s).
TimeEx.ELEC-DOWN XIII	Extends Electric Res Down effects inflicted by your Arts by 13 second(s).
TimeEx.ELEC-DOWN XIV	Extends Electric Res Down effects inflicted by your Arts by 14 second(s).
TimeEx.ELEC-DOWN XV	Extends Electric Res Down effects inflicted by your Arts by 15 second(s).
TimeEx.ELEC-DOWN XVI	Extends Electric Res Down effects inflicted by your Arts by 16 second(s).
TimeEx.ELEC-DOWN XVII	Extends Electric Res Down effects inflicted by your Arts by 17 second(s).
TimeEx.ELEC-DOWN XVIII	Extends Electric Res Down effects inflicted by your Arts by 18 second(s).
TimeEx.ELEC-DOWN XIX	Extends Electric Res Down effects inflicted by your Arts by 19 second(s).
TimeEx.ELEC-DOWN XX	Extends Electric Res Down effects inflicted by your Arts by 20 second(s).
TimeEx.GRAV-DOWN I	Extends Gravity Res Down effects inflicted by your Arts by 1 second(s).
TimeEx.GRAV-DOWN II	Extends Gravity Res Down effects inflicted by your Arts by 2 second(s).
TimeEx.GRAV-DOWN III	Extends Gravity Res Down effects inflicted by your Arts by 3 second(s).
TimeEx.GRAV-DOWN IV	Extends Gravity Res Down effects inflicted by your Arts by 4 second(s).
TimeEx.GRAV-DOWN V	Extends Gravity Res Down effects inflicted by your Arts by 5 second(s).
TimeEx.GRAV-DOWN VI	Extends Gravity Res Down effects inflicted by your Arts by 6 second(s).
TimeEx.GRAV-DOWN VII	Extends Gravity Res Down effects inflicted by your Arts by 7 second(s).
TimeEx.GRAV-DOWN VIII	Extends Gravity Res Down effects inflicted by your Arts by 8 second(s).
TimeEx.GRAV-DOWN IX	Extends Gravity Res Down effects inflicted by your Arts by 9 second(s).
TimeEx.GRAV-DOWN X	Extends Gravity Res Down effects inflicted by your Arts by 10 second(s).
TimeEx.GRAV-DOWN XI	Extends Gravity Res Down effects inflicted by your Arts by 11 second(s).
TimeEx.GRAV-DOWN XII	Extends Gravity Res Down effects inflicted by your Arts by 12 second(s).
TimeEx.GRAV-DOWN XIII	Extends Gravity Res Down effects inflicted by your Arts by 13 second(s).
TimeEx.GRAV-DOWN XIV	Extends Gravity Res Down effects inflicted by your Arts by 14 second(s).
TimeEx.GRAV-DOWN XV	Extends Gravity Res Down effects inflicted by your Arts by 15 second(s).
TimeEx.GRAV-DOWN XVI	Extends Gravity Res Down effects inflicted by your Arts by 16 second(s).
TimeEx.GRAV-DOWN XVII	Extends Gravity Res Down effects inflicted by your Arts by 17 second(s).
TimeEx.GRAV-DOWN XVIII	Extends Gravity Res Down effects inflicted by your Arts by 18 second(s).
TimeEx.GRAV-DOWN XIX	Extends Gravity Res Down effects inflicted by your Arts by 19 second(s).
TimeEx.GRAV-DOWN XX	Extends Gravity Res Down effects inflicted by your Arts by 20 second(s).
Draw.OPENING-DMG I	Boosts Skell Opening Art damage by 5%.
Draw.OPENING-DMG II	Boosts Skell Opening Art damage by 10%.
Draw.OPENING-DMG III	Boosts Skell Opening Art damage by 15%.
Draw.OPENING-DMG IV	Boosts Skell Opening Art damage by 20%.
Draw.OPENING-DMG V	Boosts Skell Opening Art damage by 25%.
Draw.OPENING-DMG VI	Boosts Skell Opening Art damage by 30%.
Draw.OPENING-DMG VII	Boosts Skell Opening Art damage by 35%.
Draw.OPENING-DMG VIII	Boosts Skell Opening Art damage by 40%.
Draw.OPENING-DMG IX	Boosts Skell Opening Art damage by 45%.
Draw.OPENING-DMG X	Boosts Skell Opening Art damage by 50%.
Draw.OPENING-DMG XI	Boosts Skell Opening Art damage by 55%.
Draw.OPENING-DMG XII	Boosts Skell Opening Art damage by 60%.
Draw.OPENING-DMG XIII	Boosts Skell Opening Art damage by 65%.
Draw.OPENING-DMG XIV	Boosts Skell Opening Art damage by 70%.
Draw.OPENING-DMG XV	Boosts Skell Opening Art damage by 75%.
Draw.OPENING-DMG XVI	Boosts Skell Opening Art damage by 80%.
Draw.OPENING-DMG XVII	Boosts Skell Opening Art damage by 85%.
Draw.OPENING-DMG XVIII	Boosts Skell Opening Art damage by 90%.
Draw.OPENING-DMG XIX	Boosts Skell Opening Art damage by 95%.
Draw.OPENING-DMG XX	Boosts Skell Opening Art damage by 100%.
Cloak.SIGHT I	Reduces detection by shrinking enemy field of view by 2% when in your Skell.
Cloak.SIGHT II	Reduces detection by shrinking enemy field of view by 4% when in your Skell.
Cloak.SIGHT III	Reduces detection by shrinking enemy field of view by 6% when in your Skell.
Cloak.SIGHT IV	Reduces detection by shrinking enemy field of view by 8% when in your Skell.
Cloak.SIGHT V	Reduces detection by shrinking enemy field of view by 10% when in your Skell.
Cloak.SIGHT VI	Reduces detection by shrinking enemy field of view by 12% when in your Skell.
Cloak.SIGHT VII	Reduces detection by shrinking enemy field of view by 14% when in your Skell.
Cloak.SIGHT VIII	Reduces detection by shrinking enemy field of view by 16% when in your Skell.
Cloak.SIGHT IX	Reduces detection by shrinking enemy field of view by 18% when in your Skell.
Cloak.SIGHT X	Reduces detection by shrinking enemy field of view by 20% when in your Skell.
Cloak.SIGHT XI	Reduces detection by shrinking enemy field of view by 22% when in your Skell.
Cloak.SIGHT XII	Reduces detection by shrinking enemy field of view by 24% when in your Skell.
Cloak.SIGHT XIII	Reduces detection by shrinking enemy field of view by 26% when in your Skell.
Cloak.SIGHT XIV	Reduces detection by shrinking enemy field of view by 28% when in your Skell.
Cloak.SIGHT XV	Reduces detection by shrinking enemy field of view by 30% when in your Skell.
Cloak.SIGHT XVI	Reduces detection by shrinking enemy field of view by 32% when in your Skell.
Cloak.SIGHT XVII	Reduces detection by shrinking enemy field of view by 34% when in your Skell.
Cloak.SIGHT XVIII	Reduces detection by shrinking enemy field of view by 36% when in your Skell.
Cloak.SIGHT XIX	Reduces detection by shrinking enemy field of view by 38% when in your Skell.
Cloak.SIGHT XX	Reduces detection by shrinking enemy field of view by 40% when in your Skell.
Cloak.SOUND I	Reduces detection by shrinking enemy auditory range by 2% when in your Skell.
Cloak.SOUND II	Reduces detection by shrinking enemy auditory range by 4% when in your Skell.
Cloak.SOUND III	Reduces detection by shrinking enemy auditory range by 6% when in your Skell.
Cloak.SOUND IV	Reduces detection by shrinking enemy auditory range by 8% when in your Skell.
Cloak.SOUND V	Reduces detection by shrinking enemy auditory range by 10% when in your Skell.
Cloak.SOUND VI	Reduces detection by shrinking enemy auditory range by 12% when in your Skell.
Cloak.SOUND VII	Reduces detection by shrinking enemy auditory range by 14% when in your Skell.
Cloak.SOUND VIII	Reduces detection by shrinking enemy auditory range by 16% when in your Skell.
Cloak.SOUND IX	Reduces detection by shrinking enemy auditory range by 18% when in your Skell.
Cloak.SOUND X	Reduces detection by shrinking enemy auditory range by 20% when in your Skell.
Cloak.SOUND XI	Reduces detection by shrinking enemy auditory range by 22% when in your Skell.
Cloak.SOUND XII	Reduces detection by shrinking enemy auditory range by 24% when in your Skell.
Cloak.SOUND XIII	Reduces detection by shrinking enemy auditory range by 26% when in your Skell.
Cloak.SOUND XIV	Reduces detection by shrinking enemy auditory range by 28% when in your Skell.
Cloak.SOUND XV	Reduces detection by shrinking enemy auditory range by 30% when in your Skell.
Cloak.SOUND XVI	Reduces detection by shrinking enemy auditory range by 32% when in your Skell.
Cloak.SOUND XVII	Reduces detection by shrinking enemy auditory range by 34% when in your Skell.
Cloak.SOUND XVIII	Reduces detection by shrinking enemy auditory range by 36% when in your Skell.
Cloak.SOUND XIX	Reduces detection by shrinking enemy auditory range by 38% when in your Skell.
Cloak.SOUND XX	Reduces detection by shrinking enemy auditory range by 40% when in your Skell.
Crush.GP I	Boosts GP by 50 when destroying an enemy appendage with your Skell.
Crush.GP II	Boosts GP by 60 when destroying an enemy appendage with your Skell.
Crush.GP III	Boosts GP by 70 when destroying an enemy appendage with your Skell.
Crush.GP IV	Boosts GP by 80 when destroying an enemy appendage with your Skell.
Crush.GP V	Boosts GP by 90 when destroying an enemy appendage with your Skell.
Crush.GP VI	Boosts GP by 100 when destroying an enemy appendage with your Skell.
Crush.GP VII	Boosts GP by 110 when destroying an enemy appendage with your Skell.
Crush.GP VIII	Boosts GP by 120 when destroying an enemy appendage with your Skell.
Crush.GP IX	Boosts GP by 130 when destroying an enemy appendage with your Skell.
Crush.GP X	Boosts GP by 140 when destroying an enemy appendage with your Skell.
Crush.GP XI	Boosts GP by 150 when destroying an enemy appendage with your Skell.
Crush.GP XII	Boosts GP by 160 when destroying an enemy appendage with your Skell.
Crush.GP XIII	Boosts GP by 170 when destroying an enemy appendage with your Skell.
Crush.GP XIV	Boosts GP by 180 when destroying an enemy appendage with your Skell.
Crush.GP XV	Boosts GP by 190 when destroying an enemy appendage with your Skell.
Crush.GP XVI	Boosts GP by 200 when destroying an enemy appendage with your Skell.
Crush.GP XVII	Boosts GP by 210 when destroying an enemy appendage with your Skell.
Crush.GP XVIII	Boosts GP by 220 when destroying an enemy appendage with your Skell.
Crush.GP XIX	Boosts GP by 230 when destroying an enemy appendage with your Skell.
Crush.GP XX	Boosts GP by 250 when destroying an enemy appendage with your Skell.
Crush.APPEND I	Boosts Skell ranged appendage damage by 5%.
Crush.APPEND II	Boosts Skell ranged appendage damage by 10%.
Crush.APPEND III	Boosts Skell ranged appendage damage by 15%.
Crush.APPEND IV	Boosts Skell ranged appendage damage by 20%.
Crush.APPEND V	Boosts Skell ranged appendage damage by 25%.
Crush.APPEND VI	Boosts Skell ranged appendage damage by 30%.
Crush.APPEND VII	Boosts Skell ranged appendage damage by 35%.
Crush.APPEND VIII	Boosts Skell ranged appendage damage by 40%.
Crush.APPEND IX	Boosts Skell ranged appendage damage by 45%.
Crush.APPEND X	Boosts Skell ranged appendage damage by 50%.
Crush.APPEND XI	Boosts Skell ranged appendage damage by 55%.
Crush.APPEND XII	Boosts Skell ranged appendage damage by 60%.
Crush.APPEND XIII	Boosts Skell ranged appendage damage by 65%.
Crush.APPEND XIV	Boosts Skell ranged appendage damage by 70%.
Crush.APPEND XV	Boosts Skell ranged appendage damage by 75%.
Crush.APPEND XVI	Boosts Skell ranged appendage damage by 80%.
Crush.APPEND XVII	Boosts Skell ranged appendage damage by 85%.
Crush.APPEND XVIII	Boosts Skell ranged appendage damage by 90%.
Crush.APPEND XIX	Boosts Skell ranged appendage damage by 95%.
Crush.APPEND XX	Boosts Skell ranged appendage damage by 100%.
Spike.EVA I	Grants a 1% chance of evading spike damage when in your Skell.
Spike.EVA II	Grants a 2% chance of evading spike damage when in your Skell.
Spike.EVA III	Grants a 3% chance of evading spike damage when in your Skell.
Spike.EVA IV	Grants a 4% chance of evading spike damage when in your Skell.
Spike.EVA V	Grants a 5% chance of evading spike damage when in your Skell.
Spike.EVA VI	Grants a 6% chance of evading spike damage when in your Skell.
Spike.EVA VII	Grants a 7% chance of evading spike damage when in your Skell.
Spike.EVA VIII	Grants a 8% chance of evading spike damage when in your Skell.
Spike.EVA IX	Grants a 9% chance of evading spike damage when in your Skell.
Spike.EVA X	Grants a 10% chance of evading spike damage when in your Skell.
Spike.EVA XI	Grants a 11% chance of evading spike damage when in your Skell.
Spike.EVA XII	Grants a 12% chance of evading spike damage when in your Skell.
Spike.EVA XIII	Grants a 13% chance of evading spike damage when in your Skell.
Spike.EVA XIV	Grants a 14% chance of evading spike damage when in your Skell.
Spike.EVA XV	Grants a 15% chance of evading spike damage when in your Skell.
Spike.EVA XVI	Grants a 16% chance of evading spike damage when in your Skell.
Spike.EVA XVII	Grants a 17% chance of evading spike damage when in your Skell.
Spike.EVA XVIII	Grants a 18% chance of evading spike damage when in your Skell.
Spike.EVA XIX	Grants a 19% chance of evading spike damage when in your Skell.
Spike.EVA XX	Grants a 20% chance of evading spike damage when in your Skell.
Vehicle.APPEND-DEF I	Reduces appendage damage by 10% when in Skell vehicle mode.
Vehicle.APPEND-DEF II	Reduces appendage damage by 12% when in Skell vehicle mode.
Vehicle.APPEND-DEF III	Reduces appendage damage by 14% when in Skell vehicle mode.
Vehicle.APPEND-DEF IV	Reduces appendage damage by 16% when in Skell vehicle mode.
Vehicle.APPEND-DEF V	Reduces appendage damage by 18% when in Skell vehicle mode.
Vehicle.APPEND-DEF VI	Reduces appendage damage by 20% when in Skell vehicle mode.
Vehicle.APPEND-DEF VII	Reduces appendage damage by 22% when in Skell vehicle mode.
Vehicle.APPEND-DEF VIII	Reduces appendage damage by 24% when in Skell vehicle mode.
Vehicle.APPEND-DEF IX	Reduces appendage damage by 26% when in Skell vehicle mode.
Vehicle.APPEND-DEF X	Reduces appendage damage by 28% when in Skell vehicle mode.
Vehicle.APPEND-DEF XI	Reduces appendage damage by 30% when in Skell vehicle mode.
Vehicle.APPEND-DEF XII	Reduces appendage damage by 32% when in Skell vehicle mode.
Vehicle.APPEND-DEF XIII	Reduces appendage damage by 34% when in Skell vehicle mode.
Vehicle.APPEND-DEF XIV	Reduces appendage damage by 36% when in Skell vehicle mode.
Vehicle.APPEND-DEF XV	Reduces appendage damage by 38% when in Skell vehicle mode.
Vehicle.APPEND-DEF XVI	Reduces appendage damage by 40% when in Skell vehicle mode.
Vehicle.APPEND-DEF XVII	Reduces appendage damage by 42% when in Skell vehicle mode.
Vehicle.APPEND-DEF XVIII	Reduces appendage damage by 44% when in Skell vehicle mode.
Vehicle.APPEND-DEF XIX	Reduces appendage damage by 46% when in Skell vehicle mode.
Vehicle.APPEND-DEF XX	Reduces appendage damage by 50% when in Skell vehicle mode.
Vehicle.FRAME-DEF I	Reduces primary damage by 5% when in Skell vehicle mode.
Vehicle.FRAME-DEF II	Reduces primary damage by 6% when in Skell vehicle mode.
Vehicle.FRAME-DEF III	Reduces primary damage by 7% when in Skell vehicle mode.
Vehicle.FRAME-DEF IV	Reduces primary damage by 8% when in Skell vehicle mode.
Vehicle.FRAME-DEF V	Reduces primary damage by 9% when in Skell vehicle mode.
Vehicle.FRAME-DEF VI	Reduces primary damage by 10% when in Skell vehicle mode.
Vehicle.FRAME-DEF VII	Reduces primary damage by 11% when in Skell vehicle mode.
Vehicle.FRAME-DEF VIII	Reduces primary damage by 12% when in Skell vehicle mode.
Vehicle.FRAME-DEF IX	Reduces primary damage by 13% when in Skell vehicle mode.
Vehicle.FRAME-DEF X	Reduces primary damage by 14% when in Skell vehicle mode.
Vehicle.FRAME-DEF XI	Reduces primary damage by 15% when in Skell vehicle mode.
Vehicle.FRAME-DEF XII	Reduces primary damage by 16% when in Skell vehicle mode.
Vehicle.FRAME-DEF XIII	Reduces primary damage by 17% when in Skell vehicle mode.
Vehicle.FRAME-DEF XIV	Reduces primary damage by 18% when in Skell vehicle mode.
Vehicle.FRAME-DEF XV	Reduces primary damage by 19% when in Skell vehicle mode.
Vehicle.FRAME-DEF XVI	Reduces primary damage by 20% when in Skell vehicle mode.
Vehicle.FRAME-DEF XVII	Reduces primary damage by 21% when in Skell vehicle mode.
Vehicle.FRAME-DEF XVIII	Reduces primary damage by 22% when in Skell vehicle mode.
Vehicle.FRAME-DEF XIX	Reduces primary damage by 23% when in Skell vehicle mode.
Vehicle.FRAME-DEF XX	Reduces primary damage by 25% when in Skell vehicle mode.
Vehicle.DEBUFF-RES I	Boosts resistance to all debuffs by 5% when in Skell vehicle mode.
Vehicle.DEBUFF-RES II	Boosts resistance to all debuffs by 6% when in Skell vehicle mode.
Vehicle.DEBUFF-RES III	Boosts resistance to all debuffs by 7% when in Skell vehicle mode.
Vehicle.DEBUFF-RES IV	Boosts resistance to all debuffs by 8% when in Skell vehicle mode.
Vehicle.DEBUFF-RES V	Boosts resistance to all debuffs by 9% when in Skell vehicle mode.
Vehicle.DEBUFF-RES VI	Boosts resistance to all debuffs by 10% when in Skell vehicle mode.
Vehicle.DEBUFF-RES VII	Boosts resistance to all debuffs by 11% when in Skell vehicle mode.
Vehicle.DEBUFF-RES VIII	Boosts resistance to all debuffs by 12% when in Skell vehicle mode.
Vehicle.DEBUFF-RES IX	Boosts resistance to all debuffs by 13% when in Skell vehicle mode.
Vehicle.DEBUFF-RES X	Boosts resistance to all debuffs by 14% when in Skell vehicle mode.
Vehicle.DEBUFF-RES XI	Boosts resistance to all debuffs by 15% when in Skell vehicle mode.
Vehicle.DEBUFF-RES XII	Boosts resistance to all debuffs by 16% when in Skell vehicle mode.
Vehicle.DEBUFF-RES XIII	Boosts resistance to all debuffs by 17% when in Skell vehicle mode.
Vehicle.DEBUFF-RES XIV	Boosts resistance to all debuffs by 18% when in Skell vehicle mode.
Vehicle.DEBUFF-RES XV	Boosts resistance to all debuffs by 19% when in Skell vehicle mode.
Vehicle.DEBUFF-RES XVI	Boosts resistance to all debuffs by 20% when in Skell vehicle mode.
Vehicle.DEBUFF-RES XVII	Boosts resistance to all debuffs by 21% when in Skell vehicle mode.
Vehicle.DEBUFF-RES XVIII	Boosts resistance to all debuffs by 22% when in Skell vehicle mode.
Vehicle.DEBUFF-RES XIX	Boosts resistance to all debuffs by 23% when in Skell vehicle mode.
Vehicle.DEBUFF-RES XX	Boosts resistance to all debuffs by 25% when in Skell vehicle mode.
Night.MR-ACC I	Boosts Skell melee and ranged accuracy by 1% during the nighttime.
Night.MR-ACC II	Boosts Skell melee and ranged accuracy by 2% during the nighttime.
Night.MR-ACC III	Boosts Skell melee and ranged accuracy by 3% during the nighttime.
Night.MR-ACC IV	Boosts Skell melee and ranged accuracy by 4% during the nighttime.
Night.MR-ACC V	Boosts Skell melee and ranged accuracy by 5% during the nighttime.
Night.MR-ACC VI	Boosts Skell melee and ranged accuracy by 6% during the nighttime.
Night.MR-ACC VII	Boosts Skell melee and ranged accuracy by 7% during the nighttime.
Night.MR-ACC VIII	Boosts Skell melee and ranged accuracy by 8% during the nighttime.
Night.MR-ACC IX	Boosts Skell melee and ranged accuracy by 9% during the nighttime.
Night.MR-ACC X	Boosts Skell melee and ranged accuracy by 10% during the nighttime.
Night.MR-ACC XI	Boosts Skell melee and ranged accuracy by 11% during the nighttime.
Night.MR-ACC XII	Boosts Skell melee and ranged accuracy by 12% during the nighttime.
Night.MR-ACC XIII	Boosts Skell melee and ranged accuracy by 13% during the nighttime.
Night.MR-ACC XIV	Boosts Skell melee and ranged accuracy by 14% during the nighttime.
Night.MR-ACC XV	Boosts Skell melee and ranged accuracy by 15% during the nighttime.
Night.MR-ACC XVI	Boosts Skell melee and ranged accuracy by 16% during the nighttime.
Night.MR-ACC XVII	Boosts Skell melee and ranged accuracy by 17% during the nighttime.
Night.MR-ACC XVIII	Boosts Skell melee and ranged accuracy by 18% during the nighttime.
Night.MR-ACC XIX	Boosts Skell melee and ranged accuracy by 19% during the nighttime.
Night.MR-ACC XX	Boosts Skell melee and ranged accuracy by 20% during the nighttime.
Weather.FOG-RES	Grants immunity to the effects of fog when in your Skell.
Weather.RAIN-RES	Grants immunity to the effects of rain when in your Skell.
Weather.HEAVY-RAIN-RES	Grants immunity to the effects of heavy rain when in your Skell.
Weather.HEAT-RES	Grants immunity to the effects of heat waves when in your Skell.
Weather.S-STORM-RES	Grants immunity to the effects of sandstorms when in your Skell.
Weather.T-STORM RES	Grants immunity to the effects of thunderstorms when in your Skell.
Weather.EM-STORM-RES	Grants immunity to the effects of electromagnetic storms when in your Skell.
Weather.E-MIST-RES	Grants immunity to the effects of energy mist when in your Skell.
Weather.RISING-E-MIST-RES	Grants immunity to the effects of rising energy mist when in your Skell.
Weather.BRIMSTONE-RES	Grants immunity to the effects of brimstone rain when in your Skell.
Weather.AURORA-RES	Grants immunity to the effects of auroras when in your Skell.
Weather.C-AURORA-RES	Grants immunity to the effects of crimson auroras when in your Skell.
Weather.SPORE-RES	Grants immunity to the effects of spore clouds when in your Skell.
Weather.METEOR-RES	Grants immunity to the effects of meteor showers when in your Skell.
Weather.DAMAGE-RES I	Reduces weather damage by 5% when in your Skell.
Weather.DAMAGE-RES II	Reduces weather damage by 10% when in your Skell.
Weather.DAMAGE-RES III	Reduces weather damage by 15% when in your Skell.
Weather.DAMAGE-RES IV	Reduces weather damage by 20% when in your Skell.
Weather.DAMAGE-RES V	Reduces weather damage by 25% when in your Skell.
Weather.DAMAGE-RES VI	Reduces weather damage by 30% when in your Skell.
Weather.DAMAGE-RES VII	Reduces weather damage by 35% when in your Skell.
Weather.DAMAGE-RES VIII	Reduces weather damage by 40% when in your Skell.
Weather.DAMAGE-RES IX	Reduces weather damage by 45% when in your Skell.
Weather.DAMAGE-RES X	Reduces weather damage by 50% when in your Skell.
Weather.DAMAGE-RES XI	Reduces weather damage by 55% when in your Skell.
Weather.DAMAGE-RES XII	Reduces weather damage by 60% when in your Skell.
Weather.DAMAGE-RES XIII	Reduces weather damage by 65% when in your Skell.
Weather.DAMAGE-RES XIV	Reduces weather damage by 70% when in your Skell.
Weather.DAMAGE-RES XV	Reduces weather damage by 75% when in your Skell.
Weather.DAMAGE-RES XVI	Reduces weather damage by 80% when in your Skell.
Weather.DAMAGE-RES XVII	Reduces weather damage by 85% when in your Skell.
Weather.DAMAGE-RES XVIII	Reduces weather damage by 90% when in your Skell.
Weather.DAMAGE-RES XIX	Reduces weather damage by 95% when in your Skell.
Weather.DAMAGE-RES XX	Reduces weather damage by 100% when in your Skell.
\.


--
-- Data for Name: class_arts; Type: TABLE DATA; Schema: xenox; Owner: poppi
--

COPY xenox.class_arts (class, art, level) FROM stdin;
Drifter	Flame Grenade	1
Drifter	Assault Hammer	1
Drifter	Chrome Armor	2
Drifter	Slit Edge	4
Drifter	Infuriate	6
Drifter	Recuperate	8
Striker	Rising Blade	1
Striker	Defensive Stance	2
Striker	Power Dive	3
Striker	Tornado Blade	4
Striker	Furious Blast	6
Striker	Magnum Edge	8
Samurai Gunner	Offensive Stance	1
Samurai Gunner	Burst Grenade	1
Samurai Gunner	Decoy Round	2
Samurai Gunner	Flash Grenade	3
Samurai Gunner	Medic Free	4
Samurai Gunner	Assault Breaker	6
Samurai Gunner	Burning Slash	8
Duelist	Incendiary Edge	1
Duelist	Gunforce	2
Duelist	Takedown Shot	4
Duelist	Samurai Soul	6
Duelist	Last Stand	8
Shield Trooper	Wild Down	1
Shield Trooper	Missile Volley	1
Shield Trooper	Flame Cloak	2
Shield Trooper	Iron Prison	3
Shield Trooper	Wild Smash	4
Shield Trooper	Trash Talk	5
Shield Trooper	Bullet Storm	7
Bastion Warrior	Hellfire	1
Bastion Warrior	Shield Wall	2
Bastion Warrior	Enhanced Stand	2
Bastion Warrior	Reality Rift	3
Bastion Warrior	Thermal Payload	4
Bastion Warrior	Bombardier	6
Bastion Warrior	Cool Off	7
Bastion Warrior	Supershield	8
Commando	Back Slash	1
Commando	Early Bird	1
Commando	Stream Edge	2
Commando	Sliding Slinger	2
Commando	Upper Hand	4
Commando	Shadowrunner	6
Winged Viper	Side Slash	1
Winged Viper	Thirsty Edge	2
Winged Viper	Violent Streak	3
Winged Viper	Blood Sacrifice	4
Winged Viper	Killing Machine	6
Winged Viper	Primer	8
Full Metal Jaguar	Electric Surge	1
Full Metal Jaguar	Ghostwalker	2
Full Metal Jaguar	Executioner	4
Full Metal Jaguar	Combat Limbo	6
Full Metal Jaguar	Hundred Shells	8
Partisan Eagle	Arcing Horn	1
Partisan Eagle	Shrapnel	1
Partisan Eagle	Eagle Eye	2
Partisan Eagle	Raijin	3
Partisan Eagle	First Down	4
Partisan Eagle	Spiral Horn	6
Partisan Eagle	Intercept	8
Astral Crusader	Overwhelm	1
Astral Crusader	Hawkeye	1
Astral Crusader	Speed Demon	2
Astral Crusader	Sidewinder	3
Astral Crusader	Hair Trigger	4
Astral Crusader	Ghost Sniper	6
Astral Crusader	Trident Buster	8
Enforcer	Beam Barrage	1
Enforcer	Repair	3
Enforcer	Myopic Screen	5
Enforcer	Full Specs	7
Psycorruptor	Screamer	1
Psycorruptor	Subterfuge	2
Psycorruptor	Absorber Skin	3
Psycorruptor	Ether Blast	5
Psycorruptor	Brainjack	7
Mastermind	Dispel	1
Mastermind	Gravity Blast	1
Mastermind	Gravity Cloak	2
Mastermind	Servant Sacrifice	3
Mastermind	Energy Source	4
Mastermind	Black Butterfly	6
Mastermind	Pathogen Blast	8
Blast Fencer	Starfall Blade	1
Blast Fencer	Stellar Ray	1
Blast Fencer	Geolibrium	2
Blast Fencer	Lightning Cloak	2
Blast Fencer	Starfall Rondo	3
Blast Fencer	Jetstream	4
Blast Fencer	Astrolibrium	6
Blast Fencer	Shooting Star	8
Galactic Knight	Astral Heal	1
Galactic Knight	Astral Protection	1
Galactic Knight	Starfall Blossom	2
Galactic Knight	Astral Purge	3
Galactic Knight	Novalibrium	4
Galactic Knight	Starlight Kick	6
Galactic Knight	Astral Horizon	7
Galactic Knight	Galactic Cataclysm	8
Nagi	Rising Blade	1
Nagi	Enhanced Stand	1
Nagi	Thermal Payload	2
Nagi	Cool Off	3
Nagi	True Stream Edge	4
Nagi	Magnum Edge	5
Nagi	Bullet Storm	6
Nagi	Defensive Stance	7
Nagi	Offensive Stance	8
Nagi	Burning Slash	9
Nagi	Blossom Dance	10
Nagi	Samurai Soul	11
Nagi	Missile Volley	12
Nagi	Incendiary Edge	13
L	Wild Down	1
L	Stellar Ray	1
L	Lightning Cloak	2
L	Iron Prison	3
L	Wild Smash	4
L	Mindstorm	5
L	Trash Talk	6
L	Shooting Star	7
L	Reality Rift	8
L	Shield Wall	9
L	Dual Dynamo	10
L	Bombardier	11
L	Flame Cloak	12
L	Astral Protection	13
L	Supershield	14
L	Starlight Kick	15
Lao	Balance Breaker	1
Lao	Shrapnel	1
Lao	First Down	2
Lao	Arcing Horn	3
Lao	Eagle Eye	4
Lao	Raijin	5
Lao	Spiral Horn	6
Lao	Sidewinder	7
Lao	Overwhelm	8
Lao	Hawkeye	9
Lao	Speed Demon	10
Lao	Trident Buster	11
Lao	Intercept	12
Lao	Hair Trigger	13
Lao	Afterburner	14
Lao	Ghost Sniper	15
H.B.	Atomic Hit	1
H.B.	Decoy Round	1
H.B.	Burst Grenade	2
H.B.	Power Dive	3
H.B.	Iron Prison	4
H.B.	Wild Smash	5
H.B.	Furious Blast	6
H.B.	Wild Down	7
H.B.	Flash Grenade	8
H.B.	Shield Wall	9
H.B.	Flamehand	10
H.B.	Takedown Shot	11
H.B.	Trash Talk	12
H.B.	Bombardier	13
H.B.	Gunforce	14
H.B.	Last Stand	15
Gwin	Rising Blade	1
Gwin	Furious Blast	1
Gwin	Power Dive	2
Gwin	Defensive Stance	3
Gwin	Magnum Edge	4
Gwin	Ultraslash	5
Gwin	Burst Grenade	6
Gwin	Offensive Stance	7
Gwin	Decoy Round	8
Gwin	Tornado Blade	9
Gwin	Medic Free	10
Gwin	Flash Grenade	11
Gwin	Incendiary Edge	12
Gwin	Grenade Blitz	13
Gwin	Gunforce	14
Gwin	Takedown Shot	15
Frye	Rising Blade	1
Frye	Missile Volley	1
Frye	Tornado Blade	2
Frye	Enhanced Stand	3
Frye	Bullet Twister	4
Frye	Burning Slash	5
Frye	Offensive Stance	6
Frye	Bullet Storm	7
Frye	Cool Off	8
Frye	Incendiary Edge	9
Frye	Titan Recharge	10
Frye	Thermal Payload	11
Frye	Defensive Stance	12
Frye	Hellfire	13
Doug	Starfall Blade	1
Doug	Beam Barrage	1
Doug	Starfall Rondo	2
Doug	Geolibrium	3
Doug	Myopic Screen	4
Doug	Starlight Duster	5
Doug	Astral Purge	6
Doug	Ether Blast	7
Doug	Novalibrium	8
Doug	Astral Heal	9
Doug	Subterfuge	10
Doug	Gravity Blast	11
Doug	Astral Horizon	12
Doug	Phenomenon	13
Doug	Pathogen Blast	14
Doug	Galactic Cataclysm	15
Yelv	Starfall Blade	1
Yelv	Beam Barrage	1
Yelv	Starfall Rondo	2
Yelv	Gravity Cloak	3
Yelv	Geolibrium	4
Yelv	Essence Exchange	5
Yelv	Ether Blast	6
Yelv	Myopic Screen	7
Yelv	Astrolibrium	8
Yelv	Astral Heal	9
Yelv	Starfall Blossom	10
Yelv	Master Gunner	11
Yelv	Subterfuge	12
Yelv	Astral Purge	13
Yelv	Novalibrium	14
Yelv	Galactic Cataclysm	15
Boze	Spiral Horn	1
Boze	Shrapnel	1
Boze	Arcing Horn	2
Boze	Eagle Eye	3
Boze	Raijin	4
Boze	Vortex	5
Boze	First Down	6
Boze	Overwhelm	7
Boze	Hair Trigger	8
Boze	Sidewinder	9
Boze	Ghost Sniper	10
Boze	Slayonet	11
Boze	Hawkeye	12
Boze	Speed Demon	13
Boze	Intercept	14
Boze	Trident Buster	15
Phog	Back Slash	1
Phog	Sliding Slinger	1
Phog	Upper Hand	2
Phog	Sky High	3
Phog	Shadowrunner	4
Phog	Side Slash	5
Phog	Stream Edge	6
Phog	Primer	7
Phog	Early Bird	8
Phog	Electric Surge	9
Phog	Executioner	10
Phog	Ghostwalker	11
Phog	Crisis Zone	12
Phog	Blood Sacrifice	13
Phog	Combat Limbo	14
Phog	Hundred Shells	15
Elma	Shadowstrike	1
Elma	Sliding Slinger	1
Elma	Stream Edge	2
Elma	Upper Hand	3
Elma	Early Bird	4
Elma	Side Slash	5
Elma	Shadowrunner	6
Elma	Primer	7
Elma	Thirsty Edge	8
Elma	Violent Streak	9
Elma	Killing Machine	10
Elma	Blood Sacrifice	11
Elma	Electric Surge	12
Elma	Ghost Factory	13
Elma	Executioner	14
Elma	Hundred Shells	15
Lin	Wild Down	1
Lin	Fire Carnival	1
Lin	Wild Smash	2
Lin	Flame Cloak	3
Lin	Trash Talk	4
Lin	Thermal Payload	5
Lin	Iron Prison	6
Lin	Bombardier	7
Lin	Bullet Storm	8
Lin	Supershield	9
Lin	Reality Rift	10
Lin	Enhanced Stand	11
Lin	Shield Wall	12
Lin	Hellfire	13
Lin	Drum Roll	14
Lin	Cool Off	15
Celica	Absorber Skin	1
Celica	Sliding Slinger	1
Celica	Black Bane	2
Celica	Full Specs	3
Celica	Screamer	4
Celica	Primer	5
Celica	Violent Streak	6
Celica	Dispel	7
Celica	Early Bird	8
Celica	Energy Source	9
Celica	Zero Zero	10
Celica	Ghostwalker	11
Celica	Repair	12
Celica	Executioner	13
Celica	Combat Limbo	14
Celica	Black Butterfly	15
Irina	Repair	1
Irina	Burst Grenade	1
Irina	Full Specs	2
Irina	Furious Blast	3
Irina	Screamer	4
Irina	Smooth Recovery	5
Irina	Dispel	6
Irina	Flash Grenade	7
Irina	Brainjack	8
Irina	Medic Free	9
Irina	Quick Cannon	10
Irina	Absorber Skin	11
Irina	Assault Hammer	12
Irina	Servant Sacrifice	13
Irina	Energy Source	14
Irina	Last Stand	15
Murderess	Side Slash	1
Murderess	Jetstream	1
Murderess	Back Slash	2
Murderess	Stellar Ray	3
Murderess	Lightning Cloak	4
Murderess	Seventh Edge	5
Murderess	Shadowrunner	6
Murderess	Shooting Star	7
Murderess	Thirsty Edge	8
Murderess	Killing Machine	9
Murderess	Gravity Lunge	10
Murderess	Electric Surge	11
Murderess	Astral Protection	12
Murderess	Hundred Shells	13
Alexa	Arcing Horn	1
Alexa	Furious Blast	1
Alexa	Spiral Horn	2
Alexa	Power Dive	3
Alexa	Overclock	4
Alexa	Overwhelm	5
Alexa	Burst Grenade	6
Alexa	Decoy Round	7
Alexa	Assault Hammer	8
Alexa	Medic Free	9
Alexa	Hair Trigger	10
Alexa	Maximum Voltage	11
Alexa	Raijin	12
Alexa	Flash Grenade	13
Alexa	Trident Buster	14
Alexa	Gunforce	15
Hope	Repair	1
Hope	Stellar Ray	1
Hope	Full Specs	2
Hope	Shooting Star	3
Hope	Absorber Skin	4
Hope	Secondary Speed	5
Hope	Dispel	6
Hope	Brainjack	7
Hope	Servant Sacrifice	8
Hope	Energy Source	9
Hope	Tacit Censure	10
Hope	Astral Protection	11
Hope	Starlight Kick	12
Hope	Black Butterfly	13
Mia	Screamer	1
Mia	Beam Barrage	1
Mia	Myopic Screen	2
Mia	Clarity Ray	3
Mia	Full Specs	4
Mia	Ether Blast	5
Mia	Subterfuge	6
Mia	Dispel	7
Mia	Gravity Cloak	8
Mia	Energy Source	9
Mia	Beam Bomber	10
Mia	Black Butterfly	11
Mia	Pathogen Blast	12
Mia	Gravity Blast	13
\.


--
-- Data for Name: class_promotions; Type: TABLE DATA; Schema: xenox; Owner: poppi
--

COPY xenox.class_promotions (class, promotion) FROM stdin;
Drifter	Striker
Drifter	Commando
Drifter	Enforcer
Striker	Samurai Gunner
Striker	Shield Trooper
Samurai Gunner	Duelist
Shield Trooper	Bastion Warrior
Commando	Winged Viper
Commando	Partisan Eagle
Winged Viper	Full Metal Jaguar
Partisan Eagle	Astral Crusader
Enforcer	Psycorruptor
Enforcer	Blast Fencer
Psycorruptor	Mastermind
Blast Fencer	Galactic Knight
\.


--
-- Data for Name: class_skills; Type: TABLE DATA; Schema: xenox; Owner: poppi
--

COPY xenox.class_skills (class, skill, level) FROM stdin;
Striker	Steel Flesh	2
Striker	Unwavering Courage	3
Striker	Flame Trigger	5
Striker	Mighty Muscle	7
Striker	Combat Presence	9
Striker	Dismantler	10
Samurai Gunner	CQC Master	2
Samurai Gunner	Auto Melee Boost	3
Samurai Gunner	Iron Knuckle	4
Samurai Gunner	Healing Aura	5
Samurai Gunner	Weapon Guard	6
Samurai Gunner	Blazing Auto	7
Samurai Gunner	Theroid Slayer	9
Samurai Gunner	Yamato Spirit	10
Duelist	Conflagrant Edge	2
Duelist	Aggro Boost	3
Duelist	Fortified Flesh	5
Duelist	Grand Procession	7
Shield Trooper	Thermal Shield	2
Shield Trooper	Topple Topper	3
Shield Trooper	Shield Screen	4
Shield Trooper	Rising Renewal	5
Shield Trooper	Long Topple	6
Shield Trooper	Trauma Tension	8
Shield Trooper	Dirty Fighter	9
Shield Trooper	Stand Strong	10
Bastion Warrior	Machine Gunner	2
Bastion Warrior	Heatseeker	5
Bastion Warrior	Double Spike	9
Bastion Warrior	Double Reflect	10
Commando	Agile Gunslinger	2
Commando	Steady Hand	3
Commando	Boosted Bullets	4
Commando	Background Noise	5
Commando	Combo Gunner	7
Commando	Third Eye	8
Commando	Master Edge	9
Commando	Aura Burst	10
Winged Viper	Deep Fang	2
Winged Viper	Mortal Enemy	3
Winged Viper	Trigger Happy	5
Winged Viper	Lifeline	7
Winged Viper	Mindscape	9
Winged Viper	Hellhound	10
Full Metal Jaguar	Night Vision	2
Full Metal Jaguar	Zero Lapse	3
Full Metal Jaguar	Red Zone	5
Full Metal Jaguar	Crisis Catalyst	7
Full Metal Jaguar	Blood Carnival	9
Full Metal Jaguar	Phantom Counter	10
Partisan Eagle	Killshot	2
Partisan Eagle	Electric Guard	3
Partisan Eagle	Electric Boost	5
Partisan Eagle	Knock 'n' Shock	7
Partisan Eagle	Fleet Feet	9
Partisan Eagle	Piscinoid Slayer	10
Astral Crusader	Long Shot	2
Astral Crusader	Unstoppable	3
Astral Crusader	Quick Reload	5
Astral Crusader	Conductive Strike	7
Astral Crusader	Electric Flesh	9
Astral Crusader	TP Overdrive	10
Enforcer	Inner Search	2
Enforcer	Beam Boost	4
Enforcer	Beam Guard	6
Enforcer	Buff Heal	8
Enforcer	Healing Touch	9
Enforcer	High Tension	10
Psycorruptor	Beauty Sleep	2
Psycorruptor	Brain Wall	3
Psycorruptor	Gentle Approach	4
Psycorruptor	King's Decree	5
Psycorruptor	Extra Armor	6
Psycorruptor	Feather Touch	8
Psycorruptor	Unpleasant Dream	9
Psycorruptor	Core Crusher	10
Mastermind	Ether Guard	2
Mastermind	Gravity Boost	3
Mastermind	Well-Weathered	4
Mastermind	Appendage Erosion	5
Mastermind	Resistant Flesh	6
Mastermind	Tactical Analyst	7
Mastermind	King's Boon	9
Mastermind	Secondary Accelerator	10
Blast Fencer	Ether Boost	2
Blast Fencer	Mechanoid Slayer	3
Blast Fencer	Knight's Soul	5
Blast Fencer	Aura Assault	7
Blast Fencer	Buff Extender	9
Blast Fencer	Supreme Sword	10
Galactic Knight	Gravity Guard	2
Galactic Knight	Fast Forward	5
Galactic Knight	Stellar Entry	9
Galactic Knight	Synchrony	10
Nagi	Steel Flesh	7
Nagi	Mighty Muscle	9
Nagi	Trauma Tension	11
Nagi	Rising Renewal	13
Nagi	Yamato Spirit	14
Nagi	Fortified Flesh	15
Nagi	Machine Gunner	16
Nagi	Grand Procession	17
L	Steel Flesh	7
L	Mighty Muscle	9
L	Shield Screen	11
L	Long Topple	13
L	Stand Strong	15
L	Mechanoid Slayer	16
L	Knight's Soul	17
L	Double Reflect	18
Lao	Killshot	7
Lao	Electric Boost	9
Lao	Knock 'n' Shock	11
Lao	Piscinoid Slayer	13
Lao	Long Shot	15
Lao	Quick Reload	16
Lao	Conductive Strike	17
Lao	TP Overdrive	18
H.B.	Steel Flesh	7
H.B.	Mighty Muscle	9
H.B.	Combat Presence	11
H.B.	Topple Topper	13
H.B.	Shield Screen	14
H.B.	Long Topple	15
H.B.	Trauma Tension	16
H.B.	Double Spike	17
Gwin	Unwavering Courage	7
Gwin	Flame Trigger	9
Gwin	Mighty Muscle	11
Gwin	Auto Melee Boost	13
Gwin	Healing Aura	15
Gwin	Weapon Guard	16
Gwin	Theroid Slayer	17
Gwin	Conflagrant Edge	18
Frye	Unwavering Courage	7
Frye	Mighty Muscle	9
Frye	Iron Knuckle	11
Frye	Rising Renewal	13
Frye	Weapon Guard	14
Frye	Trauma Tension	15
Frye	Blazing Auto	16
Frye	Machine Gunner	17
Doug	Inner Search	7
Doug	Beam Boost	9
Doug	High Tension	11
Doug	Mechanoid Slayer	13
Doug	Knight's Soul	15
Doug	Aura Assault	16
Doug	Supreme Sword	17
Doug	Stellar Entry	18
Yelv	Inner Search	7
Yelv	Beam Boost	9
Yelv	High Tension	11
Yelv	Mechanoid Slayer	13
Yelv	Knight's Soul	14
Yelv	Supreme Sword	15
Yelv	Secondary Accelerator	16
Yelv	Synchrony	17
Boze	Master Edge	7
Boze	Killshot	9
Boze	Electric Guard	11
Boze	Electric Boost	13
Boze	Knock 'n' Shock	14
Boze	Quick Reload	15
Boze	Conductive Strike	16
Boze	TP Overdrive	17
Phog	Agile Gunslinger	7
Phog	Steady Hand	9
Phog	Background Noise	11
Phog	Master Edge	13
Phog	Mortal Enemy	15
Phog	Hellhound	16
Phog	Crisis Catalyst	17
Phog	Phantom Counter	18
Elma	Agile Gunslinger	7
Elma	Steady Hand	9
Elma	Background Noise	11
Elma	Master Edge	13
Elma	Mortal Enemy	15
Elma	Hellhound	16
Elma	Crisis Catalyst	17
Elma	Phantom Counter	18
Lin	Steel Flesh	7
Lin	Mighty Muscle	9
Lin	Dismantler	11
Lin	Shield Screen	13
Lin	Long Topple	15
Lin	Dirty Fighter	16
Lin	Stand Strong	17
Lin	Machine Gunner	18
Celica	Steady Hand	7
Celica	Inner Search	9
Celica	Aura Burst	11
Celica	Fleet Feet	13
Celica	Gentle Approach	15
Celica	Mindscape	16
Celica	Feather Touch	17
Celica	Red Zone	18
Irina	Inner Search	7
Irina	Feather Touch	9
Irina	Healing Touch	11
Irina	High Tension	13
Irina	Beauty Sleep	15
Irina	King's Decree	16
Irina	Unpleasant Dream	17
Irina	King's Boon	18
Murderess	Agile Gunslinger	7
Murderess	Boosted Bullets	9
Murderess	High Tension	11
Murderess	Mechanoid Slayer	13
Murderess	Trigger Happy	14
Murderess	Aura Assault	15
Murderess	Lifeline	16
Murderess	Hellhound	17
Alexa	Steel Flesh	7
Alexa	High Tension	9
Alexa	Electric Boost	11
Alexa	Quick Reload	13
Alexa	Fortified Flesh	14
Alexa	TP Overdrive	15
Alexa	Stellar Entry	16
Alexa	Synchrony	17
Hope	Inner Search	7
Hope	Buff Heal	9
Hope	Well-Weathered	11
Hope	Mechanoid Slayer	13
Hope	King's Decree	14
Hope	Knight's Soul	15
Hope	Supreme Sword	16
Hope	TP Overdrive	17
Mia	Inner Search	7
Mia	Beam Boost	9
Mia	Beauty Sleep	11
Mia	Ether Boost	13
Mia	Extra Armor	14
Mia	Gravity Boost	15
Mia	Resistant Flesh	16
Mia	Tactical Analyst	17
\.


--
-- Data for Name: class_stats; Type: TABLE DATA; Schema: xenox; Owner: poppi
--

COPY xenox.class_stats (class, hp, macc, racc, matk, ratk, eva, pot) FROM stdin;
Drifter	1.00	1.00	1.00	1.00	1.00	1.00	1.00
Striker	1.10	0.95	1.00	1.20	0.90	1.15	0.65
Samurai Gunner	1.20	1.00	1.10	1.15	1.05	1.15	0.75
Duelist	1.25	1.05	1.00	1.25	1.20	1.00	0.85
Shield Trooper	1.40	0.95	1.00	1.40	1.00	1.00	0.60
Bastion Warrior	1.50	0.95	1.05	1.60	1.10	1.05	0.70
Commando	0.85	1.10	1.10	0.90	1.00	1.30	0.90
Winged Viper	0.95	1.15	1.15	0.95	1.10	1.35	1.00
Full Metal Jaguar	1.00	1.20	1.20	1.00	1.15	1.40	1.10
Partisan Eagle	1.00	1.05	1.10	1.05	1.30	1.05	0.90
Astral Crusader	1.10	1.10	1.05	1.10	1.60	1.10	1.00
Enforcer	0.75	0.95	1.00	0.80	1.20	1.00	1.25
Psycorruptor	0.80	0.95	1.10	0.85	1.40	1.05	1.40
Mastermind	0.90	1.00	1.10	0.90	1.30	1.10	1.60
Blast Fencer	1.10	1.00	1.00	1.10	1.10	1.05	1.10
Galactic Knight	1.20	1.10	1.05	1.20	1.20	1.10	1.20
Nagi	1.25	1.05	1.00	1.25	1.20	1.00	0.85
L	1.40	0.95	1.00	1.40	1.00	1.00	0.60
Lao	1.20	1.05	1.10	1.05	1.30	1.20	0.90
H.B.	1.40	0.95	1.00	1.40	1.00	1.00	0.60
Gwin	1.20	1.00	1.10	1.15	1.05	1.15	0.75
Frye	1.20	1.00	1.10	1.15	1.05	1.15	0.75
Doug	1.10	1.00	1.00	1.10	1.10	1.05	1.10
Yelv	1.10	1.00	1.00	1.10	1.10	1.05	1.10
Boze	1.00	1.05	1.10	1.05	1.30	1.05	0.90
Phog	0.95	1.15	1.15	0.95	1.10	1.35	1.00
Elma	1.15	1.15	1.15	0.95	1.10	1.35	1.60
Lin	1.40	0.95	1.00	1.40	1.00	1.00	0.60
Celica	0.80	0.95	1.10	0.85	1.40	1.05	1.40
Irina	0.80	0.95	1.10	0.85	1.40	1.05	1.40
Murderess	0.95	1.00	1.00	1.00	1.00	1.00	1.00
Alexa	1.00	1.05	1.10	1.05	1.30	1.05	0.90
Hope	0.80	1.00	1.00	1.00	1.00	1.00	1.00
Mia	0.80	0.95	1.10	0.85	1.40	1.05	1.40
\.


--
-- Data for Name: classes; Type: TABLE DATA; Schema: xenox; Owner: poppi
--

COPY xenox.classes (name, melee_weapon, ranged_weapon, skill_slots, max_level) FROM stdin;
Drifter	Knife	Assault Rifle	5	10
Striker	Longsword	Assault Rifle	1	10
Samurai Gunner	Longsword	Assault Rifle	2	10
Duelist	Longsword	Assault Rifle	3	10
Shield Trooper	Shield	Gatling Gun	3	10
Bastion Warrior	Shield	Gatling Gun	4	10
Commando	Dual Swords	Dual Guns	2	10
Winged Viper	Dual Swords	Dual Guns	3	10
Full Metal Jaguar	Dual Swords	Dual Guns	4	10
Partisan Eagle	Javelin	Sniper Rifle	3	10
Astral Crusader	Javelin	Sniper Rifle	4	10
Enforcer	Knife	Raygun	2	10
Psycorruptor	Knife	Raygun	3	10
Mastermind	Knife	Raygun	4	10
Blast Fencer	Photon Saber	Psycho Launchers	3	10
Galactic Knight	Photon Saber	Psycho Launchers	4	10
Nagi	Longsword	Gatling Gun	5	20
L	Shield	Psycho Launchers	3	20
Lao	Javelin	Sniper Rifle	3	20
H.B.	Shield	Assault Rifle	4	20
Gwin	Longsword	Assault Rifle	3	20
Frye	Longsword	Gatling Gun	3	20
Doug	Photon Saber	Raygun	4	20
Yelv	Photon Saber	Raygun	3	20
Boze	Javelin	Sniper Rifle	3	20
Phog	Dual Swords	Dual Guns	3	20
Elma	Dual Swords	Dual Guns	4	20
Lin	Shield	Gatling Gun	3	20
Celica	Knife	Dual Guns	3	20
Irina	Knife	Assault Rifle	4	20
Murderess	Dual Swords	Psycho Launchers	3	20
Alexa	Javelin	Assault Rifle	3	20
Hope	Knife	Psycho Launchers	3	20
Mia	Knife	Raygun	3	20
\.


--
-- Data for Name: skills; Type: TABLE DATA; Schema: xenox; Owner: poppi
--

COPY xenox.skills (name, effect) FROM stdin;
Steel Flesh	Boosts maximum HP by [10/15/20/25/30]%.
Unwavering Courage	Boosts melee accuracy by [12/14/16/18/20]%.
Flame Trigger	Boosts Blaze damage by [12/14/16/18/20]%.
Mighty Muscle	Boosts melee attack by [10/15/20/25/30]%.
Combat Presence	Extends Taunt effects by [10/12/14/16/18] seconds.
Dismantler	Grants a [25/30/35/40/50]% chance of dealing [50/75/100/125/150]% more damage to appendages with Melee Arts.
CQC Master	Boosts critical chance by [30/35/40/45/50]% when triggering a melee combo.
Auto Melee Boost	Boosts melee auto-attack damage by [30/35/40/45/50]%.
Iron Knuckle	Boosts physical damage by [30/35/40/45/50]%.
Healing Aura	Recovers [12/14/16/18/20]% of your HP when you use an aura.
Weapon Guard	Boosts physical resistance by [12/14/16/18/20] when wielding a melee weapon.
Blazing Auto	Grants a [10/12/14/16/18]% chance of inflicting Blaze [I/I/II/II/III] when melee auto-attacking.
Theroid Slayer	Boosts damage to theroid enemies by [30/35/40/45/50]%.
Yamato Spirit	Boosts TP by [20/30/40/50/60] when using a Melee Art; double that if you have an aura active.
Conflagrant Edge	Boosts thermal damage by [10/20/30/40/50]%.
Aggro Boost	Boosts damage to taunted enemies by [20/40/60/80/100]%.
Fortified Flesh	Boosts maximum HP by [30/35/40/45/50]%.
Grand Procession	Boosts entire party's TP by [300/350/400/450/500] when activating Overdrive.
Thermal Shield	Boosts thermal resistance by [12/14/16/18/20] when wielding a melee weapon.
Topple Topper	Reduces enemy Topple resistance by [10/15/20/25/30]%.
Shield Screen	Reduces damage by [10/15/20/25/30]% when wielding a shield.
Rising Renewal	Boosts HP recovery by [10/15/20/25/30]% when revived.
Long Topple	Extends Topple effects by [1/2/3/4/5] second(s).
Trauma Tension	Grants a 15% chance of receiving [50/75/100/125/150] TP when taking damage.
Dirty Fighter	Boosts Melee Art damage by [20/40/60/80/100]% to enemies inflicted with Topple.
Stand Strong	Boosts resistance to Stagger, Topple, Knockback, and Launch by [20/40/60/80/100] when wielding a shield.
Machine Gunner	Boosts ranged damage by [20/40/60/80/100]% when fighting two or more enemies.
Heatseeker	Boosts critical chance by [50/60/70/80/100]% when attacking enemies inflicted with Blaze.
Double Spike	Boosts spike damage by [20/40/60/80/100]%.
Double Reflect	Boosts reflect damage by [20/40/60/80/100]%.
Agile Gunslinger	Boosts evasion by [12/14/16/18/20]% when wielding a ranged weapon.
Steady Hand	Boosts ranged accuracy by [12/14/16/18/20]%.
Boosted Bullets	Boosts ranged attack by [10/15/20/25/30]%.
Background Noise	Boosts damage by [25/50/75/100/125]% when using Melee Arts from behind.
Combo Gunner	Boosts damage by [25/50/75/100/125]% when triggering ranged combos.
Third Eye	Boosts TP by [20/30/40/50/60] when using a Ranged Art; double that if you have an aura active.
Master Edge	Boosts critical chance by [5/6/7/8/10]% when wielding a melee weapon.
Aura Burst	Extends aura effects by [4/5/6/7/8] seconds.
Deep Fang	Reduces enemy debuff resistance by [10/15/20/25/30]% when attacking from the side.
Mortal Enemy	Boosts damage to humanoid enemies by [30/35/40/45/50]%.
Trigger Happy	Reduces an Art's cooldown by [30/35/40/45/50]% when triggering a ranged combo.
Lifeline	Recovers [10/15/20/25/30]% of your HP when HP is at 50% or less and you use an aura.
Mindscape	Boosts maximum TP by [500/750/1000/1250/1500].
Hellhound	Extends Overdrive duration by [5/6/7/8/10] seconds.
Night Vision	Boosts damage by [20/40/60/80/100]% during the nighttime.
Zero Lapse	Reduces cooldown for melee auto-attacks by [30/35/40/45/50]%.
Red Zone	Boosts critical chance by [20/25/30/35/40]% during Overdrive.
Crisis Catalyst	Boosts critical chance by [10/15/20/25/30]% when HP is 50% or less. Effect doubles when HP is 25% or less.
Blood Carnival	Grants a [5/10/15/20/25]% chance of converting [4/6/8/10/12]% of damage dealt to HP when melee auto-attacking.
Phantom Counter	Boosts your Overdrive count by [4/6/8/10/12] when activating Overdrive.
Killshot	Boosts critical chance for ranged auto-attacks by [5/6/7/8/10]%.
Electric Guard	Boosts electric resistance by [12/14/16/18/20] when wielding a melee weapon.
Electric Boost	Boosts electric damage by [30/35/40/45/50]%.
Knock 'n' Shock	Grants a [10/12/14/16/18]% chance of inflicting Shock [I/I/II/II/III] when using Melee Arts.
Fleet Feet	Boosts evasion by [10/15/20/25/30]% when wielding a melee weapon.
Piscinoid Slayer	Boosts damage to piscinoid enemies by [30/35/40/45/50]%.
Long Shot	Boosts ranged weapon range by [5/10/15/20/25]m.
Unstoppable	Boosts resistance to Stagger, Topple, Knockback, and Launch by [20/40/60/80/100] when sprinting.
Quick Reload	Reduces cooldown for ranged auto-attacks by [30/35/40/45/50]%.
Conductive Strike	Boosts electric damage by [200/225/250/275/300]% to enemies inflicted with Shock.
Electric Flesh	Grants a [10/15/20/25/30]% chance of dealing electric spike damage when taking a hit.
TP Overdrive	Boosts TP by [100/110/120/130/150] when using an Art while in Overdrive.
Inner Search	Boosts potential by [12/14/16/18/20]%.
Beam Boost	Boosts beam damage by [30/35/40/45/50]%.
Beam Guard	Boosts beam resistance by [12/14/16/18/20] when wielding a ranged weapon.
Buff Heal	Recovers [100/200/300/400/500] HP when receiving a buff.
Healing Touch	Boosts the HP recovery of party members you revive by [30/35/40/45/50]%.
High Tension	Boosts maximum TP by [500/750/1000/1250/1500].
Beauty Sleep	Extends Sleep effects by [10/12/14/16/18] seconds.
Brain Wall	Boosts resistance to Sleep, Control, and Slow Arts by [20/40/60/80/100] when you have an aura active.
Gentle Approach	Grants a [50/60/70/80/100]% chance of not waking a sleeping enemy when auto-attacking.
King's Decree	Reduces enemy Control resistance by [10/15/20/25/30]% and raises debuff tier by 1.
Extra Armor	Boosts Barrier's damage absorption rate by [3/6/9/12/15]%.
Feather Touch	Grants a [80/85/90/95/100]% chance of not waking a sleeping enemy when attacking with an Art.
Unpleasant Dream	Boosts damage to sleeping enemies by [50/75/100/125/150]%.
Core Crusher	Negates appendage damage from your Ether attacks, but boosts primary damage by [50/75/100/125/150]%.
Ether Guard	Boosts ether resistance by [12/14/16/18/20] when wielding a ranged weapon.
Gravity Boost	Boosts gravity damage by [10/20/30/40/50]%.
Well-Weathered	Boosts TP by [200/225/250/275/300] when taking weather damage.
Appendage Erosion	Boosts appendage damage by [10/20/30/40/50]% for every debuff on the enemy.
Resistant Flesh	Boosts resistance to all debuffs by [12/15/18/21/24]%.
Tactical Analyst	Reduces enemy debuff resistance by [12/15/18/21/24]% when landing an attack.
King's Boon	Grants All Abilities Up [I/II/III/IV/V] to enemies under your Control.
Secondary Accelerator	Reduces secondary cooldown by [10/20/30/40/50]%.
Ether Boost	Boosts ether damage by [30/35/40/45/50]%.
Mechanoid Slayer	Boosts damage to mechanoid enemies by [30/35/40/45/50]%.
Knight's Soul	Boosts maximum TP by [500/750/1000/1250/1500].
Aura Assault	Boosts melee attack and melee accuracy by [10/15/20/25/30]% when you have an aura active.
Buff Extender	Extends buff effects by [5/6/7/8/10] seconds.
Supreme Sword	Boosts damage by [20/40/60/80/100]% when triggering melee combos.
Gravity Guard	Boosts gravity resistance by [12/14/16/18/20] when wielding a ranged weapon.
Fast Forward	Reduces an Art's cooldown by [10/20/30/40/50]% when triggering a melee combo.
Stellar Entry	Boosts GP by [1000/1250/1500/1750/2000] when boarding your Skell while in Overdrive.
Synchrony	Boosts Skell melee attack, ranged attack, melee & ranged accuracy, potential, and evasion by [4/6/8/10/12]%.
\.


--
-- Name: affixes_pkey; Type: CONSTRAINT; Schema: xenox; Owner: poppi
--

ALTER TABLE ONLY xenox.affixes
    ADD CONSTRAINT affixes_pkey PRIMARY KEY (name);


--
-- Name: class_arts_pkey; Type: CONSTRAINT; Schema: xenox; Owner: poppi
--

ALTER TABLE ONLY xenox.class_arts
    ADD CONSTRAINT class_arts_pkey PRIMARY KEY (art, class);


--
-- Name: class_promotions_pkey; Type: CONSTRAINT; Schema: xenox; Owner: poppi
--

ALTER TABLE ONLY xenox.class_promotions
    ADD CONSTRAINT class_promotions_pkey PRIMARY KEY (class, promotion);


--
-- Name: class_skills_pkey; Type: CONSTRAINT; Schema: xenox; Owner: poppi
--

ALTER TABLE ONLY xenox.class_skills
    ADD CONSTRAINT class_skills_pkey PRIMARY KEY (skill, class);


--
-- Name: class_stats_pkey; Type: CONSTRAINT; Schema: xenox; Owner: poppi
--

ALTER TABLE ONLY xenox.class_stats
    ADD CONSTRAINT class_stats_pkey PRIMARY KEY (class);


--
-- Name: classes_pkey; Type: CONSTRAINT; Schema: xenox; Owner: poppi
--

ALTER TABLE ONLY xenox.classes
    ADD CONSTRAINT classes_pkey PRIMARY KEY (name);


--
-- Name: skills_pkey; Type: CONSTRAINT; Schema: xenox; Owner: poppi
--

ALTER TABLE ONLY xenox.skills
    ADD CONSTRAINT skills_pkey PRIMARY KEY (name);


--
-- Name: class_arts_class_fkey; Type: FK CONSTRAINT; Schema: xenox; Owner: poppi
--

ALTER TABLE ONLY xenox.class_arts
    ADD CONSTRAINT class_arts_class_fkey FOREIGN KEY (class) REFERENCES xenox.classes(name);


--
-- Name: class_promotions_class_fkey; Type: FK CONSTRAINT; Schema: xenox; Owner: poppi
--

ALTER TABLE ONLY xenox.class_promotions
    ADD CONSTRAINT class_promotions_class_fkey FOREIGN KEY (class) REFERENCES xenox.classes(name);


--
-- Name: class_promotions_promotion_fkey; Type: FK CONSTRAINT; Schema: xenox; Owner: poppi
--

ALTER TABLE ONLY xenox.class_promotions
    ADD CONSTRAINT class_promotions_promotion_fkey FOREIGN KEY (promotion) REFERENCES xenox.classes(name);


--
-- Name: class_skills_class_fkey; Type: FK CONSTRAINT; Schema: xenox; Owner: poppi
--

ALTER TABLE ONLY xenox.class_skills
    ADD CONSTRAINT class_skills_class_fkey FOREIGN KEY (class) REFERENCES xenox.classes(name);


--
-- Name: class_skills_skill_fkey; Type: FK CONSTRAINT; Schema: xenox; Owner: poppi
--

ALTER TABLE ONLY xenox.class_skills
    ADD CONSTRAINT class_skills_skill_fkey FOREIGN KEY (skill) REFERENCES xenox.skills(name);


--
-- Name: class_stats_class_fkey; Type: FK CONSTRAINT; Schema: xenox; Owner: poppi
--

ALTER TABLE ONLY xenox.class_stats
    ADD CONSTRAINT class_stats_class_fkey FOREIGN KEY (class) REFERENCES xenox.classes(name);


--
-- PostgreSQL database dump complete
--

