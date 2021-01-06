/*
5. Automate repeating tasks using Stata “for” loops.
*/

preserve
foreach result in numberofpersonsinjured numberofpedestriansinjured numberofcyclistinjured {
   sum `result'
    }


ds, detail
gen crash_date_new = date(crashdate, "MDY")
format crash_date_new %td
gen month = month(crash_date_new)


forvalues t = 10/12 {
	           display `t'
			              summarize numberofpersonsinjured if month == `t'
						        }
restore
