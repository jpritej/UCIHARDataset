Codebook
========
This project stores tidy data in the file *tidydata.txt* extracted from the raw data that can be found in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

To load the tidy data, run the code:
```{r}
tidydata<-read.table("tidydata.txt")
```

The resulting *tidydata* object is a matrix with the mean values of some features from the raw data. Each row corresponds to a different subject and a different activity. The row names follow the format ID.activity where ID identifies the subject and 

In summary, the matrix has the form:

                | mean(feature) |    ...    | mean(feature) |
----------------|---------------|-----------|---------------| 
  ID.activity   |     value     |    ...    |    value      |   
    $\vdots$    |       .       |  $\vdots$ |    $\vdots$   |   
  ID.activity   |     value     |    ...    |    value      |   

