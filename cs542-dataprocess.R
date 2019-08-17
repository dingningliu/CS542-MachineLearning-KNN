crxtraining <- read.csv('/Users/liudingning/Desktop/sum/ml542/hw2/credit 2019/crx.data.training',header = FALSE)
crxtesting <- read.csv('/Users/liudingning/Desktop/sum/ml542/hw2/credit 2019/crx.data.testing',header = FALSE)
glimpse(crxtraining)
table(crxtraining$V4)


#missing value
crxtraining[crxtraining$V1 == '?',"V1"] <- 'b'

crxtraining$V2 <-as.numeric(as.character(crxtraining$V2))
mean(crxtraining$V2, na.rm=TRUE)
crxtraining$V2[is.na(crxtraining$V2)] <- 31.26653

crxtraining[crxtraining$V4 == '?', "V4"] <- 'u'
crxtraining[crxtraining$V5 == '?', "V5"] <- 'g'
crxtraining[crxtraining$V6 == '?', "V6"] <- 'c'
crxtraining[crxtraining$V7 == '?', "V7"] <- 'v'

crxtraining$V14 <- as.numeric(as.character(crxtraining$V14))
mean(crxtraining$V14, na.rm=TRUE)
crxtraining$V14[is.na(crxtraining$V14)] <- 182.5759

#normalize
normalize <- function(x) {
  temp <- as.numeric(as.character(unlist(x)))
  mu <- mean(temp)
  std <- sd(temp)
  return ((temp - mu) / std)
}

crxtraining$V2 <- normalize(crxtraining$V2)
crxtraining$V3 <- normalize(crxtraining$V3)
crxtraining$V8 <- normalize(crxtraining$V8)
crxtraining$V14 <- normalize(crxtraining$V14)
crxtraining$V15 <- normalize(crxtraining$V15)


#missing value
crxtesting[crxtesting$V1 == '?',"V1"] <- 'b'

crxtesting$V2 <-as.numeric(as.character(crxtesting$V2))
mean(crxtesting$V2, na.rm=TRUE)
crxtesting$V2[is.na(crxtesting$V2)] <- 32.80421

crxtesting[crxtesting$V6 == '?', "V6"] <- 'q'
crxtesting[crxtesting$V7 == '?', "V7"] <- 'v'

crxtesting$V14 <- as.numeric(as.character(crxtesting$V14))
mean(crxtesting$V14, na.rm=TRUE)
crxtesting$V14[is.na(crxtesting$V14)] <- 189.6861

#normalize

crxtesting$V2 <- normalize(crxtesting$V2)
crxtesting$V3 <- normalize(crxtesting$V3)
crxtesting$V8 <- normalize(crxtesting$V8)
crxtesting$V14 <- normalize(crxtesting$V14)
crxtesting$V15 <- normalize(crxtesting$V15)

write.table(crxtesting,file = '/Users/liudingning/Desktop/sum/ml542/hw2/credit 2019/crx_testing',sep =',',row.names = FALSE, col.names = FALSE, quote = FALSE)
write.table(crxtraining,file = '/Users/liudingning/Desktop/sum/ml542/hw2/credit 2019/crx_training',sep =',',row.names = FALSE, col.names = FALSE, quote = FALSE)

