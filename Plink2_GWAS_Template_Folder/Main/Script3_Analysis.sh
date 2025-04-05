#!/bin/bash

ITALIC='\e[3m'
LIGHT_CYAN='\033[1;36m'

echo "------------------------------------------------------------------------"
figlet -f slant "Plink 2.0 GWAS" | lolcat --animate --speed 400 --freq 0
echo -e "${ITALIC}${LIGHT_CYAN}Part II: Regression & Post-Hoc Test"
cowsay -g -f turkey -W 100 "Half way there!!!" | lolcat --freq 0 #cowsay -l -> more options
echo ""
date
echo "------------------------------------------------------------------------"
echo ""
echo "Welcome to the Plink 2.0 GWAS Data Analysis Pipeline!"
read -t 60 -p "Do you want to continue [Y/n]? " continue_selection
echo ""

set -e #Exit entire script immediately if error is encountered

main(){
	if [[ "$1" == "Y" ]]; then
		echo "You've made the right choice ..."
		sleep 1
		echo -n "Initializing ... "
		sleep 1
		echo -n "5"
		sleep 1	
		echo -n "...4"
		sleep 1
		echo -n "...3"
		sleep 1
		echo -n "...2"
		sleep 1
		echo -n "...1"
		sleep 1
		echo -n "...take off!"
		echo ""	
		sleep 1
		echo "*********************** START ***********************"
		echo ""
		bash ./Shell_scripts/Quantitative_Phenotype_Estimation.sh
		echo ""
		echo "*********************** Part 1/5 Done ***********************"
		echo ""
		sleep 1	
		bash ./Shell_scripts/Quantitative_Phenotype_Estimation_remove_FP.sh
		echo ""
		echo "*********************** Part 2/5 Done ***********************"
		echo ""
		sleep 1	
		bash ./Shell_scripts/Qualitative_Phenotype_Logistic_Regression.sh
		echo ""
		echo "*********************** Part 3/5 Done ***********************"
		echo ""
		sleep 1	
		bash ./Shell_scripts/Post_Hoc_GLM_P_value_Adjustment.sh
		echo ""
		echo "*********************** Part 4/5 Done ***********************"
		echo ""
		sleep 1	
		bash ./Shell_scripts/Post_Hoc_Clump_method.sh
		echo ""
		echo "*********************** Part 5/5 Done ***********************"
		echo ""	
		bash ./Shell_scripts/Collect_Files_Create_CSV_Analysis.sh	
		echo "Retrieving output files, changing files to .csv and aggregating the files in one working directory for easy usage in R-studio project..."	
		sleep 1
		echo ""
		echo "*********************** FINISH ***********************"
		echo ""	
		echo "All scripts executed successfully! Now open up the .csv files in R and start plotting and analyzing!"
		echo "Time taken to run the pipeline:"

	elif [[ "$1" == "n" ]]; then
		echo "Exiting ... welcome back some other time!"

	else
		echo "Error: invalid input or no input ... exiting ... please try again!"
	fi
}

time main ${continue_selection}
