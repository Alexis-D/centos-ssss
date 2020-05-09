FROM centos:8

RUN yum -y update && \
    yum install -y gcc gmp-devel make

COPY ./ssss /ssss
WORKDIR /ssss

RUN make compile install

CMD ["/usr/bin/ssss-combine", "-t", "3"]
