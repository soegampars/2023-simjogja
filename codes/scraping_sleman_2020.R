library("rvest")
library("tidyverse")
library("writexl")

# Listing URL

urllist_jk <- list("https://kependudukan.jogjaprov.go.id/statistik/penduduk/jumlahpenduduk/15/0/08/04/34.clear",
                  "https://kependudukan.jogjaprov.go.id/statistik/penduduk/jumlahpenduduk/15/0/17/04/34.clear",
                  "https://kependudukan.jogjaprov.go.id/statistik/penduduk/jumlahpenduduk/15/0/07/04/34.clear",
                  "https://kependudukan.jogjaprov.go.id/statistik/penduduk/jumlahpenduduk/15/0/01/04/34.clear",
                  "https://kependudukan.jogjaprov.go.id/statistik/penduduk/jumlahpenduduk/15/0/02/04/34.clear",
                  "https://kependudukan.jogjaprov.go.id/statistik/penduduk/jumlahpenduduk/15/0/10/04/34.clear",
                  "https://kependudukan.jogjaprov.go.id/statistik/penduduk/jumlahpenduduk/15/0/04/04/34.clear",
                  "https://kependudukan.jogjaprov.go.id/statistik/penduduk/jumlahpenduduk/15/0/06/04/34.clear",
                  "https://kependudukan.jogjaprov.go.id/statistik/penduduk/jumlahpenduduk/15/0/03/04/34.clear",
                  "https://kependudukan.jogjaprov.go.id/statistik/penduduk/jumlahpenduduk/15/0/12/04/34.clear",
                  "https://kependudukan.jogjaprov.go.id/statistik/penduduk/jumlahpenduduk/15/0/11/04/34.clear",
                  "https://kependudukan.jogjaprov.go.id/statistik/penduduk/jumlahpenduduk/15/0/16/04/34.clear",
                  "https://kependudukan.jogjaprov.go.id/statistik/penduduk/jumlahpenduduk/15/0/09/04/34.clear",
                  "https://kependudukan.jogjaprov.go.id/statistik/penduduk/jumlahpenduduk/15/0/05/04/34.clear",
                  "https://kependudukan.jogjaprov.go.id/statistik/penduduk/jumlahpenduduk/15/0/13/04/34.clear",
                  "https://kependudukan.jogjaprov.go.id/statistik/penduduk/jumlahpenduduk/15/0/14/04/34.clear",
                  "https://kependudukan.jogjaprov.go.id/statistik/penduduk/jumlahpenduduk/15/0/15/04/34.clear")

urllist_usia <- list("https://kependudukan.jogjaprov.go.id/statistik/penduduk/golonganusia/15/5/08/04/34.clear",
                   "https://kependudukan.jogjaprov.go.id/statistik/penduduk/golonganusia/15/5/17/04/34.clear",
                   "https://kependudukan.jogjaprov.go.id/statistik/penduduk/golonganusia/15/5/07/04/34.clear",
                   "https://kependudukan.jogjaprov.go.id/statistik/penduduk/golonganusia/15/5/01/04/34.clear",
                   "https://kependudukan.jogjaprov.go.id/statistik/penduduk/golonganusia/15/5/02/04/34.clear",
                   "https://kependudukan.jogjaprov.go.id/statistik/penduduk/golonganusia/15/5/10/04/34.clear",
                   "https://kependudukan.jogjaprov.go.id/statistik/penduduk/golonganusia/15/5/04/04/34.clear",
                   "https://kependudukan.jogjaprov.go.id/statistik/penduduk/golonganusia/15/5/06/04/34.clear",
                   "https://kependudukan.jogjaprov.go.id/statistik/penduduk/golonganusia/15/5/03/04/34.clear",
                   "https://kependudukan.jogjaprov.go.id/statistik/penduduk/golonganusia/15/5/12/04/34.clear",
                   "https://kependudukan.jogjaprov.go.id/statistik/penduduk/golonganusia/15/5/11/04/34.clear",
                   "https://kependudukan.jogjaprov.go.id/statistik/penduduk/golonganusia/15/5/16/04/34.clear",
                   "https://kependudukan.jogjaprov.go.id/statistik/penduduk/golonganusia/15/5/09/04/34.clear",
                   "https://kependudukan.jogjaprov.go.id/statistik/penduduk/golonganusia/15/5/05/04/34.clear",
                   "https://kependudukan.jogjaprov.go.id/statistik/penduduk/golonganusia/15/5/13/04/34.clear",
                   "https://kependudukan.jogjaprov.go.id/statistik/penduduk/golonganusia/15/5/14/04/34.clear",
                   "https://kependudukan.jogjaprov.go.id/statistik/penduduk/golonganusia/15/5/15/04/34.clear")

urllist_educ <- list("https://kependudukan.jogjaprov.go.id/statistik/penduduk/pendidikan/15/0/08/04/34.clear",
                     "https://kependudukan.jogjaprov.go.id/statistik/penduduk/pendidikan/15/0/17/04/34.clear",
                     "https://kependudukan.jogjaprov.go.id/statistik/penduduk/pendidikan/15/0/07/04/34.clear",
                     "https://kependudukan.jogjaprov.go.id/statistik/penduduk/pendidikan/15/0/01/04/34.clear",
                     "https://kependudukan.jogjaprov.go.id/statistik/penduduk/pendidikan/15/0/02/04/34.clear",
                     "https://kependudukan.jogjaprov.go.id/statistik/penduduk/pendidikan/15/0/10/04/34.clear",
                     "https://kependudukan.jogjaprov.go.id/statistik/penduduk/pendidikan/15/0/04/04/34.clear",
                     "https://kependudukan.jogjaprov.go.id/statistik/penduduk/pendidikan/15/0/06/04/34.clear",
                     "https://kependudukan.jogjaprov.go.id/statistik/penduduk/pendidikan/15/0/03/04/34.clear",
                     "https://kependudukan.jogjaprov.go.id/statistik/penduduk/pendidikan/15/0/12/04/34.clear",
                     "https://kependudukan.jogjaprov.go.id/statistik/penduduk/pendidikan/15/0/11/04/34.clear",
                     "https://kependudukan.jogjaprov.go.id/statistik/penduduk/pendidikan/15/0/16/04/34.clear",
                     "https://kependudukan.jogjaprov.go.id/statistik/penduduk/pendidikan/15/0/09/04/34.clear",
                     "https://kependudukan.jogjaprov.go.id/statistik/penduduk/pendidikan/15/0/05/04/34.clear",
                     "https://kependudukan.jogjaprov.go.id/statistik/penduduk/pendidikan/15/0/13/04/34.clear",
                     "https://kependudukan.jogjaprov.go.id/statistik/penduduk/pendidikan/15/0/14/04/34.clear",
                     "https://kependudukan.jogjaprov.go.id/statistik/penduduk/pendidikan/15/0/15/04/34.clear")

urllist_occ <- list("https://kependudukan.jogjaprov.go.id/statistik/penduduk/pekerjaan/15/0/08/04/34.clear",
                    "https://kependudukan.jogjaprov.go.id/statistik/penduduk/pekerjaan/15/0/17/04/34.clear",
                    "https://kependudukan.jogjaprov.go.id/statistik/penduduk/pekerjaan/15/0/07/04/34.clear",
                    "https://kependudukan.jogjaprov.go.id/statistik/penduduk/pekerjaan/15/0/01/04/34.clear",
                    "https://kependudukan.jogjaprov.go.id/statistik/penduduk/pekerjaan/15/0/02/04/34.clear",
                    "https://kependudukan.jogjaprov.go.id/statistik/penduduk/pekerjaan/15/0/10/04/34.clear",
                    "https://kependudukan.jogjaprov.go.id/statistik/penduduk/pekerjaan/15/0/04/04/34.clear",
                    "https://kependudukan.jogjaprov.go.id/statistik/penduduk/pekerjaan/15/0/06/04/34.clear",
                    "https://kependudukan.jogjaprov.go.id/statistik/penduduk/pekerjaan/15/0/03/04/34.clear",
                    "https://kependudukan.jogjaprov.go.id/statistik/penduduk/pekerjaan/15/0/12/04/34.clear",
                    "https://kependudukan.jogjaprov.go.id/statistik/penduduk/pekerjaan/15/0/11/04/34.clear",
                    "https://kependudukan.jogjaprov.go.id/statistik/penduduk/pekerjaan/15/0/16/04/34.clear",
                    "https://kependudukan.jogjaprov.go.id/statistik/penduduk/pekerjaan/15/0/09/04/34.clear",
                    "https://kependudukan.jogjaprov.go.id/statistik/penduduk/pekerjaan/15/0/05/04/34.clear",
                    "https://kependudukan.jogjaprov.go.id/statistik/penduduk/pekerjaan/15/0/13/04/34.clear",
                    "https://kependudukan.jogjaprov.go.id/statistik/penduduk/pekerjaan/15/0/14/04/34.clear",
                    "https://kependudukan.jogjaprov.go.id/statistik/penduduk/pekerjaan/15/0/15/04/34.clear")

# Listing Place Names 

kecamatanlist <- list("BERBAH",
                  "CANGKRINGAN",
                  "DEPOK",
                  "GAMPING",
                  "GODEAN",
                  "KALASAN",
                  "MINGGIR",
                  "MLATI",
                  "MOYUDAN",
                  "NGAGLIK",
                  "NGEMPLAK",
                  "PAKEM",
                  "PRAMBANAN",
                  "SEYEGAN",
                  "SLEMAN",
                  "TEMPEL",
                  "TURI")


# Scraping jk -------------------------------------------------------------

list_jk <- list() #Creating list for dataset appending
list_jk <- vector("list", length = length(urllist_jk)) #???

#Looping for scraping and cleaning
for(url in 1:length(urllist_jk)){
  
  table <- urllist_jk[[url]] %>% 
    read_html() %>% 
    html_table()
  
  
  data <- data.frame(table[2])
  colnames(data) <- data[1,]
  colnames(data)[1] <- "kelurahan"
  data <- data[-1,] %>% 
    mutate_at(~as.numeric(str_remove_all(as.character(.x), '\\.')), .vars = c(2:4))
  data$kecamatan <- kecamatanlist[[url]]
  
  list_jk[[url]] <- data
  
}

dataset_jk <- list_jk %>% 
  bind_rows() %>% 
  filter(kelurahan != "Jumlah")

write.table(dataset_jk,file = "raw/jk_sleman_2020_2.csv",quote=FALSE,row.names = FALSE,sep="; ")


# Scraping usia ------------------------------------------------------------

list_usia <- list() #Creating list for dataset appending
list_usia <- vector("list", length = length(urllist_usia)) #???

#Looping for scraping and cleaning
for(url in 1:length(urllist_usia)){
  
  table <- urllist_usia[[url]] %>% 
    read_html() %>% 
    html_table()
  
  
  data <- t(data.frame(table[2]))
  data <- rownames_to_column(data.frame(data), var = "rowname")
  colnames(data) <- c("kelurahan", "jk", "0-4tahun", "5-9tahun",
                      "10-14tahun", "15-19tahun", "20-24tahun",
                      "25-29tahun", "30-34tahun", "35-39tahun",
                      "40-44tahun", "45-49tahun", "50-54tahun",
                      "55-59tahun", "60-64tahun", "65-69tahun",
                      "70-74tahun", "75-79tahun", "80keatas", "jumlah")
  
  data <- data[-20]
  data <- data[-1,] %>%
    mutate_at(~as.numeric(str_remove_all(as.character(.x), '\\.')), .vars = c(3:19)) %>% 
    mutate_at(~str_remove_all(as.character(.x), '[.12]'), .vars = 1)
  data$kecamatan <- kecamatanlist[[url]]
  
  list_usia[[url]] <- data
  
}

dataset_usia <- list_usia %>% 
  bind_rows() %>% 
  filter(kelurahan != "Total")

write.table(dataset_usia,file = "raw/usia_sleman_2020_2.csv",quote=FALSE,row.names = FALSE,sep="; ")


# Scraping pendidikan ------------------------------------------------------

list_educ <- list() #Creating list for dataset appending
list_educ <- vector("list", length = length(urllist_educ)) #???

#Looping for scraping and cleaning
for(url in 1:length(urllist_educ)){
  
  table <- urllist_educ[[url]] %>% 
    read_html() %>% 
    html_table()
  
  data <- data.frame(table[2])
  colnames(data) <- c("kelurahan", "TidakSekolah_L", "TidakSekolah_P", 
                      "TidakSekolah_L+P", "BelumTamatSD/MI_L", 
                      "BelumTamatSD/MI_P", "BelumTamatSD/MI_L+P", 
                      "TamatSD/MI_L", "TamatSD/MI_P", "TamatSD/MI_L+P", 
                      "SMP/MTs_L", "SMP/MTs_P", "SMP/MTs_L+P", 
                      "SMA/SMK/MA_L", "SMA/SMK/MA_P", "SMA/SMK/MA_L+P", 
                      "DiplomaI/II_L", "DiplomaI/II_P", "DiplomaI/II_L+P", 
                      "Akademi/DplmIII/S.Mud_L", "Akademi/DplmIII/S.Mud_P", 
                      "Akademi/DplmIII/S.Mud_L+P", "DiplomaIV/StrataI_L", 
                      "DiplomaIV/StrataI_P", "DiplomaIV/StrataI_L+P", 
                      "StrataII_L", "StrataII_P", "StrataII_L+P", "StrataIII_L", 
                      "StrataIII_P", "StrataIII_L+P", "TOTAL_L", "TOTAL_P", "TOTAL_L+P")
  
  data <- data[-1,]%>%
    mutate_at(~as.numeric(str_remove_all(as.character(.x), '\\.')), .vars = c(2:34))

  data$kecamatan <- kecamatanlist[[url]]
  
  list_educ[[url]] <- data
  
}

dataset_educ <- list_educ %>% 
  bind_rows() %>% 
  filter(kelurahan != "Jumlah")

write.table(dataset_educ,file = "raw/educ_sleman_2020_2.csv",quote=FALSE,row.names = FALSE,sep="; ")


# Scraping pekerjaan ------------------------------------------------------

list_occ <- list() #Creating list for dataset appending
list_occ <- vector("list", length = length(urllist_occ)) #???

#Looping for scraping and cleaning
for(url in 1:length(urllist_occ)){
  
  table <- urllist_occ[[url]] %>% 
    read_html() %>% 
    html_table()
  
  data <- data.frame(table[2])
  colnames(data) <- c("kelurahan", "MENGURUSRUMAHTANGGA_L", 
                      "MENGURUSRUMAHTANGGA_P", "MENGURUSRUMAHTANGGA_L+P", 
                      "PELAJAR/MAHASISWA_L", "PELAJAR/MAHASISWA_P", 
                      "PELAJAR/MAHASISWA_L+P", "PENSIUNAN_L", "PENSIUNAN_P", 
                      "PENSIUNAN_L+P", "BELUMBEKERJA_L", "BELUMBEKERJA_P", 
                      "BELUMBEKERJA_L+P", "ASN_L", "ASN_P", "ASN_L+P", "TNI_L", 
                      "TNI_P", "TNI_L+P", "POLRI_L", "POLRI_P", "POLRI_L+P", 
                      "PEJABATNEGARA_L", "PEJABATNEGARA_P", "PEJABATNEGARA_L+P", 
                      "BURUH/TUKANGBERKEAHLIANKHUSUS_L", 
                      "BURUH/TUKANGBERKEAHLIANKHUSUS_P", "BURUH/TUKANGBERKEAHLIANKHUSUS_L+P", 
                      "SEKTORPERTANIAN/PETERNAKAN/PERIKANAN_L", "SEKTORPERTANIAN/PETERNAKAN/PERIKANAN_P", 
                      "SEKTORPERTANIAN/PETERNAKAN/PERIKANAN_L+P", "KARYAWANBUMN/BUMD_L", "KARYAWANBUMN/BUMD_P", 
                      "KARYAWANBUMN/BUMD_L+P", "KARYAWANSWASTA_L", "KARYAWANSWASTA_P", "KARYAWANSWASTA_L+P", 
                      "WIRASWASATA_L", "WIRASWASATA_P", "WIRASWASATA_L+P", "TENAGAMEDIS_L", "TENAGAMEDIS_P", 
                      "TENAGAMEDIS_L+P", "PEKERJAANLAINNYA_L", "PEKERJAANLAINNYA_P", "PEKERJAANLAINNYA_L+P", 
                      "TOTAL_L", "TOTAL_P", "TOTAL_L+P")
  
  data <- data[-1,]%>%
    mutate_at(~as.numeric(str_remove_all(as.character(.x), '\\.')), .vars = c(2:49))
  data$kecamatan <- kecamatanlist[[url]]
  
  list_occ[[url]] <- data
  
}

dataset_occ <- list_occ %>% 
  bind_rows() %>% 
  filter(kelurahan != "Jumlah")

write.table(dataset_occ,file = "raw/occ_sleman_2020_2.csv",quote=FALSE,row.names = FALSE,sep="; ")