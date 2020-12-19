FROM python:3-alpine

RUN apk add git make

ARG BRANCH=5.x

RUN git clone --depth=1 https://github.com/symfony/symfony-docs.git -b ${BRANCH}
RUN pip install -r /symfony-docs/_build/.requirements.txt
RUN sed -i "s/copyright = ''/copyright = '2004-2020 Fabien Potencier'/g" /symfony-docs/_build/conf.py
RUN sed -i "s/# version = '2.2'/version = '${BRANCH}}'/g" /symfony-docs/_build/conf.py

ENTRYPOINT ["make", "--directory=/symfony-docs/_build", "SPHINXOPTS=-nW -c /symfony-docs/_build", "BUILDDIR=/output"]
