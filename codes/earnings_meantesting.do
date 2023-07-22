quietly: {
clear
set more off

local datestamp : di %tdCYND daily("$S_DATE", "DMY")

global suser = c(username)

if (inlist("${suser}","satya")) {
	cd "C:\Users\satya\OneDrive\WORKBENCH\Personal Study\1B - Thesis\proposals\spatialmicrosim"
}

global output	"output"
global dofile	"dofile"
global raw		"raw"
global clean	"clean"

******************************************


import delimited $clean/reshaped_diy_2020_2.csv, clear

la de status 1 "Berusaha sendiri" 2 "Berusaha dibantu pekerja tidak tetap/pekerja keluarga/tidak dibayar" 3 "Berusaha dibantu pekerja tetap dan dibayar" 4 "Buruh/karyawan/pegawai" 5 "Pekerja bebas di pertanian" 6 "Pekerja bebas di nonpertanian" 7 "Pekerja keluarga/tidak dibayar"

la val target_jobstatus status

la de sector 1  "Agriculture, Forestry and Fishing" 2  "Mining and Quarrying" 3  "Manufacturing" 4  "Electricity and Gas" 5  "Water, Sewerage, Waste" 6  "Construction" 7  "Wholesale and Retail Trade; Repair of Motor" 8  "Transportation and Storage" 9  "Accommodation and Food Service Activities" 10 "Information and Communication" 11 "Financial and Insurance Activities" 12 "Real Estate Activities" 13 "Business Activities" 14 "Public Administration and Defence; Compulsory" 15 "Education" 16 "Human Health and Social Work Activities" 17 "Other Services Activities"

la val cat_sector sector

merge m:1 id using $clean/identifier_kelurahan, nogen

forval x = 1/17{
	
	gen cat_sector_`x' = cat_sector == `x'
		replace cat_sector_`x' = . if target_working !=1
}

forval x = 1/7{
	
	gen target_jobstatus_`x' = target_jobstatus == `x'
		replace target_jobstatus_`x' = . if target_working !=1
		
}

// replace target_earnings = . if target_working == 0 | target_lf == 0

}

sum target_earnings

****************************

quietly:{
import delimited $clean/reshaped_diy_2019_2.csv, clear

la de status 1 "Berusaha sendiri" 2 "Berusaha dibantu pekerja tidak tetap/pekerja keluarga/tidak dibayar" 3 "Berusaha dibantu pekerja tetap dan dibayar" 4 "Buruh/karyawan/pegawai" 5 "Pekerja bebas di pertanian" 6 "Pekerja bebas di nonpertanian" 7 "Pekerja keluarga/tidak dibayar"

la val target_jobstatus status

la de sector 1  "Agriculture, Forestry and Fishing" 2  "Mining and Quarrying" 3  "Manufacturing" 4  "Electricity and Gas" 5  "Water, Sewerage, Waste" 6  "Construction" 7  "Wholesale and Retail Trade; Repair of Motor" 8  "Transportation and Storage" 9  "Accommodation and Food Service Activities" 10 "Information and Communication" 11 "Financial and Insurance Activities" 12 "Real Estate Activities" 13 "Business Activities" 14 "Public Administration and Defence; Compulsory" 15 "Education" 16 "Human Health and Social Work Activities" 17 "Other Services Activities"

la val cat_sector sector

merge m:1 id using $clean/identifier_kelurahan, nogen

forval x = 1/17{
	
	gen cat_sector_`x' = cat_sector == `x'
		replace cat_sector_`x' = . if target_working !=1
}

forval x = 1/7{
	
	gen target_jobstatus_`x' = target_jobstatus == `x'
		replace target_jobstatus_`x' = . if target_working !=1
		
}

// replace target_earnings = . if target_working == 0 | target_lf == 0

}

sum target_earn*

quietly: {

import delimited $clean/reshaped_diy_2020_2.csv, clear

la de status 1 "Berusaha sendiri" 2 "Berusaha dibantu pekerja tidak tetap/pekerja keluarga/tidak dibayar" 3 "Berusaha dibantu pekerja tetap dan dibayar" 4 "Buruh/karyawan/pegawai" 5 "Pekerja bebas di pertanian" 6 "Pekerja bebas di nonpertanian" 7 "Pekerja keluarga/tidak dibayar"

la val target_jobstatus status

la de sector 1  "Agriculture, Forestry and Fishing" 2  "Mining and Quarrying" 3  "Manufacturing" 4  "Electricity and Gas" 5  "Water, Sewerage, Waste" 6  "Construction" 7  "Wholesale and Retail Trade; Repair of Motor" 8  "Transportation and Storage" 9  "Accommodation and Food Service Activities" 10 "Information and Communication" 11 "Financial and Insurance Activities" 12 "Real Estate Activities" 13 "Business Activities" 14 "Public Administration and Defence; Compulsory" 15 "Education" 16 "Human Health and Social Work Activities" 17 "Other Services Activities"

la val cat_sector sector

merge m:1 id using $clean/identifier_kelurahan, nogen

forval x = 1/17{
	
	gen cat_sector_`x' = cat_sector == `x'
		replace cat_sector_`x' = . if target_working !=1
}

forval x = 1/7{
	
	gen target_jobstatus_`x' = target_jobstatus == `x'
		replace target_jobstatus_`x' = . if target_working !=1
		
}

replace target_earnings = . if target_working == 0 | target_lf == 0

}

sum target_earnings

****************************

quietly:{
import delimited $clean/reshaped_diy_2019_2.csv, clear

la de status 1 "Berusaha sendiri" 2 "Berusaha dibantu pekerja tidak tetap/pekerja keluarga/tidak dibayar" 3 "Berusaha dibantu pekerja tetap dan dibayar" 4 "Buruh/karyawan/pegawai" 5 "Pekerja bebas di pertanian" 6 "Pekerja bebas di nonpertanian" 7 "Pekerja keluarga/tidak dibayar"

la val target_jobstatus status

la de sector 1  "Agriculture, Forestry and Fishing" 2  "Mining and Quarrying" 3  "Manufacturing" 4  "Electricity and Gas" 5  "Water, Sewerage, Waste" 6  "Construction" 7  "Wholesale and Retail Trade; Repair of Motor" 8  "Transportation and Storage" 9  "Accommodation and Food Service Activities" 10 "Information and Communication" 11 "Financial and Insurance Activities" 12 "Real Estate Activities" 13 "Business Activities" 14 "Public Administration and Defence; Compulsory" 15 "Education" 16 "Human Health and Social Work Activities" 17 "Other Services Activities"

la val cat_sector sector

merge m:1 id using $clean/identifier_kelurahan, nogen

forval x = 1/17{
	
	gen cat_sector_`x' = cat_sector == `x'
		replace cat_sector_`x' = . if target_working !=1
}

forval x = 1/7{
	
	gen target_jobstatus_`x' = target_jobstatus == `x'
		replace target_jobstatus_`x' = . if target_working !=1
		
}

replace target_earnings = . if target_working == 0 | target_lf == 0

}

sum target_earn*