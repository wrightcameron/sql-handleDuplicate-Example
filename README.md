# SQL Duplication Handling Example

## Requirements

* Docker (For postgres image)
* psql CLI tool (Accessing postgres database)

## Setup

### Database Creation

Creating a postgres database can be done with docker with the following command.

```bash
docker run --rm -p 5432:5432 --name postgres -e POSTGRES_PASSWORD=pass -d postgres
```

This setups an empty postgres database, that when stopped will remove all data.  This example doesn't require data to persist so we can add it every time.

### Accessing Database with psql

psql is a command line tool for accessing postgres databases.  On Debian it can be installed with command `sudo apt install postgresql-client`

To access the postgres database use `psql -U postgres -h localhost`.

Some helpful commands with postgres are.

* \q - quit
* \l - list databases
* \c - switch database
* \du - list users, more info with \du+
* \dn - list schemas
* \dt - list tables
* \d \d+ \<table name> - describe table name

More commands can be found with `man psql` or searching online, but the ones above are the most common I use.

### Creating Schema

The schema is defined in the file `./setup/schema.sql`  To add schema run command, `psql -U postgres -h localhost -f ./setup/schema.sql`.

### Adding Data

The data to add is in file `./setup/data.sql`.  To add this as well run command, `psql -U postgres -h localhost -f ./setup/data.sql`.

## Problem

The satellite SQL database tracks thousands and thousands of satellites in orbit.  This database is used by hundreds of clients to keep track of public records saying who has what in the sky.  There is an issue though, some of the records are showing duplicates.  These duplicates need to be removed, but a single entry needs to remain and which of the duplicates should be the one to remain?

## Solution

## Resources

* [Postgres Docker image](https://hub.docker.com/_/postgres/)

