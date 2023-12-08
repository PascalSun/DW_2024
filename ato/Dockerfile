FROM postgres:14.0

RUN apt-get update
RUN apt-get -y install unzip ruby dos2unix

RUN mkdir /data
COPY OLTP/install.sql /data/AdventureWorkOLTP/
COPY OLAP/install.sql /data/AdventureWorkDW/
COPY OLAP/installdemo.sql /data/AdventureWorkDWDemo/
COPY OLTP/update_csvs.rb /data/AdventureWorkOLTP/
COPY OLTP/update_csvs.rb /data/AdventureWorkDW/
COPY OLTP/update_csvs.rb /data/AdventureWorkDWDemo/
COPY data/AdventureWorkOLTP /data/AdventureWorkOLTP/
COPY data/AdventureWorkDW/ /data/AdventureWorkDW/
COPY data/AdventureWorkDWDemo/ /data/AdventureWorkDWDemo/
RUN cd /data/AdventureWorkOLTP && \
    ruby update_csvs.rb && \
    rm update_csvs.rb
RUN cd /data/AdventureWorkDW && \
    ruby update_csvs.rb && \
    rm update_csvs.rb
RUN cd /data/AdventureWorkDWDemo && \
    ruby update_csvs.rb && \
    rm update_csvs.rb

COPY OLTP/install.sh /docker-entrypoint-initdb.d/
WORKDIR /data/AdventureWorkOLTP
RUN dos2unix /docker-entrypoint-initdb.d/*.sh
