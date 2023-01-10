---
editor_options: 
  markdown: 
    wrap: sentence
---

# Mateable 0.3.2

## Major changes

`makeScene()` now includes an argument, `split`, to split a dataframe by the level of a specified variable.
`plotScene()` now includes arguments `sortBy` and `colorBy` to allow users to control the stacking order and color of temporal plots by specified variables.
*In all plotting functions, users can now set their own plot margins (oma and mar) outside of the function, using* `par()`.
We removed the argument to add a main title, main, to grant users more flexibility in formatting their plot titles.
We added a new `method` option to `synchrony()`, called `sync_prop`, which calculates individual synchrony the proportion of a seasons reproductive opportunities that occur on days that an individual reproduced.
Population values of `sync_prop` calculate the mean individual synchrony.
*We added a function,* `simplify.potential.list()`, which simplifies the list output of the `synchrony()`, `proximity()`, and `compatibility` functions to a dataframe.
We updated the vignette investigateMatingScene to reflect new features and included a new dataset, `ech2012`, which includes spatial and temporal data for two populations.

## Bug Fixes and Minor Improvements

*The plot limits shown by* `plotScene()` for multi-year scenes are now accurate in all years.
`proximity()` no longer throws an error in calculating measures proximity for multi-year scenes.
\*We made updates to .cpp export files to maintain compatibility with current verions of Rcpp and R 4.2.2.
