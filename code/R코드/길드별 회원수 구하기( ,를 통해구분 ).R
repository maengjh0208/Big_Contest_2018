data <- read.csv("train_guild.csv", sep=",")

#data$guild_member_acc_id[9963]
#length(data$guild_member_acc_id)

col_1 <- data$guild_id
col_2 <- data$guild_member_acc_id


new_col = c() #새로운 열 추가

for (i in 1:9963){
  num <- unlist(gregexpr(pattern =',',col_2[i]))  # ,의 위치 구하기
  if(num[1] == -1){
    new_col <- c(new_col,1)
  }
  else{
    new_col <- c(new_col,1+length(num))
  }
}

data <- cbind(data,new_col)



