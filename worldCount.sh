#!/usr/bin/Rscript
library(rmr2)
lines=to.dfs("Hello how are you , Hi how are you",format="text");
result=from.dfs(mapreduce(
      input = lines ,
      input.format = "text",
      map = function(., lines) {
        keyval(
          unlist(
            strsplit(
              x = lines,
              split = " ")),
          1)},
      reduce = function(word, counts ) {
        keyval(word, sum(counts))}
        ))
 barplot(result$val, main="world count", horiz=FALSE,names.arg=result$key)
