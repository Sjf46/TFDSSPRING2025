install.packages("datasets")
install.packages("tidyverse")
install.packages("reshape")
install.packages("carData")
install.packages("moments")



library(datasets)
library(tidyverse)

x = 10^2
y = 2*x
1+2
3*4
3**4
3^4
45-89


## Data Types and Objects
# Character

l = "R is usefull"
class(l)

#Logical
v1 = 5>6
7+7+1==15
class(v1)

# Numeric
x = 9
X = 99
y = x/2
x
y
class(x)


# Factors
x = c(0,0,1,1,2)
#Converts Numerical Factors into words
x=factor(x,labels = c("Control", "Low Dose", "High Dose"))
class(x)

# Vectors
vec1 = c(1,21,50,80,45,0)
vec2 = c("d", "4", "r")
class(vec1)
length(vec1)


# Matrices

ma1=matrix(data=c(vec1,0,0,0,0,0,150),nrow = 4, byrow = TRUE)
ma1
#If number of elements does not fit into the nrows R will recycle data from beginning of elements
class(ma1)
#Rows are observations. Columns are variables.
ma2 = matrix(data = c(10,45,56,90),nrow = 2)
ma2


# Data frames
df=data.frame(myv1=rnorm(100),myv2=rnorm(100, mean = 5))
summary(df)
#$ gves access to df variables
x=df$myv1
x
y=df$myv2
y

class(df)

airquality$Ozone
summary(airquality)

str(airquality)


# Lists
L=list(one = 1, 
       two=c(1,2), 
       five=seq(0,1,0.1), 
       six="student",
       mydata=airquality)
class(L)
L$five
L$one
L$mydata
#Most outputs we see will be lists


#Built-in Functions
sum(1,3,5)
help(sum)
example(sum)
example(mean)
sum(vec1)

sum(x)
mean(x)
sd(x) #Standard Deviation
summary(x)
var(x)


# Sequence
s1= 1:10
s1
s2 = seq(from =1 , to =10)
s2
seq1=seq(1,10,0.5)
seq1
seq2=seq(10,1)
seq2



# Vector Access
vec1[1] = 5
vec1[1]
vec1[c(2,5,6)]
vec1[1:3]


# Named Vector
r=c(1:3)
names(r) = c("f", "s", "t")
r[5] = 2
barplot(r)



# Data sets in R
data("airquality")
mdata=cars


# Reading variables from a data.frame
mdata$speed
with(mdata,mean(speed+dist))
mean(mdata$speed+mdata$dist)


# Structure and Summary
str(mdata)
summary(mdata)
print(mdata)
View(mdata)


# Creating new variables
mdata$time=mdata$dist/mdata$speed
mdata$time
mean(mdata$time)
mdata$speed2=mdata$speed^2
mdata$speed2


# Rename the variables
library(reshape)
mdata=rename(mdata,c("speed"="mspeed", "speed2"="s2"))
#names(mdata) = c("speed","dist","time","speedsq")


# Create categories from continuous variable
mdata$newdata = (mdata$mspeed >=5) + (mdata$mspeed >=10) + (mdata$mspeed >=15) + (mdata$mspeed >= 20)
mdata$newdata

# Drop or keep variables in a data set
library(datasets)
library(carData)
data(Salaries)

str(Salaries)

help("Salaries")

summary(Salaries)

submdata = subset(Salaries, select = c("discipline","salary"))
submdata
submdata1 = Salaries[,c(1:4)]
submdata1
submdata2 = subset(Salaries, select = c(-2,-3))
submdata2


# Keep Unique values
uni = unique(Salaries)
uni

# Identify duplicated values
dup = duplicated(Salaries)
dup
Salaries


# Stack data sets



## Random generations
# Normal Random Numbers
mdata = rnorm(100 , mean = 0, sd = 1)
mdata
#Histogram
hist(mdata, freq = T)
#plot
plot(mdata,
     type = "b",
     col = "blue",
     pch=ifelse(abs(mdata)>2,19,11),
     xlim = c(-1,100),
     ylim = c(-3,4),
     xlab = "Number from SND",
     ylab = "Values",
     main = "100 Obs. from Standard Normal Dist.",
     las = 2)

dt = rnorm(30000, mean = 10 , sd = 3)
var(dt)
quantile(dt, c(0.25,0.5,0.75,0.99))
hist(dt)
mean(dt)

library(moments)
skewness(dt)
kurtosis(dt)


hist(dt)
hist(scale(dt))



