class MatchDetailsResponse {
  MatchDetail? matchDetail;
  List<Innings>? innings;
  Teams? teams;

  MatchDetailsResponse({
    this.matchDetail,
    this.innings,
    this.teams,
  });

  MatchDetailsResponse.fromJson(Map<String, dynamic> json) {
    matchDetail = json['Matchdetail'] != null ? MatchDetail.fromJson(json['Matchdetail']) : null;
    if (json['Innings'] != null) {
      innings = <Innings>[];
      json['Innings'].forEach((v) {
        innings!.add(Innings.fromJson(v));
      });
    }
    teams = json['Teams'] != null ? Teams.fromJson(json['Teams']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (matchDetail != null) {
      data['Matchdetail'] = matchDetail!.toJson();
    }
    if (innings != null) {
      data['Innings'] = innings!.map((v) => v.toJson()).toList();
    }
    if (teams != null) {
      data['Teams'] = teams!.toJson();
    }
    return data;
  }
}

class MatchDetail {
  String? teamHome;
  String? teamAway;
  Match? match;
  Series? series;
  Venue? venue;
  Officials? officials;
  String? weather;
  String? tossWonBy;
  String? status;
  String? statusId;
  String? playerMatch;
  String? result;
  String? winningTeam;
  String? winMargin;
  String? equation;

  MatchDetail({
    this.teamHome,
    this.teamAway,
    this.match,
    this.series,
    this.venue,
    this.officials,
    this.weather,
    this.tossWonBy,
    this.status,
    this.statusId,
    this.playerMatch,
    this.result,
    this.winningTeam,
    this.winMargin,
    this.equation,
  });

  MatchDetail.fromJson(Map<String, dynamic> json) {
    teamHome = json['Team_Home'];
    teamAway = json['Team_Away'];
    match = json['Match'] != null ? Match.fromJson(json['Match']) : null;
    series = json['Series'] != null ? Series.fromJson(json['Series']) : null;
    venue = json['Venue'] != null ? Venue.fromJson(json['Venue']) : null;
    officials = json['Officials'] != null ? Officials.fromJson(json['Officials']) : null;
    weather = json['Weather'];
    tossWonBy = json['Tosswonby'];
    status = json['Status'];
    statusId = json['Status_Id'];
    playerMatch = json['Player_Match'];
    result = json['Result'];
    winningTeam = json['Winningteam'];
    winMargin = json['Winmargin'];
    equation = json['Equation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Team_Home'] = teamHome;
    data['Team_Away'] = teamAway;
    if (match != null) {
      data['Match'] = match!.toJson();
    }
    if (series != null) {
      data['Series'] = series!.toJson();
    }
    if (venue != null) {
      data['Venue'] = venue!.toJson();
    }
    if (officials != null) {
      data['Officials'] = officials!.toJson();
    }
    data['Weather'] = weather;
    data['Tosswonby'] = tossWonBy;
    data['Status'] = status;
    data['Status_Id'] = statusId;
    data['Player_Match'] = playerMatch;
    data['Result'] = result;
    data['Winningteam'] = winningTeam;
    data['Winmargin'] = winMargin;
    data['Equation'] = equation;
    return data;
  }
}

class Match {
  String? liveCoverage;
  String? id;
  String? code;
  String? league;
  String? number;
  String? type;
  String? date;
  String? time;
  String? offset;
  String? dayNight;

  Match({
    this.liveCoverage,
    this.id,
    this.code,
    this.league,
    this.number,
    this.type,
    this.date,
    this.time,
    this.offset,
    this.dayNight,
  });

  Match.fromJson(Map<String, dynamic> json) {
    liveCoverage = json['Livecoverage'];
    id = json['Id'];
    code = json['Code'];
    league = json['League'];
    number = json['Number'];
    type = json['Type'];
    date = json['Date'];
    time = json['Time'];
    offset = json['Offset'];
    dayNight = json['Daynight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Livecoverage'] = liveCoverage;
    data['Id'] = id;
    data['Code'] = code;
    data['League'] = league;
    data['Number'] = number;
    data['Type'] = type;
    data['Date'] = date;
    data['Time'] = time;
    data['Offset'] = offset;
    data['Daynight'] = dayNight;
    return data;
  }
}

class Series {
  String? id;
  String? name;
  String? status;
  String? tour;
  String? tourName;

  Series({
    this.id,
    this.name,
    this.status,
    this.tour,
    this.tourName,
  });

  Series.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    status = json['Status'];
    tour = json['Tour'];
    tourName = json['Tour_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    data['Status'] = status;
    data['Tour'] = tour;
    data['Tour_Name'] = tourName;
    return data;
  }
}

class Venue {
  String? id;
  String? name;

  Venue({
    this.id,
    this.name,
  });

  Venue.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    return data;
  }
}

class Officials {
  String? umpires;
  String? referee;

  Officials({
    this.umpires,
    this.referee,
  });

  Officials.fromJson(Map<String, dynamic> json) {
    umpires = json['Umpires'];
    referee = json['Referee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Umpires'] = umpires;
    data['Referee'] = referee;
    return data;
  }
}

class Innings {
  String? number;
  String? battingteam;
  String? total;
  String? wickets;
  String? overs;
  String? runrate;
  String? byes;
  String? legbyes;
  String? wides;
  String? noballs;
  String? penalty;
  String? allottedOvers;
  List<BatsmanDetail>? batsmen;
  PartnershipCurrent? partnershipCurrent;
  List<Bowler>? bowlers;
  List<FallofWicket>? fallofWickets;
  PowerPlay? powerPlay;
  String? target;

  Innings({
    this.number,
    this.battingteam,
    this.total,
    this.wickets,
    this.overs,
    this.runrate,
    this.byes,
    this.legbyes,
    this.wides,
    this.noballs,
    this.penalty,
    this.allottedOvers,
    this.batsmen,
    this.partnershipCurrent,
    this.bowlers,
    this.fallofWickets,
    this.powerPlay,
    this.target,
  });

  Innings.fromJson(Map<String, dynamic> json) {
    number = json['Number'];
    battingteam = json['Battingteam'];
    total = json['Total'];
    wickets = json['Wickets'];
    overs = json['Overs'];
    runrate = json['Runrate'];
    byes = json['Byes'];
    legbyes = json['Legbyes'];
    wides = json['Wides'];
    noballs = json['Noballs'];
    penalty = json['Penalty'];
    allottedOvers = json['AllottedOvers'];
    if (json['Batsmen'] != null) {
      batsmen = <BatsmanDetail>[];
      json['Batsmen'].forEach((v) {
        batsmen!.add(BatsmanDetail.fromJson(v));
      });
    }
    partnershipCurrent =
        json['Partnership_Current'] != null ? PartnershipCurrent.fromJson(json['Partnership_Current']) : null;
    if (json['Bowlers'] != null) {
      bowlers = <Bowler>[];
      json['Bowlers'].forEach((v) {
        bowlers!.add(Bowler.fromJson(v));
      });
    }
    if (json['FallofWickets'] != null) {
      fallofWickets = <FallofWicket>[];
      json['FallofWickets'].forEach((v) {
        fallofWickets!.add(FallofWicket.fromJson(v));
      });
    }
    powerPlay = json['PowerPlay'] != null ? PowerPlay.fromJson(json['PowerPlay']) : null;
    target = json['Target'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Number'] = number;
    data['Battingteam'] = battingteam;
    data['Total'] = total;
    data['Wickets'] = wickets;
    data['Overs'] = overs;
    data['Runrate'] = runrate;
    data['Byes'] = byes;
    data['Legbyes'] = legbyes;
    data['Wides'] = wides;
    data['Noballs'] = noballs;
    data['Penalty'] = penalty;
    data['AllottedOvers'] = allottedOvers;
    if (batsmen != null) {
      data['Batsmen'] = batsmen!.map((v) => v.toJson()).toList();
    }
    if (partnershipCurrent != null) {
      data['Partnership_Current'] = partnershipCurrent!.toJson();
    }
    if (bowlers != null) {
      data['Bowlers'] = bowlers!.map((v) => v.toJson()).toList();
    }
    if (fallofWickets != null) {
      data['FallofWickets'] = fallofWickets!.map((v) => v.toJson()).toList();
    }
    if (powerPlay != null) {
      data['PowerPlay'] = powerPlay!.toJson();
    }
    data['Target'] = target;
    return data;
  }
}

class BatsmanDetail {
  String? batsman;
  String? runs;
  String? balls;
  String? fours;
  String? sixes;
  String? dots;
  String? strikeRate;
  String? dismissal;
  String? howout;
  String? bowler;
  String? fielder;
  bool? isonstrike;

  BatsmanDetail({
    this.batsman,
    this.runs,
    this.balls,
    this.fours,
    this.sixes,
    this.dots,
    this.strikeRate,
    this.dismissal,
    this.howout,
    this.bowler,
    this.fielder,
    this.isonstrike,
  });

  BatsmanDetail.fromJson(Map<String, dynamic> json) {
    batsman = json['Batsman'];
    runs = json['Runs'];
    balls = json['Balls'];
    fours = json['Fours'];
    sixes = json['Sixes'];
    dots = json['Dots'];
    strikeRate = json['Strikerate'];
    dismissal = json['Dismissal'];
    howout = json['Howout'];
    bowler = json['Bowler'];
    fielder = json['Fielder'];
    isonstrike = json['Isonstrike'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Batsman'] = batsman;
    data['Runs'] = runs;
    data['Balls'] = balls;
    data['Fours'] = fours;
    data['Sixes'] = sixes;
    data['Dots'] = dots;
    data['Strikerate'] = strikeRate;
    data['Dismissal'] = dismissal;
    data['Howout'] = howout;
    data['Bowler'] = bowler;
    data['Fielder'] = fielder;
    data['Isonstrike'] = isonstrike;
    return data;
  }
}

class PartnershipCurrent {
  String? runs;
  String? balls;
  List<PartnershipBatsman>? batsmen;

  PartnershipCurrent({
    this.runs,
    this.balls,
    this.batsmen,
  });

  PartnershipCurrent.fromJson(Map<String, dynamic> json) {
    runs = json['Runs'];
    balls = json['Balls'];
    if (json['Batsmen'] != null) {
      batsmen = <PartnershipBatsman>[];
      json['Batsmen'].forEach((v) {
        batsmen!.add(PartnershipBatsman.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Runs'] = runs;
    data['Balls'] = balls;
    if (batsmen != null) {
      data['Batsmen'] = batsmen!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PartnershipBatsman {
  String? batsman;
  String? runs;
  String? balls;

  PartnershipBatsman({
    this.batsman,
    this.runs,
    this.balls,
  });

  PartnershipBatsman.fromJson(Map<String, dynamic> json) {
    batsman = json['Batsman'];
    runs = json['Runs'];
    balls = json['Balls'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Batsman'] = batsman;
    data['Runs'] = runs;
    data['Balls'] = balls;
    return data;
  }
}

class Bowler {
  String? bowler;
  String? overs;
  String? maidens;
  String? runs;
  String? wickets;
  String? economyRate;
  String? noBalls;
  String? wides;
  String? dots;
  bool? isBowlingTandem;
  bool? isBowlingNow;
  List<ThisOver>? thisOver;

  Bowler({
    this.bowler,
    this.overs,
    this.maidens,
    this.runs,
    this.wickets,
    this.economyRate,
    this.noBalls,
    this.wides,
    this.dots,
    this.isBowlingTandem,
    this.isBowlingNow,
    this.thisOver,
  });

  Bowler.fromJson(Map<String, dynamic> json) {
    bowler = json['Bowler'];
    overs = json['Overs'];
    maidens = json['Maidens'];
    runs = json['Runs'];
    wickets = json['Wickets'];
    economyRate = json['Economyrate'];
    noBalls = json['Noballs'];
    wides = json['Wides'];
    dots = json['Dots'];
    isBowlingTandem = json['Isbowlingtandem'];
    isBowlingNow = json['Isbowlingnow'];
    if (json['ThisOver'] != null) {
      thisOver = <ThisOver>[];
      json['ThisOver'].forEach((v) {
        thisOver!.add(ThisOver.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Bowler'] = bowler;
    data['Overs'] = overs;
    data['Maidens'] = maidens;
    data['Runs'] = runs;
    data['Wickets'] = wickets;
    data['Economyrate'] = economyRate;
    data['Noballs'] = noBalls;
    data['Wides'] = wides;
    data['Dots'] = dots;
    data['Isbowlingtandem'] = isBowlingTandem;
    data['Isbowlingnow'] = isBowlingNow;
    if (thisOver != null) {
      data['ThisOver'] = thisOver!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ThisOver {
  String? t;
  String? b;

  ThisOver({
    this.t,
    this.b,
  });

  ThisOver.fromJson(Map<String, dynamic> json) {
    t = json['T'];
    b = json['B'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['T'] = t;
    data['B'] = b;
    return data;
  }
}

class FallofWicket {
  String? batsman;
  String? score;
  String? overs;

  FallofWicket({
    this.batsman,
    this.score,
    this.overs,
  });

  FallofWicket.fromJson(Map<String, dynamic> json) {
    batsman = json['Batsman'];
    score = json['Score'];
    overs = json['Overs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Batsman'] = batsman;
    data['Score'] = score;
    data['Overs'] = overs;
    return data;
  }
}

class PowerPlay {
  String? pp1;
  String? pp2;

  PowerPlay({
    this.pp1,
    this.pp2,
  });

  PowerPlay.fromJson(Map<String, dynamic> json) {
    pp1 = json['PP1'];
    pp2 = json['PP2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PP1'] = pp1;
    data['PP2'] = pp2;
    return data;
  }
}

class Teams {
  Team? teamA;
  Team? teamB;

  Teams({
    this.teamA,
    this.teamB,
  });

  Teams.fromJson(Map<String, dynamic> json) {
    List<String> keys = json.keys.toList();
    if (keys.length >= 2) {
      teamA = json[keys[0]] != null ? Team.fromJson(json[keys[0]]) : null;
      teamB = json[keys[1]] != null ? Team.fromJson(json[keys[1]]) : null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (teamA != null) {
      data['TeamA'] = teamA!.toJson();
    }
    if (teamB != null) {
      data['TeamB'] = teamB!.toJson();
    }
    return data;
  }
}

class Team {
  String? nameFull;
  String? nameShort;
  Map<String, PlayerInfo>? players;

  Team({
    this.nameFull,
    this.nameShort,
    this.players,
  });

  Team.fromJson(Map<String, dynamic> json) {
    nameFull = json['Name_Full'];
    nameShort = json['Name_Short'];
    if (json['Players'] != null) {
      players = <String, PlayerInfo>{};
      json['Players'].forEach((key, value) {
        players![key] = PlayerInfo.fromJson(value);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Name_Full'] = nameFull;
    data['Name_Short'] = nameShort;
    if (players != null) {
      data['Players'] = players!.map((key, value) => MapEntry(key, value.toJson()));
    }
    return data;
  }
}

class PlayerInfo {
  String? position;
  String? nameFull;
  bool? isCaptain;
  bool? isKeeper;
  Batting? batting;
  Bowling? bowling;

  PlayerInfo({
    this.position,
    this.nameFull,
    this.isCaptain,
    this.isKeeper,
    this.batting,
    this.bowling,
  });

  PlayerInfo.fromJson(Map<String, dynamic> json) {
    position = json['Position'];
    nameFull = json['Name_Full'];
    isCaptain = json['Iscaptain'];
    isKeeper = json['Iskeeper'];
    batting = json['Batting'] != null ? Batting.fromJson(json['Batting']) : null;
    bowling = json['Bowling'] != null ? Bowling.fromJson(json['Bowling']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Position'] = position;
    data['Name_Full'] = nameFull;
    data['Iscaptain'] = isCaptain;
    data['Iskeeper'] = isKeeper;
    if (batting != null) {
      data['Batting'] = batting!.toJson();
    }
    if (bowling != null) {
      data['Bowling'] = bowling!.toJson();
    }
    return data;
  }
}

class Batting {
  String? style;
  String? average;
  String? strikerate;
  String? runs;

  Batting({
    this.style,
    this.average,
    this.strikerate,
    this.runs,
  });

  Batting.fromJson(Map<String, dynamic> json) {
    style = json['Style'];
    average = json['Average'];
    strikerate = json['Strikerate'];
    runs = json['Runs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Style'] = style;
    data['Average'] = average;
    data['Strikerate'] = strikerate;
    data['Runs'] = runs;
    return data;
  }
}

class Bowling {
  String? style;
  String? average;
  String? economyrate;
  String? wickets;

  Bowling({
    this.style,
    this.average,
    this.economyrate,
    this.wickets,
  });

  Bowling.fromJson(Map<String, dynamic> json) {
    style = json['Style'];
    average = json['Average'];
    economyrate = json['Economyrate'];
    wickets = json['Wickets'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Style'] = style;
    data['Average'] = average;
    data['Economyrate'] = economyrate;
    data['Wickets'] = wickets;
    return data;
  }
}
