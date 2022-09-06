
-- 1.0.0   Introduction to Snowflake and Snowflake Objects

-- 1.1.0   Lab Introduction

-- 1.1.1   Purpose
--         The purpose of this lab is to familiarize you with Snowflake’s
--         Snowsight user interface. Specifically, you will learn how to create
--         and use Snowflake objects that you will need to use to run queries
--         and conduct data analysis in your day-to-day work.
--         If you’re a data engineer, you’ll learn skills important to your
--         role. If you’re not a data engineer, the process of creating the
--         objects will both help you learn how to navigate the Snowsight
--         interface and become familiar with warehouses, databases, roles and
--         schemas, all of which together form the context for any SQL
--         statements you are likely to execute.
--         Context refers to the resources and objects that must be specified in
--         order for SQL statements to execute.

-- 1.1.2   What you’ll learn

-- 1.1.3   How to complete this lab
--         In order to complete this lab, you can type the SQL commands below
--         directly into a worksheet. It is not recommended that you cut and
--         paste from the workbook pdf as that sometimes results in errors.
--         You can also use the SQL code file for this lab that was provided at
--         the start of the class. You would simply need to open it in TextEdit
--         (Mac) or Notepad (Windows), and then copy and paste the SQL code
--         directly into a worksheet.

-- 1.1.4   Scenario
--         You are a data engineer working for Snowbear Air, which is an airline
--         that flies to fun destinations all over the world. You’ve been tasked
--         to design and implement data sets that will be used by business
--         analysts that create flight profitability reports for executive
--         management. You have been asked to create a few Snowflake objects in
--         a development environment to test out your SQL statements. You will
--         need to create:
--         Let’s get started!

-- 1.2.0   Launching Snowsight

-- 1.2.1   Access the URL provided to you for this course.

-- 1.2.2   You will be taken to a login page. Enter the username and password
--         provided to you for this course.

-- 1.2.3   You will be prompted to change the password. Follow the prompts to
--         change the password and click Submit.

-- 1.2.4   Log in with your new password.
--         Your screen should look similar to the screen below:
--         Home
--         Now let’s get familiar with the left-hand navigation bar and its
--         contents.

-- 1.2.5   Click on Dashboards in the left-hand navigation bar.
--         You should see the blank screen below. If you had access to any
--         dashboards, they would appear in the Dashboards pane that takes up
--         the majority of the screen.
--         Dashboards

-- 1.2.6   Click on Data in the left-hand navigation bar.
--         You should see the screen below. An Object Selection Pane and an
--         Object Detail Pane should now be visible.
--         Object Panes
--         Now let’s navigate to a table.

-- 1.2.7   Click SNOWBEARAIR_DB in the Object Selection Pane.

-- 1.2.8   Click schema PROMO_CATALOG_SALES.

-- 1.2.9   Click Tables to expand the table tree.

-- 1.2.10  Click any table to view details about the table.
--         Navigating to a Table
--         By navigating the tree in the Object Selection pane, you can view
--         details about many Snowflake Objects. Try to click through a few more
--         to get familiar with the tree.

-- 1.2.11  Now click on Shared Data in the left-hand navigation bar.
--         You should now see a few data sets that are available for you to
--         consume.
--         Data Sharing

-- 1.2.12  Now click on Marketplace in the left-hand navigation bar.
--         You should now see a few data sets that are available for you to
--         consume.
--         Marketplace
--         Scroll through this section and take a look at the offerings. You may
--         see sections titled Featured Providers, Most Recent, Financial,
--         Business, Marketing, Local and Demographics. What you see may differ
--         as the Data Marketplace is dynamic and new types of data sets are
--         being added every day.
--         As you can imagine, both the Shared Data tab and the Marketplace tab
--         are likely to be useful to many Snowflake users in their day-to-day
--         work.

-- 1.2.13  Now click on Compute in the left-hand navigation bar.
--         The Query History sub-option under Compute should be selected by
--         default. Your query history will be empty, but after running queries
--         your screen will eventually look similar to the one shown below:
--         Compute
--         There should be a list of SQL statements including the status of the
--         execution, when it was started, the total duration, the user who
--         executed the SQL statement, the warehouse, and a session ID.

-- 1.2.14  Now click on Warehouses in the left-hand navigation bar.
--         You may see a list of virtual warehouses and their statuses. However,
--         as this is a training environment, there may not be any virtual
--         warehouses yet. Just know that this is where you can go to see what
--         virtual warehouses exist.
--         Remember, unlike on-premises data warehouses you may be used to, in
--         Snowflake storage and compute are separated. A Snowflake virtual
--         warehouse is a cluster of servers used to run and execute queries,
--         and it provides compute power, memory, and some local SSD storage for
--         caching operations. Other than that, no data is stored in the
--         warehouse. Instead, data is stored in Snowflake’s cloud storage
--         layer. At runtime are storage and compute dynamically combined to
--         execute your queries.
--         Warehouses

-- 1.3.0   Creating Snowflake Objects
--         Now let’s get started on our Snowflake objects. We will need a
--         database, a schema, a warehouse and a table. Let’s make sure you
--         create the objects in the role you will be using throughout the
--         course, which is TRAINING_ROLE. This will ensure that your role will
--         own the objects, which will enable you to do whatever you need to in
--         each lab.

-- 1.3.1   Click Data in the left-hand navigation bar. Click on Databases. If
--         your role is not already TRAINING_ROLE, click the down arrow next to
--         your role. There should now be a pop up menu that says Switch Role.
--         Select the arrow next to your role and select TRAINING_ROLE.
--         Changing the role

-- 1.3.2   Now let’s create a database. Click the New Database button (It’s a
--         big blue button with + Database) in the Object Details pane. The New
--         Database dialog box will appear.

-- 1.3.3   Name your database LEARNER_db and click the Create button.
--         The details of your new database should be shown in the Object
--         Details pane.

-- 1.3.4   Select your new database in the Object Selection pane.

-- 1.3.5   Click the Schemas tab in the Object Detail pane to view the schemas
--         INFORMATION_SCHEMA AND PUBLIC.

-- 1.3.6   Next click the new Schema button to create your new schema:

-- 1.3.7   In the New Schema dialog box, name your schema LEARNER_schema and
--         click the Create button.
--         Your schema should now be listed along with schemas
--         INFORMATION_SCHEMA and PUBLIC.
--         We haven’t created our table yet, but we’ll come back to create that
--         after we’ve created our warehouse.

-- 1.3.8   To create your warehouse, click Compute -> Warehouses in the
--         navigation bar.

-- 1.3.9   Now click the + Warehouse button to create a new Warehouse.

-- 1.3.10  In the New Warehouse dialog box, name your warehouse LEARNER_WH.

-- 1.3.11  Choose X-Small for the size.

-- 1.3.12  Expand the Advanced Warehouse Options to confirm Auto Resume and Auto
--         Suspend are selected.

-- 1.3.13  Click the Create Warehouse button.
--         Your warehouse should now be listed and started.
--         Now let’s create one of the first tables we need for our business
--         analysts. It is a table that contains the regions and nations served
--         by Snowbear Air and it will used in many reports across all the
--         company’s business functions.
--         In order to create this table, we need to run SQL statements in a
--         worksheet. We will first create a folder. Then we will create a
--         worksheet in that folder and run the appropriate SQL statements
--         within the worksheet.
--         A worksheet is a container in which you can draft, revise, execute
--         and save SQL statements, and folders are used to organize those
--         worksheets.

-- 1.3.14  Click on Worksheets in the navigation bar.

-- 1.3.15  Click the ellipsis next to the New Worksheet button in the upper
--         right hand corner of the screen.
--         The three dots in a row just to the left of the blue +Worksheet
--         button is an ellipsis.

-- 1.3.16  Click New Folder.

-- 1.3.17  In the New Folder Dialog box, type WORKING WITH OBJECTS and then
--         click the Create Folder Button.
--         The folder should now be created and its contents (empty of course)
--         shown in the right hand pane. Notice that at the top-left of this
--         pane is a link titled Worksheets. This is a bread crumb trail that
--         you can use to go up a level.
--         Note that at the right of the folder name is a down arrow. If you
--         click it you will see an editable version of the folder name.
--         Now let’s create a worksheet.

-- 1.3.18  Click the New Worksheet button.
--         You should now see the contents of worksheet, which is a blank space
--         where you can type SQL statements. The bread crumb at the top-left of
--         the screen now contains the file name in a date/time format. The top
--         right of the screen contains:

-- 1.3.19  If your warehouse isn’t already selected, select it now by clicking
--         warehouse and selecting LEARNER_WH.

-- 1.3.20  Now complete the context of your worksheet by selecting LEARNER_db
--         and LEARNER_schema from the down arrow right above the empty SQL
--         pane.
--         Now let’s rename the worksheet. Remember, it’s in the upper-left hand
--         corner in date/time format.

-- 1.3.21  Rename the worksheet by clicking the arrow to the right of the
--         worksheet name, name it Region and nation in the dialog box and hit
--         enter.
--         Now let’s create the region_and_nation table. It’s a simple example
--         with a query that will populate it.
--         Remember, you can type the SQL commands directly into your worksheet.
--         You can also use the SQL code file provided for this lab at the start
--         of class. Just open the file in TextEdit (Mac) or Notepad (Windows),
--         and then copy and paste the SQL code directly into your worksheet.
--         It is not recommended that you cut and paste from this workbook pdf
--         as that sometimes results in errors.

-- 1.3.22  Run the SQL statements below in the SQL pane to create and populate
--         your table:

CREATE OR REPLACE TABLE region_and_nation (
      id INTEGER
    , region TEXT
    , nation TEXT
);

INSERT INTO region_and_nation
SELECT 
      N_NATIONKEY
    , R_NAME
    , N_NAME
FROM
    TRAINING_DB.TPCH_SF1.NATION N 
    INNER JOIN TRAINING_DB.TPCH_SF1.REGION R ON N.N_REGIONKEY = R.R_REGIONKEY
ORDER BY
    R_NAME, N_NAME;


-- 1.3.23  Now run the statement below to confirm your data was properly
--         inserted:

SELECT
    *
FROM
    region_and_nation
ORDER BY 
    REGION, NATION;

--         You should now see a result set in the bottom half of the pane.

-- 1.4.0   Creating Objects Exclusively with SQL Statements
--         Now let’s practice creating objects but strictly with SQL statements.
--         You’ll see how quickly and efficiently you can accomplish object
--         creation with SQL code.

-- 1.4.1   Using what you’ve learned, navigate to your folder for this lab,
--         create a new worksheet and name it SQL.

-- 1.4.2   Set the context
--         The context defines the default database/schema location in which our
--         SQL statements run, and the WH and role to use in support of this.
--         So, let’s set the context so we can run our SQL statements.
--         Run the following statements in the SQL portion of this worksheet.


USE ROLE TRAINING_ROLE;
USE WAREHOUSE LEARNER_WH;
USE DATABASE LEARNER_DB;
USE SCHEMA LEARNER_SCHEMA;



-- 1.4.3   Drop all the objects previously created
--         Now we’re going to drop everything we created with the Snowsight UI:


DROP TABLE region_and_nation;
DROP SCHEMA LEARNER_SCHEMA;
DROP DATABASE LEARNER_DB;
DROP WAREHOUSE LEARNER_WH;



-- 1.4.4   Create the warehouse by executing the following statement


CREATE WAREHOUSE LEARNER_WH
  WITH WAREHOUSE_SIZE = 'XSMALL'
       AUTO_SUSPEND = 180
       AUTO_RESUME = TRUE
       INITIALLY_SUSPENDED = TRUE;


--         Since we set INITIALLY_SUSPENDED = TRUE, the warehouse isn’t actually
--         running. Let’s confirm its status and then start the warehouse.

-- 1.4.5   Run the following statements to confirm the warehouse status and to
--         start it


-- Use this to confirm the warehouse's status
SHOW WAREHOUSES like 'LEARNER_WH';

-- RESUME will start the warehouse, SUSPEND will stop the warehouse
ALTER WAREHOUSE LEARNER_WH RESUME;

-- Now add this warehouse to the current context
USE WAREHOUSE LEARNER_WH;



-- 1.4.6   Run the following statements to create the required database objects,
--         to complete the context and to create and populate the table.


-- These statements create the database and schema
CREATE DATABASE LEARNER_DB;
CREATE SCHEMA LEARNER_SCHEMA;

-- These statements determine which database and warehouse will be used
USE DATABASE LEARNER_DB;
USE SCHEMA LEARNER_SCHEMA;

-- These statements create and populate the table
CREATE OR REPLACE TABLE region_and_nation (
      id INTEGER
    , region TEXT
    , nation TEXT
);

INSERT INTO region_and_nation
SELECT 
      N_NATIONKEY
    , R_NAME
    , N_NAME
FROM
    TRAINING_DB.TPCH_SF1.NATION N 
    INNER JOIN TRAINING_DB.TPCH_SF1.REGION R ON N.N_REGIONKEY = R.R_REGIONKEY
ORDER BY
    R_NAME, N_NAME;
    
-- Use this statement to confirm the table was populated    
SELECT
    *
FROM
    region_and_nation
ORDER BY 
    REGION, NATION;


--         You should now see the results of your query in the query pane.

-- 1.5.0   Key Takeaways
--         You can create database objects both via the Snowsight UI and by
--         executing SQL code in a worksheet.
--         Data Sharing options such Data Marketplace can be accessed via
--         Snowsight by users with the appropriate privileges.
--         You can browse database objects and view their details by using the
--         navigation bar, the Object Selection and Object Details panes.
--         The context of a worksheet session consists of a role, schema,
--         database and warehouse.
--         The context of a worksheet can be set via the Snowsight UI or via SQL
--         statements.
--         A Snowflake user can create folders in which to save and organize
--         worksheets.
