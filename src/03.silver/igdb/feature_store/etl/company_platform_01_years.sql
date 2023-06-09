WITH tb_full AS (

  SELECT t1.idCompany,
        t1.idGame,
        t4.descName,
        t4.descAbbreviation,
        t4.descAlternativeName,
        t4.descCategory
        
  FROM silver.igdb.involved_companies AS t1

  LEFT JOIN silver.igdb.games AS t2
  ON t1.idGame = t2.idGame

  LEFT JOIN silver.igdb.games_platforms AS t3
  ON t1.idGame = t3.idGame

  LEFT JOIN silver.igdb.platforms AS t4
  ON t4.idPlatform = t3.idPlatform

  WHERE t2.dtRelease < '{date}'
  AND t2.dtRelease >= date({'date'}) - INTERVAL 1 year
  --  AND descCategory IN ('standalone_expansion','remaster','expansion','expanded_game','main_game','remake')

)

SELECT
    idCompany,
    '{date}' AS dtRef,
    count( DISTINCT CASE WHEN descCategory = 'operating_system' THEN idGame END) AS qtdeOperatingSystem01Years,
    count( DISTINCT CASE WHEN descCategory = 'operating_system' AND descName IN ('Android', 'BlackBerry OS', 'Palm OS', 'Windows Mobile', 'Windows Phone', 'iOS') THEN idGame END) AS qtdeMobile01Years,
    count( DISTINCT CASE WHEN descCategory = 'operating_system' AND descName NOT IN ('Android', 'BlackBerry OS', 'Palm OS', 'Windows Mobile', 'Windows Phone', 'iOS') THEN idGame END) AS qtdePC01Years, 
    count( DISTINCT CASE WHEN descCategory = 'portable_console' THEN idGame END) AS qtdePortableConsole01Years,
    count( DISTINCT CASE WHEN descCategory = 'missing_category' THEN idGame END) AS qtdeMissingCategory01Years,
    count( DISTINCT CASE WHEN descCategory = 'console' THEN idGame END) AS qtdeConsole01Years,
    count( DISTINCT CASE WHEN descCategory = 'computer' THEN idGame END) AS qtdeComputer01Years,
    count( DISTINCT CASE WHEN descCategory = 'platform' THEN idGame END) AS qtdePlatform01Years,
    count( DISTINCT CASE WHEN descCategory = 'arcade' THEN idGame END) AS qtdeArcade01Years,

    count( DISTINCT CASE WHEN descCategory = 'operating_system' THEN idGame END) / count(DISTINCT idGame) AS pctOperatingSystem01Years,
    count( DISTINCT CASE WHEN descCategory = 'operating_system' AND descName IN ('Android', 'BlackBerry OS', 'Palm OS', 'Windows Mobile', 'Windows Phone', 'iOS') THEN idGame END) / count(DISTINCT idGame) AS pctMobile01Years,
    count( DISTINCT CASE WHEN descCategory = 'operating_system' AND descName NOT IN ('Android', 'BlackBerry OS', 'Palm OS', 'Windows Mobile', 'Windows Phone', 'iOS') THEN idGame END) / count(DISTINCT idGame) AS pctPC01Years, 
    count( DISTINCT CASE WHEN descCategory = 'portable_console' THEN idGame END) / count(DISTINCT idGame) AS pctPortableConsole01Years,
    count( DISTINCT CASE WHEN descCategory = 'missing_category' THEN idGame END) / count(DISTINCT idGame) AS pctMissingCategory01Years,
    count( DISTINCT CASE WHEN descCategory = 'console' THEN idGame END) / count(DISTINCT idGame) AS pctConsole01Years,
    count( DISTINCT CASE WHEN descCategory = 'computer' THEN idGame END) / count(DISTINCT idGame) AS pctComputer01Years,
    count( DISTINCT CASE WHEN descCategory = 'platform' THEN idGame END) / count(DISTINCT idGame) AS pctPlatform01Years,
    count( DISTINCT CASE WHEN descCategory = 'arcade' THEN idGame END) / count(DISTINCT idGame) AS pctArcade01Years


FROM tb_full

GROUP BY 1
ORDER BY 1