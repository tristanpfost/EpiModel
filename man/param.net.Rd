% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/param.R
\name{param.net}
\alias{param.net}
\title{Epidemic Parameters for Stochastic Network Models}
\usage{
param.net(inf.prob, inter.eff, inter.start, act.rate, rec.rate, b.rate, ds.rate,
  di.rate, dr.rate, inf.prob.m2, rec.rate.m2, b.rate.m2, ds.rate.m2, di.rate.m2,
  dr.rate.m2, ...)
}
\arguments{
\item{inf.prob}{Probability of infection per transmissible act between
a susceptible and an infected person. In bipartite models, this is the
probability of infection to the mode 1 nodes. This may also be a vector
of probabilities, with each element corresponding to the probability
in that time step of infection (see Time-Varying Parameters below).}

\item{inter.eff}{Efficacy of an intervention which affects the per-act
probability of infection. Efficacy is defined as 1 - the relative
hazard of infection given exposure to the intervention, compared to no
exposure.}

\item{inter.start}{Time step at which the intervention starts, between 1 and
the number of time steps specified in the model. This will default to
1 if the \code{inter.eff} is defined but this parameter is not.}

\item{act.rate}{Average number of transmissible acts \emph{per partnership}
per unit time (see \code{act.rate} Parameter below). This may also be a vector
of rates, with each element corresponding to the rate in in that time
step of infection (see Time-Varying Parameters below).}

\item{rec.rate}{Average rate of recovery with immunity (in \code{SIR} models)
or re-susceptibility (in \code{SIS} models). The recovery rate is the
reciprocal of the disease duration. For bipartite models, this is the
recovery rate for mode 1 persons only. This parameter is only used for
\code{SIR} and \code{SIS} models. This may also be a vector
of rates, with each element corresponding to the rate in that time step
of infection (see Time-Varying Parameters below).}

\item{b.rate}{Birth or entry rate. For one-mode models, the birth rate is the
rate of new births per person per unit time. For bipartite models, the
birth rate may be parameterized as a rate per mode 1 person time (with
mode 1 persons representing females), and with the \code{b.rate.g2}
rate set as described below.}

\item{ds.rate}{Death or exit rate for susceptible. For bipartite models, it
is the rate for the mode 1 susceptible only.}

\item{di.rate}{Death or exit rate for infected. For bipartite models, it is
the rate for the mode 1 infected only.}

\item{dr.rate}{Death or exit rate for recovered. For bipartite models, it is
the rate for the mode 1 recovered only. This parameter is only used for
\code{SIR} models.}

\item{inf.prob.m2}{Probability of transmission given a transmissible act
between a susceptible mode 2 person and an infected mode 1 person.
It is the probability of transmission to mode 2 members.}

\item{rec.rate.m2}{Average rate of recovery with immunity (in \code{SIR} models)
or re-susceptibility (in \code{SIS} models) for mode 2 persons. This
parameter is only used for bipartite \code{SIR} and \code{SIS} models.}

\item{b.rate.m2}{Birth or entry rate for mode 2. This may either be specified
numerically as the rate of new births per mode 2 persons per unit time,
or as \code{NA} in which case the mode 1 rate, \code{b.rate}, governs
the mode 2 rate. The latter is used when, for example, the first mode
is conceptualized as female, and the female population size determines
the birth rate. Such births are evenly allocated between the two modes.}

\item{ds.rate.m2}{Death or exit rate for mode 2 susceptible.}

\item{di.rate.m2}{Death or exit rate for mode 2 infected.}

\item{dr.rate.m2}{Death or exit rate for mode 2 recovered. This parameter is
only used for \code{SIR} model types.}

\item{...}{Additional arguments passed to model.}
}
\description{
Sets the epidemic parameters for stochastic network models
             simulated with \code{\link{netsim}}.
}
\details{
\code{param.net} sets the epidemic parameters for the stochastic network
models simulated with the \code{\link{netsim}} function. Models
may use the base types, for which these parameters are used, or new process
modules which may use these parameters (but not necessarily). A detailed
description of network model parameterization for base models is found in
the \href{http://statnet.github.io/tut/BasicNet.html}{Basic Network Models}
tutorial.

For base models, the model specification will be chosen as a result of
the model parameters entered here and the control settings in
\code{\link{control.net}}. One-mode and two-mode models are available, where
the the latter assumes a heterogenous mixing between two distinct partitions
in the population (e.g., men and women). Specifying any bipartite parameters
(those with a \code{.m2}) implies the simulation of a bipartite model. All the
parameters for a desired model type must be specified, even if they are zero.
}
\section{The \code{act.rate} Parameter}{

A key difference between these network models and DCM/ICM classes is the
treatment of transmission events. With DCM and ICM, contacts or partnerships are
mathematically instantaneous events: they have no duration in time, and thus
no changes may occur within them over time. In contrast, network models allow
for partnership durations defined by the dynamic network model, summarized in
the model dissolution coefficients calculated in \code{\link{dissolution_coefs}}.
Therefore, the \code{act.rate} parameter has a different interpretation here,
where it is the number of transmissible acts \emph{per partnership} per unit
time.
}

\section{Time-Varying Parameters}{

The \code{inf.prob}, \code{act.rate}, \code{rec.rate} arguments (and their
\code{.m2} companions) may be specified as time-varying parameters by passing
in a vector of probabilities or rates, respectively. The value in each
position on the vector then corresponds to the probability or rate at that
discrete time step for the infected partner. For example, an \code{inf.prob}
of \code{c(0.5, 0.5, 0.1)} would simulate a 0.5 transmission probability for
the first two time steps of a person's infection, followed by a 0.1 for the
third time step. If the infected person has not recovered or exited the
population by the fourth time step, the third element in the vector will carry
forward until one of those events occurs or the simulation ends. For further examples,
see the NME tutorial,
\href{https://statnet.github.io/nme/d3-s6.html}{Time-Varying Biology & Behavior}.
}

\section{New Modules}{

To build original models outside of the base models, new process modules
may be constructed to replace the existing modules or to supplement the existing
set. These are passed into the control settings in \code{\link{control.net}}.
New modules may use either the existing model parameters named here, an
original set of parameters, or a combination of both. The \code{...} allows
the user to pass an arbitrary set of original model parameters into
\code{param.net}. Whereas there are strict checks with default modules for
parameter validity, these checks are the user's responsibility with new modules.
}

\seealso{
Use \code{\link{init.net}} to specify the initial conditions and
         \code{\link{control.net}} to specify the control settings. Run the
         parameterized model with \code{\link{netsim}}.
}
\keyword{parameterization}
