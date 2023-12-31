SELECT 

    match_id AS idMatch,
    from_unixtime(start_time) AS dtMatch,
    duration AS nrDuration,
    patch AS nrPatch,
    radiant_win AS flRadiantWin,
    account_id AS idPlayer,
    personaname AS descPersonname,
    name AS descName,
    isRadiant AS flIsRadiant,
    win AS flWin,
    lose AS flLose,
    backpack_0 AS idItemBackpack01,
    backpack_1 AS idItemBackpack02,
    backpack_2 AS idItemBackpack03,
    backpack_3 AS idItemBackpack04,
    camps_stacked AS nrCampsStacked,
    creeps_stacked AS nrCreepsStacked,
    kills AS nrKills,
    assists AS nrAssist,
    deaths AS nrDeaths,
    denies AS nrDenies,
    firstblood_claimed AS flFirstbloodClaimed,
    gold AS nrGold,
    gold_per_min AS nrGoldMinute,
    gold_spent AS nrGoldSpent,
    hero_damage AS nrHeroDamage,
    hero_healing AS nrHeroHealing,
    hero_id AS idHero,
    item_0 AS idItem1,
    item_1 AS idItem2,
    item_2 AS idItem3,
    item_3 AS idItem4,
    item_4 AS idItem5,
    item_5 AS idItem6,
    item_neutral AS idNeutralItem,
    last_hits AS nrLastHits,
    level AS nrLevel,
    net_worth AS nrNetWorth,
    roshans_killed AS nrRoshansKilled,
    rune_pickups AS nrRunePicks,
    stuns AS nrStunsSec,
    teamfight_participation AS pctTeamfightParticipation,
    tower_damage AS nrTowerDamage,
    towers_killed AS nrTowerKilled,
    xp_per_min AS nrXpMinute,
    region AS idRegion,
    total_gold AS nrTotalGold,
    total_xp AS nrTotalXp,
    kills_per_min AS nrKillsMinute,
    kda AS nrKDA,
    abandons AS nrAbandons,
    neutral_kills AS nrNeutralKills,
    tower_kills AS nrTowerKills,
    courier_kills AS nrCourierKills,
    lane_kills AS nrLaneKills,
    hero_kills AS nrHeroKills,
    observer_kills AS nrObserverKills,
    sentry_kills AS nrSentryKills,
    roshan_kills AS nrRoshansKills,
    necronomicon_kills AS nrNecronomiconKills ,
    ancient_kills AS nrAncientKills,
    buyback_count AS nrBuybackCount,
    observer_uses AS nrObserverUses,
    sentry_uses AS nrSentryUses,
    lane_efficiency AS pctLaneEfficiency,
    lane AS idLane,
    lane_role AS idLaneRole,
    purchase_tpscroll AS nrPurchaseTps,
    actions_per_min AS nrActionsMinute,
    rank_tier AS nrRankTier

FROM bronze.dota.matches_players

WHERE account_id IS NOT NULL