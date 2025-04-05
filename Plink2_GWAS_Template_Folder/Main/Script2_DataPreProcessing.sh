#!/bin/bash

ITALIC='\e[3m'
LIGHT_CYAN='\033[1;36m'

echo "--------------------------------------------------------------------------"
figlet -f slant "Plink 2.0 GWAS" | lolcat --animate --speed 400 --freq 0
echo -e "${ITALIC}${LIGHT_CYAN}Part I: Data Pre-Processing & Evaluation of Assumptions"
cowsay -g -f turtle -W 100 "Let's go!!!" | lolcat --freq 0
echo ""
date
echo "--------------------------------------------------------------------------"
echo ""
echo "Welcome to the Plink 2.0 GWAS Data Analysis Pipeline!"
read -t 60 -p "Do you want to continue [Y/n]? " continue_selection
echo ""

set -e #Exit the entire script if error occurs

main(){
	if [[ "$1" == "Y" ]]; then
		echo "You've made the right choice ... "
		sleep 1
		echo -n "Initializing ..."
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
		bash ./Shell_scripts/Hardy_Weinberg_Equilibrium_Test.sh  
		echo ""
		echo "*********************** Part 1/16 Done ***********************"
		echo ""
		sleep 1	
		bash ./Shell_scripts/Allele_Frequency_Spectrum_Test.sh
		echo ""
		echo "*********************** Part 2/16 Done ***********************"
		echo ""
		sleep 1	
		bash ./Shell_scripts/Linkage_Data_Preprocessing.sh
		echo ""
		echo "*********************** Part 3/16 Done ***********************"
		echo ""
		sleep 1	
		bash ./Shell_scripts/Linkage_Disequilibrium_PrePhased_PhasedR.sh
		echo ""
		echo "*********************** Part 4/16 Done ***********************"
		echo ""
		sleep 1	
		bash ./Shell_scripts/Linkage_Disequilibrium_UnPhased.sh
		echo ""
		echo "*********************** Part 5/16 Done ***********************"
		echo ""
		sleep 1	
		bash ./Shell_scripts/Linkage_Disequilibrium_UnPhased_PhasedR.sh
		echo ""
		echo "*********************** Part 6/16 Done ***********************"
		echo ""
		sleep 1	
		bash ./Shell_scripts/Linkage_Disequilibrium_PrePhased_UnPhasedR.sh
		echo ""
		echo "*********************** Part 7/16 Done ***********************"
		echo ""
		sleep 1	
		bash ./Shell_scripts/LD_pruning_QC.sh
		echo ""
		echo "*********************** Part 8/16 Done ***********************"
		echo ""
		sleep 1	
		bash ./Shell_scripts/LD_pruning_Results.sh
		echo ""
		echo "*********************** Part 9/16 Done ***********************"
		echo ""
		sleep 1	
		bash ./Shell_scripts/Genomic_Relationship_Matrix_Creator.sh
		echo ""
		echo "*********************** Part 10/16 Done ***********************"
		echo ""
		sleep 1	
		bash ./Shell_scripts/Kinshipbased_INference_for_GWAS.sh
		echo ""
		echo "*********************** Part 11/16 Done ***********************"
		echo ""
		sleep 1	
		bash ./Shell_scripts/Remove_NA_Individuals.sh
		echo ""
		echo "*********************** Part 12/16 Done ***********************"
		echo ""
		sleep 1	
		bash ./Shell_scripts/HG_only_Individuals_Principal_Components.sh
		echo ""
		echo "*********************** Part 13/16 Done ***********************"
		echo ""
		sleep 1	
		bash ./Shell_scripts/Project_HG_only_vs_HG_generated_allele_weights.sh
		echo ""
		echo "*********************** Part 14/16 Done ***********************"
		echo ""
		sleep 1	
		bash ./Shell_scripts/Project_HG_only_vs_NA.sh
		echo ""
		echo "*********************** Part 15/16 Done ***********************"
		echo ""
		sleep 1	
		bash ./Shell_scripts/Generate_HG_and_NA_Principal_Components.sh
		echo ""
		echo "*********************** Part 16/16 Done ***********************"
		echo ""	
		bash ./Shell_scripts/Collect_Files_Create_CSV_DataPreProcessing.sh	
		echo "Retrieving output files, changing files to .csv and aggregating the files in one working directory for easy usage in R-studio project..."	
		sleep 1
		echo ""
		echo "*********************** FINISH ***********************"
		echo ""	
		echo "All scripts executed successfully! Now open up the .csv files in R and start plotting and analyzing!"

	elif [[ "$1" == "n" ]]; then
		echo "Exiting ... welcome back some other time!"

	else
		echo "Error: invalid input or no input ... exiting ... please try again!"
	fi
}

time main ${continue_selection}
