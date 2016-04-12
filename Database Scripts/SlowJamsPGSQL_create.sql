/*
 Navicat PostgreSQL Data Transfer

 Source Server         : SlowJams_Local
 Source Server Version : 90405
 Source Host           : localhost
 Source Database       : SlowJams
 Source Schema         : public

 Target Server Version : 90405
 File Encoding         : utf-8

 Date: 03/06/2016 11:53:03 AM
*/

-- ----------------------------
--  Table structure for game
-- ----------------------------
DROP TABLE IF EXISTS "game";
CREATE TABLE "game" (
	"game_id" int4 NOT NULL,
	"game_date_time" timestamp(6) WITH TIME ZONE,
	"league_home" varchar(255) COLLATE "default",
	"team_home" varchar(255) COLLATE "default",
	"league_away" varchar(255) COLLATE "default",
	"team_away" varchar(255) COLLATE "default",
	"team_home_avg_points" float4,
	"team_away_avg_points" float4,
	"median_points" float4,
	"is_scrimmage" boolean
)
WITH (OIDS=FALSE);

-- ----------------------------
--  Records of game
-- ----------------------------
BEGIN;
INSERT INTO "game" VALUES ('1004', '2015-03-14 05:00:00-04', 'Ohio Roller Girls', 'Charter Team', 'Tri-city Roller Girls', 'Thunder', '350', '275', '155', FALSE);
INSERT INTO "game" VALUES ('1005', '2015-04-11 08:00:00-04', 'Hammer City Roller Girls', 'Harlots', 'Tri-city Roller Girls', 'Plan B', '0', '0', '0', FALSE);
COMMIT;

-- ----------------------------
--  Table structure for game_jam_penalty
-- ----------------------------
DROP TABLE IF EXISTS "game_jam_penalty";
CREATE TABLE "game_jam_penalty" (
	"game_id" int4 NOT NULL,
	"period" int4 NOT NULL,
	"jam" int4 NOT NULL,
	"team" varchar(255) NOT NULL COLLATE "default",
	"player_id" int4 NOT NULL,
	"penalty_id" int4 NOT NULL,
	"role_when_penalized" varchar(255) COLLATE "default",
	"penalty_type" varchar(255) COLLATE "default",
	"penalty_name" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE);

-- ----------------------------
--  Records of game_jam_penalty
-- ----------------------------
BEGIN;
INSERT INTO "game_jam_penalty" VALUES ('1004', '1', '2', 'Charter Team', '19', '1', 'Blocker3', 'C', 'Dir of Play');
INSERT INTO "game_jam_penalty" VALUES ('1004', '1', '4', 'Charter Team', '22', '1', 'Pivot', 'F', 'Forearms');
INSERT INTO "game_jam_penalty" VALUES ('1004', '1', '4', 'Thunder', '7', '1', 'Blocker1', 'F', 'Forearms');
INSERT INTO "game_jam_penalty" VALUES ('1004', '1', '5', 'Thunder', '2', '1', 'Pivot', 'P', 'Out of Play');
INSERT INTO "game_jam_penalty" VALUES ('1004', '1', '5', 'Thunder', '7', '2', 'Blocker1', 'G', 'Misconduct');
INSERT INTO "game_jam_penalty" VALUES ('1004', '1', '5', 'Thunder', '8', '1', 'Jammer', 'X', 'Cut Track');
INSERT INTO "game_jam_penalty" VALUES ('1004', '1', '5', 'Thunder', '11', '1', 'Blocker2', 'L', 'Low Block');
INSERT INTO "game_jam_penalty" VALUES ('1004', '1', '6', 'Charter Team', '21', '1', 'Jammer', 'G', 'Misconduct');
INSERT INTO "game_jam_penalty" VALUES ('1004', '1', '6', 'Thunder', '8', '2', 'Jammer', 'B', 'Back Block');
INSERT INTO "game_jam_penalty" VALUES ('1004', '1', '8', 'Thunder', '3', '1', 'Blocker2', 'F', 'Forearms');
INSERT INTO "game_jam_penalty" VALUES ('1004', '1', '9', 'Charter Team', '18', '1', 'Jammer', 'B', 'Back Block');
INSERT INTO "game_jam_penalty" VALUES ('1004', '1', '10', 'Charter Team', '16', '1', 'Blocker1', 'p', 'Out of Play');
INSERT INTO "game_jam_penalty" VALUES ('1004', '1', '12', 'Charter Team', '22', '2', 'Blocker3', 'X', 'Cut Track');
INSERT INTO "game_jam_penalty" VALUES ('1004', '1', '13', 'Thunder', '12', '1', 'Jammer', 'B', 'Back Block');
INSERT INTO "game_jam_penalty" VALUES ('1004', '1', '14', 'Charter Team', '19', '2', 'Blocker2', 'P', 'Out of Play');
INSERT INTO "game_jam_penalty" VALUES ('1004', '1', '14', 'Thunder', '12', '2', 'Jammer', 'B', 'Back Block');
INSERT INTO "game_jam_penalty" VALUES ('1004', '1', '15', 'Charter Team', '22', '3', 'Blocker1', 'F', 'Forearms');
INSERT INTO "game_jam_penalty" VALUES ('1004', '1', '16', 'Charter Team', '25', '1', 'Jammer', 'B', 'Back Block');
INSERT INTO "game_jam_penalty" VALUES ('1004', '1', '16', 'Thunder', '7', '3', 'Blocker1', 'F', 'Forearms');
INSERT INTO "game_jam_penalty" VALUES ('1004', '1', '16', 'Thunder', '8', '3', 'Jammer', 'B', 'Back Block');
INSERT INTO "game_jam_penalty" VALUES ('1004', '1', '16', 'Thunder', '8', '4', 'Jammer', 'B', 'Back Block');
INSERT INTO "game_jam_penalty" VALUES ('1004', '1', '17', 'Charter Team', '27', '1', 'Blocker3', 'F', 'Forearms');
INSERT INTO "game_jam_penalty" VALUES ('1004', '1', '18', 'Thunder', '5', '1', 'Pivot', 'P', 'Out of Play');
INSERT INTO "game_jam_penalty" VALUES ('1004', '2', '1', 'Charter Team', '15', '1', 'Pivot', 'C', 'Dir of Play');
INSERT INTO "game_jam_penalty" VALUES ('1004', '2', '1', 'Thunder', '12', '3', 'Jammer', 'B', 'Back Block');
INSERT INTO "game_jam_penalty" VALUES ('1004', '2', '1', 'Thunder', '12', '4', 'Jammer', 'I', 'Illegal Proc');
INSERT INTO "game_jam_penalty" VALUES ('1004', '2', '1', 'Thunder', '12', '5', 'Jammer', 'A', 'High Block');
INSERT INTO "game_jam_penalty" VALUES ('1004', '2', '2', 'Thunder', '1', '1', 'Blocker2', 'C', 'Dir of Play');
INSERT INTO "game_jam_penalty" VALUES ('1004', '2', '2', 'Thunder', '6', '1', 'Jammer', 'X', 'Cut Track');
INSERT INTO "game_jam_penalty" VALUES ('1004', '2', '2', 'Thunder', '7', '4', 'Blocker3', 'B', 'Back Block');
INSERT INTO "game_jam_penalty" VALUES ('1004', '2', '2', 'Thunder', '12', '6', 'Blocker1', 'F', 'Forearms');
INSERT INTO "game_jam_penalty" VALUES ('1004', '2', '4', 'Charter Team', '27', '2', 'Blocker2', 'F', 'Forearms');
INSERT INTO "game_jam_penalty" VALUES ('1004', '2', '4', 'Thunder', '4', '1', 'Blocker1', 'M', 'Multi-Player');
INSERT INTO "game_jam_penalty" VALUES ('1004', '2', '6', 'Thunder', '2', '2', 'Jammer', 'F', 'Forearms');
INSERT INTO "game_jam_penalty" VALUES ('1004', '2', '8', 'Charter Team', '27', '3', 'Blocker3', 'F', 'Forearms');
INSERT INTO "game_jam_penalty" VALUES ('1004', '2', '8', 'Thunder', '9', '1', 'Blocker2', 'P', 'Out of Play');
INSERT INTO "game_jam_penalty" VALUES ('1004', '2', '8', 'Thunder', '28', '1', 'Blocker1', 'F', 'Forearms');
INSERT INTO "game_jam_penalty" VALUES ('1004', '2', '9', 'Thunder', '6', '2', 'Jammer', 'X', 'Cut Track');
INSERT INTO "game_jam_penalty" VALUES ('1004', '2', '10', 'Charter Team', '23', '1', 'Blocker1', 'P', 'Out of Play');
INSERT INTO "game_jam_penalty" VALUES ('1004', '2', '10', 'Charter Team', '27', '4', 'Blocker3', 'P', 'Out of Play');
INSERT INTO "game_jam_penalty" VALUES ('1004', '2', '13', 'Thunder', '8', '5', 'Jammer', 'L', 'Low Block');
INSERT INTO "game_jam_penalty" VALUES ('1004', '2', '13', 'Thunder', '8', '6', 'Jammer', 'B', 'Back Block');
INSERT INTO "game_jam_penalty" VALUES ('1004', '2', '14', 'Charter Team', '16', '2', 'Blocker1', 'F', 'Forearms');
INSERT INTO "game_jam_penalty" VALUES ('1004', '2', '14', 'Charter Team', '27', '5', 'Blocker3', 'L', 'Low Block');
INSERT INTO "game_jam_penalty" VALUES ('1004', '2', '14', 'Thunder', '2', '3', 'Blocker1', 'A', 'High Block');
INSERT INTO "game_jam_penalty" VALUES ('1004', '2', '15', 'Thunder', '13', '1', 'Blocker3', 'M', 'Multi-Player');
INSERT INTO "game_jam_penalty" VALUES ('1004', '2', '16', 'Charter Team', '17', '1', 'Blocker3', 'C', 'Dir of Play');
INSERT INTO "game_jam_penalty" VALUES ('1004', '2', '16', 'Charter Team', '19', '3', 'Blocker2', 'X', 'Cut Track');
INSERT INTO "game_jam_penalty" VALUES ('1004', '2', '17', 'Charter Team', '22', '4', 'Blocker1', 'X', 'Cut Track');
INSERT INTO "game_jam_penalty" VALUES ('1004', '2', '17', 'Charter Team', '22', '5', 'Blocker1', 'C', 'Dir of Play');
INSERT INTO "game_jam_penalty" VALUES ('1004', '2', '17', 'Thunder', '2', '4', 'Blocker2', 'C', 'Dir of Play');
INSERT INTO "game_jam_penalty" VALUES ('1004', '2', '17', 'Thunder', '7', '5', 'Blocker3', 'C', 'Dir of Play');
INSERT INTO "game_jam_penalty" VALUES ('1004', '2', '17', 'Thunder', '11', '2', 'Blocker1', 'L', 'Low Block');
INSERT INTO "game_jam_penalty" VALUES ('1005', '1', '1', 'Harlots', '30', '1', 'Jammer', 'B', 'Back Block');
INSERT INTO "game_jam_penalty" VALUES ('1005', '1', '1', 'Plan B', '48', '1', 'Jammer', 'X', 'Cut Track');
INSERT INTO "game_jam_penalty" VALUES ('1005', '1', '2', 'Harlots', '38', '1', 'Blocker2', 'M', 'Multi-Player');
INSERT INTO "game_jam_penalty" VALUES ('1005', '1', '2', 'Harlots', '39', '1', 'Jammer', 'X', 'Cut Track');
INSERT INTO "game_jam_penalty" VALUES ('1005', '1', '2', 'Plan B', '51', '1', 'Blocker3', 'P', 'Out of Play');
INSERT INTO "game_jam_penalty" VALUES ('1005', '1', '3', 'Plan B', '52', '1', 'Blocker3', 'P', 'Out of Play');
INSERT INTO "game_jam_penalty" VALUES ('1005', '1', '5', 'Plan B', '45', '1', 'Blocker3', 'P', 'Out of Play');
INSERT INTO "game_jam_penalty" VALUES ('1005', '1', '7', 'Harlots', '34', '1', 'Blocker3', 'P', 'Out of Play');
INSERT INTO "game_jam_penalty" VALUES ('1005', '1', '8', 'Plan B', '13', '1', 'Pivot', 'C', 'Dir of Play');
INSERT INTO "game_jam_penalty" VALUES ('1005', '1', '8', 'Plan B', '43', '1', 'Blocker2', 'X', 'Cut Track');
INSERT INTO "game_jam_penalty" VALUES ('1005', '1', '8', 'Plan B', '53', '1', 'Jammer', 'B', 'Back Block');
INSERT INTO "game_jam_penalty" VALUES ('1005', '1', '9', 'Harlots', '30', '2', 'Jammer', 'X', 'Cut Track');
INSERT INTO "game_jam_penalty" VALUES ('1005', '1', '9', 'Plan B', '46', '1', 'Blocker2', 'M', 'Multi-Player');
INSERT INTO "game_jam_penalty" VALUES ('1005', '1', '11', 'Harlots', '34', '2', 'Blocker2', 'E', 'Elbows');
INSERT INTO "game_jam_penalty" VALUES ('1005', '1', '12', 'Plan B', '51', '2', 'Blocker3', 'L', 'Low Block');
INSERT INTO "game_jam_penalty" VALUES ('1005', '1', '13', 'Harlots', '37', '1', 'Jammer', 'X', 'Cut Track');
INSERT INTO "game_jam_penalty" VALUES ('1005', '1', '14', 'Harlots', '29', '1', 'Blocker1', 'X', 'Cut Track');
INSERT INTO "game_jam_penalty" VALUES ('1005', '1', '15', 'Plan B', '28', '1', 'Pivot', 'P', 'Out of Play');
INSERT INTO "game_jam_penalty" VALUES ('1005', '1', '15', 'Plan B', '52', '2', 'Blocker1', 'P', 'Out of Play');
INSERT INTO "game_jam_penalty" VALUES ('1005', '1', '18', 'Plan B', '13', '2', 'Pivot', 'C', 'Dir of Play');
INSERT INTO "game_jam_penalty" VALUES ('1005', '2', '2', 'Harlots', '31', '1', 'Blocker2', 'C', 'Dir of Play');
INSERT INTO "game_jam_penalty" VALUES ('1005', '2', '3', 'Plan B', '45', '2', 'Blocker3', 'X', 'Cut Track');
INSERT INTO "game_jam_penalty" VALUES ('1005', '2', '3', 'Plan B', '52', '3', 'Blocker1', 'L', 'Low Block');
INSERT INTO "game_jam_penalty" VALUES ('1005', '2', '3', 'Plan B', '53', '2', 'Jammer', 'F', 'Forearms');
INSERT INTO "game_jam_penalty" VALUES ('1005', '2', '4', 'Harlots', '38', '2', 'Pivot', 'C', 'Dir of Play');
INSERT INTO "game_jam_penalty" VALUES ('1005', '2', '4', 'Plan B', '47', '1', 'Blocker1', 'O', 'OOB Block');
INSERT INTO "game_jam_penalty" VALUES ('1005', '2', '5', 'Plan B', '46', '2', 'Blocker1', 'C', 'Dir of Play');
INSERT INTO "game_jam_penalty" VALUES ('1005', '2', '5', 'Plan B', '52', '4', 'Blocker3', 'L', 'Low Block');
INSERT INTO "game_jam_penalty" VALUES ('1005', '2', '6', 'Harlots', '33', '1', 'Jammer', 'X', 'Cut Track');
INSERT INTO "game_jam_penalty" VALUES ('1005', '2', '6', 'Harlots', '39', '2', 'Blocker4', 'B', 'Back Block');
INSERT INTO "game_jam_penalty" VALUES ('1005', '2', '8', 'Plan B', '13', '3', 'Jammer', 'F', 'Forearms');
INSERT INTO "game_jam_penalty" VALUES ('1005', '2', '10', 'Harlots', '38', '3', 'Pivot', 'C', 'Dir of Play');
INSERT INTO "game_jam_penalty" VALUES ('1005', '2', '11', 'Harlots', '34', '3', 'Blocker3', 'C', 'Dir of Play');
INSERT INTO "game_jam_penalty" VALUES ('1005', '2', '11', 'Plan B', '46', '3', 'Blocker1', 'M', 'Multi-Player');
INSERT INTO "game_jam_penalty" VALUES ('1005', '2', '11', 'Plan B', '48', '2', 'Jammer', 'B', 'Back Block');
INSERT INTO "game_jam_penalty" VALUES ('1005', '2', '11', 'Plan B', '48', '3', 'Jammer', 'X', 'Cut Track');
INSERT INTO "game_jam_penalty" VALUES ('1005', '2', '12', 'Harlots', '37', '2', 'Pivot', 'F', 'Forearms');
INSERT INTO "game_jam_penalty" VALUES ('1005', '2', '12', 'Plan B', '13', '4', 'Pivot', 'F', 'Forearms');
INSERT INTO "game_jam_penalty" VALUES ('1005', '2', '12', 'Plan B', '43', '2', 'Blocker3', 'M', 'Multi-Player');
INSERT INTO "game_jam_penalty" VALUES ('1005', '2', '12', 'Plan B', '49', '1', 'Blocker2', 'P', 'Out of Play');
INSERT INTO "game_jam_penalty" VALUES ('1005', '2', '12', 'Plan B', '51', '3', 'Blocker1', 'P', 'Out of Play');
INSERT INTO "game_jam_penalty" VALUES ('1005', '2', '13', 'Harlots', '36', '1', 'Blocker4', 'P', 'Out of Play');
INSERT INTO "game_jam_penalty" VALUES ('1005', '2', '13', 'Plan B', '28', '2', 'Pivot', 'F', 'Forearms');
INSERT INTO "game_jam_penalty" VALUES ('1005', '2', '13', 'Plan B', '44', '1', 'Jammer', 'B', 'Back Block');
INSERT INTO "game_jam_penalty" VALUES ('1005', '2', '15', 'Harlots', '35', '1', 'Jammer', 'X', 'Cut Track');
INSERT INTO "game_jam_penalty" VALUES ('1005', '2', '15', 'Harlots', '41', '1', 'Blocker2', 'P', 'Out of Play');
INSERT INTO "game_jam_penalty" VALUES ('1005', '2', '17', 'Harlots', '42', '1', 'Jammer', 'X', 'Cut Track');
INSERT INTO "game_jam_penalty" VALUES ('1005', '2', '17', 'Plan B', '49', '2', 'Blocker2', 'P', 'Out of Play');
INSERT INTO "game_jam_penalty" VALUES ('1005', '2', '18', 'Harlots', '38', '4', 'Pivot', 'C', 'Dir of Play');
INSERT INTO "game_jam_penalty" VALUES ('1005', '2', '18', 'Harlots', '42', '2', 'Jammer', 'X', 'Cut Track');
INSERT INTO "game_jam_penalty" VALUES ('1005', '2', '18', 'Plan B', '52', '5', 'Blocker3', 'P', 'Out of Play');
COMMIT;

-- ----------------------------
--  Table structure for game_jam_score
-- ----------------------------
DROP TABLE IF EXISTS "game_jam_score";
CREATE TABLE "game_jam_score" (
	"game_id" int4 NOT NULL,
	"period" int4 NOT NULL,
	"jam" int4 NOT NULL,
	"team" varchar(255) NOT NULL COLLATE "default",
	"jammer_player_id" int4 NOT NULL,
	"lead_jammer" boolean,
	"called_jam" boolean,
	"pass_occurred" boolean,
	"passes" int4,
	"points" int4
)
WITH (OIDS=FALSE);

-- ----------------------------
--  Records of game_jam_score
-- ----------------------------
BEGIN;
INSERT INTO "game_jam_score" VALUES ('1004', '1', '1', 'Charter Team', '21', FALSE, FALSE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '1', 'Thunder', '6', TRUE, TRUE, FALSE, '1', '2');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '2', 'Charter Team', '18', TRUE, TRUE, FALSE, '1', '3');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '2', 'Thunder', '8', FALSE, FALSE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '3', 'Charter Team', '21', TRUE, FALSE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '3', 'Thunder', '12', FALSE, FALSE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '4', 'Charter Team', '18', FALSE, FALSE, FALSE, '1', '2');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '4', 'Thunder', '6', TRUE, TRUE, FALSE, '1', '2');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '5', 'Charter Team', '24', FALSE, FALSE, FALSE, '3', '15');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '5', 'Thunder', '8', FALSE, FALSE, FALSE, '0', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '6', 'Charter Team', '21', TRUE, FALSE, FALSE, '4', '19');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '6', 'Thunder', '8', FALSE, FALSE, FALSE, '0', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '7', 'Charter Team', '15', TRUE, TRUE, FALSE, '1', '2');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '7', 'Thunder', '12', FALSE, FALSE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '8', 'Charter Team', '21', TRUE, TRUE, FALSE, '1', '3');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '8', 'Thunder', '6', FALSE, FALSE, FALSE, '1', '1');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '9', 'Charter Team', '18', FALSE, FALSE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '9', 'Thunder', '8', TRUE, TRUE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '10', 'Charter Team', '21', FALSE, FALSE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '10', 'Thunder', '12', TRUE, TRUE, FALSE, '1', '4');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '11', 'Charter Team', '18', FALSE, FALSE, FALSE, '0', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '11', 'Thunder', '6', TRUE, TRUE, FALSE, '2', '10');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '12', 'Charter Team', '24', FALSE, FALSE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '12', 'Thunder', '5', TRUE, TRUE, FALSE, '2', '5');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '13', 'Charter Team', '15', TRUE, TRUE, FALSE, '1', '5');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '13', 'Thunder', '12', FALSE, FALSE, FALSE, '0', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '14', 'Charter Team', '21', TRUE, TRUE, FALSE, '5', '18');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '14', 'Thunder', '12', FALSE, FALSE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '15', 'Charter Team', '18', FALSE, FALSE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '15', 'Thunder', '6', TRUE, TRUE, FALSE, '2', '7');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '16', 'Charter Team', '25', FALSE, FALSE, FALSE, '2', '7');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '16', 'Thunder', '8', TRUE, FALSE, FALSE, '3', '7');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '17', 'Charter Team', '15', TRUE, TRUE, FALSE, '1', '3');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '17', 'Thunder', '8', FALSE, FALSE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '18', 'Charter Team', '21', TRUE, TRUE, FALSE, '6', '25');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '18', 'Thunder', '5', FALSE, FALSE, TRUE, '1', '4');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '18', 'Thunder', '6', FALSE, FALSE, FALSE, '0', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '19', 'Charter Team', '15', FALSE, FALSE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '1', '19', 'Thunder', '12', TRUE, TRUE, FALSE, '1', '5');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '1', 'Charter Team', '21', TRUE, TRUE, FALSE, '6', '27');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '1', 'Thunder', '2', FALSE, FALSE, TRUE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '1', 'Thunder', '12', FALSE, FALSE, FALSE, '0', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '2', 'Charter Team', '18', TRUE, FALSE, FALSE, '3', '14');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '2', 'Thunder', '6', FALSE, FALSE, FALSE, '0', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '3', 'Charter Team', '21', TRUE, TRUE, FALSE, '3', '11');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '3', 'Thunder', '8', FALSE, FALSE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '4', 'Charter Team', '18', FALSE, FALSE, FALSE, '1', '4');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '4', 'Thunder', '6', TRUE, TRUE, FALSE, '2', '8');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '5', 'Charter Team', '15', FALSE, FALSE, TRUE, '1', '2');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '5', 'Charter Team', '24', FALSE, FALSE, FALSE, '0', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '5', 'Thunder', '8', TRUE, TRUE, FALSE, '1', '3');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '6', 'Charter Team', '21', FALSE, TRUE, FALSE, '4', '20');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '6', 'Thunder', '2', FALSE, FALSE, TRUE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '6', 'Thunder', '4', FALSE, FALSE, FALSE, '0', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '7', 'Charter Team', '15', TRUE, TRUE, FALSE, '2', '9');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '7', 'Thunder', '2', FALSE, FALSE, FALSE, '0', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '7', 'Thunder', '6', FALSE, FALSE, TRUE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '8', 'Charter Team', '22', FALSE, FALSE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '8', 'Thunder', '8', TRUE, TRUE, FALSE, '4', '17');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '9', 'Charter Team', '18', TRUE, TRUE, FALSE, '1', '5');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '9', 'Thunder', '6', FALSE, FALSE, FALSE, '0', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '10', 'Charter Team', '21', TRUE, TRUE, FALSE, '2', '9');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '10', 'Thunder', '6', FALSE, FALSE, FALSE, '2', '4');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '11', 'Charter Team', '18', FALSE, FALSE, FALSE, '1', '2');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '11', 'Thunder', '8', TRUE, TRUE, FALSE, '2', '8');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '12', 'Charter Team', '24', TRUE, TRUE, FALSE, '1', '1');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '12', 'Thunder', '6', FALSE, FALSE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '13', 'Charter Team', '15', TRUE, TRUE, FALSE, '5', '20');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '13', 'Thunder', '8', FALSE, FALSE, FALSE, '0', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '14', 'Charter Team', '21', TRUE, TRUE, FALSE, '3', '11');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '14', 'Thunder', '8', FALSE, FALSE, FALSE, '4', '17');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '15', 'Charter Team', '18', FALSE, FALSE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '15', 'Thunder', '5', TRUE, TRUE, FALSE, '2', '5');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '16', 'Charter Team', '21', TRUE, TRUE, FALSE, '3', '12');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '16', 'Thunder', '2', FALSE, FALSE, TRUE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '16', 'Thunder', '6', FALSE, FALSE, FALSE, '0', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '17', 'Charter Team', '15', FALSE, FALSE, TRUE, '2', '8');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '17', 'Charter Team', '23', FALSE, FALSE, FALSE, '0', '0');
INSERT INTO "game_jam_score" VALUES ('1004', '2', '17', 'Thunder', '5', TRUE, TRUE, FALSE, '3', '13');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '1', 'Harlots', '30', FALSE, FALSE, FALSE, '2', '4');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '1', 'Plan B', '48', TRUE, FALSE, FALSE, '4', '13');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '2', 'Harlots', '39', FALSE, FALSE, FALSE, '0', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '2', 'Plan B', '44', TRUE, TRUE, FALSE, '4', '20');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '3', 'Harlots', '42', FALSE, FALSE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '3', 'Plan B', '4', TRUE, TRUE, FALSE, '1', '1');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '4', 'Harlots', '36', FALSE, FALSE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '4', 'Plan B', '53', TRUE, TRUE, FALSE, '1', '4');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '5', 'Harlots', '30', FALSE, FALSE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '5', 'Plan B', '48', TRUE, TRUE, FALSE, '1', '4');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '6', 'Harlots', '33', FALSE, FALSE, TRUE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '6', 'Harlots', '39', FALSE, FALSE, FALSE, '0', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '6', 'Plan B', '44', TRUE, FALSE, FALSE, '3', '10');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '7', 'Harlots', '42', TRUE, TRUE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '7', 'Plan B', '4', FALSE, FALSE, FALSE, '1', '3');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '8', 'Harlots', '36', FALSE, FALSE, FALSE, '3', '10');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '8', 'Plan B', '53', TRUE, FALSE, FALSE, '2', '9');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '9', 'Harlots', '30', FALSE, FALSE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '9', 'Plan B', '48', TRUE, TRUE, FALSE, '4', '15');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '10', 'Harlots', '39', TRUE, TRUE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '10', 'Plan B', '44', FALSE, FALSE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '11', 'Harlots', '42', FALSE, FALSE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '11', 'Plan B', '4', TRUE, TRUE, FALSE, '1', '4');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '12', 'Harlots', '36', FALSE, FALSE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '12', 'Plan B', '53', TRUE, FALSE, FALSE, '3', '15');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '13', 'Harlots', '37', FALSE, FALSE, FALSE, '0', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '13', 'Plan B', '48', TRUE, TRUE, FALSE, '3', '12');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '14', 'Harlots', '39', FALSE, FALSE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '14', 'Plan B', '44', TRUE, TRUE, FALSE, '2', '4');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '15', 'Harlots', '42', TRUE, TRUE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '15', 'Plan B', '45', FALSE, FALSE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '16', 'Harlots', '36', TRUE, TRUE, FALSE, '1', '4');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '16', 'Plan B', '51', FALSE, FALSE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '17', 'Harlots', '30', TRUE, TRUE, FALSE, '1', '3');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '17', 'Plan B', '53', FALSE, FALSE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '18', 'Harlots', '33', FALSE, FALSE, TRUE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '18', 'Harlots', '39', FALSE, FALSE, FALSE, '0', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '18', 'Plan B', '48', TRUE, TRUE, FALSE, '1', '4');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '19', 'Harlots', '42', FALSE, FALSE, FALSE, '2', '4');
INSERT INTO "game_jam_score" VALUES ('1005', '1', '19', 'Plan B', '53', TRUE, FALSE, FALSE, '2', '8');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '1', 'Harlots', '39', FALSE, FALSE, FALSE, '0', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '1', 'Plan B', '48', TRUE, TRUE, FALSE, '3', '15');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '2', 'Harlots', '30', FALSE, FALSE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '2', 'Plan B', '44', TRUE, TRUE, FALSE, '2', '7');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '3', 'Harlots', '42', TRUE, TRUE, FALSE, '3', '12');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '3', 'Plan B', '53', FALSE, FALSE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '4', 'Harlots', '36', FALSE, FALSE, FALSE, '2', '4');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '4', 'Plan B', '48', TRUE, TRUE, FALSE, '2', '4');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '5', 'Harlots', '30', FALSE, FALSE, FALSE, '0', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '5', 'Harlots', '38', FALSE, FALSE, TRUE, '3', '8');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '5', 'Plan B', '44', TRUE, TRUE, FALSE, '3', '9');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '6', 'Harlots', '33', FALSE, FALSE, TRUE, '0', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '6', 'Harlots', '39', FALSE, FALSE, FALSE, '0', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '6', 'Plan B', '45', TRUE, TRUE, FALSE, '7', '30');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '7', 'Harlots', '33', FALSE, FALSE, FALSE, '0', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '7', 'Harlots', '38', FALSE, FALSE, TRUE, '1', '1');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '7', 'Plan B', '53', TRUE, TRUE, FALSE, '2', '4');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '8', 'Harlots', '42', TRUE, TRUE, FALSE, '1', '4');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '8', 'Plan B', '48', FALSE, FALSE, FALSE, '2', '4');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '9', 'Harlots', '36', TRUE, TRUE, FALSE, '1', '2');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '9', 'Plan B', '44', FALSE, FALSE, FALSE, '2', '4');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '10', 'Harlots', '30', TRUE, TRUE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '10', 'Plan B', '45', FALSE, FALSE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '11', 'Harlots', '38', FALSE, FALSE, TRUE, '4', '15');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '11', 'Harlots', '39', FALSE, FALSE, FALSE, '0', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '11', 'Plan B', '48', FALSE, FALSE, FALSE, '2', '4');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '12', 'Harlots', '42', TRUE, TRUE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '12', 'Plan B', '48', FALSE, FALSE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '13', 'Harlots', '36', FALSE, FALSE, FALSE, '0', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '13', 'Harlots', '37', FALSE, FALSE, TRUE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '13', 'Plan B', '44', TRUE, FALSE, FALSE, '3', '12');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '14', 'Harlots', '30', TRUE, TRUE, FALSE, '1', '4');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '14', 'Plan B', '53', FALSE, FALSE, FALSE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '15', 'Harlots', '35', FALSE, FALSE, TRUE, '0', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '15', 'Harlots', '39', FALSE, FALSE, FALSE, '0', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '15', 'Plan B', '47', TRUE, FALSE, FALSE, '4', '20');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '16', 'Harlots', '35', FALSE, FALSE, FALSE, '0', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '16', 'Harlots', '38', FALSE, FALSE, TRUE, '1', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '16', 'Plan B', '45', TRUE, TRUE, FALSE, '2', '4');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '17', 'Harlots', '42', FALSE, FALSE, FALSE, '0', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '17', 'Plan B', '48', TRUE, TRUE, FALSE, '2', '10');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '18', 'Harlots', '42', FALSE, FALSE, FALSE, '0', '0');
INSERT INTO "game_jam_score" VALUES ('1005', '2', '18', 'Plan B', '44', TRUE, TRUE, FALSE, '3', '10');
COMMIT;

-- ----------------------------
--  Table structure for game_player
-- ----------------------------
DROP TABLE IF EXISTS "game_player";
CREATE TABLE "game_player" (
	"game_id" int4 NOT NULL,
	"player_id" int4 NOT NULL,
	"league" varchar(255) COLLATE "default",
	"team" varchar(255) COLLATE "default",
	"derby_name" varchar(255) COLLATE "default",
	"number" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE);

-- ----------------------------
--  Records of game_player
-- ----------------------------
BEGIN;
INSERT INTO "game_player" VALUES ('1004', '1', 'Tri-City Roller Derby', 'Thunder', 'Stacie Jones', '101');
INSERT INTO "game_player" VALUES ('1004', '2', 'Tri-City Roller Derby', 'Thunder', 'Fox Hadley', '1013');
INSERT INTO "game_player" VALUES ('1004', '3', 'Tri-City Roller Derby', 'Thunder', 'Rain Blows Brite', '13');
INSERT INTO "game_player" VALUES ('1004', '4', 'Tri-City Roller Derby', 'Thunder', 'Kristy Skelton', '1321');
INSERT INTO "game_player" VALUES ('1004', '5', 'Tri-City Roller Derby', 'Thunder', 'AnneX', '14');
INSERT INTO "game_player" VALUES ('1004', '6', 'Tri-City Roller Derby', 'Thunder', 'The Honey Badger', '18');
INSERT INTO "game_player" VALUES ('1004', '7', 'Tri-City Roller Derby', 'Thunder', 'Aggrosaurus', '2042');
INSERT INTO "game_player" VALUES ('1004', '8', 'Tri-City Roller Derby', 'Thunder', 'Crazy Squirrel', '231');
INSERT INTO "game_player" VALUES ('1004', '9', 'Tri-City Roller Derby', 'Thunder', 'Anne Tastic', '24');
INSERT INTO "game_player" VALUES ('1004', '10', 'Tri-City Roller Derby', 'Thunder', 'Pity Affoo', '711');
INSERT INTO "game_player" VALUES ('1004', '11', 'Tri-City Roller Derby', 'Thunder', 'Fraxxure', '911');
INSERT INTO "game_player" VALUES ('1004', '12', 'Tri-City Roller Derby', 'Thunder', 'Wylde Leigh Coyote', '9TNT');
INSERT INTO "game_player" VALUES ('1004', '13', 'Tri-City Roller Derby', 'Thunder', 'Commander Will Wrecker', 'NO1');
INSERT INTO "game_player" VALUES ('1004', '14', 'Ohio Roller Girls', 'Charter Team', 'Paige Bleed', '0125');
INSERT INTO "game_player" VALUES ('1004', '15', 'Ohio Roller Girls', 'Charter Team', 'Lora "OutaMy" Wayman', '10');
INSERT INTO "game_player" VALUES ('1004', '16', 'Ohio Roller Girls', 'Charter Team', 'Amy Spears', '1098');
INSERT INTO "game_player" VALUES ('1004', '17', 'Ohio Roller Girls', 'Charter Team', 'Jesse "Ava Tarr" Fox', '1101');
INSERT INTO "game_player" VALUES ('1004', '18', 'Ohio Roller Girls', 'Charter Team', 'Kitty Liquorbottom', '12');
INSERT INTO "game_player" VALUES ('1004', '19', 'Ohio Roller Girls', 'Charter Team', 'Texas Chainsaw Sasskicker', '19');
INSERT INTO "game_player" VALUES ('1004', '20', 'Ohio Roller Girls', 'Charter Team', 'Val Holla', '2');
INSERT INTO "game_player" VALUES ('1004', '21', 'Ohio Roller Girls', 'Charter Team', 'The Smacktivist', '365');
INSERT INTO "game_player" VALUES ('1004', '22', 'Ohio Roller Girls', 'Charter Team', 'Burnadeath', '451');
INSERT INTO "game_player" VALUES ('1004', '23', 'Ohio Roller Girls', 'Charter Team', 'HellionBOI', '5459');
INSERT INTO "game_player" VALUES ('1004', '24', 'Ohio Roller Girls', 'Charter Team', 'BiggRigg', '815');
INSERT INTO "game_player" VALUES ('1004', '25', 'Ohio Roller Girls', 'Charter Team', 'KloverKill', '99');
INSERT INTO "game_player" VALUES ('1004', '26', 'Ohio Roller Girls', 'Charter Team', 'TactiGal', 'C4');
INSERT INTO "game_player" VALUES ('1004', '27', 'Ohio Roller Girls', 'Charter Team', 'Ena Flash', 'ICU2');
INSERT INTO "game_player" VALUES ('1004', '28', 'Tri-City Roller Derby', 'Thunder', 'Andi Slamberg', '0');
INSERT INTO "game_player" VALUES ('1005', '4', 'Tri-City Roller Derby', 'Plan B', 'Kristy Skelton', '1321');
INSERT INTO "game_player" VALUES ('1005', '13', 'Tri-City Roller Derby', 'Plan B', 'Commander Will Wrecker', 'N01');
INSERT INTO "game_player" VALUES ('1005', '28', 'Tri-City Roller Derby', 'Plan B', 'Andi Slamberg', '0');
INSERT INTO "game_player" VALUES ('1005', '29', 'Hammer City Roller Girls', 'Harlots', 'Typhoid Maggie', '11');
INSERT INTO "game_player" VALUES ('1005', '30', 'Hammer City Roller Girls', 'Harlots', 'Fista Krusher', '11G6');
INSERT INTO "game_player" VALUES ('1005', '31', 'Hammer City Roller Girls', 'Harlots', 'Hitty Pryde', '152');
INSERT INTO "game_player" VALUES ('1005', '32', 'Hammer City Roller Girls', 'Harlots', 'GuilloTina', '237 ');
INSERT INTO "game_player" VALUES ('1005', '33', 'Hammer City Roller Girls', 'Harlots', 'Bam Bam Bigelow', '26');
INSERT INTO "game_player" VALUES ('1005', '34', 'Hammer City Roller Girls', 'Harlots', 'Va Va BOOM', '2611');
INSERT INTO "game_player" VALUES ('1005', '35', 'Hammer City Roller Girls', 'Harlots', 'Miss Carriage', '45');
INSERT INTO "game_player" VALUES ('1005', '36', 'Hammer City Roller Girls', 'Harlots', 'fErinheit', '451');
INSERT INTO "game_player" VALUES ('1005', '37', 'Hammer City Roller Girls', 'Harlots', 'Bean Stalker', '511');
INSERT INTO "game_player" VALUES ('1005', '38', 'Hammer City Roller Girls', 'Harlots', 'Smashin'' Good Time', '519');
INSERT INTO "game_player" VALUES ('1005', '39', 'Hammer City Roller Girls', 'Harlots', 'Natty B', '58');
INSERT INTO "game_player" VALUES ('1005', '40', 'Hammer City Roller Girls', 'Harlots', 'Heaven Lee Bash', '932');
INSERT INTO "game_player" VALUES ('1005', '41', 'Hammer City Roller Girls', 'Harlots', 'Lethal Mermaid', 'H20');
INSERT INTO "game_player" VALUES ('1005', '42', 'Hammer City Roller Girls', 'Harlots', 'Scooby Doom', 'K9');
INSERT INTO "game_player" VALUES ('1005', '43', 'Tri-City Roller Derby', 'Plan B', 'Justine Sane', '17');
INSERT INTO "game_player" VALUES ('1005', '44', 'Tri-City Roller Derby', 'Plan B', 'Lippy Wrongstockings', '19');
INSERT INTO "game_player" VALUES ('1005', '45', 'Tri-City Roller Derby', 'Plan B', 'Zooks', '20');
INSERT INTO "game_player" VALUES ('1005', '46', 'Tri-City Roller Derby', 'Plan B', 'Violent NoRegard', '303');
INSERT INTO "game_player" VALUES ('1005', '47', 'Tri-City Roller Derby', 'Plan B', 'Suzy Slam', '33');
INSERT INTO "game_player" VALUES ('1005', '48', 'Tri-City Roller Derby', 'Plan B', 'Psykosonic', '4');
INSERT INTO "game_player" VALUES ('1005', '49', 'Tri-City Roller Derby', 'Plan B', 'Meg N'' Plead', '42');
INSERT INTO "game_player" VALUES ('1005', '50', 'Tri-City Roller Derby', 'Plan B', 'Brunt Force Bunny', '44');
INSERT INTO "game_player" VALUES ('1005', '51', 'Tri-City Roller Derby', 'Plan B', 'Slaughterhouse Streeter', '480');
INSERT INTO "game_player" VALUES ('1005', '52', 'Tri-City Roller Derby', 'Plan B', 'Cannonball Doll', '64');
INSERT INTO "game_player" VALUES ('1005', '53', 'Tri-City Roller Derby', 'Plan B', 'MEGAnTRON', '84');
COMMIT;

-- ----------------------------
--  Table structure for player
-- ----------------------------
DROP TABLE IF EXISTS "player";
CREATE TABLE "player" (
	"player_id" int4 NOT NULL,
	"derby_name" varchar(255) COLLATE "default",
	"first_name" varchar(255) COLLATE "default",
	"last_name" varchar(255) COLLATE "default",
	"email" varchar(255) COLLATE "default",
	"phone" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE);

-- ----------------------------
--  Records of player
-- ----------------------------
BEGIN;
INSERT INTO "player" VALUES ('1', 'Stacie Jones', 'Stacie', 'Jahonez', '', '');
INSERT INTO "player" VALUES ('2', 'Fox Hadley', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('3', 'Rain Blows Brite', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('4', 'Kristy Skelton', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('5', 'AnneX', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('6', 'The Honey Badger', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('7', 'Aggrosaurus', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('8', 'Crazy Squirrel', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('9', 'Anne Tastic', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('10', 'Pity Affoo', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('11', 'Fraxxure', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('12', 'Wylde Leigh Coyote', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('13', 'Commander Will Wrecker', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('14', 'Paige Bleed', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('15', 'Lora "OutaMy" Wayman', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('16', 'Amy Spears', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('17', 'Jesse "Ava Tarr" Fox', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('18', 'Kitty Liquorbottom', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('19', 'Texas Chainsaw Sasskicker', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('20', 'Val Holla', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('21', 'The Smacktivist', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('22', 'Burnadeath', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('23', 'HellionBOI', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('24', 'BiggRigg', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('25', 'KloverKill', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('26', 'TactiGal', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('27', 'Ena Flash', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('28', 'Andi Slamberg', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('29', 'Typhoid Maggie', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('30', 'Fista Krusher', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('31', 'Hitty Pryde', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('32', 'GuilloTina', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('33', 'Bam Bam Bigelow', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('34', 'Va Va BOOM', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('35', 'Miss Carriage', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('36', 'fErinheit', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('37', 'Bean Stalker', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('38', 'Smashin'' Good Time', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('39', 'Natty B', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('40', 'Heaven Lee Bash', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('41', 'Lethal Mermaid', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('42', 'Scooby Doom', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('43', 'Justine Sane', 'Nicole', 'French', '', '');
INSERT INTO "player" VALUES ('44', 'Lippy Wrongstockings', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('45', 'Zooks', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('46', 'Violent NoRegard', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('47', 'Suzy Slam', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('48', 'Psykosonic', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('49', 'Meg N'' Plead', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('50', 'Brunt Force Bunny', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('51', 'Slaughterhouse Streeter', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('52', 'Cannonball Doll', 'Bonnie', 'Thunders', '', '');
INSERT INTO "player" VALUES ('53', 'MEGAnTRON', 'Bonnie', 'Thunders', '', '');
COMMIT;

-- ----------------------------
--  Table structure for player_affiliation
-- ----------------------------
DROP TABLE IF EXISTS "player_affiliation";
CREATE TABLE "player_affiliation" (
	"player_id" int4 NOT NULL,
	"league" varchar(255) NOT NULL COLLATE "default",
	"derby_name" varchar(255) COLLATE "default",
	"number" varchar(255) COLLATE "default",
	"effective_date" date NOT NULL,
	"expiry_date" date
)
WITH (OIDS=FALSE);

-- ----------------------------
--  Records of player_affiliation
-- ----------------------------
BEGIN;
INSERT INTO "player_affiliation" VALUES ('1', 'Tri-City Roller Derby', 'Stacie Jones', '101', '2015-03-14', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('2', 'Tri-City Roller Derby', 'Fox Hadley', '1013', '2015-03-14', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('3', 'Tri-City Roller Derby', 'Rain Blows Brite', '13', '2015-03-14', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('4', 'Tri-City Roller Derby', 'Kristy Skelton', '1321', '2015-03-14', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('5', 'Tri-City Roller Derby', 'AnneX', '14', '2015-03-14', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('6', 'Tri-City Roller Derby', 'The Honey Badger', '18', '2015-03-14', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('7', 'Tri-City Roller Derby', 'Aggrosaurus', '2042', '2015-03-14', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('8', 'Tri-City Roller Derby', 'Crazy Squirrel', '231', '2015-03-14', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('9', 'Tri-City Roller Derby', 'Anne Tastic', '24', '2015-03-14', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('10', 'Tri-City Roller Derby', 'Pity Affoo', '711', '2015-03-14', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('11', 'Tri-City Roller Derby', 'Fraxxure', '911', '2015-03-14', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('12', 'Tri-City Roller Derby', 'Wylde Leigh Coyote', '9TNT', '2015-03-14', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('13', 'Tri-City Roller Derby', 'Commander Will Wrecker', 'NO1', '2015-03-14', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('14', 'Ohio Roller Girls', 'Paige Bleed', '0125', '2015-03-14', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('15', 'Ohio Roller Girls', 'Lora "OutaMy" Wayman', '10', '2015-03-14', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('16', 'Ohio Roller Girls', 'Amy Spears', '1098', '2015-03-14', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('17', 'Ohio Roller Girls', 'Jesse "Ava Tarr" Fox', '1101', '2015-03-14', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('18', 'Ohio Roller Girls', 'Kitty Liquorbottom', '12', '2015-03-14', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('19', 'Ohio Roller Girls', 'Texas Chainsaw Sasskicker', '19', '2015-03-14', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('20', 'Ohio Roller Girls', 'Val Holla', '2', '2015-03-14', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('21', 'Ohio Roller Girls', 'The Smacktivist', '365', '2015-03-14', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('22', 'Ohio Roller Girls', 'Burnadeath', '451', '2015-03-14', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('23', 'Ohio Roller Girls', 'HellionBOI', '5459', '2015-03-14', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('24', 'Ohio Roller Girls', 'BiggRigg', '815', '2015-03-14', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('25', 'Ohio Roller Girls', 'KloverKill', '99', '2015-03-14', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('26', 'Ohio Roller Girls', 'TactiGal', 'C4', '2015-03-14', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('27', 'Ohio Roller Girls', 'Ena Flash', 'ICU2', '2015-03-14', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('28', 'Tri-City Roller Derby', 'Andi Slamberg', '0', '2015-03-14', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('29', 'Hammer City Roller Girls', 'Typhoid Maggie', '11', '2015-04-11', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('30', 'Hammer City Roller Girls', 'Fista Krusher', '11G6', '2015-04-11', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('31', 'Hammer City Roller Girls', 'Hitty Pryde', '152', '2015-04-11', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('32', 'Hammer City Roller Girls', 'GuilloTina', '237', '2015-04-11', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('33', 'Hammer City Roller Girls', 'Bam Bam Bigelow', '26', '2015-04-11', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('34', 'Hammer City Roller Girls', 'Va Va BOOM', '2611', '2015-04-11', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('35', 'Hammer City Roller Girls', 'Miss Carriage', '45', '2015-04-11', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('36', 'Hammer City Roller Girls', 'fErinheit', '451', '2015-04-11', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('37', 'Hammer City Roller Girls', 'Bean Stalker', '511', '2015-04-11', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('38', 'Hammer City Roller Girls', 'Smashin'' Good Time', '519', '2015-04-11', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('39', 'Hammer City Roller Girls', 'Natty B', '58', '2015-04-11', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('40', 'Hammer City Roller Girls', 'Heaven Lee Bash', '932', '2015-04-11', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('41', 'Hammer City Roller Girls', 'Lethal Mermaid', 'H20', '2015-04-11', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('42', 'Hammer City Roller Girls', 'Scooby Doom', 'K9', '2015-04-11', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('43', 'Tri-City Roller Derby', 'Justine Sane', '17', '2015-04-11', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('44', 'Tri-City Roller Derby', 'Lippy Wrongstockings', '19', '2015-04-11', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('45', 'Tri-City Roller Derby', 'Zooks', '20', '2015-04-11', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('46', 'Tri-City Roller Derby', 'Violent NoRegard', '303', '2015-04-11', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('47', 'Tri-City Roller Derby', 'Suzy Slam', '33', '2015-04-11', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('48', 'Tri-City Roller Derby', 'Psykosonic', '4', '2015-04-11', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('49', 'Tri-City Roller Derby', 'Meg N'' Plead', '42', '2015-04-11', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('50', 'Tri-City Roller Derby', 'Brunt Force Bunny', '44', '2015-04-11', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('51', 'Tri-City Roller Derby', 'Slaughterhouse Streeter', '480', '2015-04-11', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('52', 'Tri-City Roller Derby', 'Cannonball Doll', '64', '2015-04-11', '2030-12-31');
INSERT INTO "player_affiliation" VALUES ('53', 'Tri-City Roller Derby', 'MEGAnTRON', '84', '2015-04-11', '2030-12-31');
COMMIT;

-- ----------------------------
--  Table structure for game_jam_position
-- ----------------------------
DROP TABLE IF EXISTS "game_jam_position";
CREATE TABLE "game_jam_position" (
	"game_id" int4 NOT NULL,
	"period" int4 NOT NULL,
	"jam" int4 NOT NULL,
	"team" varchar(255) NOT NULL COLLATE "default",
	"player_id" int4 NOT NULL,
	"position" varchar(255) COLLATE "default",
	"box" varchar(255) COLLATE "default",
	"penalties" int4,
	"post_pass_box" varchar(255) COLLATE "default",
	"post_pass_penalties" int4,
	"pass_occurred" boolean
)
WITH (OIDS=FALSE);

-- ----------------------------
--  Records of game_jam_position
-- ----------------------------
BEGIN;
INSERT INTO "game_jam_position" VALUES ('1004', '1', '1', 'Charter Team', '15', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '1', 'Charter Team', '18', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '1', 'Charter Team', '21', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '1', 'Charter Team', '22', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '1', 'Charter Team', '27', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '1', 'Thunder', '2', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '1', 'Thunder', '6', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '1', 'Thunder', '9', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '1', 'Thunder', '10', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '1', 'Thunder', '11', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '2', 'Charter Team', '15', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '2', 'Charter Team', '17', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '2', 'Charter Team', '18', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '2', 'Charter Team', '19', 'Blocker3', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '2', 'Charter Team', '27', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '2', 'Thunder', '1', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '2', 'Thunder', '5', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '2', 'Thunder', '7', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '2', 'Thunder', '8', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '2', 'Thunder', '13', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '3', 'Charter Team', '15', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '3', 'Charter Team', '16', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '3', 'Charter Team', '19', 'Blocker3', '$', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '3', 'Charter Team', '21', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '3', 'Charter Team', '22', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '3', 'Thunder', '2', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '3', 'Thunder', '9', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '3', 'Thunder', '10', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '3', 'Thunder', '11', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '3', 'Thunder', '12', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '4', 'Charter Team', '16', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '4', 'Charter Team', '17', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '4', 'Charter Team', '18', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '4', 'Charter Team', '22', 'Pivot', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '4', 'Charter Team', '27', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '4', 'Thunder', '1', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '4', 'Thunder', '5', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '4', 'Thunder', '6', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '4', 'Thunder', '7', 'Blocker1', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '4', 'Thunder', '13', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '5', 'Charter Team', '15', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '5', 'Charter Team', '17', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '5', 'Charter Team', '22', 'Pivot', '$', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '5', 'Charter Team', '24', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '5', 'Charter Team', '27', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '5', 'Thunder', '2', 'Pivot', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '5', 'Thunder', '7', 'Blocker1', '$X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '5', 'Thunder', '8', 'Jammer', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '5', 'Thunder', '9', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '5', 'Thunder', '11', 'Blocker2', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '6', 'Charter Team', '14', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '6', 'Charter Team', '17', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '6', 'Charter Team', '18', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '6', 'Charter Team', '19', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '6', 'Charter Team', '21', 'Jammer', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '6', 'Thunder', '1', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '6', 'Thunder', '2', 'Pivot', '$', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '6', 'Thunder', '5', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '6', 'Thunder', '8', 'Jammer', '$X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '6', 'Thunder', '11', 'Blocker2', '$', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '7', 'Charter Team', '15', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '7', 'Charter Team', '16', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '7', 'Charter Team', '18', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '7', 'Charter Team', '19', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '7', 'Charter Team', '27', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '7', 'Thunder', '2', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '7', 'Thunder', '4', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '7', 'Thunder', '10', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '7', 'Thunder', '11', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '7', 'Thunder', '12', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '8', 'Charter Team', '21', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '8', 'Charter Team', '22', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '8', 'Charter Team', '24', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '8', 'Charter Team', '25', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '8', 'Charter Team', '27', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '8', 'Thunder', '1', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '8', 'Thunder', '3', 'Blocker2', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '8', 'Thunder', '5', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '8', 'Thunder', '6', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '8', 'Thunder', '7', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '9', 'Charter Team', '14', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '9', 'Charter Team', '15', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '9', 'Charter Team', '16', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '9', 'Charter Team', '18', 'Jammer', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '9', 'Charter Team', '22', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '9', 'Thunder', '2', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '9', 'Thunder', '3', 'Blocker2', '$', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '9', 'Thunder', '8', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '9', 'Thunder', '11', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '9', 'Thunder', '28', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '10', 'Charter Team', '14', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '10', 'Charter Team', '15', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '10', 'Charter Team', '16', 'Blocker1', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '10', 'Charter Team', '21', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '10', 'Charter Team', '27', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '10', 'Thunder', '3', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '10', 'Thunder', '5', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '10', 'Thunder', '7', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '10', 'Thunder', '12', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '10', 'Thunder', '13', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '11', 'Charter Team', '15', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '11', 'Charter Team', '16', 'Blocker1', '$', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '11', 'Charter Team', '17', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '11', 'Charter Team', '18', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '11', 'Charter Team', '22', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '11', 'Thunder', '2', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '11', 'Thunder', '6', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '11', 'Thunder', '9', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '11', 'Thunder', '11', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '11', 'Thunder', '28', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '12', 'Charter Team', '21', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '12', 'Charter Team', '22', 'Blocker3', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '12', 'Charter Team', '24', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '12', 'Charter Team', '25', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '12', 'Charter Team', '27', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '12', 'Thunder', '1', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '12', 'Thunder', '5', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '12', 'Thunder', '7', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '12', 'Thunder', '8', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '12', 'Thunder', '13', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '13', 'Charter Team', '14', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '13', 'Charter Team', '15', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '13', 'Charter Team', '18', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '13', 'Charter Team', '22', 'Blocker3', '$', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '13', 'Charter Team', '27', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '13', 'Thunder', '2', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '13', 'Thunder', '9', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '13', 'Thunder', '10', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '13', 'Thunder', '11', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '13', 'Thunder', '12', 'Jammer', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '14', 'Charter Team', '16', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '14', 'Charter Team', '19', 'Blocker2', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '14', 'Charter Team', '21', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '14', 'Charter Team', '24', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '14', 'Charter Team', '27', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '14', 'Thunder', '1', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '14', 'Thunder', '3', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '14', 'Thunder', '5', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '14', 'Thunder', '7', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '14', 'Thunder', '12', 'Jammer', '$X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '15', 'Charter Team', '15', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '15', 'Charter Team', '16', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '15', 'Charter Team', '18', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '15', 'Charter Team', '20', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '15', 'Charter Team', '22', 'Blocker1', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '15', 'Thunder', '2', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '15', 'Thunder', '6', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '15', 'Thunder', '9', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '15', 'Thunder', '10', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '15', 'Thunder', '11', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '16', 'Charter Team', '17', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '16', 'Charter Team', '20', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '16', 'Charter Team', '24', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '16', 'Charter Team', '25', 'Jammer', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '16', 'Charter Team', '27', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '16', 'Thunder', '1', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '16', 'Thunder', '5', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '16', 'Thunder', '7', 'Blocker1', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '16', 'Thunder', '8', 'Jammer', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '16', 'Thunder', '13', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '17', 'Charter Team', '15', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '17', 'Charter Team', '17', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '17', 'Charter Team', '18', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '17', 'Charter Team', '22', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '17', 'Charter Team', '27', 'Blocker3', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '17', 'Thunder', '2', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '17', 'Thunder', '8', 'Jammer', '$', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '17', 'Thunder', '9', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '17', 'Thunder', '11', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '17', 'Thunder', '28', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '18', 'Charter Team', '16', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '18', 'Charter Team', '17', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '18', 'Charter Team', '18', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '18', 'Charter Team', '21', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '18', 'Charter Team', '22', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '18', 'Thunder', '1', 'Blocker3', '', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '18', 'Thunder', '3', 'Blocker2', '', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '18', 'Thunder', '5', 'Pivot', 'X', '1', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '18', 'Thunder', '6', 'Jammer', '', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '18', 'Thunder', '7', 'Blocker1', '', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '19', 'Charter Team', '15', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '19', 'Charter Team', '16', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '19', 'Charter Team', '24', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '19', 'Charter Team', '25', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '19', 'Charter Team', '27', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '19', 'Thunder', '2', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '19', 'Thunder', '4', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '19', 'Thunder', '9', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '19', 'Thunder', '11', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '1', '19', 'Thunder', '12', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '1', 'Charter Team', '15', 'Pivot', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '1', 'Charter Team', '18', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '1', 'Charter Team', '21', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '1', 'Charter Team', '22', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '1', 'Charter Team', '27', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '1', 'Thunder', '2', 'Pivot', '', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '1', 'Thunder', '4', 'Blocker3', '', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '1', 'Thunder', '9', 'Blocker1', '', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '1', 'Thunder', '11', 'Blocker2', '', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '1', 'Thunder', '12', 'Jammer', 'X', '1', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '2', 'Charter Team', '15', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '2', 'Charter Team', '17', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '2', 'Charter Team', '18', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '2', 'Charter Team', '22', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '2', 'Charter Team', '27', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '2', 'Thunder', '1', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '2', 'Thunder', '5', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '2', 'Thunder', '6', 'Jammer', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '2', 'Thunder', '7', 'Blocker3', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '2', 'Thunder', '12', 'Blocker1', '$', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '3', 'Charter Team', '15', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '3', 'Charter Team', '17', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '3', 'Charter Team', '19', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '3', 'Charter Team', '21', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '3', 'Charter Team', '22', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '3', 'Thunder', '1', 'Blocker2', '$', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '3', 'Thunder', '7', 'Blocker3', '$', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '3', 'Thunder', '8', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '3', 'Thunder', '11', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '3', 'Thunder', '12', 'Blocker1', '$', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '4', 'Charter Team', '14', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '4', 'Charter Team', '16', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '4', 'Charter Team', '18', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '4', 'Charter Team', '22', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '4', 'Charter Team', '27', 'Blocker2', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '4', 'Thunder', '2', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '4', 'Thunder', '4', 'Blocker1', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '4', 'Thunder', '6', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '4', 'Thunder', '9', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '4', 'Thunder', '11', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '5', 'Charter Team', '15', 'Pivot', '', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '5', 'Charter Team', '17', 'Blocker3', '', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '5', 'Charter Team', '22', 'Blocker1', '', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '5', 'Charter Team', '24', 'Jammer', '', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '5', 'Charter Team', '27', 'Blocker2', '$', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '5', 'Thunder', '1', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '5', 'Thunder', '5', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '5', 'Thunder', '7', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '5', 'Thunder', '8', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '5', 'Thunder', '13', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '6', 'Charter Team', '14', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '6', 'Charter Team', '17', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '6', 'Charter Team', '18', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '6', 'Charter Team', '19', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '6', 'Charter Team', '21', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '6', 'Thunder', '2', 'Pivot', '', '0', '/', '1', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '6', 'Thunder', '4', 'Jammer', '', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '6', 'Thunder', '9', 'Blocker1', '', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '6', 'Thunder', '10', 'Blocker2', '', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '6', 'Thunder', '11', 'Blocker3', '', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '7', 'Charter Team', '15', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '7', 'Charter Team', '16', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '7', 'Charter Team', '18', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '7', 'Charter Team', '19', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '7', 'Charter Team', '27', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '7', 'Thunder', '1', 'Blocker2', '', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '7', 'Thunder', '2', 'Jammer', '$', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '7', 'Thunder', '5', 'Blocker3', '', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '7', 'Thunder', '6', 'Pivot', '', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '7', 'Thunder', '7', 'Blocker1', '', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '8', 'Charter Team', '14', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '8', 'Charter Team', '22', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '8', 'Charter Team', '24', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '8', 'Charter Team', '25', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '8', 'Charter Team', '27', 'Blocker3', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '8', 'Thunder', '2', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '8', 'Thunder', '8', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '8', 'Thunder', '9', 'Blocker2', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '8', 'Thunder', '11', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '8', 'Thunder', '28', 'Blocker1', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '9', 'Charter Team', '14', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '9', 'Charter Team', '15', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '9', 'Charter Team', '16', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '9', 'Charter Team', '18', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '9', 'Charter Team', '23', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '9', 'Thunder', '1', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '9', 'Thunder', '5', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '9', 'Thunder', '6', 'Jammer', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '9', 'Thunder', '7', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '9', 'Thunder', '28', 'Blocker1', '$', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '10', 'Charter Team', '15', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '10', 'Charter Team', '16', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '10', 'Charter Team', '21', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '10', 'Charter Team', '23', 'Blocker1', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '10', 'Charter Team', '27', 'Blocker3', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '10', 'Thunder', '2', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '10', 'Thunder', '6', 'Jammer', '$', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '10', 'Thunder', '9', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '10', 'Thunder', '10', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '10', 'Thunder', '11', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '11', 'Charter Team', '15', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '11', 'Charter Team', '18', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '11', 'Charter Team', '19', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '11', 'Charter Team', '22', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '11', 'Charter Team', '27', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '11', 'Thunder', '3', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '11', 'Thunder', '5', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '11', 'Thunder', '7', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '11', 'Thunder', '8', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '11', 'Thunder', '13', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '12', 'Charter Team', '17', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '12', 'Charter Team', '21', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '12', 'Charter Team', '22', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '12', 'Charter Team', '24', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '12', 'Charter Team', '25', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '12', 'Thunder', '2', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '12', 'Thunder', '6', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '12', 'Thunder', '9', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '12', 'Thunder', '11', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '12', 'Thunder', '28', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '13', 'Charter Team', '15', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '13', 'Charter Team', '17', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '13', 'Charter Team', '18', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '13', 'Charter Team', '19', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '13', 'Charter Team', '27', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '13', 'Thunder', '1', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '13', 'Thunder', '5', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '13', 'Thunder', '7', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '13', 'Thunder', '8', 'Jammer', 'X/', '2', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '13', 'Thunder', '13', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '14', 'Charter Team', '16', 'Blocker1', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '14', 'Charter Team', '21', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '14', 'Charter Team', '24', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '14', 'Charter Team', '26', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '14', 'Charter Team', '27', 'Blocker3', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '14', 'Thunder', '2', 'Blocker1', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '14', 'Thunder', '6', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '14', 'Thunder', '8', 'Jammer', '$', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '14', 'Thunder', '9', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '14', 'Thunder', '11', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '15', 'Charter Team', '16', 'Blocker1', '$', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '15', 'Charter Team', '18', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '15', 'Charter Team', '20', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '15', 'Charter Team', '22', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '15', 'Charter Team', '24', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '15', 'Thunder', '1', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '15', 'Thunder', '3', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '15', 'Thunder', '5', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '15', 'Thunder', '7', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '15', 'Thunder', '13', 'Blocker3', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '16', 'Charter Team', '15', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '16', 'Charter Team', '17', 'Blocker3', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '16', 'Charter Team', '19', 'Blocker2', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '16', 'Charter Team', '20', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '16', 'Charter Team', '21', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '16', 'Thunder', '2', 'Pivot', '', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '16', 'Thunder', '6', 'Jammer', '', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '16', 'Thunder', '9', 'Blocker1', '', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '16', 'Thunder', '11', 'Blocker2', '', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '16', 'Thunder', '13', 'Blocker3', '$', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '17', 'Charter Team', '15', 'Pivot', '', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '17', 'Charter Team', '17', 'Blocker3', '$', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '17', 'Charter Team', '19', 'Blocker2', '$', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '17', 'Charter Team', '22', 'Blocker1', 'X/', '2', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '17', 'Charter Team', '23', 'Jammer', '', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '17', 'Thunder', '2', 'Blocker2', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '17', 'Thunder', '5', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '17', 'Thunder', '7', 'Blocker3', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '17', 'Thunder', '8', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1004', '2', '17', 'Thunder', '11', 'Blocker1', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '1', 'Harlots', '30', 'Jammer', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '1', 'Harlots', '32', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '1', 'Harlots', '34', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '1', 'Harlots', '35', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '1', 'Harlots', '40', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '1', 'Plan B', '28', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '1', 'Plan B', '45', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '1', 'Plan B', '46', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '1', 'Plan B', '48', 'Jammer', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '1', 'Plan B', '52', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '2', 'Harlots', '29', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '2', 'Harlots', '31', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '2', 'Harlots', '33', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '2', 'Harlots', '38', 'Blocker2', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '2', 'Harlots', '39', 'Jammer', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '2', 'Plan B', '13', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '2', 'Plan B', '43', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '2', 'Plan B', '44', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '2', 'Plan B', '47', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '2', 'Plan B', '51', 'Blocker3', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '3', 'Harlots', '32', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '3', 'Harlots', '34', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '3', 'Harlots', '35', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '3', 'Harlots', '41', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '3', 'Harlots', '42', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '3', 'Plan B', '4', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '3', 'Plan B', '28', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '3', 'Plan B', '45', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '3', 'Plan B', '50', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '3', 'Plan B', '52', 'Blocker3', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '4', 'Harlots', '29', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '4', 'Harlots', '33', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '4', 'Harlots', '36', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '4', 'Harlots', '38', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '4', 'Harlots', '40', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '4', 'Plan B', '13', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '4', 'Plan B', '49', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '4', 'Plan B', '51', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '4', 'Plan B', '52', 'Blocker3', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '4', 'Plan B', '53', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '5', 'Harlots', '30', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '5', 'Harlots', '31', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '5', 'Harlots', '32', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '5', 'Harlots', '34', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '5', 'Harlots', '35', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '5', 'Plan B', '28', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '5', 'Plan B', '45', 'Blocker3', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '5', 'Plan B', '46', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '5', 'Plan B', '48', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '5', 'Plan B', '52', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '6', 'Harlots', '29', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '6', 'Harlots', '33', 'Pivot', '', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '6', 'Harlots', '38', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '6', 'Harlots', '39', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '6', 'Harlots', '41', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '6', 'Plan B', '13', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '6', 'Plan B', '44', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '6', 'Plan B', '45', 'Blocker3', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '6', 'Plan B', '47', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '6', 'Plan B', '51', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '7', 'Harlots', '32', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '7', 'Harlots', '34', 'Blocker3', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '7', 'Harlots', '35', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '7', 'Harlots', '40', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '7', 'Harlots', '42', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '7', 'Plan B', '4', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '7', 'Plan B', '28', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '7', 'Plan B', '46', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '7', 'Plan B', '50', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '7', 'Plan B', '52', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '8', 'Harlots', '29', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '8', 'Harlots', '33', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '8', 'Harlots', '34', 'Blocker3', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '8', 'Harlots', '36', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '8', 'Harlots', '38', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '8', 'Plan B', '13', 'Pivot', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '8', 'Plan B', '43', 'Blocker2', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '8', 'Plan B', '49', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '8', 'Plan B', '51', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '8', 'Plan B', '53', 'Jammer', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '9', 'Harlots', '30', 'Jammer', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '9', 'Harlots', '31', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '9', 'Harlots', '32', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '9', 'Harlots', '34', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '9', 'Harlots', '35', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '9', 'Plan B', '28', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '9', 'Plan B', '45', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '9', 'Plan B', '46', 'Blocker2', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '9', 'Plan B', '48', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '9', 'Plan B', '52', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '10', 'Harlots', '29', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '10', 'Harlots', '33', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '10', 'Harlots', '38', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '10', 'Harlots', '39', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '10', 'Harlots', '41', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '10', 'Plan B', '13', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '10', 'Plan B', '44', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '10', 'Plan B', '46', 'Blocker2', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '10', 'Plan B', '47', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '10', 'Plan B', '49', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '11', 'Harlots', '32', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '11', 'Harlots', '34', 'Blocker2', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '11', 'Harlots', '35', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '11', 'Harlots', '40', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '11', 'Harlots', '42', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '11', 'Plan B', '4', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '11', 'Plan B', '28', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '11', 'Plan B', '45', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '11', 'Plan B', '50', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '11', 'Plan B', '52', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '12', 'Harlots', '29', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '12', 'Harlots', '33', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '12', 'Harlots', '34', 'Blocker2', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '12', 'Harlots', '36', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '12', 'Harlots', '38', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '12', 'Plan B', '13', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '12', 'Plan B', '43', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '12', 'Plan B', '47', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '12', 'Plan B', '51', 'Blocker3', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '12', 'Plan B', '53', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '13', 'Harlots', '30', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '13', 'Harlots', '31', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '13', 'Harlots', '32', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '13', 'Harlots', '34', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '13', 'Harlots', '37', 'Jammer', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '13', 'Plan B', '28', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '13', 'Plan B', '45', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '13', 'Plan B', '46', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '13', 'Plan B', '48', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '13', 'Plan B', '52', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '14', 'Harlots', '29', 'Blocker1', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '14', 'Harlots', '33', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '14', 'Harlots', '38', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '14', 'Harlots', '39', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '14', 'Harlots', '41', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '14', 'Plan B', '13', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '14', 'Plan B', '44', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '14', 'Plan B', '47', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '14', 'Plan B', '49', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '14', 'Plan B', '51', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '15', 'Harlots', '29', 'Blocker1', 'I', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '15', 'Harlots', '32', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '15', 'Harlots', '35', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '15', 'Harlots', '37', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '15', 'Harlots', '42', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '15', 'Plan B', '4', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '15', 'Plan B', '28', 'Pivot', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '15', 'Plan B', '45', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '15', 'Plan B', '50', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '15', 'Plan B', '52', 'Blocker1', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '16', 'Harlots', '29', 'Blocker1', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '16', 'Harlots', '33', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '16', 'Harlots', '36', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '16', 'Harlots', '38', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '16', 'Harlots', '40', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '16', 'Plan B', '13', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '16', 'Plan B', '28', 'Pivot', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '16', 'Plan B', '49', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '16', 'Plan B', '51', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '16', 'Plan B', '52', 'Blocker1', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '17', 'Harlots', '30', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '17', 'Harlots', '31', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '17', 'Harlots', '32', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '17', 'Harlots', '34', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '17', 'Harlots', '35', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '17', 'Plan B', '28', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '17', 'Plan B', '45', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '17', 'Plan B', '50', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '17', 'Plan B', '52', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '17', 'Plan B', '53', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '18', 'Harlots', '29', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '18', 'Harlots', '33', 'Pivot', '', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '18', 'Harlots', '38', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '18', 'Harlots', '39', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '18', 'Harlots', '41', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '18', 'Plan B', '13', 'Pivot', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '18', 'Plan B', '43', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '18', 'Plan B', '47', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '18', 'Plan B', '48', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '18', 'Plan B', '51', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '19', 'Harlots', '32', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '19', 'Harlots', '34', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '19', 'Harlots', '35', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '19', 'Harlots', '40', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '19', 'Harlots', '42', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '19', 'Plan B', '13', 'Pivot', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '19', 'Plan B', '28', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '19', 'Plan B', '46', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '19', 'Plan B', '52', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '1', '19', 'Plan B', '53', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '1', 'Harlots', '32', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '1', 'Harlots', '34', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '1', 'Harlots', '35', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '1', 'Harlots', '39', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '1', 'Harlots', '40', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '1', 'Plan B', '28', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '1', 'Plan B', '45', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '1', 'Plan B', '46', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '1', 'Plan B', '48', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '1', 'Plan B', '52', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '2', 'Harlots', '29', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '2', 'Harlots', '30', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '2', 'Harlots', '31', 'Blocker2', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '2', 'Harlots', '33', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '2', 'Harlots', '38', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '2', 'Plan B', '13', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '2', 'Plan B', '43', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '2', 'Plan B', '44', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '2', 'Plan B', '47', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '2', 'Plan B', '51', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '3', 'Harlots', '31', 'Blocker2', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '3', 'Harlots', '32', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '3', 'Harlots', '34', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '3', 'Harlots', '35', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '3', 'Harlots', '42', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '3', 'Plan B', '28', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '3', 'Plan B', '45', 'Blocker3', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '3', 'Plan B', '50', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '3', 'Plan B', '52', 'Blocker1', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '3', 'Plan B', '53', 'Jammer', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '4', 'Harlots', '29', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '4', 'Harlots', '33', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '4', 'Harlots', '36', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '4', 'Harlots', '38', 'Pivot', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '4', 'Harlots', '41', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '4', 'Plan B', '13', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '4', 'Plan B', '47', 'Blocker1', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '4', 'Plan B', '48', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '4', 'Plan B', '49', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '4', 'Plan B', '51', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '5', 'Harlots', '30', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '5', 'Harlots', '32', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '5', 'Harlots', '34', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '5', 'Harlots', '35', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '5', 'Harlots', '38', 'Pivot', 'X', '1', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '5', 'Plan B', '28', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '5', 'Plan B', '44', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '5', 'Plan B', '46', 'Blocker1', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '5', 'Plan B', '50', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '5', 'Plan B', '52', 'Blocker3', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '6', 'Harlots', '29', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '6', 'Harlots', '32', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '6', 'Harlots', '33', 'Pivot', '', '0', 'X', '1', TRUE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '6', 'Harlots', '39', 'Jammer', '', '0', '/', '1', TRUE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '6', 'Harlots', '40', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '6', 'Plan B', '13', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '6', 'Plan B', '45', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '6', 'Plan B', '47', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '6', 'Plan B', '49', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '6', 'Plan B', '51', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '7', 'Harlots', '33', 'Jammer', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '7', 'Harlots', '34', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '7', 'Harlots', '37', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '7', 'Harlots', '38', 'Pivot', '', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '7', 'Harlots', '39', 'Blocker1', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '7', 'Plan B', '28', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '7', 'Plan B', '46', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '7', 'Plan B', '50', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '7', 'Plan B', '52', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '7', 'Plan B', '53', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '8', 'Harlots', '29', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '8', 'Harlots', '31', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '8', 'Harlots', '33', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '8', 'Harlots', '37', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '8', 'Harlots', '42', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '8', 'Plan B', '13', 'Pivot', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '8', 'Plan B', '43', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '8', 'Plan B', '47', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '8', 'Plan B', '48', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '8', 'Plan B', '51', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '9', 'Harlots', '32', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '9', 'Harlots', '34', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '9', 'Harlots', '35', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '9', 'Harlots', '36', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '9', 'Harlots', '41', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '9', 'Plan B', '13', 'Pivot', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '9', 'Plan B', '28', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '9', 'Plan B', '44', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '9', 'Plan B', '46', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '9', 'Plan B', '52', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '10', 'Harlots', '29', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '10', 'Harlots', '30', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '10', 'Harlots', '33', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '10', 'Harlots', '38', 'Pivot', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '10', 'Harlots', '40', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '10', 'Plan B', '13', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '10', 'Plan B', '45', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '10', 'Plan B', '47', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '10', 'Plan B', '51', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '10', 'Plan B', '53', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '11', 'Harlots', '32', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '11', 'Harlots', '34', 'Blocker3', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '11', 'Harlots', '35', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '11', 'Harlots', '38', 'Pivot', 'X', '1', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '11', 'Harlots', '39', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '11', 'Plan B', '28', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '11', 'Plan B', '46', 'Blocker1', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '11', 'Plan B', '48', 'Jammer', 'X/', '2', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '11', 'Plan B', '50', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '11', 'Plan B', '52', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '12', 'Harlots', '29', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '12', 'Harlots', '33', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '12', 'Harlots', '34', 'Blocker3', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '12', 'Harlots', '37', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '12', 'Harlots', '42', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '12', 'Plan B', '13', 'Pivot', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '12', 'Plan B', '43', 'Blocker3', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '12', 'Plan B', '48', 'Jammer', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '12', 'Plan B', '49', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '12', 'Plan B', '51', 'Blocker1', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '13', 'Harlots', '31', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '13', 'Harlots', '32', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '13', 'Harlots', '34', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '13', 'Harlots', '36', 'Jammer', '', '0', '/', '1', TRUE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '13', 'Harlots', '37', 'Pivot', 'X', '1', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '13', 'Plan B', '28', 'Pivot', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '13', 'Plan B', '43', 'Blocker3', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '13', 'Plan B', '44', 'Jammer', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '13', 'Plan B', '49', 'Blocker2', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '13', 'Plan B', '51', 'Blocker1', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '14', 'Harlots', '29', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '14', 'Harlots', '30', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '14', 'Harlots', '33', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '14', 'Harlots', '36', 'Blocker1', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '14', 'Harlots', '38', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '14', 'Plan B', '28', 'Pivot', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '14', 'Plan B', '45', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '14', 'Plan B', '46', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '14', 'Plan B', '52', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '14', 'Plan B', '53', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '15', 'Harlots', '32', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '15', 'Harlots', '34', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '15', 'Harlots', '35', 'Pivot', '', '0', '/', '1', TRUE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '15', 'Harlots', '39', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '15', 'Harlots', '41', 'Blocker2', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '15', 'Plan B', '13', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '15', 'Plan B', '44', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '15', 'Plan B', '47', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '15', 'Plan B', '49', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '15', 'Plan B', '51', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '16', 'Harlots', '29', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '16', 'Harlots', '33', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '16', 'Harlots', '35', 'Jammer', 'X', '1', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '16', 'Harlots', '37', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '16', 'Harlots', '38', 'Pivot', '', '0', '', '0', TRUE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '16', 'Plan B', '28', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '16', 'Plan B', '45', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '16', 'Plan B', '46', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '16', 'Plan B', '50', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '16', 'Plan B', '52', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '17', 'Harlots', '32', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '17', 'Harlots', '34', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '17', 'Harlots', '37', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '17', 'Harlots', '40', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '17', 'Harlots', '42', 'Jammer', '/', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '17', 'Plan B', '13', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '17', 'Plan B', '43', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '17', 'Plan B', '48', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '17', 'Plan B', '49', 'Blocker2', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '17', 'Plan B', '51', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '18', 'Harlots', '29', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '18', 'Harlots', '33', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '18', 'Harlots', '37', 'Blocker3', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '18', 'Harlots', '38', 'Pivot', 'X', '1', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '18', 'Harlots', '42', 'Jammer', 'X/', '2', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '18', 'Plan B', '28', 'Pivot', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '18', 'Plan B', '44', 'Jammer', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '18', 'Plan B', '45', 'Blocker1', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '18', 'Plan B', '46', 'Blocker2', '', '0', '', '0', FALSE);
INSERT INTO "game_jam_position" VALUES ('1005', '2', '18', 'Plan B', '52', 'Blocker3', '/', '1', '', '0', FALSE);
COMMIT;

-- ----------------------------
--  Primary key structure for table game
-- ----------------------------
ALTER TABLE "game" ADD PRIMARY KEY ("game_id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table game_jam_penalty
-- ----------------------------
ALTER TABLE "game_jam_penalty" ADD PRIMARY KEY ("game_id", "period", "jam", "team", "player_id", "penalty_id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table game_jam_score
-- ----------------------------
ALTER TABLE "game_jam_score" ADD PRIMARY KEY ("game_id", "period", "jam", "team", "jammer_player_id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table game_player
-- ----------------------------
ALTER TABLE "game_player" ADD PRIMARY KEY ("game_id", "player_id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table player
-- ----------------------------
ALTER TABLE "player" ADD PRIMARY KEY ("player_id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table player_affiliation
-- ----------------------------
ALTER TABLE "player_affiliation" ADD PRIMARY KEY ("player_id", "league", "effective_date") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table game_jam_position
-- ----------------------------
ALTER TABLE "game_jam_position" ADD PRIMARY KEY ("game_id", "period", "jam", "team", "player_id") NOT DEFERRABLE INITIALLY IMMEDIATE;

