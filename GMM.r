rm(list=ls());
rm= list=ls();
gc();

setwd("C:\\Users\\user\\Desktop\\claim")

xdata <- read.csv("claim_new.csv",header = T)
vdata <- read.csv("claim_new.csv",header = T)

str(xdata)
xdata[,1] <- scale(xdata[,1])

m1 <- ncol(xdata)
n1 <- nrow(xdata)
m2 <- ncol(vdata)
n2 <- nrow(vdata)


#freqdist <- data.frame()

freqdist <- vector("numeric")

for (f in 1:m1)
{
freqcnt = hist(xdata[,f],unique(xdata[,f]))
freqcnt = freqcnt$counts
freqpert = (freqcnt/n1)*100
k = max(freqpert)
freqdist[f] <- k
#k = k+1
#f = f+1
}

freqdist
str(xdata)
for ( i in 1:8)
{
  if (freqdist[i] > 20)
  {
    xdata[,i] <- NULL
    vdata[,i] <- NULL
  }
  else i = i+1
}

Accuracy1 <- data.frame()

for(batch 1:3)
{
  rvar = sample(1,(n1-100),replace = T)
  data = xdata[rvar:(rvar+100),]
  m = ncol(data)
  n = nrow(data)
}



tol = vector("numeric")

tol = c(0.75,0.80,0.85,0.90,0.95)

sigma = vector("numeric")

sigma = c(2.5,1.5,1.0,0.5)

accur = vector("numeric")

accur = c(0.75,0.80,0.85,0.90,0.95)

accuracy = data.frame()
