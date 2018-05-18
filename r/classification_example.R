library(caret)
library(tree)

# Load iris dataset
dataset <- iris

# Print summary
summary(dataset)

# Density plots
featurePlot(dataset[,1:4], dataset[,5], plot="density", scales=list(x=list(relation="free"), y=list(relation="free")), auto.key=list(columns=3))


#### Classify the plants ####


# Variables to store the predictions and true classes.
trueClasses <- NULL; predictions <- NULL

# Set seed for reproducibility
set.seed(1234)

# Shuffle our data. Told you the sample function is very handy =)  note the replace = F.
dataset <- dataset[sample(nrow(dataset), replace = F),]

# Generate folds for cross-validation
k <- 10

# Again, we can use the sample function. This time replace = T
folds <- sample(1:k, size = nrow(dataset), replace = T)

for(i in 1:k){
  
  print(paste0("Fold: ",i,"/",k))
  
  # Generate train and test sets
  testset <- dataset[which(folds == i),]
  trainset <- dataset[which(folds != i),]
  
  # Train the model (a tree in this case)
  classifier <- tree(Species ~., trainset)
  
  tmp.preds <- as.character(predict(classifier, newdata = testset, type = "class"))
  tmp.true <- as.character(testset$Species)
  
  predictions <- c(predictions, tmp.preds)
  trueClasses <- c(trueClasses, tmp.true)
  
}

# Print confusion matrix and some performance metrics
confusionMatrix(as.factor(predictions), reference = as.factor(trueClasses))




# Refrences

#Density plots: https://machinelearningmastery.com/data-visualization-with-the-caret-r-package/
