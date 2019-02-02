FROM r-base:3.5.2

RUN apt-get update
RUN apt-get install -y pandoc
RUN apt-get install -y texlive
RUN apt-get install -y texlive-latex-extra
RUN apt-get install -y texinfo
RUN apt-get install -y imagemagick
RUN apt-get install -y pandoc-citeproc

RUN Rscript -e 'install.packages("bookdown")'

WORKDIR /book
CMD Rscript -e 'bookdown::render_book("index.Rmd", "bookdown::gitbook")'
