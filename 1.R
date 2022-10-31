library(dbplyr)

library(ggplot2)

data(mtcars)

data(iris)
head(iris)
tail(iris)

library(ggplot2)

data(mtcars)
ggplot(data = mtcars) +
  geom_point(aes(y = hp, x = mpg))