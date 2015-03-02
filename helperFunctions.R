#### Helper Functions for Plotting


# accepts vector of sector abbreviations, returns vector w/ sector names
reNameSector <- function(sectorVect){
  sectorVect[sectorVect =='A'] <- 'A: Agribusiness'
  sectorVect[sectorVect == 'B'] <- 'B: Communications/Electronics'
  sectorVect[sectorVect == 'C'] <- 'C: Construction'
  sectorVect[sectorVect == 'D'] <- 'D: Defense'
  sectorVect[sectorVect == 'E'] <- 'E: Energy/Natural Resources'
  sectorVect[sectorVect == 'F'] <- 'F: Finance/Insurance/Real Estate'
  sectorVect[sectorVect == 'H'] <- 'H: Health'
  sectorVect[sectorVect == 'K'] <- 'K: Lawyers and Lobbyists'
  sectorVect[sectorVect == 'M'] <- 'M: Transportation'
  sectorVect[sectorVect == 'N'] <- 'N: Misc. Business'
  sectorVect[sectorVect == 'Q'] <- 'Q: Ideology/Single Issue'
  sectorVect[sectorVect == 'P'] <- 'P: Labor'
  sectorVect[sectorVect == 'W'] <- 'W: Other'
  sectorVect[sectorVect == 'Y'] <- 'Y: Unknown'
  sectorVect[sectorVect == 'Z'] <- 'Z: Administrative Use'
  sectorVect
}