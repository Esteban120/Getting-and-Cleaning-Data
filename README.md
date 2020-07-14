# Getting-and-Cleaning-Data
This repository contains several files which are explained here.
1. run_analysis.R: a file that contains the code needed to reproduce the tidy dataset. 
2. Codebook.txt: the codebook that explains how the features were firstly calculated and how they were grouped by in the resulting tidy dataset.
   It also contains the name and the type of each column in the tidy dataset.
3. tidy_dataframe.txt: the resulting dataset obtain by implementing the code in the run_nalaysis.R file.
 
 
To make the tidy data set, the following steps were taken: Firstly, the iformation was uploaded to R and merged in order to get a complete dataframe with information 
of all the subjects involved in the test. Secondly, the resulting dataframe was filtered to get only the columns with information about the mean and standard deviation
of the variables. The columns chosen were the ones that contain mean() or std() in their names.  Some minor adjustments were made to get only plain text in the variables' names.
Lastly, the mean of the columns was calculated and grouped by individual and activity.
