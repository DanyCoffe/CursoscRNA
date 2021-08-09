install.packages("remotes")
remotes::install_cran("BiocManager")
BiocManager::install(c("batchelor", "BiocFileCache", "BiocSingular", "bluster", "cowplot", "dplyr", "DropletUtils", "EnsDb.Hsapiens.v86", "ExperimentHub", "fossil", "gert", "gh", "here", "iSEE", "kableExtra", "org.Mm.eg.db", "patchwork", "PCAtools", "pheatmap", "plotly", "pryr", "RColorBrewer", "rsthemes", "Rtsne", "scater", "scPipe", "scran", "scRNAseq", "sessioninfo", "Seurat", "SingleCellExperiment", "suncalc", "TENxPBMCData", "usethis", "uwot"))
install.packages("devtools")
devtools::install_github("gadenbuie/rsthemes")

remotes::install_cran("suncalc")
rsthemes::install_rsthemes(include_base16 = TRUE)


usethis::edit_r_profile()
if (interactive() && requireNamespace("rsthemes", quietly = TRUE)) {
  # Set preferred themes if not handled elsewhere..
  rsthemes::set_theme_light("Solarized Light {rsthemes}") # light theme
  rsthemes::set_theme_dark("base16 Monokai {rsthemes}") # dark theme
  rsthemes::set_theme_favorite(c(
    "Solarized Light {rsthemes}",
    "base16 Monokai {rsthemes}",
    "One Dark {rsthemes}"
  ))
  # Whenever the R session restarts inside RStudio...
  setHook("rstudio.sessionInit", function(isNewSession) {
    # Automatically choose the correct theme based on time of day
    ## Used rsthemes::geolocate() once
    rsthemes::use_theme_auto(lat = 39.2891, lon = -76.5583)
  }, action = "append")
}
## https://blog.rstudio.com/2013/06/10/rstudio-cran-mirror/
options(repos = c(CRAN = "https://cloud.r-project.org"))



#####
#Creando un proyecto

usethis::create_project("D:/Winter/SC_RNA/cdsb2021_scRNAseq_notas")

usethis::create_github_token()

###################################
#Vinculando RStudio con Git y GitHub
#####################################
install.packages(c("gitcreds", "gert", "gh"))

library(gitcreds)
library(gert)
library(gh)

# Para iniciar conexión con GitHub
usethis::create_github_token() # redirige a github donde eligiras nombre especifico del token
# copia el token para después ingresarlo con gitcreds_set()
gitcreds::gitcreds_set() # aquí colocas el token (NO tu contraseña de github!!!)

# Configurar usuario de gitHub
usethis::edit_git_config() # que abre el archivo .gitconfig
# colocaremos nombre y correo de cuenta de github. SOLO borrar los # y respetar los demas espacios
# [user]
#   name = N O M B R E
#   email = correodeGithub
