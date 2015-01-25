# Getting-and-Cleaning-Data-Course-Project
This is the for the using the basic R code run_analysis.R
To run the code properly will drequire the dplyr packages, which can be installed in the by install.packages ("dplyr")
the workng directory should be set to the data folder UCI HAR Dataset
The workflow for the code is as follows, detail break down is in the code comments

1.Load the different data sets into R, includes the data and the asscoiated variables
2.Two different dataframe is created, one for the test data and one for the train data
3.The two dataframe is combine into 1 single dataframe
4.The names for col are set with text and from the feature list included
5.A new dataframe is subsetted to contian only mean and std using the features.txt as a guide line
6.Activiites are gsub with the activity names list in the activity_tables.txt 
7.The data is sorted and combined using pipelines and sumarrize_each
8.The data is output to finaltable.txt

See cook book for details of the column values, listed as the first row

