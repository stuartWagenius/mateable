# Mateable 0.3.2

## Major changes
*\code{makeScene()} now includes an argument, \code{split}, to split a dataframe by the level of a specified variable.
*\code{plotScene()} now includes arguments \code{sortBy} and \code{colorBy} to allow users to control the  stacking order and color of temporal plots by specified variables.
*In all plotting functions, users can now set their own plot margins (oma and mar) outside of the function, using \code{par()}. We removed the argument to add a main title, main, to grant users more flexibility in formatting their plot titles.
*We added a new \code{method} option to \code{synchrony()}, called \code{sync_prop}, which calculates individual synchrony the proportion of a seasons reproductive opportunities that occur on days that an individual reproduced. Population values of \code{sync_prop} calculate the mean individual synchrony.
*We added a function, \code{simplify.potential.list()}, which simplifies the list output of the \code{synchrony()}, \code{proximity()}, and \code{compatibility} functions to a dataframe.
* We updated the vignette investigateMatingScene to reflect new features and included a new dataset, \code{ech2012}, which includes spatial and temporal data for two populations.

## Bug Fixes and Minor Improvements
*The plot limits shown by \code{plotScene()} for multi-year scenes are now accurate in all years.
*\code{proximity()} no longer throws an error in calculating measures proximity for multi-year scenes.
*We made updates to .cpp export files to maintain compatibility with current verions of Rcpp and R 4.2.2.
