/*
7. Read .csv data in Stata.
*/

cd
cd Downloads/Homework
insheet using "data/Motor_Vehicle_Collisions_-_Crashes.csv", clear

/*
We can use another way to read .csv data in Stata:

import delimited "data/Motor_Vehicle_Collisions_-_Crashes.csv", delimiter(comma) bindquote(strict) stripquote(no) clear
*/
