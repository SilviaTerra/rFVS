% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fvsInteractRun.R
\name{fvsInteractRun}
\alias{fvsInteractRun}
\title{FVS Interact Run}
\usage{
fvsInteractRun(...)
}
\arguments{
\item{...}{named arguments selected from the above list.}
}
\value{
A named list where the names are automatically generated using the 
  `standid`, `mgmtid`, and `year.` In the case where the return value 
  corresponds to the end of the simulation, the string SimEnd is used in 
  place of year.
  
  The objects in this returned list are also a named lists. Each contains 
  the values of the expressions (or functions) when they are computed. The 
  values are named using the argument names.
}
\description{
This function is used to provide for functional interaction 
  between R and FVS. Most of the arguments (all those listed in the table 
  below), when specified, refer to names of stop points; each provides R 
  code that is run when the stop point is reached. One additional optional 
  argument may be added that that is trace=[TRUE|FALSE]. When `trace=TRUE` 
  is specified, informative messages are output during the function call. 
  Setting `trace = FALSE` has the same effect as not specifying it at all.
  
  `BeforeEM1`: R code to run at the stop point just before the first call to 
    the Event Monitor
  `AfterEM1`: R code to run at the stop point just after the first call to 
    the Event Monitor
  `BeforeEM2`: R code to run at the stop point just before the second call 
    to the Event Monitor
  `AfterEM2`: R code to run at the stop point just after the second call to 
    the Event Monitor
  `BeforeAdd`: R code to run at the stop point after growth and mortality has 
    been computed, but prior to applying them
  `BeforeEstab`: R code to run at the stop point just before the Regeneration 
    Establishment Model is called
  `SimEnd`: R code to run at the stop point at the end of one stand's 
    simulaton and prior to the beginning of the next
 
 The value of arguments can be either:
   1) a quoted character string containing a valid R expression (more than 
      one can be specified if separated by semicolons (;) or 
   2) an R function with no arguments. The expression is evaluated (or the 
      function is called) when the corresponding stop point is reached. Note 
      that using fvsInteractRun() without arguments is functionally 
      equivalent to using fvsRun() without arguments.
}
