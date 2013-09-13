#!/usr/bin/Rscript
#importing the rmr2 package .
library(rmr2)
# writing a file to hdfs with key:null & value:{1,2,...10}(file : null 1 \n null 2\n ......)
small.ints = to.dfs(1:10)
# from.dfs gets the final output back to R from dfs 
# MapReduce Job : squares the number 
# input : null 2 , output : 1 4
# check the console for jobtracker details and Final output in above format 
from.dfs(mapreduce(
    input = small.ints, 
    map = function(k, v) cbind(v, v^2)))
