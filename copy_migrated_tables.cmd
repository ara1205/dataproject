REM Workbench Table Data copy script
REM Workbench Version: 8.0.22
REM 
REM Execute this to copy table data from a source RDBMS to MySQL.
REM Edit the options below to customize it. You will need to provide passwords, at least.
REM 
REM Source DB: Mysql@localhost:3306 (MySQL)
REM Target DB: Mysql@local:


@ECHO OFF
REM Source and target DB passwords
set arg_source_password=
set arg_target_password=
set arg_source_ssh_password=
set arg_target_ssh_password=


REM Set the location for wbcopytables.exe in this variable
set "wbcopytables_path=C:\Program Files\MySQL\MySQL Workbench 8.0 CE"

if not [%wbcopytables_path%] == [] set wbcopytables_path=%wbcopytables_path%
set wbcopytables=%wbcopytables_path%\wbcopytables.exe

if not exist "%wbcopytables%" (
	echo "wbcopytables.exe doesn't exist in the supplied path. Please set 'wbcopytables_path' with the proper path(e.g. to Workbench binaries)"
	exit 1
)

IF [%arg_source_password%] == [] (
    IF [%arg_target_password%] == [] (
        IF [%arg_source_ssh_password%] == [] (
            IF [%arg_target_ssh_password%] == [] (
                ECHO WARNING: All source and target passwords are empty. You should edit this file to set them.
            )
        )
    )
)
set arg_worker_count=2
REM Uncomment the following options according to your needs

REM Whether target tables should be truncated before copy
REM set arg_truncate_target=--truncate-target
REM Enable debugging output
REM set arg_debug_output=--log-level=debug3


REM Creation of file with table definitions for copytable

set table_file=%TMP%\wb_tables_to_migrate.txt
TYPE NUL > %TMP%\wb_tables_to_migrate.txt
ECHO `mydatabase`	`socialindexs`	`mydatabase`	`socialindexs`	-	-	`index`, `CountryID`, `socialProgressIndex`, `basicHumanNeeds`, `foundationsOfWellbeing`, `Opportunity` >> %TMP%\wb_tables_to_migrate.txt
ECHO `mydatabase`	`countries`	`mydatabase`	`countries`	-	-	`index`, `CountryID`, `CountryName` >> %TMP%\wb_tables_to_migrate.txt
ECHO `mydatabase`	`incomegini`	`mydatabase`	`incomegini`	-	-	`index`, `CountryID`, `Most_Recent_Income_Gini` >> %TMP%\wb_tables_to_migrate.txt
ECHO `mydatabase`	`wealthgini`	`mydatabase`	`wealthgini`	-	-	`index`, `CountryID`, `WealthGini` >> %TMP%\wb_tables_to_migrate.txt


"%wbcopytables%" ^
 --mysql-source="root@localhost:3306" ^
 --source-rdbms-type=Mysql ^
 --target="root@localhost:None" ^
 --source-password="%arg_source_password%" ^
 --target-password="%arg_target_password%" ^
 --table-file="%table_file%" ^
 --source-ssh-port="22" ^
 --source-ssh-host="" ^
 --source-ssh-user="" ^
 --target-ssh-port="22" ^
 --target-ssh-host="" ^
 --target-ssh-user="" ^
 --source-ssh-password="%arg_source_ssh_password%" ^
 --target-ssh-password="%arg_target_ssh_password%" --thread-count=%arg_worker_count% ^
 %arg_truncate_target% ^
 %arg_debug_output%

REM Removes the file with the table definitions
DEL %TMP%\wb_tables_to_migrate.txt


