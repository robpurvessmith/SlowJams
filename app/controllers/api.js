'use strict';

exports.games = function(req, res, next) {

    var games = [
        {
            GameDate: "2/15/2013",
            GameID: 0,
            LeagueHome: "Montreal",
            TeamHome: "New Skids on the Block",
            LeagueAway: "Tri-City",
            TeamAway: "Thunder",
            ScoreHome: 310,
            ScoreAway: 59
        },
        {
            GameDate: "4/13/2013",
            GameID: 0,
            LeagueHome: "Tri-City",
            TeamHome: "Thunder",
            LeagueAway: "Kilamazoo",
            TeamAway: "Derby Darlins",
            ScoreHome: 124,
            ScoreAway: 240
        },
        {
            GameDate: "5/11/2013",
            GameID: 0,
            LeagueHome: "Tri-City",
            TeamHome: "Thunder",
            LeagueAway: "Hammer City",
            TeamAway: "Eh! Team",
            ScoreHome: 320,
            ScoreAway: 88
        },
        {
            GameDate: "5/18/2013",
            GameID: 0,
            LeagueHome: "Tri-City",
            TeamHome: "Thunder",
            LeagueAway: "South Bend",
            TeamAway: "Studebrakers",
            ScoreHome: 253,
            ScoreAway: 94
        },
        {
            GameDate: "5/18/2013",
            GameID: 1,
            LeagueHome: "Tri-City",
            TeamHome: "Thunder",
            LeagueAway: "Conneticut",
            TeamAway: "Stepford Sabotage",
            ScoreHome: 143,
            ScoreAway: 155
        },
        {
            GameDate: "5/19/2013",
            GameID: 0,
            LeagueHome: "Tri-City",
            TeamHome: "Thunder",
            LeagueAway: "Chicago Outfit",
            TeamAway: "Syndicate",
            ScoreHome: 191,
            ScoreAway: 140
        },
        {
            GameDate: "6/08/2013",
            GameID: 0,
            LeagueHome: "Tri-City",
            TeamHome: "Thunder",
            LeagueAway: "Cincinatti",
            TeamAway: "Black Sheep",
            ScoreHome: 320,
            ScoreAway: 88
        },
        {
            GameDate: "8/23/2013",
            GameID: 0,
            LeagueHome: "Tri-City",
            TeamHome: "Thunder",
            LeagueAway: "Burning River",
            TeamAway: "All-Stars",
            ScoreHome: 190,
            ScoreAway: 174
        },
        {
            GameDate: "8/23/2013",
            GameID: 1,
            LeagueHome: "Tri-City",
            TeamHome: "Thunder",
            LeagueAway: "Santa Cruze",
            TeamAway: "Boardwalk Bombshells",
            ScoreHome: 231,
            ScoreAway: 236
        },
        {
            GameDate: "8/24/2013",
            GameID: 0,
            LeagueHome: "Tri-City",
            TeamHome: "Thunder",
            LeagueAway: "Carolina",
            TeamAway: "All Stars",
            ScoreHome: 247,
            ScoreAway: 131
        },
        {
            GameDate: "8/25/2013",
            GameID: 0,
            LeagueHome: "Tri-City",
            TeamHome: "Thunder",
            LeagueAway: "Paper Valley",
            TeamAway: "All Stars",
            ScoreHome: 203,
            ScoreAway: 169
        },
        {
            GameDate: "10/19/2013",
            GameID: 0,
            LeagueHome: "Tri-City",
            TeamHome: "Thunder",
            LeagueAway: "Rideau Valley",
            TeamAway: "Vixens",
            ScoreHome: 199,
            ScoreAway: 148
        }
    ];

    res.send(games);
}
