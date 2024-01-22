# Q.1) Visualization

#convert the class variable to factor
divorce$Class <- as.factor(divorce$Class)

# 1 Viz
#Plot the scatterplot matrix for Q21 and Q23 with divorce event
ggplot(divorce, aes(x = Atr21, y = Atr23)) +
  geom_point(aes(fill = Class, shape = Class, color = Class)) +
  xlab("Q.21 I know exactly what my wife likes") +
  ylab("Q.23 I know my spouse's favorite food") + 
  #ggtitle("Question 21 and Question 23 vs Divorce") +
  ggtitle("Fctors that influence Divorce") +
  theme(plot.title = element_text(hjust = 0.5))

# 2 Viz
#Plot the scatterplot matrix for Q10 and Q15 with divorce event
ggplot(divorce, aes(x = Atr10, y = Atr15)) +
  geom_point(aes(fill = Class, shape = Class, color = Class)) +
  xlab("Q.10 Most of our goals are common to my spouse") +
  ylab("Q.15 Our dreams with my spouse are similar and harmonious") + 
  #ggtitle("Question 10 and Question 15 vs Divorce") +
  ggtitle("Fctors that influence Divorce") +
  theme(plot.title = element_text(hjust = 0.5))

# 3 Viz
#Plot the scatterplot matrix for Q2 and Q18 with divorce event
ggplot(divorce, aes(x = Atr2, y = Atr18)) +
  geom_point(aes(fill = Class, shape = Class, color = Class)) +
  xlab("Q.2 I know we can ignore our differences, even if things get hard sometime") +
  ylab("Q.18 My spouse and I have similar ideas about how marriage should be") + 
  #ggtitle("Question 10 and Question 15 vs Divorce") +
  ggtitle("Fctors that influence Divorce") +
  theme(plot.title = element_text(hjust = 0.5))

# 4 Viz
#Plot the scatterplot matrix for Q9 and Q17 with divorce event
ggplot(divorce, aes(x = Atr9, y = Atr17)) +
  geom_point(aes(fill = Class, shape = Class, color = Class)) +
  xlab("Q.9 I enjoy traveling with my wife") +
  ylab("Q.17 We share the same views about being happy in our life with my spouse") + 
  #ggtitle("Question 10 and Question 15 vs Divorce") +
  ggtitle("Fctors that influence Divorce") +
  theme(plot.title = element_text(hjust = 0.5))

# Q.2) Variance Inflation Factor

library(car)

# Run linear regression
linearmodel <- lm(Class~.,data = divorce)

# Model summary
summary(linearmodel)

viftable <- vif(linearmodel)
viftable

# Sort the table in desceasing oder
sorttable <- sort(viftable,decreasing=TRUE)
sorttable

sorttable[sorttable < 8]

# Q.3) Neural Network
library(neuralnet)

# Creating the split dataset into testing and training
set.seed(22)

divorce_index <- sample(nrow(divorce), 0.7 * nrow(divorce), replace = FALSE)
divorce_train <- divorce[divorce_index, ]
divorce_test <- divorce[-divorce_index, ]

# 1st neural model
divorceneuralnet1 <- neuralnet(Class ~ Atr6 + Atr7 + Atr42 + Atr43 + Atr45 + 
                    Atr46 + Atr47 + Atr48 + Atr52, divorce_train, hidden = 3, 
                    lifesign = "minimal", linear.output = FALSE, threshold = 0.1)
# Plot the neural network
plot(divorceneuralnet1)

# Test the neural network 
temp_test1 <- subset(divorce_test, select = c("Atr6","Atr7","Atr42","Atr43","Atr45","Atr46","Atr47","Atr48","Atr52"))

# To predict divorce for the test data
divorceneuralnet1.results <- compute(divorceneuralnet1, temp_test1)

# To create a view of the predictions
results <- data.frame(actual = divorce_test$Class, prediction = divorceneuralnet1.results$net.result)

# View the results
results1$prediction <- round(results$prediction)
results1[1:22, ]

# Convert the data type to factor
actual <- as.factor(divorce_test$Class)
neural_result <- as.factor(round(results$prediction))

# Build confusion matrix for neural model 1
predicttable <- table(neural_result, actual)
predicttable

#Calculate the accuracy of neural model 1
Accuracy <- sum(diag(predicttable))/sum(predicttable)

# Format the accuracy as a percentage with two decimal places
accuracy_formatted <- sprintf("Accuracy of the neural model 1: %.2f%%", Accuracy * 100)

# Displaying the accuracy of neural model 1
print(accuracy_formatted)

# Creating a Loop for 1st neural model with 1 to 5 hidden layer
cur_max_list <- list()#initialize an empty list
for (layer_one in 1:5){
  divorceneuralnet1 <- neuralnet(Class ~ Atr6 + Atr7 + Atr42 + Atr43 + Atr45 + Atr46 + Atr47 + Atr48 + Atr52, divorce_train,
                   hidden = 1, lifesign = "minimal", linear.output = FALSE, threshold = 0.1)
  divorceneuralnet1.results <- compute(divorceneuralnet1, temp_test1)
  neural_result <- as.factor(round(divorceneuralnet1.results$net.result))
  predicttable = table(neural_result, actual)
  print(sum(diag(predicttable))/sum(predicttable))
  predictive_accuracy <- sum(diag(predicttable))/sum(predicttable)
  cur_max_list[paste(layer_one)] <- predictive_accuracy 
  #use number of nodes as key,put the predictive accuracy to the key accordingly, and store the paired value in the list
}
cur_max_list[which.max(sapply(cur_max_list,max))]

library(caret)
confusionMatrix(neural_result, actual)

# 2nd neural model
divorceneuralnet2 <- neuralnet(Class ~ Atr7 + Atr43 + Atr46 + Atr48 + 
                     Atr52, divorce_train, hidden = 5, lifesign = "minimal", 
                     linear.output = FALSE, threshold = 0.1)
# Plot the neural network 2
plot(divorceneuralnet2)

# Test the neural network 2
temp_test2 <- subset(divorce_test, select = c("Atr7","Atr43","Atr46","Atr47","Atr48"))

# To predict divorce for the test data
divorceneuralnet2.results <- compute(divorceneuralnet2, temp_test2)

# To create a view of the predictions
results2 <- data.frame(actual = divorce_test$Class, prediction = divorceneuralnet2.results$net.result)

# View the results
results2$prediction <- round(results2$prediction)
results2[1:22, ]

# Convert the data type to factor
actual <- as.factor(divorce_test$Class)
neural_result2 <- as.factor(round(results2$prediction))

# Build confusion matrix for neural model 2
predicttable2 <- table(neural_result2, actual)
predicttable2

#Calculate the accuracy neural model 2
Accuracy2 <- sum(diag(predicttable2))/sum(predicttable2)

# Format the accuracy as a percentage with two decimal places
accuracy_formatted2 <- sprintf("Accuracy of the neural model 2: %.2f%%", Accuracy2 * 100)

# Displaying the accuracy of neural model 2
print(accuracy_formatted2)

# Creating a Loop for 2nd neural model with 1 to 5 hidden layer
cur_max_list <- list()#initialize an empty list
for (layer_one in 1:5){
  divorceneuralnet2 <- neuralnet(Class ~ Atr7 + Atr43 + Atr46 + Atr48 + Atr52, divorce_train,
                   hidden = 1, lifesign = "minimal", linear.output = FALSE, threshold = 0.1)
  divorceneuralnet2.results <- compute(divorceneuralnet2, temp_test2)
  neural_result2 <- as.factor(round(divorceneuralnet2.results$net.result))
  predicttable2 = table(neural_result2, actual)
  print(sum(diag(predicttable2))/sum(predicttable2))
  predictive_accuracy <- sum(diag(predicttable2))/sum(predicttable2)
  cur_max_list[paste(layer_one)] <- predictive_accuracy 
  #use number of nodes as key,put the predictive accuracy to the key accordingly, and store the paired value in the list
}
cur_max_list[which.max(sapply(cur_max_list,max))]

library(caret)
confusionMatrix(neural_result2, actual)
