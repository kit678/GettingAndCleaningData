## run_analysis.R description

* Step 1:
  * Read all the test and training data separately. Then combine them one by one to form one whole data set ( subject + activities + X Observations)
  * Name the first two columns of this dataset to reflect the "subject" and "activity" performed

* Step 2:
  * Read the features from features.txt.
  * Filter it to only leave features that are either means ("mean()") or standard deviations ("std()").  leaving out meanFreq() is
  * Now, Subjects, labels and the described features are the columns of the new data frame formed.

* Step 3:
  * Read the activity labels from activity_labels.txt and replace the numbers with the text in our consolidated data.

* Step 4:
  * Make a column list (includig "subjects" and "label" at the start)
  * Tidy-fy the list by removing all non-alphanumeric characters and converting the result to lowercase
  * Apply the now-good-columnnames to the data frame
  
* Step 5:
  * Create a new data frame by finding the mean grouping by subject and activity. It's done by `aggregate()` function
  
* Final step:
  * Write the new tidy set into a text file called tidy.txt