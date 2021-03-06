% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/FunctionCorrVars.R
\name{corrVars}
\alias{corrVars}
\title{Produce a correlation matrix of all potential input variables}
\usage{
corrVars(vars, na.rm = T, method = "color", order = "hclust",
  title = "Layer Correlation Matrix")
}
\arguments{
\item{vars}{A raster stack of potential input variables}

\item{na.rm}{`logical` Should cells with at least one NA be ignored?}

\item{order}{Ordering method for the correlation matrix plot. See `?corrplot::corrplot` for more details}

\item{title}{Title for the correlation matrix plot}
}
\value{
A matrix of correlation coefficients between layers, and a correlation matrix plot of these coefficients
}
\description{
Produce a correlation matrix of all potential input variables
}
\examples{

#get UK extent
UK <- ggplot2::map_data(map = "world", region = "UK")
max.lat <- ceiling(max(UK$lat))
min.lat <- floor(min(UK$lat))
max.lon <- ceiling(max(UK$long))
min.lon <- floor(min(UK$long))
extent <- raster::extent(x = c(min.lon, max.lon, min.lat, max.lat))

#get variables data
bio<-raster::getData('worldclim',var='bio',res=5,lon=-2,lat=40)

#crop to uk
bio<-raster::crop(bio,extent)

#produce correlation matrix
corr <- corrVars(bio)

#END

}
