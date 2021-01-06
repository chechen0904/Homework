/*
10. Prepare a sample for analysis by filtering observations and variables and creating transformations of variables. Demonstrate all three.
*/

/*
Filter variables : We can use drop or keep.
Filter observations: We can use drop if or keep if
Create transformations of variables: gen or egen
*/

keep crashdate crashtime borough numberofpersonsinjured numberofpersonskilled numberofpedestriansinjured numberofpedestrianskilled numberofcyclistinjured numberofcyclistkilled numberofmotoristinjured numberofmotoristkilled contributingfactorvehicle1

gen number_of_injured = numberofpersonsinjured + numberofpedestriansinjured + numberofcyclistinjured + numberofmotoristinjured
gen number_of_killed = numberofpersonskilled + numberofpedestrianskilled + numberofcyclistkilled + numberofmotoristkilled
generate year = real(substr(crashdate, 7, 4))
generate time = real(substr(crashtime, 1, 1))

nmissing
keep if !missing(number_of_injured)
keep if !missing(number_of_killed)
keep if !missing(borough)
keep if !missing(year)
keep if !missing(time)
keep if !missing(contributingfactorvehicle1)

tab contributingfactorvehicle1
drop if strmatch(contributingfactorvehicle1, "Unspecified")
drop if strmatch(contributingfactorvehicle1, "1")
drop if strmatch(contributingfactorvehicle1, "80")
encode contributingfactorvehicle1, gen(cfv)
gen gr = 0
replace gr = 1 if contributingfactorvehicle1 == "Driver Inattention/Distraction"

drop crashdate crashtime numberofpersonsinjured numberofpersonskilled numberofpedestriansinjured numberofpedestrianskilled numberofcyclistinjured numberofcyclistkilled numberofmotoristinjured numberofmotoristkilled contributingfactorvehicle1

/*
Show how to use egen to create transformations of variables.
egen injured_egen = sum(number_of_injured)
egen killed_egen = sum(number_of_killed)
gen injured_percent = number_of_injured/injured_egen * 100
gen killed_percent = number_of_killed/killed_egen * 100
*/
