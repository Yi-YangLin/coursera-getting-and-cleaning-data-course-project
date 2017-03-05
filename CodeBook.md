#Code Book for Getting and Cleaning Data Course Project

This code book is a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information for tidy_data.txt.


##variables

*subject: 
integer, range from 1 to 30

*activity:
6 possible values include:
WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING

*features:
which is not shown directly in the file, but we use it to correct the column names in the dataset.

*averages_data:
include two kinds of domains:
timeDomain
frequencyDomain

*two kinds of components:
Accelerometer
Gyroscope

*And some metrics include:
Mean
StandardDeviation
Frequency

For example, 
fBodyGyroscopeStandardDeviationX means standard deviation of the frequency domain Gyroscope body velocity in X direction.











