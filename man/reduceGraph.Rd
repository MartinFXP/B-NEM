% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bnem_main.r
\name{reduceGraph}
\alias{reduceGraph}
\title{Reduce graph}
\usage{
reduceGraph(bString, model, CNOlist)
}
\arguments{
\item{bString}{binary vector indicating the sub-graph given a model}

\item{model}{Model object including the search space, if available.
See CellNOptR::preprocessing.}

\item{CNOlist}{CNOlist object (see package CellNOptR), if available.}
}
\value{
equivalent sub-graph denoted by a bString
}
\description{
reduces the size of a graph, if possible, to an equivalent sub-graph
}
\examples{
sifMatrix <- rbind(c("A", 1, "B"), c("A", 1, "C"), c("B", 1, "D"),
c("C", 1, "D"))
temp.file <- tempfile(pattern="interaction",fileext=".sif")
write.table(sifMatrix, file = temp.file, sep = "\t",
row.names = FALSE, col.names = FALSE,
quote = FALSE)
PKN <- CellNOptR::readSIF(temp.file)
CNOlist <- dummyCNOlist("A", c("B","C","D"), maxStim = 1, maxInhibit = 2,
signal = c("A", "B","C","D"))
model <- CellNOptR::preprocessing(CNOlist, PKN, maxInputsPerGate = 100)
bString <- reduceGraph(rep(1, length(model$reacID)), model, CNOlist)
}
\author{
Martin Pirkl
}
