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
    description text,
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

COPY xenox.classes (name, description, melee_weapon, ranged_weapon, skill_slots, max_level) FROM stdin;
Drifter	The class you start out with. Offers a balanced variety of Arts, but provides no stat bonuses.	Knife	Assault Rifle	5	10
Striker	Choose this route if you want to go in guns blazing. Mixes offensive and defensive Arts, and provides HP and melee-attack bonuses. Well balanced and suited for beginners.	Longsword	Assault Rifle	1	10
Samurai Gunner	The standard progression from Striker. Retains the mix of offensive and defensive Arts and the bonuses to HP and melee attack. Well balanced and suited for beginners.	Longsword	Assault Rifle	2	10
Duelist	An advanced Samurai Gunner. Shifts the focus more toward offense. Provides bonuses to HP and melee attack.	Longsword	Assault Rifle	3	10
Shield Trooper	An alternate progression from Striker with new weapons and a focus on defense. Greatly improves HP and melee attack.	Shield	Gatling Gun	3	10
Bastion Warrior	An advanced Shield Trooper that increases attribute resistance in addition to defense. Greatly improves HP and melee attack.	Shield	Gatling Gun	4	10
Commando	Choose this route if you want to rack up damage. Focuses on skillful application of damage buffs, and provides bonuses to melee accuracy, ranged accuracy, and evasion.	Dual Swords	Dual Guns	2	10
Winged Viper	The standard progression from Commando. Improves your damage-dealing capabilities and retains the bonuses to melee accuracy, ranged accuracy, and evasion.	Dual Swords	Dual Guns	3	10
Full Metal Jaguar	An advanced Winged Viper that features tricky offensive Arts and offers bonuses to melee accuracy, ranged accuracy, and evasion.	Dual Swords	Dual Guns	4	10
Partisan Eagle	An alternate progression from Commando with new weapons and an emphasis on ranged attacks. Provides bonuses to ranged attack and accuracy.	Javelin	Sniper Rifle	3	10
Astral Crusader	An advanced Partisan Eagle that continues to be centered on ranged attacks and provide bonuses to ranged attack and accuracy.	Javelin	Sniper Rifle	4	10
Enforcer	Choose this route if you want to provide support from afar. Offers many ranged Arts and bonuses to ranged attack and potential. Tricky to master and suited for professionals.	Knife	Raygun	2	10
Psycorruptor	The standard progression from Enforcer. Weaken the enemy using debuffs and gain bonuses to ranged attack and potential. Tricky to master and suited for professionals.	Knife	Raygun	3	10
Mastermind	An advanced Psycorruptor that adds ally support Arts to the mix of enemy debuffs. Improves ranged attack and potential.	Knife	Raygun	4	10
Blast Fencer	An alternate progression from Enforcer with new weapons and a balanced offense and defense. Provides bonuses to both melee and ranged attack.	Photon Saber	Psycho Launchers	3	10
Galactic Knight	An advanced Blast Fencer that adds recovery Arts to its even mix of offense and defense. Improves melee and ranged attack.	Photon Saber	Psycho Launchers	4	10
Nagi		Longsword	Gatling Gun	5	20
L		Shield	Psycho Launchers	3	20
Lao		Javelin	Sniper Rifle	3	20
H.B.		Shield	Assault Rifle	4	20
Gwin		Longsword	Assault Rifle	3	20
Frye		Longsword	Gatling Gun	3	20
Doug		Photon Saber	Raygun	4	20
Yelv		Photon Saber	Raygun	3	20
Boze		Javelin	Sniper Rifle	3	20
Phog		Dual Swords	Dual Guns	3	20
Elma		Dual Swords	Dual Guns	4	20
Lin		Shield	Gatling Gun	3	20
Celica		Knife	Dual Guns	3	20
Irina		Knife	Assault Rifle	4	20
Murderess		Dual Swords	Psycho Launchers	3	20
Alexa		Javelin	Assault Rifle	3	20
Hope		Knife	Psycho Launchers	3	20
Mia		Knife	Raygun	3	20
\.


--
-- Data for Name: skills; Type: TABLE DATA; Schema: xenox; Owner: poppi
--

COPY xenox.skills (name, effect) FROM stdin;
Steel Flesh	Boosts maximum HP by [10/15/20/25/30]%.
Unwavering Courage	Boosts melee accuracy by [12/14/16/18/20]%.
Flame Trigger	Boosts Blaze Damage by [12/14/16/18/20]%.
Mighty Muscle	Boosts melee attack by [10/15/20/25/30]%.
Combat Presence	Extends Taunt effects by [10/12/14/16/18] seconds.
Dismantler	Grants a [25/30/35/40/45]% chance of dealing [50/75/100/125/150]% more damage to appendage with Melee Arts.
CQC Master	Boosts critical chance by [30/35/40/45/50]% when triggering a melee combo.
Auto Melee Boost	Boosts melee auto-attack damage by [30/35/40/45/50]%.
Iron Knuckle	Boosts physical damage by [30/35/40/45/50]%.
Healing Aura	Recovers [12/14/16/18/20]% of your HP when you use an aura.
Weapon Guard	Boosts physical resistance by [12/14/16/18/20] when wielding a melee weapon.
Blazing Auto	Grants a [10/12/14/16/18]% chance to inflict Blaze [I/I/II/II/III] when melee auto-attacking.
Theroid Slayer	Boosts damage to theroid enemies by [30/35/40/45/50]%.
Yamato Spirit	Boosts TP by [20/30/40/50/60] when using a Melee Art; double that if you have an aura active.
Conflagrant Edge	Boosts thermal damage by [10/20/30/40/50]%.
Aggro Boost	Boosts damage to taunted enemies by [20/40/60/80/100]%.
Fortified Flesh	Boosts maximum HP by[30/35/40/45/50]%.
Grand Procession	Boosts entire party's TP by [300/350/400/450/500] when activating Overdrive.
Thermal Shield	Boosts thermal resistance by [12/14/16/18/20] when wielding a melee weapon.
Shield Screen	Reduces damage by [10/15/20/25/30]% when wielding a shield.
Rising Renewal	Boosts HP recovery by [10/15/20/25/30]% when revived.
Long Topple	Extends Topple effects by [1/2/3/4/5] second(s)
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
Aura Burst	Extends Aura effects by [4/5/6/7/8] seconds
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
Unstoppable	Boosts resistances to Stagger, Topple, Knockback, and Launch by [20/40/60/80/100] when sprinting.
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
Gentle Approach	Grants a [50/60/70/80/100]% chance of not waking up a sleeping enemy when auto-attacking.
King's Decree	Reduces enemy Control resistance by [10/15/20/25/30]% and raises debuff tier by 1.
Extra Armor	Boosts Barrier's damage absorbtion by [3/6/9/12/15]%.
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
Mechanoid Slayer	Boosts damage to mechanoid enemies by +[30/35/40/45/50]%.
Knight's Soul	Boosts maximum TP by [500/750/1000/1250/1500].
Aura Assault	Boosts melee attack and melee accuracy by [10/15/20/25/30]% when you have an aura active.
Buff Extender	Extends buff effects by [5/6/7/8/10] seconds.
Supreme Sword	Boosts damage by [20/40/60/80/100]% when triggering melee combos.
Gravity Guard	Boosts gravity resistance by [12/14/16/18/20] when wielding a ranged weapon.
Fast Forward	Reduces an Art's cooldown by [10/20/30/40/50]% when triggering a melee combo.
Stellar Entry	Boosts GP by [1000/1250/1500/1750/2000] when boarding your Skell while in Overdrive.
Synchrony	Boosts Skell melee attack, ranged attack, melee & ranged accuracy, potential, and evasion by [4/6/8/10/12]%.
Topple Topper	Reduces enemy Topple resistance by [10/15/20/25/30]%.
\.


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

