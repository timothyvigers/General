animalgameattack <- function(attacker, attackernumber,chancetohit,targettype,targets){
# List attackers.
  attackers <- c("eagle","croc","bear","buffalo","gun","wolf","rat","gorilla","lion")
  
# Define total damage and HP.
  totaldamage <- 100
  totalhp <- 1000
  playerhp <- round(totalhp/2,digits = 2)
  
# Make stats table for each animal.
  animalstats <- data.frame(matrix(nrow = length(attackers),ncol = 2))
  rownames(animalstats) <- attackers
  colnames(animalstats) <- c("dmg","hp")
  
  animalstats["eagle",1] <- round(totaldamage/50,digits = 2)
  animalstats["eagle",2] <- round(totalhp/50,digits = 2)
  animalstats["croc",1] <- round(totaldamage/10,digits = 2)
  animalstats["croc",2] <- round(totalhp/10,digits = 2)
  animalstats["bear",1] <- round(totaldamage/3,digits = 2)
  animalstats["bear",2] <- round(totalhp/3,digits = 2)
  animalstats["buffalo",1] <- round(totaldamage/7,digits = 2)
  animalstats["buffalo",2] <- round(totalhp/7,digits = 2)
  animalstats["gun",1] <- round(totaldamage/1,digits = 2)
  animalstats["gun",2] <- round(totalhp/1,digits = 2)
  animalstats["wolf",1] <- round(totaldamage/15,digits = 2)
  animalstats["wolf",2] <- round(totalhp/15,digits = 2)
  animalstats["rat",1] <- round(totaldamage/10000,digits = 2)
  animalstats["rat",2] <- round(totalhp/10000,digits = 2)
  animalstats["gorilla",1] <- round(totaldamage/5,digits = 2)
  animalstats["gorilla",2] <- round(totalhp/5,digits = 2)
  animalstats["lion",1] <- round(totaldamage/4,digits = 2)
  animalstats["lion",2] <- round(totalhp/4,digits = 2)
  
  
# Fight!
  success <- sum(rbinom(attackernumber,1,chancetohit))
  damagedone <- success * animalstats[attacker,1]
  
  print(paste("Number of hits: ",success))
  print(paste("Total damage done: ",damagedone))
  View(animalstats)
}