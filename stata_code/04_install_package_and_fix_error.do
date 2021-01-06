/*
15. Install a Stata package. 
ssc install nmissing
*/

/*
8. Fix common data quality errors in Stata (for example, string vs number, missing value).
*/

preserve

describe
generate year_new = real(substr(crashdate, 7, 4))
generate time_new = real(substr(crashtime, 1, 1))
tabulate year_new, missing
tabulate time_new, missing

/*
List missing values for all variables
*/

nmissing

/*
Check missing values for selected variables. In this way, we can see the number of missing values.
We can also use display missing(varname) to check whether the variable has missing values or not. We can't see the number of missing values, it only shows 0 or 1, which means false or true, respectively.
*/

codebook year_new time_new

/*
Only retain data without missing values
*/

gen missing1 = missing(year_new, time_new)
keep if missing1 == 0
codebook missing1

restore
