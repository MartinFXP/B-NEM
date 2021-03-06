% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bnem_main.r
\name{bnemBs}
\alias{bnemBs}
\title{Bootstraped Network}
\usage{
bnemBs(fc, x = 10, f = 0.5, replace = TRUE, startString = NULL, ...)
}
\arguments{
\item{fc}{m x l matrix of foldchanges of gene expression values or
equivalent input
(normalized pvalues, logodds, ...) for m E-genes and l contrasts. If left
NULL, the gene expression
data is used to calculate naive foldchanges.}

\item{x}{number of bootstraps}

\item{f}{percentage to sample, e.g. f = 0.5 samples only 50%
the amount of E-genes as the original data}

\item{replace}{if TRUE classical bootstrap, if FALSE sub-sampling without
replacement}

\item{startString}{matrix with each row being a string denoting a
network to start inference several times with a specific network}

\item{...}{additional parameters for the bnem function}
}
\value{
list with the accumulation of edges in x and the number of
bootstraps in n
}
\description{
Runs Bootstraps on the data
}
\examples{
sifMatrix <- rbind(c("A", 1, "B"), c("A", 1, "C"), c("B", 1, "D"),
c("C", 1, "D"))
temp.file <- tempfile(pattern="interaction",fileext=".sif")
write.table(sifMatrix, file = temp.file, sep = "\t",
row.names = FALSE, col.names = FALSE,
quote = FALSE)
PKN <- CellNOptR::readSIF(temp.file)
CNOlist <- dummyCNOlist("A", c("B","C","D"), maxStim = 1,
maxInhibit = 2, signals = c("A", "B","C","D"))
model <- CellNOptR::preprocessing(CNOlist, PKN, maxInputsPerGate = 100)
expression <- matrix(rnorm(nrow(slot(CNOlist, "cues"))*10), 10,
nrow(slot(CNOlist, "cues")))
fc <- computeFc(CNOlist, expression)
initBstring <- rep(0, length(model$reacID))
res <- bnemBs(search = "greedy", model = model, CNOlist = CNOlist,
fc = fc, pkn = PKN, stimuli = "A", inhibitors = c("B","C","D"),
parallel = NULL, initBstring = initBstring, draw = FALSE, verbose = FALSE,
maxSteps = Inf)
}
\author{
Martin Pirkl
}
