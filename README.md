# Data Science Capstone-Smart Keyboard
The goal of this exercise is to create a product to highlight the prediction algorithm that you have built and to provide an interface that can be accessed by others. For this project you must submit:

    A Shiny app that takes as input a phrase (multiple words) in a text box input 
    and outputs a prediction of the next word.
    A slide deck consisting of no more than 5 slides created with R Studio Presenter 
    
    
  # Included files
  
  * Shinny Apps 
     * nextword/UI.R Client Code
     * nextword/Server.R Server code
     * nextword/global.R global parameters 
     * nextword/predictNextword.R helper function
     * nextword/data: model data
 * Model Generation
    * Final_project_week3.Rmd: rmd markup file with code 
    * Final_project_week3.html: Html file and report 
 * Final Presentation
    * Rstudio Presentation
    * html file output
   
  # User Guide
  
The Sinny Apps <https://sanjayk98.shinyapps.io/NextWord/>

- Type partial word, it will predict the complete word (Ex:lov->love)
- Type one word, it will predict next pair (Ex: Happy Holiday)
- Type partial sentence, it will predict next word
- It shows top 3 likely words and includes log probablity and N-Gram being used

# Reference
https://rpubs.com/sanjayk98/461828
http://rpubs.com/sanjayk98/461886
