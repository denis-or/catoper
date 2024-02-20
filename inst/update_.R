pkgload::load_all()

base_readme <- catoper:::update_base_readme()

save(base_readme, file = "inst/base_readme.rda")

rmarkdown::render("README.Rmd")
