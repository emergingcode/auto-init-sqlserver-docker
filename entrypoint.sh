#!/bin/bash
wait_time=15s

# wait for SQL Server to come up
echo importing data will start in $wait_time...
sleep $wait_time
echo executing script...

# run the scripts in /schemas folder to create the DB and the tables
for entry in "schemas/*.sql"
do
  echo executing $entry
  /opt/mssql-tools/bin/sqlcmd -S 0.0.0.0 -U sa -P $SA_PASSWORD -i $entry
done

# run scripts to populate by Bulk insert all these test data
/opt/mssql-tools/bin/bcp dbo.Hoteis in data/Hoteis.csv -S localhost -U sa -P $SA_PASSWORD -d $DATABASE_NAME -c -t ','
/opt/mssql-tools/bin/bcp dbo.Quartos in data/Quartos.csv -S localhost -U sa -P $SA_PASSWORD -d $DATABASE_NAME -c -t ','