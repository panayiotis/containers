FROM sharelatex/sharelatex:v1.2.1

LABEL maintainer "Panayiotis Vlantis <vlantis.p@gmail.com>"

LABEL name "Sharelatex"

LABEL version "v1.2.1"

LABEL description "Sharelatex container with the full texlive 2018 \
distribution installed."

# does not change the directory from 2017 to 2018 in case the sharelatex web app
# uses that somewhere

RUN true \
    && cd /usr/local/texlive/2017 \
    && wget -q http://mirror.ctan.org/systems/texlive/tlnet/update-tlmgr-latest.sh \
    && chmod +x update-tlmgr-latest.sh \
    && ./update-tlmgr-latest.sh -- --upgrade

RUN true \
    && tlmgr update --all \
    && tlmgr install scheme-full
