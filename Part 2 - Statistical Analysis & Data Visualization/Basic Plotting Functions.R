#Data visulization intro
#We will cover: Basic R plot functions, GGplot
#You will learn: how to use R studio for data visulization
#Before Data visulization, you should know: basic R

#Why visulize R:
#Understanding complex datasets
#Reports 
#Model developments

#Short cut and setup:
# ctrl + shift + 1: show full screen
# ctrl + shift + c: add multiple comments
#shift + end: select one line
#Word wrap (solving long line codes):
#tools -> global options -> code -> Soft-wrap R source files
#Cheatsheet: help -> cheatsheets

#Plot types: Scatter plot, line plot, bar plot, Histogram, pie charts
# Scatter plot: observe relationship between two numerical variables
# line plot: track changes over short and long period of time. 
# bar plot:
# histogram:
# pie charts: show percentages represented by each category

#Default: plot(X,y)
#initial dataset: X = [0,10,..,100], Y = [20,22,...,40]
X_random = seq(0,100,10)
Y_random = seq(20,40,2)
plot(X_random,Y_random)

#Advance setting
#plot(X, y , type ='_',  main = '_', sub = '_', xlab = '_', ylab = '_', xlim = '_', ylim = '_', col = '_', pch = '_', legend. )

# X,y: X and y coordinates
# type: "p": point; "l": line; 'h' histogram like vertical lines
# main, sub, xlab, ylab: descriptions
# xlim, ylim: range of data
# col: line color('red', 'blue', .)
# pch: point shapes(21-25) (21:circle, 22: square, etc.)
# Legend: A small box usually explain two or more plots in a graph

#In this example we will use Iris dataset
#Two methods: import local csv or R default dataset
#method1
library(datasets)
data(iris)
#method2
#iris <- read.csv('iris.csv', header = TRUE) #put in the same folder with R script
#if there is error, run this
#iris <- read.csv(file.choose(), header = TRUE)
head(iris)
#   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
# 1          5.1         3.5          1.4         0.2  setosa
# 2          4.9         3.0          1.4         0.2  setosa
# 3          4.7         3.2          1.3         0.2  setosa
# 4          4.6         3.1          1.5         0.2  setosa
# 5          5.0         3.6          1.4         0.2  setosa
# 6          5.4         3.9          1.7         0.4  setosa
dim(iris)
#[1] 150   5
attach(iris) #iris$...
#Example
X = Sepal.Length
Y = Sepal.Width
#Explore flower length and width
#basic plot function
plot(X,Y, type = 'p')

plot.new() # draw a new plot

plot(X,Y, type ='p',  main = 'Main title', sub = 'Subtitle', xlab = 'X value', ylab = 'Y value', xlim = c(3,8), ylim = c(2,6), col = 'red', pch = 25) #add a line on the same plot

abline(-3,1) #y coordinate -3, slope 1

legend('topleft', c('Red plots', 'black line'), fill = c('red', 'black')) #Add parameters 
#graphics.off() #close the graph

#other plot functions: (similar settings)
#hist()
hist(X)
hist(X, main = 'Main title', sub = 'Subtitle', xlab = 'X value', xlim = c(2,8))

#lines()
#initial dataset: X = [0,10,..,100], Y = [20,22,...,40]
X_random = seq(0,100,10)
Y_random = seq(20,40,2)
plot(X_random, Y_random)
lines(X_random,Y_random, main = 'Main title', sub = 'Subtitle', xlab = 'X value', ylab = 'Y value', col = 'blue')# customized setting
#why some of the setting disappeared?
#most of the settings are based on plot(). Just add settings in plot() instead of lines().
plot.new()
plot(X_random, Y_random, main = 'Main title', sub = 'Subtitle', xlab = 'X value', ylab = 'Y value')
lines(X_random, Y_random, col = 'blue')
#here is the correct one.

#barplot()
barplot(table(Y)) #each y value appear once
barplot(table(Species))# know each target's distribution
barplot(table(Y_2), main = 'Main title', sub = 'Subtitle', xlab = 'X value', ylab = 'Y value', col = 'red')# customized setting

#pie()
pie()
# Simple Pie Chart
slices <- c(10, 22, 14, 16, 8)
lbls <- c("Group1", "Group2", "Group3", "Group4", "Group5")
pie(slices, labels = lbls, main="Pie Chart Example")

#3d pie chart
#install.packages('plotrix')
library(plotrix)
pie3D(slices,labels=lbls,explode=0.1, main="Pie Chart Example")

#Exercise
#Remember we told about plot(), hist(), barplot(), pie()
#And settings (type, main, sub, xlabel, ylabel, xlim, ylim, col)
#Review:
#type = type of line (in plot())
#main = main title of the graph, don't forget ''
# = subtitle of the graph
#xlabel, ylabel: labels of X and y values
#xlim, ylim; range of X and y
#col: color

#In this exercise we will use Iris dataset
#Two methods: import local csv or R default dataset
#method1
library(datasets)
data(iris)
#method2
#iris <- read.csv('iris.csv', header = TRUE) #put in the same folder with R script
#if there is error, run this
#iris <- read.csv(file.choose(), header = TRUE)

head(iris)
#   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
# 1          5.1         3.5          1.4         0.2  setosa
# 2          4.9         3.0          1.4         0.2  setosa
# 3          4.7         3.2          1.3         0.2  setosa
# 4          4.6         3.1          1.5         0.2  setosa
# 5          5.0         3.6          1.4         0.2  setosa
# 6          5.4         3.9          1.7         0.4  setosa
dim(iris)
#[1] 150   5

#Question 1
#Scatter plot between Sepal.Length and Sepal.Width, set range of X and y to 0-10, add titles and x,y axis. Is there looks like a linear relationship?






#Your Answer
attach(iris) #iris$...
plot(Sepal.Length, Sepal.Width, main = 'Iris dataset', sub = 'Scatter plot for Sepal Length and Sepal Width', xlab = 'Sepal.Length', ylab = 'Sepal Width')
#No linear relationship

#Question 2
#Draw a histogram for Petal.Length and set its bins to 4. (breaks = ...)
#Your answer









hist(Petal.Length, main = 'Iris dataset', sub = 'Histogram for Petal length', xlab = 'Petal length', breaks = 4)

#Question 3
#Count each unique species. Draw a pie chart.
table(Species)
#setosa versicolor  virginica 
#    50         50         50 







#Your answer
slices <- c(50,50,50)
lbls <- c("setosa", "versicolor", "virginica")
pie(slices, label = lbls ,main="Pie Chart Species")

#Then, the next part is relate to another package - ggplot2


