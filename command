install.packages(c(
  "Ecdat",
  "janitor",
  "plm",
  "pwt9",
  "quarto",
  "renv",
  "rio",
  "shiny",
  "targets",
  "testthat",
  "tidyverse",
  "tibble",
  "usethis"
))

library(Ecdat)
library(janitor)
library(plm)
library(pwt9)
library(quarto)
library(renv)
library(shiny)
library(targets)
library(testthat)
library(tidyverse)
library(tibble)
library(usethis)
library(rio)


mtcars <- rio::import("mtcars.csv")
mtcars_dta <- rio::import("mtcars.ta")
mccars_sas <- rio::import("mtcars.sas7bdat")

multi_xlsx <- rio::import_llist("multi.xlsx")

paths <- Sys.glob("unemployment/*.csv")

unemployment <- rio:: import_list(paths, rbind=True)


urls <- c("https://raw.githubusercontent.com/b-rodrigues/modern_R/master/datasets/unemployment/unemp_2013.csv", 
    "https://raw.githubusercontent.com/b-rodrigues/modern_R/master/datasets/unemployment/unemp_2014.csv", 
    "https://raw.githubusercontent.com/b-rodrigues/modern_R/master/datasets/unemployment/unemp_2015.csv", 
    "https://raw.githubusercontent.com/b-rodrigues/modern_R/master/datasets/unemployment/unemp_2016.csv")
    
import_lists(urls)

lapply(urls, read.csv) %>% dplyr::bind_rows()



## use same packages for every project
if(!file.exists("~/.Rprofile")) # only create if not already there
    file.create("~/.Rprofile")    # (don't overwrite it)
file.edit("~/.Rprofile")



data("starwars")

starwars %>%
  filter(!is.na(hair_color)) %>%
  group_by(sex) %>%
  summarise(mean_mass = mean(mass, na.rm=TRUE))
  
  
  
nchar(100000)
nchar("10000")


starwars %>%
  filter(!is.na(hair_color)) %>%
  group_by(sex) %>%
  summarise(mean_mass = mean(mass, na.rm=TRUE))
  
  
list("mean" = mean, "std" = std)
  
equivalent to
  
tibble::lst(mean, std)

so 


mtcars <- mtcars %>%
mutate(gear = factor(gear))

summary (lm(mpg ~ gear, data = mtcars))

model removes the row of missing data
  
  
## T 
iris %>% lapply(typeof)

iris %>% lapply(class)



starwars %>% filter(name == "Luke Skywaler") %>% pull(films)

#pull vs select:
#select keeps the column within the dataframe


starwars %>% select(films)

select gives you what inside the cell

starwars %>%
  filter(name == "Luke Skywalker") %>%
  pull(films) %>%
  length()
  
# will be 1

#if I want w

starwars %>% colnames




starwars %>% pull("films")

unemployment %>% group_by(commune)

unemployment %>% 
  janitor::clean_names() %>%
  filter(commune %in% c("Luxembourg, "Esch-sur-Alzette", wiltz)) %>%
  group_by(commune) %>%
  nest() %>%
  mutate(heads = map(data, \(x) head(x,1)))

head takes first row  

#division and dataframe becom variables

unemp <- unemployment %>% 
  janitor::clean_names() %>%
  filter(commune %in% c("Luxembourg", "Esch-sur-Alzette", "wiltz")) %>%
  group_by(commune) %>%
  nest() %>%
  mutate(plot = map2(.x = data, .y = commune, ~ggplot(dadta = .x) +
        theme_minimal() +
        geom_line(aes(year, unemployment_rate_in_percent, group = 
        labs(title = paste("Unemployment in", .y))))
        %>%
  mutate(saved_plots = map2(.x = commune, 
          .y = plot,
          \ (x,y)ggsave(paste0("plot_for_", .x, ".pdf),
          .y)))

saveRDS(unemployment, "unemployment RDS")


paste(c("aa", "aui", "bbb", ""sr"), collapse = ", ")





  mutate(plot = map2(.x = data, .y = commune, ~ggplot(data = .x) +
        theme_minimal() +
        geom_line(aes(year, unemployment_rate_in_percent, group = 1)) +
        labs(title = paste("Unemployment in", .y))),
        gsave(paste0("plot_for_", .x, ".pdf"),
        .y)
        
        
        mutate(saved_plots = map2(.x = commune, 
          .y = plot,
          ggsave(paste0("plot_for_", .x, ".pdf"),
          .y)))
          
          
          )%>%



SETTER

names(mu_list) <- c("a", "b")

GETTER

my_list
