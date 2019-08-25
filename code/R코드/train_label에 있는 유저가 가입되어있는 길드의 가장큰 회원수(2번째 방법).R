install.packages("stringr")
library(stringr)

data_1 = read.csv("train_guild_1.csv", sep =",")
data_2 = read.csv("train_label.csv", sep=",")
data_1$guild_member_acc_id = as.character(data_1$guild_member_acc_id)
data_2$acc_id = as.character( data_2$acc_id)

guild = numeric()

for(i in 1:nrow(data_2)){
  
  sub_df = subset(data_1, str_detect(data_1$guild_member_acc_id,data_2$acc_id[i]))
  if(nrow(sub_df) != 0){
    guild = append(guild, sub_df$guild_member_population[1])
  }
  else{
    guild = append(guild, 0)
  }
  
}

data_2 = cbind(data_2,guild)
write.csv(data_2,"data.csv")
