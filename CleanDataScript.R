sub_test <- read.table("subject_test.txt")
sub_train <- read.table("subject_train.txt")
features <- read.table("features.txt")
y_test <- read.table("y_test.txt")
x_test <- read.table("x_test.txt")
y_train <- read.table("y_train.txt")
x_train <- read.table("x_train.txt")

y_join <- rbind(y_test, y_train)
x_join <- rbind(x_test, x_train)
sub_join <- rbind(sub_test, sub_train)

y_join$V1 <- factor(y_join$V1)
levels(join$V1) <- list( walking = c("1"), walking_upstairs = c("2"), walking_downstairs = c("3"), sitting = c("4"), standing = c("5"), laying = c("6"))
colnames(y_join) = c("activity")
colnames(sub_join) = c("subject")

colnames(x_join)= features[,2]

extract <- function(df){
        df_col<- ncol(df)
        for (i in seq(1, df_col)){
                #cat(names(df)[i])
                if (!(grepl("mean", names(df)[i]) | grepl("std", names(df)[i]))){
                        df<- df[-i]
                        
                }
                
                
                
        }
        
        
        df
}
x_join_extrac <- extract(x_join)
tidyData <- cbind(sub_join, y_join, x_join_extrac)

extract2 <- function(df){
        df_col<- ncol(df)
        for (i in seq(1, df_col)){
                #cat(names(df)[i])
                if (!(grepl("mean", names(df)[i]))){
                        df<- df[-i]
                        
                }
                
                
                
        }
        
        
        df
}

x_join_extracV2 <- extract2(x_join)
tidyDataV2<- cbind(sub_join, y_join, x_join_extracV2)