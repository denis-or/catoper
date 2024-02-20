pkgload::load_all()

base_readme <- catoper:::update_base_readme()

saveRDS(base_readme, "inst/base_readme.rda")

rmarkdown::render("README.Rmd")
