demographics <- read.csv('DEC_10_DP_DPDP1_with_ann.csv')
race <- demographics[,c("GEO.id","HD02_S100", "HD02_S101", "HD02_S102", "HD02_S103", "HD02_S104", "HD02_S105", "HD02_S106")]
write.csv(demographics, file = "demographics")
rownames(race) <- race[,c("GEO.id")]
race = race[-1,]
sink("race.json")
cat(toJSON(race, dataframe=c("rows"), pretty = TRUE))
sink()

json <- '  {
  "0500000US01003": {
    "GEO.id": "0500000US01003",
    "HD02_S100": "87.0",
    "HD02_S101": "9.9",
    "HD02_S102": "1.3",
    "HD02_S103": "1.0",
    "HD02_S104": "0.1",
    "HD02_S105": "2.2",
    "HD02_S106": "100.0",
    "_row": "0500000US01003"
  },
  "0500000US01004": {
    "GEO.id": "0500000US01005",
    "HD02_S100": "48.6",
    "HD02_S101": "47.4",
    "HD02_S102": "0.8",
    "HD02_S103": "0.5",
    "HD02_S104": "0.2",
    "HD02_S105": "3.5",
    "HD02_S106": "100.0",
    "_row": "0500000US01005"
  }
}'
frmjson <- fromJSON(json)
raceList <- setNames(split(race, seq(nrow(race))), rownames(race))

sink("race.json")
cat(toJSON(raceList, dataframe=c("rows"), pretty = TRUE))
sink()
