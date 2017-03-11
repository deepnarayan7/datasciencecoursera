# datasciencecoursera

### Working directory:

Should have all six test and trial data, feature.txt and activity_labels.txt.


### Code logic:
1. Load all the files in different variables.
2. Assign names to the columns from features.txt.
3. Add Y and Sub data to the X data. Variable name used "candidate" and "activity".
4. Make activity a factor.
5. Add another column at the end called status variable to trac if trial or test data.
6. Perform 2 - 5 for both trial and test data and merge them using rbind.

7. To take mean and std data search for mean() and std() in column name and subset the data.

8. Group the dataset accordingto candidate and activity, using group_by from dplyr package.
9. Use summarize_each to get mean of each variable for each canditate, each activity.
10. Write it to a file.
