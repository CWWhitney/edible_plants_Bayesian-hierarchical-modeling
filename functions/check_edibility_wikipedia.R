# Load necessary libraries
library(rvest)
library(dplyr)
library(stringr)

# Define a function to search Wikipedia and classify edibility
check_edibility_wikipedia <- function(species_name) {
  # Format species name for Wikipedia URL
  formatted_name <- gsub(" ", "_", species_name)
  url <- paste0("https://en.wikipedia.org/wiki/", formatted_name)
  
  # Try to read the page; handle errors if the page doesn't exist
  tryCatch({
    page <- read_html(url)
    
    # Extract the main text from the Wikipedia page
    text_content <- page %>%
      html_nodes("p") %>%  # Extract all paragraphs
      html_text() %>%
      paste(collapse = " ")  # Combine all text into one string
    
    # Convert text to lowercase for easier searching
    text_content <- tolower(text_content)
    
    # Define keywords for classification
    edible_keywords <- c("edible", "consumed", "food", "eaten", "nutrition")
    toxic_keywords <- c("toxic", "poisonous", "inedible", "harmful")
    
    # Check for presence of keywords
    if (any(str_detect(text_content, edible_keywords))) {
      return("edible")
    } else if (any(str_detect(text_content, toxic_keywords))) {
      return("toxic")
    } else {
      return("unknown")
    }
  }, error = function(e) {
    # Return 'unknown' if the page doesn't exist or an error occurs
    return("unknown")
  })
}

