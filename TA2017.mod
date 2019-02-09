/*********************************************
 * OPL 12.8.0.0 Model
 * Author: Inspire
 * Creation Date: Dec 23, 2018 at 9:01:22 PM
 *********************************************/

int i=...; // number of courses
int j=...; // number of TAs

range courses = 1..i;
range TA = 1..j;

float efficiency[courses][TA]=...;
float capacity[courses]=...;

// variables

dvar boolean x[courses][TA];
dvar boolean y[courses][TA];

maximize sum(i in courses, j in TA) efficiency[i][j]*(0.5*x[i][j]+y[i][j]);

subject to {
	forall(i in courses)
	  available_TA:
	  0.5* sum(j in TA) x[i][j] + sum(j in TA) y[i][j] <= capacity[i];
	  0.5* sum(j in TA) x[i][j] + sum(j in TA) y[i][j] >=0; 
	
	forall(j in TA)
	  available_courses:
	  0.5*sum(i in courses) x[i][j] + sum(i in courses) y[i][j] <= 1;
	  0.5*sum(i in courses) x[i][j] + sum(i in courses) y[i][j] >= 0;
	  

}