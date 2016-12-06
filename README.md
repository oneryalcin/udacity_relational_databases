## Udacity Intoduction to Relational Databases Project 

This project simulates a Swiss Tournament where there is no knockout. All players play equal number of games

This repository has three files:

 - `tournament.sql` is used to initialize the tournament database tables and views 
 - `tournament.py` has python modules to query tournament database, insert data into tables or delete data from tables
 - `tournament_test.py` has ten predefined test cases for `tournament.py`. This file is provided by Udacity.
 

## Steps to setup and run and test the application

In short we need to first create 
 - `tournament` database
 - `matches` and `players` tables
 -  Helper views, `games_won`, `games_lost` and `standings`

by running the command below 

`$ psql -f tournament.sql`
 

We run all the tests against our code in `tournament.py` file by running `tournament_test.py` file 

`$ python tournament_test.py`


