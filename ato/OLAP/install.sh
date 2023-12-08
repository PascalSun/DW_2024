#!/bin/bash

export PGUSER=postgres
cd /data/AdventureWorkDW
psql -d AdventureworksDW < /data/AdventureWorkDW/installolap.sql
