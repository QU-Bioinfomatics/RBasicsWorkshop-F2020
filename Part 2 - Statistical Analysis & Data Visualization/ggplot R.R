#R basic workshop: ggplot2

#basic Settings
#install.packages('ggplot2')# R: 3.6.3, if lower than this version, run folllowing
#library(installr)
#updateR()
library('ggplot2')

#qqplot: simple settings from using ggplot
library(datasets)
data(iris)
attach(iris)
head(iris)
#   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
# 1          5.1         3.5          1.4         0.2  setosa
# 2          4.9         3.0          1.4         0.2  setosa
# 3          4.7         3.2          1.3         0.2  setosa
# 4          4.6         3.1          1.5         0.2  setosa
# 5          5.0         3.6          1.4         0.2  setosa
# 6          5.4         3.9          1.7         0.4  setosa

#histogram and scatter plot
qplot(x = Sepal.Length)# if not attach, set the data = iris
qplot(x = Sepal.Length, y = Sepal.Width)#one variable is histogram, two is scatter plot
qplot(x = Sepal.Length, binwidth = 0.8)
qplot(x = Sepal.Length, y = Sepal.Width, size = Petal.Length)
qplot(x = Sepal.Length, y = Sepal.Width, size = I(3))#scale by a constant
qplot(x = Sepal.Length, y = Sepal.Width, size = I(5))
qplot(x = Sepal.Length, y = Sepal.Width, color = 'red')
qplot(x = Sepal.Length, binwidth = 0.8, group = Sepal.Width, fill = Sepal.Width)
#boxplot
qplot(x = Sepal.Length, geom = 'boxplot')
qplot(x = Sepal.Length, geom = 'density')

#background: theme_bw(), theme_linedraw(), theme_light(), theme_minimal(),theme_classic()
qplot(x = Sepal.Length, y = Sepal.Width) +theme_linedraw()

#final
qplot(x = Sepal.Length, binwidth = 0.8, group = Sepal.Width, fill = Sepal.Width, xlab = 'Sepal Length' , ylab = 'Sepal Width', main = 'Iris')+ theme_bw()

#ggplot
#useful materials:
#https://colauttilab.github.io/RCrashCourse/3_ggplot.html#31_separate_data
#https://rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf
#https://ggplot2.tidyverse.org/reference/index.html

#How ggplot different from others:
#For qplot(), plot(), dist(),...
#plot(..., ..., ...), every settings are inside the brackets

#but ggplot is like a block choice setting
#ggplot()... + geom_plot() + labs() + coord_cartesian()

#after setting dataset and basic properties in ggplot(), add the settings we want after the block
#advantage is flexible to change different settings

#ggplot basic setting:
#ggplot(data, aes = (X,y))
#example
ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length))
iris_plot = ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length))

#theme_minimal: adjust appearance of the plots
#geom_point(): scatter plot
#geom_bar(): barplot
#geom_density(): density plot
#geom_area(), geom_histogram(bin = ...), geom_point(), geom_line(), geom_boxplot()
#settings: X,y,color,size,...
#aes(x,y)
#if not attach data, add data=... in the first argument.

iris_plot = iris_plot + geom_point()
iris_plot
#Plot adjustments: (for a better view)
#ggtitle("New Plot Title")
#xlab("New X label")
#ylab("New Y label")
#labs(title =" New title", x = "New x", y = "New y")
#example
iris_plot = iris_plot + labs(title =" Scatter plot for Sepal width and length", x = "width", y = "length") 
iris_plot
#xlim(...)
#ylim(...)
#coord_cartesian(xlim, ylim, ...) (other arguments not cover in this tutorial)
#example
iris_plot = iris_plot + coord_cartesian(xlim = c(2,4), ylim = c(4,6))
iris_plot
#other advanced functions:
#scale_color_gradient(): color points by value
#geom_smooth(): a smooth line with data points
#scale_x_log10(): Plot x on log10 scale 
#scale_x_sqrt() - Plot x on square root scale
#example
iris_plot = iris_plot + geom_smooth()
iris_plot

#theme_minimal: adjust appearance of the plots
#theme_grey(),theme_classic(),theme_bw()
#example
iris_plot = iris_plot + theme_bw()
iris_plot

#final: 
ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length)) + geom_point() + labs(title =" Scatter plot for Sepal width and length", x = "width", y = "length") + coord_cartesian(xlim = c(2,4), ylim = c(4,6)) + geom_smooth() + theme_bw()

#Exercise: Try to draw a graph with following condition:
#Setting ggplot
#boxplot, set data x=Species, y=Sepal.Length, color these three plots
#Add approporiate labels
#setting limit, y(4.2 - 7.5)
#add a classic theme (theme_classic())







#Answer
#setting
names(iris)
#[1] "Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width"  "Species" 
Answer <- ggplot(iris, aes(x=Species, y=Sepal.Length))
Answer <- Answer + geom_boxplot(color = c("red", "blue", "green"))
Answer <- Answer + labs(title =" boxplot for Species and Sepal length", x = "Species", y = "Sepal length")
Answer <- Answer + coord_cartesian(ylim = c(4.2, 7.5))
Answer <- Answer + theme_classic()