# ShinyApplication
Developing Data Products - Course Project Week 4

# AirQuality
Shiny application allowing the manipulation of the Airquality dataset from the datasets package to do basic data exploration.

## Dependencies
You will need the following libraries installed to run this shiny application:
* shiny
* ggplot2

## Getting Started

### Histogram panel

In the histogram panel you can select three different variables:

* Ozone
* Solar radiation
* Wind

from the air quality dataset which contains daily air quality measurements in
New York State (May to September) and inspect their distribution.

Press submit once you made the choice

### Scatterplot panel

In the scatterplot panel you can examine whether solar radiation and wind are related to measured ozone. 
You can select specific months or plot the data for all the sample.

The plots include a linear regression model fitted using OLS to demonstrate the relationship.

The sidebars allow you to exclude more extreme data. The initial position represents the interval between 25% and 75% percentile


