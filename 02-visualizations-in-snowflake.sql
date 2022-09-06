
-- 2.0.0   Visualizations in Snowflake

-- 2.1.0   Lab Introduction

-- 2.1.1   Purpose
--         The purpose of this lab is to show you how to use the visualization
--         features and tools available in Snowsight. Specifically, you’ll learn
--         how to leverage Contextual Statistics for specific columns in a table
--         in order to gain quick insights into data. Also, you’ll learn how to
--         create a dashboard from an existing query.
--         If you’re a data analyst, you’ll learn skills that are immediately
--         useful to your job. If you’re a data engineer, you’ll gain insight
--         into how the data you provide to users is used and become familiar
--         with the tools they use.

-- 2.1.2   What you’ll learn

-- 2.1.3   How to complete this lab
--         In order to complete this lab, you can type the SQL commands below
--         directly into a worksheet. It is not recommended that you cut and
--         paste from the workbook pdf as that sometimes results in errors.
--         You can also use the SQL code file for this lab that was provided at
--         the start of the class. You would simply need to open it in TextEdit
--         (mac) or Notepad (Windows), and then copy and paste the SQL code
--         directly into a worksheet.

-- 2.2.0   Creating a Dashboard

-- 2.2.1   Scenario
--         Snowbear Air is interested in seeing a year-by-year summary of gross
--         sales. You’ve been asked to write a query with a graph and share it
--         via a Snowflake dashboard. You’ve decided to use the
--         PROMO_SALES_CATALOG_STAR schema to accomplish your task.
--         Let’s get started!

-- 2.2.2   Using skills you’ve already learned, create a new folder called
--         Visualizations in Snowflake.

-- 2.2.3   Within your new folder, create a new worksheet called Dashboard Data.

-- 2.2.4   Set the context by executing the statements below in your worksheet:

USE ROLE TRAINING_ROLE;
USE DATABASE SNOWBEARAIR_DB;
USE SCHEMA PROMO_CATALOG_SALES_STAR;
USE WAREHOUSE LEARNER_WH;


-- 2.2.5   Now let’s write our query. Just take a moment to review it. You don’t
--         need to run it.

SELECT
         *
FROM 
        YEAR Y
        INNER JOIN QUARTER Q ON Y.YEAR_ID = Q.YEAR_ID
        INNER JOIN MONTH M ON Q.QUARTER_ID = M.QUARTER_ID
        INNER JOIN ORDER_DATE_DIM D ON M.MONTH_ID = D.MONTH_ID
        
        INNER JOIN REVENUE_FACT RF ON D.DATE_ID = RF.ORDER_DATE_ID
        
        INNER JOIN CUSTOMER_DIM C ON RF.CUSTOMER_ID = C.CUSTOMER_ID
        INNER JOIN NATION N ON C.NATION_ID = N.NATION_ID
        INNER JOIN REGION R ON N.REGION_ID = R.REGION_ID
        
        INNER JOIN PART_DIM P ON RF.PART_ID = P.PART_ID
        INNER JOIN SUPPLIER_DIM S ON RF.SUPPLIER_ID = S.SUPPLIER_ID

ORDER BY
            Y.YEAR; 

--         As you can see, you are selecting *, which returns all the fields.
--         However, all you need is column YEAR from the YEAR table and the sum
--         of GROSS_REVENUE from the REVENUE_FACT table.
--         The Auto-Complete Feature
--         The auto-complete feature suggests SQL Keywords, databases, schemas,
--         tables, field names, functions and other object types while you are
--         typing.
--         By using auto-complete, you can work faster and make fewer typos.

-- 2.2.6   Add the YEAR column using auto-complete
--         Remove the asterisk and type Y and then a period as shown below:
--         Auto-complete
--         As you can see, when you type the period the auto-complete feature
--         generates a list of fields from the YEAR table. Select YEAR and hit
--         enter.

-- 2.2.7   Add the next column using auto-complete
--         Add the column containing the the sum of the gross revenue. Type a
--         comma followed by SUM, note that as you type SUM the auto-complete
--         feature will offer you the choice of a SUM function.
--         auto-complete recognizing the SUM function
--         You should now have the query below. Note that we’ve added a GROUP BY
--         clause.

SELECT
          Y.YEAR
        , SUM(RF.GROSS_REVENUE) AS SUM_GROSS_REVENUE
       
FROM 
        YEAR Y
        INNER JOIN QUARTER Q ON Y.YEAR_ID = Q.YEAR_ID
        INNER JOIN MONTH M ON Q.QUARTER_ID = M.QUARTER_ID
        INNER JOIN ORDER_DATE_DIM D ON M.MONTH_ID = D.MONTH_ID
        
        INNER JOIN REVENUE_FACT RF ON D.DATE_ID = RF.ORDER_DATE_ID
        
        INNER JOIN CUSTOMER_DIM C ON RF.CUSTOMER_ID = C.CUSTOMER_ID
        INNER JOIN NATION N ON C.NATION_ID = N.NATION_ID
        INNER JOIN REGION R ON N.REGION_ID = R.REGION_ID
        
        INNER JOIN PART_DIM P ON RF.PART_ID = P.PART_ID
        INNER JOIN SUPPLIER_DIM S ON RF.SUPPLIER_ID = S.SUPPLIER_ID
        
GROUP BY
            Y.YEAR

ORDER BY
            Y.YEAR; 


-- 2.2.8   Run the query and check the results
--         You should see the results below:
--         Query results
--         Note that there are two kinds of information to the right of the
--         result. There are the Query Details pane and the Contextual
--         Statistics panes. The Query Details pane shows the duration of the
--         query and the number of rows returned. The Contextual Statistics
--         panes help you make sense of your data at a glance.

-- 2.2.9   Click the Query Details pane
--         Query results
--         Note that in addition to the query duration and the rows scanned, it
--         shows the end time of the query, the role used and the warehouse
--         used.

-- 2.2.10  Click on the section with the graph to apply a filter
--         Note there are two panes with Contextual Statistics, one that shows a
--         graph of data from 2012 to 2018 and is labeled YEAR, the other that
--         shows the highest and lowest values in the data set returned and is
--         labeled SUM_GROSS_REVENUE. The contextual statistics, one for each
--         column returned by the query, can be used interactively as filters on
--         the query result. Let’s explore how they work.

-- 2.2.11  Click on the YEAR filter
--         You should now see the filter. On the left is the data and the YEAR
--         column is highlighted. On the right is the filter itself.
--         YEAR filter

-- 2.2.12  Click on the leftmost column in the graph’s filter
--         Now the results should be filtered for 2012 only.
--         YEAR filter, 2012

-- 2.2.13  Select 2012 and 2013
--         Note that there are two oval selectors beneath the chosen column in
--         the filter’s graph. Click, hold and drag the right-most selector to
--         include both 2012 and 2013. Your filter should appear as shown below:
--         YEAR filter, 2012-2013
--         Now click different bars, or select any combination of multiple bars
--         to see how the filter changes the data shown.

-- 2.2.14  Click the Clear filter button
--         The filter should appear as it did before.

-- 2.2.15  Click the Clear selection button
--         This should clear the column selected and you should see the Query
--         Details pane and the YEAR and SUM_GROSS_REVENUE filters.

-- 2.2.16  Click the SUM_GROSS_REVENUE filter
--         The filter should appear as below. Click the columns and observe how
--         the data is filtered. Clicking between the columns will display the
--         following message: Query produced no results. That’s because there is
--         a gap between the highest value in the left-most bar and the lowest
--         value of the right-most bar.
--         SUM_GROSS_REVENUE filter

-- 2.2.17  Click the Clear filter and Clear selection buttons

-- 2.2.18  Move the worksheet to the Dashboards
--         Now let’s create our dashboard. You can do this by either creating a
--         brand new dashboard, or by moving an existing worksheet to
--         Dashboards. Let’s try this second method.

-- 2.2.19  Click the down arrow next to the worksheet name (Dashboard Data)

-- 2.2.20  Select Move to, then New dashboard from the dialog box.
--         Move to Dashboards

-- 2.2.21  Name the new dashboard Gross Sales and click the Create Dashboard
--         button.
--         You should now see a screen that looks like the worksheet itself.
--         This is where you can edit the query that creates the data for the
--         dashboard. In the upper-left hand corner there should be a Return to
--         Gross Sales link.

-- 2.2.22  Click the Return to Gross Sales link
--         You should now see the dashboard but in presentation mode.
--         Presentation mode
--         The data itself is in a tile that is present on the dashboard. Tiles
--         are used to present data or graphs in the dashboard.
--         Now let’s add a graph in a brand new tile.

-- 2.2.23  Click the plus sign just below the home button and the dashboard name
--         to create a graph
--         A dialog box should appear with a New Tile from Worksheet button.

-- 2.2.24  Click the New Tile from Worksheet button
--         A new worksheet should appear with no SQL code.

-- 2.2.25  Paste the query below into the empty pane.

SELECT
          Y.YEAR
        , SUM(RF.GROSS_REVENUE) AS SUM_GROSS_REVENUE
       
FROM 
        YEAR Y
        INNER JOIN QUARTER Q ON Y.YEAR_ID = Q.YEAR_ID
        INNER JOIN MONTH M ON Q.QUARTER_ID = M.QUARTER_ID
        INNER JOIN ORDER_DATE_DIM D ON M.MONTH_ID = D.MONTH_ID
        
        INNER JOIN REVENUE_FACT RF ON D.DATE_ID = RF.ORDER_DATE_ID
        
        INNER JOIN CUSTOMER_DIM C ON RF.CUSTOMER_ID = C.CUSTOMER_ID
        INNER JOIN NATION N ON C.NATION_ID = N.NATION_ID
        INNER JOIN REGION R ON N.REGION_ID = R.REGION_ID
        
        INNER JOIN PART_DIM P ON RF.PART_ID = P.PART_ID
        INNER JOIN SUPPLIER_DIM S ON RF.SUPPLIER_ID = S.SUPPLIER_ID
        
GROUP BY
            Y.YEAR

ORDER BY
            Y.YEAR; 


-- 2.2.26  Rename this worksheet
--         Just like with the worksheets we created earlier, a time and date
--         should appear at the top of the worksheet. Click the time/date and
--         change the time and date to Dashboard Graph.

-- 2.2.27  Run the query
--         The result pane identical to the one we saw before should appear.

-- 2.2.28  Click the Chart button
--         The Chart button is just above the result pane, next to the blue
--         results button.
--         A line graph should be chosen by default:
--         Presentation mode

-- 2.2.29  Click Return to Gross Sales in the upper-left hand corner
--         You should now see a completed dashboard like the one shown below:
--         Presentation mode
--         Now let’s see how to share our dashboard.

-- 2.2.30  Click the share button in the upper-right hand corner
--         In this dialog box you can search for and invite someone to view and
--         use this dashboard.
--         Share dialog box
--         You don’t have anyone to share with, so we’ll just walk you through
--         the process so you understand it. It’s so simple!
--         First, you would select a user by typing their user name:
--         Sharing with a user
--         Next you would select a permission level for them, such as Edit, View
--         + run, or just View results:
--         Granting permissions to user
--         Then you would click the Done button. That’s it!

-- 2.3.0   Key Takeaways
--         The auto-complete feature is a useful tool for writing queries. It
--         helps you work faster and with fewer typos.
--         While conducting ad-hoc analyses you can use filters to gain insights
--         into your data.
--         You can create dashboards out of existing worksheets.
--         Snowflake makes it super-easy to share worksheets with colleagues.
