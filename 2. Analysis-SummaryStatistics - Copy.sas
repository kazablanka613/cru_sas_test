
/*
-generate and export summary statistics for champlain and quebec into csv files
*/

/***** champlain *****/
/*
1. generate mean, standard deviation, median, first quintile, third quintile 
	for each vaeiable in "var" 
	by year (separately for 2015 and 2016)
2. output results into csv file
*/
ods csv file="\champlain_summary_stats.csv";
proc means data=champlain StackODSOutput  mean std median q1 q3 print;
var Dispatch_time Mobilization_time	Response_time	Stabilization_time	Total_transport_time;
class ryear;
title "champlain: summary statistics by year";
run;
ods csv close;

/*
1. generate Wilcoxon non-parametric test on two independent means 
	for each vaeiable in "var" 
*/
proc npar1way data=champlain wilcoxon;
  class ryear;
  var Dispatch_time	Mobilization_time	Response_time	Stabilization_time	Total_transport_time;
  exact wilcoxon; /*added by mac*/
  /*opa*/
  output out=work.champlain_summary;
  title "champlain: wilcoxon non-parametric test on two independent means";
run;

/*added some comments*/
