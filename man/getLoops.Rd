% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getLoops.R
\name{getLoops}
\alias{getLoops}
\alias{setLoopLabel}
\alias{plot.feedbackLoops}
\title{Extract, Plot and Manipulate Labels for Feedback Loops in a Causal Loop Diagram}
\usage{
getLoops(x, S = 100, nsteps = 6)

setLoopLabel(FBL, loopIx, label)

\method{plot}{feedbackLoops}(FBL, ...)
}
\arguments{
\item{x}{a CLD object}

\item{S}{number of loop traversals (random walks on directed graph) to be simulated,
originating from each variable in the CLD.}

\item{nsteps}{number of steps for each loop traversal. Setting this to larger values
(e.g., 10 or 15) tends to yield a larger number of identified loops, many of which
involve large numbers of variables. The default value of 6 tends to yield simpler
loop structures (which contain up to a maximum of 6 variables).}

\item{FBL}{A \code{feedbackLoops} object (i.e., object outputted from \code{getLoops()})}

\item{loopIx}{Loop index. When \code{getLoops()} is run, each loop is assigned an index.
The function \code{setLoopLabel} will take a \code{loopIx} as input. The loop indices
are always displayed in the \code{plot} method.}

\item{label}{Label to assign to a feedback loop in \code{setLoopLabel()}.}
}
\value{
a list of 2-element lists, each with element \code{[[1]]} containing
  a feedback loop and element \code{[[2]]} containing the loop's type (i.e.,
  either "balancing" or "reinforcing"). Balancing loops have an odd number
  of links with negative polarity, and reinforcing loops have an even
  number of links with negative polarity.
}
\details{
This function applies a particle-based approach to identifying loops
  (cycles) within a causal loop diagram.  Random walks are generated, initiated at
  each variable, and any cycles that are identified are retained and numbered.
}
\examples{
edges <- tibble::tribble(
~from, ~to, ~polarity,
1,2,1,
1,5,1,
1,8,1,
2,3,-1,
2,7,1,
2,9,1,
3,1,1,
3,2,1,
3,4,1,
3,6,-1,
4,5,1,
5,2,1,
6,4,1,
8,9,-1,
9,8,1
)
txtedges <- edges \%>\% dplyr::mutate(from = letters[from], to = letters[to])
z <- CLD(txtedges$from, txtedges$to, polarity = txtedges$polarity)
loops <- getLoops(z)
loops <- setLoopLabel(loops, loopIx = 5, label = "BCFdE!")

}
\references{

}
