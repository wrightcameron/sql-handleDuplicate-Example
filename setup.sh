#!/bin/bash

cmnParam=" -U postgres -h localhost "

# Schema and stored functions
psql $cmnParam -f ./setup/schema.sql
psql $cmnParam -f ./setup/sprocAddSensor.sql

# Data
psql $cmnParam -f ./data/data.sql
psql $cmnParam -f ./data/relationalData.sql
psql $cmnParam -f ./data/sensorDataDuplicate.sql

