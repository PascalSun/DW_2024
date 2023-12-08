#!/bin/bash

export PGUSER=postgres
psql <<- SHELL
  CREATE USER docker;
  CREATE DATABASE "Adventureworks";
  CREATE DATABASE "AdventureworksDW";
  CREATE DATABASE "AdventureworksDWDemo";
  GRANT ALL PRIVILEGES ON DATABASE "Adventureworks" TO docker;
  GRANT ALL PRIVILEGES ON DATABASE "AdventureworksDW" TO docker;
  GRANT ALL PRIVILEGES ON DATABASE "AdventureworksDWDemo" TO docker;
SHELL
cd /data/AdventureWorkOLTP
psql -d Adventureworks < /data/AdventureWorkOLTP/install.sql
cd /data/AdventureWorkDW
psql -d AdventureworksDW < /data/AdventureWorkDW/install.sql
cd /data/AdventureWorkDWDemo
psql -d AdventureworksDWDemo < /data/AdventureWorkDWDemo/installdemo.sql