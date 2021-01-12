#!/bin/bash
wait_time=15s

# wait for SQL Server to come up
echo importing data will start in $wait_time...
sleep $wait_time
echo executing script...

# run the init script to create the DB and the tables in /schemas
# /opt/mssql-tools/bin/sqlcmd -S 0.0.0.0 -U sa -P $SA_PASSWORD -i schemas/create-database.sql

for entry in "schemas/*.sql"
do
  echo executing $entry
  /opt/mssql-tools/bin/sqlcmd -S 0.0.0.0 -U sa -P $SA_PASSWORD -i $entry
done

/opt/mssql-tools/bin/bcp dbo.Hoteis in data/Hoteis.csv -S localhost -U sa -P $SA_PASSWORD -d $DATABASE_NAME -c -t ','
/opt/mssql-tools/bin/bcp dbo.Quartos in data/Quartos.csv -S localhost -U sa -P $SA_PASSWORD -d $DATABASE_NAME -c -t ','