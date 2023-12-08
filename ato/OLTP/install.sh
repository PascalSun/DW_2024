#!/bin/bash

export PGUSER=postgres
psql <<- SHELL
  CREATE USER docker;
  CREATE DATABASE "Adventureworks";
  CREATE DATABASE "AdventureworksDW";
  GRANT ALL PRIVILEGES ON DATABASE "Adventureworks" TO docker;
  GRANT ALL PRIVILEGES ON DATABASE "AdventureworksDW" TO docker;
SHELL
cd /data/AdventureWorkOLTP
psql -d Adventureworks < /data/AdventureWorkOLTP/install.sql
cd /data/AdventureWorkDW
psql -d AdventureworksDW < /data/AdventureWorkDW/install.sql
