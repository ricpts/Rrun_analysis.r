## My run_analysis file info

I tried to follow the instructor's directions to the project so as to deliver it in such a way that 
would make sense:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

  1. Before merging the contents of the directories 'Train' & 'Test' I had to check if they had info that was compatible in both. Read the files and assigned 'as.numeric' values to the column headings; visited the 'subject.txt' file & changed the name of the column to a name that made more sense to me at the moment. Repeated this for the other files within both directories. Once both had similar column names, so as to be able to merge them w/o difficutly, proceeded to merge and create the first - of what became many data sets, maybe as the courses progress, I'll be able to be more succint with my code, but for now it is as 'tidy' as I could with this knowledge some online forums (class) and some other resources such as O'Reilly's 'Learning R' (Cotton 2013)
  
  2. Moved on to the 'features.txt' file which contained all the different measures for all the variables and thus, concentrated on 'mean' & 'standard[deviation]' to extract such info alone generating a couple more datasets that could give me the information requested
  
  3. Changed the cols names in order to give it descriptive names to the dataset
  
  4. Very difficult to find which package and command to use to best have a way of applying something like a wildcard to disregard the name of the activity-measure(mean/stdDev). Took several hours, but 'gsub' seemed to do the work quite nicely
  
  5. Created the lenghtier 'Tidy2' dataset that encompasses the vars averages and placed as a separate dataset in text format for peer eval.
  
  