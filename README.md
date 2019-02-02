# Setup

* Install R from r-project.org
* Download rstudio ui https://www.rstudio.com/products/rstudio/download/preview/
* Install https://www.xquartz.org/

``` shell
R
install.packages('bookdown')
```

# Docker

``` shell
docker run -it -v $(pwd):/book 0xcaff/bookdown bash
cd recipes
Rscript -e "bookdown::render_book('.', 'all')"
```
