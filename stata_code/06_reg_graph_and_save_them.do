/*
12. Run ordinary least squares regression in Stata.
13. Create a graph (of any type) in State.
14. Save regression tables and graphs as files. Demonstrate both.
*/


/*
Run ordinary least squares regression in Stata.
reg number_of_killed cfv, robust
reg number_of_killed cfv if year == 2020, robust
reg number_of_killed cfv i.year, robust
reghdfe number_of_killed cfv, absorb(year)
*/

foreach X in number_of_killed cfv {
generate ln_`X' = ln(`X' + 1)
}

reg ln_number_of_killed ln_cfv, robust

/*
reg ln_number_of_killed ln_cfv if year == 2020, robust
reg ln_number_of_killed ln_cfv i.year, robust
reghdfe ln_number_of_killed ln_cfv, absorb(year)
*/

* Save regression tables as file. 
outreg2 using "output/regression.txt", replace

* Create a graph (of any type) in State.
graph pie number_of_killed, over(year)

/*
We can use one of the following coding to draw a scatter plot:
scatter ln_number_of_killed ln_cfv 
scatter ln_number_of_killed ln_cfv if year ==2020
twoway (scatter number_of_killed cfv)
twoway (scatter number_of_killed cfv) if year == 2020
*/

* Save the graph as file.
graph save "output/number_of_killed_pie_chart.gph", replace
