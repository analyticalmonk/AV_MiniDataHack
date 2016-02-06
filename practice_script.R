data("AirPassengers")
class(AirPassengers)

start(AirPassengers)
frequency(AirPassengers)
deltat(AirPassengers)

plot(AirPassengers)
abline(reg = lm(AirPassengers~time(AirPassengers)))
cycle(AirPassengers)
plot(aggregate(AirPassengers, FUN = mean))
boxplot(AirPassengers ~ cycle(AirPassengers))

library(tseries)

adf.test(diff(log(AirPassengers)), alternative = "stationary", k = 0)
# acf(log(AirPassengers))
acf(diff(log(AirPassengers)))
pacf(diff(log(AirPassengers)))