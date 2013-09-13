#!/usr/bin/Rscript
library(rmr2)
# random binomial distributaion, genreates 50 observations 
# map : input . 12 | output 12 1
# reduce : input 12 {1,1,1,1} | output 12 4
groups = rbinom(32, n = 50, prob = 0.4)
  groups = to.dfs(groups)
  result=from.dfs(
    mapreduce(
      input = groups, 
      map = function(., v) keyval(v, 1), 
      reduce = 
        function(k, vv) 
          keyval(k, length(vv))))
#  print(result)
# key-vs-values 
plot(result$key,result$val)
