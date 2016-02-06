library(tseries)

train <- read.csv("Train_JPXjxg6.csv")
test <- read.csv("Test_mvj827l.csv")

# training <- train[1:15888,]
# validate <- train[15889:18288,]

# str(train)
train_ts <- ts(train$Count, frequency = 24)
# training_ts <- ts(training$Count, frequency = 24)
# validate_ts <- ts(validate$Count, frequency = 24)

# summary(train_ts)
# plot(diff(log(train_ts)))
# boxplot(train_ts~cycle(train_ts))
# 
# acf(diff(log(training_ts)))
# pacf(diff(log(training_ts)))
## MA(2)
## p = 1 or 2, q = 1

fit <- arima((log(train_ts)), c(1, 2, 1), seasonal = list(order = c(2, 1, 1), period = 24))
pred_train <- predict(fit, n.ahead = 5112)

# rmse <- sum((validate$Count - 2.718^pred_train$pred)^2) / 2400
# rmse

submission <- data.frame(Datetime = test$Datetime, Count = 2.718^pred_train$pred)
# summary(submission)
write.csv(submission, file = "submission.csv")
