Data Science Capstone-Final Project
========================================================
author: Sanjay Kumar
date:    27-JAN-2019
autosize: true

Smart Keyboard Application
========================================================

 ![Screen Shot](https://github.com/sanjayk98/predictNextWord/blob/master/nextword.png)
 
 
 
 
 
 <https://github.com/sanjayk98/predictNextWord/blob/master/nextword.png>

Features
========================================================

The Sinny Apps <https://sanjayk98.shinyapps.io/NextWord/>

- Type partial word, it will predict the complete word (Ex:lov->love)
- Type one word, it will predict next pair (Ex: Happy Holiday)
- Type partial sentence, it will predict next word
- It shows top 3 likely words and includes log probablity and N-Gram being used

Modeling
========================================================
It uses N-Gram language modeling to predict next word
\[
\begin{eqnarray}
P(w_{a}) & = & \frac{C(w_{a})}{N}\\
P(w_{a}|w_{b}) & = & \frac{C(w_{a},w_{b})}{\sum_{w_{b}}C(w_{a},w_{b})}\\
P(w_{a}|w_{b}) & \sim &  \frac{C(w_{a},w_{b})}{C(w_{b})}\\
Laplace correction\\
P(w_{a}) & = & \frac{C(w_{a})+\delta}{N+V*\delta}\\
\end{eqnarray}
\]
where N #words in trainingset, V- #words in vocubulary delta-Tuning parameter 

Ref: <http://ssli.ee.washington.edu/WS07/notes/ngrams.pdf>

Prediction Algorithm and User Experience
========================================================
We use recurrsive back-off algorithm to predict the next word

- First 4-Gram modeling is used if none found then it fails back to 3-gram, 2-gram and 1-gram
- We train the model and save the data in RDS format
- It loads model data during lanch of shinny apps 
- Prediction is done based on data loaded in memory for a better user experience
- We have used up to 4-Gram language model and discard any thing which ranks below 1 million probablity ranks


Code
========================================================
Github <https://github.com/sanjayk98/predictNextWord>

Rpub <http://rpubs.com/sanjayk98/461828>

Shinny Apps <https://sanjayk98.shinyapps.io/NextWord/>

Model Data <https://github.com/sanjayk98/predictNextWord/tree/master/NextWord/data>
 
Lesson Learned and Next Step
========================================================
- When we used inline function to update and summarize data, the performance was terriable
- We used direct data.table method to manupulate data. Details of tips and technique can be found here <https://jangorecki.github.io/blog/2015-12-11/Solve-common-R-problems-efficiently-with-data.table.html>
- One can detect the sentence boundary before splitting the string. It will greatly improve model performance
- Spell Check and grammar check can be used to rule out words with same probablity
