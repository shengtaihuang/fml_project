library(data.table)

# Load emoji table to replace with ASCII code
data(emojis, package = "emoji")
emojis <- emojis[emojis$aliases != "character(0)", ]
emojis$alias <- sapply(emojis$aliases, function(a) {
  a <- gsub(pattern = "^c\\((.+)\\)$",
            replacement = "\\1",
            x = a)
  a <- gsub(pattern = '["]',
            replacement = "",
            x = a)
  a <- strsplit(x = a, split = ", ")[[1]]
  paste0(":", a, ":")
})

# Table for not groups
not_groups <- fread("not_group_table.csv", header = T, data.table = F)
# Conservative
con_post <- fread("data/con_post.csv", data.table = F)
con_post <- con_post[!con_post$`User Name` %in% not_groups$`Not Conservative`, ]
con_post <- con_post[con_post$Type == "Status", ]
con_post <- con_post[order(con_post$Message), ]
con_post <- con_post[!grepl(pattern = "Trudeau|Canada|Canadian|UK", x = con_post$Message, ignore.case = T), ]
# Remove username
con_post$Message <- gsub(pattern = "@[^ ]+", replacement = "", x = con_post$Message)
# Remove url
con_post$Message <- gsub(pattern = "http[^ ]+", replacement = "", x = con_post$Message)
# Replace emoji
for (i in 1:nrow(emojis)) {
  con_post$Message <- gsub(pattern = emojis$emoji[i],
                           replacement = emojis$alias[i],
                           x = con_post$Message)
}
# fwrite(x = con_post, file = "con_post.csv")

# Liberal
lib_post <- fread("data/lib_post.csv", data.table = F)
lib_post <- lib_post[!lib_post$`User Name` %in% not_groups$V5, ]
lib_post <- lib_post[lib_post$Type == "Status", ]
lib_post <- lib_post[order(lib_post$Message), ]
lib_post <- lib_post[!grepl(pattern = "Trudeau||Canada|Canadian", x = lib_post$Message, ignore.case = T), ]
# Remove username
lib_post$Message <- gsub(pattern = "@[^ ]+", replacement = "", x = lib_post$Message)
# Remove url
lib_post$Message <- gsub(pattern = "http[^ ]+", replacement = "", x = lib_post$Message)
# Replace emoji
for (i in 1:nrow(emojis)) {
  lib_post$Message <- gsub(pattern = emojis$emoji[i],
                          replacement = emojis$alias[i],
                          x = lib_post$Message)
}
# fwrite(x = lib_post, file = "lib_post.csv")

# Dad
dad_post <- fread("data/dad_post.csv", data.table = F)
dad_post <- dad_post[!dad_post$`User Name` %in% not_groups$`Not Dad`, ]
dad_post <- dad_post[dad_post$Type == "Status", ]
dad_post <- dad_post[order(dad_post$Message), ]
# Remove username
dad_post$Message <- gsub(pattern = "@[^ ]+", replacement = "", x = dad_post$Message)
# Remove url
dad_post$Message <- gsub(pattern = "http[^ ]+", replacement = "", x = dad_post$Message)
# Replace emoji
for (i in 1:nrow(emojis)) {
  dad_post$Message <- gsub(pattern = emojis$emoji[i],
                           replacement = emojis$alias[i],
                           x = dad_post$Message)
}
# fwrite(x = dad_post, file = "dad_post.csv")

# Mom
mom_post <- fread("data/mom_post.csv", data.table = F)
mom_post <- mom_post[!mom_post$`User Name` %in% not_groups$`Not Mom`, ]
mom_post <- mom_post[mom_post$Type == "Status", ]
mom_post <- mom_post[order(mom_post$Message), ]
# Remove username
mom_post$Message <- gsub(pattern = "@[^ ]+", replacement = "", x = mom_post$Message)
# Remove url
mom_post$Message <- gsub(pattern = "http[^ ]+", replacement = "", x = mom_post$Message)
# Replace emoji
for (i in 1:nrow(emojis)) {
  mom_post$Message <- gsub(pattern = emojis$emoji[i],
                           replacement = emojis$alias[i],
                           x = mom_post$Message)
}
# fwrite(x = mom_post, file = "mom_post.csv")
