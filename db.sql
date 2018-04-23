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
-- Name: skills; Type: TABLE; Schema: xenox; Owner: poppi
--

CREATE TABLE xenox.skills (
    name text NOT NULL,
    effect text,
    learned text
);


ALTER TABLE xenox.skills OWNER TO poppi;

--
-- Data for Name: skills; Type: TABLE DATA; Schema: xenox; Owner: poppi
--

COPY xenox.skills (name, effect, learned) FROM stdin;
Steel Flesh	Boosts maximum HP by [10/15/20/25/30]%.	Striker 2
Unwavering Courage	Boosts melee accuracy by [12/14/16/18/20]%.	Striker 3
Flame Trigger	Boosts Blaze Damage by [12/14/16/18/20]%.	Striker 5
Mighty Muscle	Boosts melee attack by [10/15/20/25/30]%.	Striker 7
Combat Presence	Extends Taunt effects by [10/12/14/16/18] seconds.	Striker 9
Dismantler	Grants a [25/30/35/40/45]% chance of dealing [50/75/100/125/150]% more damage to appendage with Melee Arts.	Striker 10
CQC Master	Boosts critical chance by [30/35/40/45/50]% when triggering a melee combo.	Samurai Gunner 2
Auto Melee Boost	Boosts melee auto-attack damage by [30/35/40/45/50]%.	Samurai Gunner 3
Iron Knuckle	Boosts physical damage by [30/35/40/45/50]%.	Samurai Gunner 4
Healing Aura	Recovers [12/14/16/18/20]% of your HP when you use an aura.	Samurai Gunner 5
Weapon Guard	Boosts physical resistance by [12/14/16/18/20] when wielding a melee weapon.	Samurai Gunner 6
Blazing Auto	Grants a [10/12/14/16/18]% chance to inflict Blaze [I/I/II/II/III] when melee auto-attacking.	Samurai Gunner 7
Theroid Slayer	Boosts damage to theroid enemies by [30/35/40/45/50]%.	Samurai Gunner 9
Yamato Spirit	Boosts TP by [20/30/40/50/60] when using a Melee Art; double that if you have an aura active.	Samurai Gunner 10
Conflagrant Edge	Boosts thermal damage by [10/20/30/40/50]%.	Duelist 2
Aggro Boost	Boosts damage to taunted enemies by [20/40/60/80/100]%.	Duelist 3
Fortified Flesh	Boosts maximum HP by[30/35/40/45/50]%.	Duelist 5
Grand Procession	Boosts entire party's TP by [300/350/400/450/500] when activating Overdrive.	Duelist 7
Thermal Shield	Boosts thermal resistance by [12/14/16/18/20] when wielding a melee weapon.	Shield Trooper 2
Topple Toppler	Reduces enemy Topple resistance by [10/15/20/25/30]%.	Shield Trooper 3
Shield Screen	Reduces damage by [10/15/20/25/30]% when wielding a shield.	Shield Trooper 4
Rising Renewal	Boosts HP recovery by [10/15/20/25/30]% when revived.	Shield Trooper 5
Long Topple	Extends Topple effects by [1/2/3/4/5] second(s)	Shield Trooper 6
Trauma Tension	Grants a 15% chance of receiving [50/75/100/125/150] TP when taking damage.	Shield Trooper 8
Dirty Fighter	Boosts Melee Art damage by [20/40/60/80/100]% to enemies inflicted with Topple.	Shield Trooper 9
Stand Strong	Boosts resistance to Stagger, Topple, Knockback, and Launch by [20/40/60/80/100] when wielding a shield.	Shield Trooper 10
Machine Gunner	Boosts ranged damage by [20/40/60/80/100]% when fighting two or more enemies.	Bastion Warrior 2
Heatseeker	Boosts critical chance by [50/60/70/80/100]% when attacking enemies inflicted with Blaze.	Bastion Warrior 5
Double Spike	Boosts spike damage by [20/40/60/80/100]%.	Bastion Warrior 9
Double Reflect	Boosts reflect damage by [20/40/60/80/100]%.	Bastion Warrior 10
Agile Gunslinger	Boosts evasion by [12/14/16/18/20]% when wielding a ranged weapon.	Commando 2
Steady Hand	Boosts ranged accuracy by [12/14/16/18/20]%.	Commando 3
Boosted Bullets	Boosts ranged attack by [10/15/20/25/30]%.	Commando 4
Background Noise	Boosts damage by [25/50/75/100/125]% when using Melee Arts from behind.	Commando 5
Combo Gunner	Boosts damage by [25/50/75/100/125]% when triggering ranged combos.	Commando 7
Third Eye	Boosts TP by [20/30/40/50/60] when using a Ranged Art; double that if you have an aura active.	Commando 8
Master Edge	Boosts critical chance by [5/6/7/8/10]% when wielding a melee weapon.	Commando 9
Aura Burst	Extends Aura effects by [4/5/6/7/8] seconds	Commando 10
Deep Fang	Reduces enemy debuff resistance by [10/15/20/25/30]% when attacking from the side.	Winged Viper 2
Mortal Enemy	Boosts damage to humanoid enemies by [30/35/40/45/50]%.	Winged Viper 3
Trigger Happy	Reduces an Art's cooldown by [30/35/40/45/50]% when triggering a ranged combo.	Winged Viper 5
Lifeline	Recovers [10/15/20/25/30]% of your HP when HP is at 50% or less and you use an aura.	Winged Viper 7
Mindscape	Boosts maximum TP by [500/750/1000/1250/1500].	Winged Viper 9
Hellhound	Extends Overdrive duration by [5/6/7/8/10] seconds.	Winged Viper 10
Night Vision	Boosts damage by [20/40/60/80/100]% during the nighttime.	Full Metal Jaguar 2
Zero Lapse	Reduces cooldown for melee auto-attacks by [30/35/40/45/50]%.	Full Metal Jaguar 3
Red Zone	Boosts critical chance by [20/25/30/35/40]% during Overdrive.	Full Metal Jaguar 5
Crisis Catalyst	Boosts critical chance by [10/15/20/25/30]% when HP is 50% or less. Effect doubles when HP is 25% or less.	Full Metal Jaguar 7
Blood Carnival	Grants a [5/10/15/20/25]% chance of converting [4/6/8/10/12]% of damage dealt to HP when melee auto-attacking.	Full Metal Jaguar 9
Phantom Counter	Boosts your Overdrive count by [4/6/8/10/12] when activating Overdrive.	Full Metal Jaguar 10
Killshot	Boosts critical chance for ranged auto-attacks by [5/6/7/8/10]%.	Partisan Eagle 2
Electric Guard	Boosts electric resistance by [12/14/16/18/20] when wielding a melee weapon.	Partisan Eagle 3
Electric Boost	Boosts electric damage by [30/35/40/45/50]%.	Partisan Eagle 5
Knock 'n' Shock	Grants a [10/12/14/16/18]% chance of inflicting Shock [I/I/II/II/III] when using Melee Arts.	Partisan Eagle 7
Fleet Feet	Boosts evasion by [10/15/20/25/30]% when wielding a melee weapon.	Partisan Eagle 9
Piscinoid Slayer	Boosts damage to piscinoid enemies by [30/35/40/45/50]%.	Partisan Eagle 10
Long Shot	Boosts ranged weapon range by [5/10/15/20/25]m.	Astral Crusader 2
Unstoppable	Boosts resistances to Stagger, Topple, Knockback, and Launch by [20/40/60/80/100] when sprinting.	Astral Crusader 3
Quick Reload	Reduces cooldown for ranged auto-attacks by [30/35/40/45/50]%.	Astral Crusader 5
Conductive Strike	Boosts electric damage by [200/225/250/275/300]% to enemies inflicted with Shock.	Astral Crusader 7
Electric Flesh	Grants a [10/15/20/25/30]% chance of dealing electric spike damage when taking a hit.	Astral Crusader 9
TP Overdrive	Boosts TP by [100/110/120/130/150] when using an Art while in Overdrive.	Astral Crusader 10
Inner Search	Boosts potential by [12/14/16/18/20]%.	Enforcer 2
Beam Boost	Boosts beam damage by [30/35/40/45/50]%.	Enforcer 4
Beam Guard	Boosts beam resistance by [12/14/16/18/20] when wielding a ranged weapon.	Enforcer 6
Buff Heal	Recovers [100/200/300/400/500] HP when receiving a buff.	Enforcer 8
Healing Touch	Boosts the HP recovery of party members you revive by [30/35/40/45/50]%.	Enforcer 9
High Tension	Boosts maximum TP by [500/750/1000/1250/1500].	Enforcer 10
Beauty Sleep	Extends Sleep effects by [10/12/14/16/18] seconds.	Psycorruptor 2
Brain Wall	Boosts resistance to Sleep, Control, and Slow Arts by [20/40/60/80/100] when you have an aura active.	Psycorruptor 3
Gentle Approach	Grants a [50/60/70/80/100]% chance of not waking up a sleeping enemy when auto-attacking.	Psycorruptor 4
King's Decree	Reduces enemy Control resistance by [10/15/20/25/30]% and raises debuff tier by 1.	Psycorruptor 5
Extra Armor	Boosts Barrier's damage absorbtion by [3/6/9/12/15]%.	Psycorruptor 6
Feather Touch	Grants a [80/85/90/95/100]% chance of not waking a sleeping enemy when attacking with an Art.	Psycorruptor 8
Unpleasant Dream	Boosts damage to sleeping enemies by [50/75/100/125/150]%.	Psycorruptor 9
Core Crusher	Negates appendage damage from your Ether attacks, but boosts primary damage by [50/75/100/125/150]%.	Psycorruptor 10
Ether Guard	Boosts ether resistance by [12/14/16/18/20] when wielding a ranged weapon.	Mastermind 1
Gravity Boost	Boosts gravity damage by [10/20/30/40/50]%.	Mastermind 3
Well-Weathered	Boosts TP by [200/225/250/275/300] when taking weather damage.	Mastermind 4
Appendage Erosion	Boosts appendage damage by [10/20/30/40/50]% for every debuff on the enemy.	Mastermind 5
Resistant Flesh	Boosts resistance to all debuffs by [12/15/18/21/24]%.	Mastermind 6
Tactical Analyst	Reduces enemy debuff resistance by [12/15/18/21/24]% when landing an attack.	Mastermind 7
King's Boon	Grants All Abilities Up [I/II/III/IV/V] to enemies under your Control.	Mastermind 9
Secondary Accelerator	Reduces secondary cooldown by [10/20/30/40/50]%.	Mastermind 10
Ether Boost	Boosts ether damage by [30/35/40/45/50]%.	Blast Fencer 1
Mechanoid Slayer	Boosts damage to mechanoid enemies by +[30/35/40/45/50]%.	Blast Fencer 3
Knight's Soul	Boosts maximum TP by [500/750/1000/1250/1500].	Blast Fencer 5
Aura Assault	Boosts melee attack and melee accuracy by [10/15/20/25/30]% when you have an aura active.	Blast Fencer 7
Buff Extender	Extends buff effects by [5/6/7/8/10] seconds.	Blast Fencer 9
Supreme Sword	Boosts damage by [20/40/60/80/100]% when triggering melee combos.	Blast Fencer 10
Gravity Guard	Boosts gravity resistance by [12/14/16/18/20] when wielding a ranged weapon.	Galactic Knight 2
Fast Forward	Reduces an Art's cooldown by [10/20/30/40/50]% when triggering a melee combo.	Galactic Knight 5
Stellar Entry	Boosts GP by [1000/1250/1500/1750/2000] when boarding your Skell while in Overdrive.	Galactic Knight 9
Synchrony	Boosts Skell melee attack, ranged attack, melee & ranged accuracy, potential, and evasion by [4/6/8/10/12]%.	Galactic Knight 10
\.


--
-- Name: skills_pkey; Type: CONSTRAINT; Schema: xenox; Owner: poppi
--

ALTER TABLE ONLY xenox.skills
    ADD CONSTRAINT skills_pkey PRIMARY KEY (name);


--
-- PostgreSQL database dump complete
--

