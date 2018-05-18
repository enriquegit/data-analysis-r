
# Printing to the console
print("hello world")

# Generate random numbers from a normal distribution. Default: mean = 0, sd = 1
arr <- rnorm(100)

# Compute the mean
mean(arr)

# Compute the standard deviation
sd(arr)

# Plot the corresponding histogram
hist(arr)

# A boxplot
boxplot(arr)

# Sample without replacement
sample(1:10, size = 5, replace = F)

# Sample with replacement
sample(1:10, size = 5, replace = T)

# Lets create another array but with different mean
arr2 <- rnorm(100, mean = 3)

hist(arr2)

# Test if difference in means is not equal to 0.
t.test(arr, arr2)

# installing libraries
install.packages("beepr")

# load library
library(beepr)

# use the library
beep()

