# plotIndustryContribToPol
shiny app for visualizing contributions to politician's campains (federal [senate, house, president] and state)

### Description

This is the source codoe for the app that can be found here: https://sorens.shinyapps.io/plotIndustryContribToPol/

This app is a method for visualizing data from the sunlight Foundation's influence explorer API.  It allows the user to specify the name of a Politician in a text box and then see either 1) a bar graph of the contributions to the polticians' campaign for a given year or 2) a line graph showing the relative contributions of industries for that politician over all the years available in the sunlight foundation api.

### Usage

The app can either be used online via the above link (possibly depending upon how many live hours I have left on shinyapps.io) or downloaded and run on a local local machine. 

if you wish to download the app, clone it as a source. You will need to have several R packages installed - 'shiny' 'ggplot2' and 'rsunlight'. All of these are available in cran. with these libraries installed, you can open an R interactive session and set the wd to be the source directory for this package. shiny::runApp() will start the app. The app will expect a file called "SunlightapiKey.txt" in the working directory. This file is just a unicode-8 text file with an API key from the sunlight foundation (you will have to sign up for your own). 

Let me know if this doesn't work for you. 


### To Do:
- make app into its own R package
- handle name collisions more gracefully. Right now, if a text querry to the runslight ie_entitites API returns more than one entity, the default behavior is to return the first entry. This mostly seems to work fine, but it'd be better to have the user be able to override this behavior ( probably do this w/ context dependent UI)
- change search function. Right now, the app blindly querries the sunlight foundation api everytime the text input to the polSearchString field is updated. I need to limit this as I'm hitting the API with unnecessary calls
- provide some partial string matching - From what I can tell, partial matching isn't implemented via sunlight, I'll have to do this on my end.

