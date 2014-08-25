## Codebook Affecting Project2's Tidy2 & run_analysis

As explained as part of the 'run_analysis.R' file, I had to change some nomenclature on the directories' files so as to have them make sense to me:

- subject was changed to Person
- y was changed to Activity as well as activity_* to Activity_*
- all file references included the directory downloaded which contained the dataset. May seem irrelevant, but for a newbie still trying to remember the basics of 8 weeks ago, is an important step, especially when subtleties in the instructions may indicate that the reviewers may not have the data available from where it would be called. Hope this helps someone or I'll be the only one

Started the merge (as required in step 1) buy analyzing the data on both directories Train & Test to find out whether or not they contained similar column names that would allow for a successful merge and not just a file containing a mash-up of data, but rather where it can be realted.

Read the tables, changed some of the column names as described above, and assigned 'as.numeric' class. Had to do the merge of each directory due to the various files within each of them so as to have clean data in Train (where the subject/Person, activity/Activity, and outcomes were organized) & Test as well.

Bound the new datasets containing the merged files (Training & Test) within the Train & Test directories. This concluded the first requirement of merging the data of these directories.

The following items, 2 & 4, were much more difficult and had to resort to several hours of visiting the class forums, stackoverflow, publications from O'Reilly, and some youtube videos to determine that the best approach was using grepl and gsub respectively to extract the values that matched only *-mean and *-standard as well as label the data by replacement.

Step 3 was a little easier, but still convoluted given the inexperience of your writer in discerning when is the rigth time to use a certain data set. A simple merge of the dataset that contained the mean & stdDev and the appropriately named 'activity_labels' file was performed after renaming the columns to a more 'legible' names.

Step 5 had to deal with the 'listening' to what is asked and this case I had to determine what wasn't used for the file and use aggregated data to reduce the number of items that would have to merge with the labels we had created previously. Created the text file that needed to be uploaded for student review in the next phase of the eval process.
