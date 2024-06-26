% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/editarray.R, R/as.matrix.R, R/c.R, R/summary.R
\name{editarray}
\alias{editarray}
\alias{as.character.editarray}
\alias{as.data.frame.editarray}
\alias{as.expression.editarray}
\alias{as.matrix.editarray}
\alias{c.editarray}
\alias{summary.editarray}
\title{Parse textual, categorical edit rules to an editarray}
\usage{
editarray(editrules, sep = ":", env = parent.frame())

\method{as.character}{editarray}(x, useIf = TRUE, datamodel = TRUE, ...)

\method{as.data.frame}{editarray}(x, ...)

\method{as.expression}{editarray}(x, ...)

\method{as.matrix}{editarray}(x, ...)

\method{c}{editarray}(...)

\method{summary}{editarray}(object, useBlocks = TRUE, ...)
}
\arguments{
\item{editrules}{\code{character} or \code{expression} vector.}

\item{sep}{textual separator, to be used internally for separating variable from category names.}

\item{env}{environment to evaluate the rhs of '==' or '\%in\%' in.}

\item{x}{editarray object}

\item{useIf}{\code{logical}. Use if( <condition> ) <statement> or !<condition> | <statement> ?}

\item{datamodel}{\code{logical}. Include datamodel explicitly?}

\item{...}{further arguments passed to or from other methods}

\item{object}{an R object}

\item{useBlocks}{\code{logical} Summarize each block?}
}
\value{
\code{editarray} : An object of class \code{editarray}

\code{as.data.frame}: \code{data.frame} with columns 'name', 'edit' and 'description'.

\code{as.matrix}: The boolean matrix part of the \code{editarray}.
}
\description{
An \code{editarray} is a boolean array (with some extra attributes) 
where each row contains an edit restriction on purely categorical data. 
The function \code{editarray} converts (a vector of) edit(s)
in \code{character} or \code{expression} from to an \code{editarray} object. 
Edits may also be read from a \code{\link{data.frame}}, in which case it must have at least
a \code{character} column  with the name \code{edit}. It is not 
strictly necessary, but hightly recommended that the datamodel (i.e. the possible levels
for a variable) is included explicitly in the edits using an \code{\%in\%} statement, as shown
in the examples below. The function \code{\link{editfile}} can read categorical edits from a 
free-form text file.
}
\examples{

# Here is the prototypical categorical edit: men cannot be pregnant.
E <- editarray(expression(
    gender \%in\% c('male','female'),
    pregnant \%in\% c('yes','no'),
    if( gender == 'male' ) pregnant == 'no'
    )
)
E

# an editarray has a summary method:
summary(E)

# A yes/no variable may also be modeled as a logical:
editarray(expression(
    gender \%in\% c('male','female'),
    pregnant \%in\% c(TRUE, FALSE),
    if( gender == 'male' ) pregnant == FALSE
    )
)

# or, shorter (and using a character vector as input): 
editarray(expression(
    gender \%in\% c('male','female'),
    pregnant \%in\% c(TRUE, FALSE),
    if( gender == 'male' ) !pregnant
    )
)

# the \\%in\\% statement may be used at will
editarray(expression(
    gender \%in\% c('male','female'),
    pregnant \%in\% c(TRUE, FALSE),
    positionInHousehold \%in\% c('marriage partner', 'child', 'other'),
    maritalStatus \%in\% c('unmarried','married','widowed','divorced'),
    if( gender == 'male' ) !pregnant,
    if( maritalStatus \%in\% c(
          'unmarried',
          'widowed',
          'divorced')
      ) !positionInHousehold \%in\% c('marriage partner','child')
    )
)





# Here is the prototypical categorical edit: men cannot be pregnant.
E <- editarray(expression(
    gender \%in\% c('male','female'),
    pregnant \%in\% c('yes','no'),
    if( gender == 'male' ) pregnant == 'no'
    )
)
E

# an editarray has a summary method:
summary(E)

# A yes/no variable may also be modeled as a logical:
editarray(expression(
    gender \%in\% c('male','female'),
    pregnant \%in\% c(TRUE, FALSE),
    if( gender == 'male' ) pregnant == FALSE
    )
)

# or, shorter (and using a character vector as input): 
editarray(expression(
    gender \%in\% c('male','female'),
    pregnant \%in\% c(TRUE, FALSE),
    if( gender == 'male' ) !pregnant
    )
)

# the \\%in\\% statement may be used at will
editarray(expression(
    gender \%in\% c('male','female'),
    pregnant \%in\% c(TRUE, FALSE),
    positionInHousehold \%in\% c('marriage partner', 'child', 'other'),
    maritalStatus \%in\% c('unmarried','married','widowed','divorced'),
    if( gender == 'male' ) !pregnant,
    if( maritalStatus \%in\% c(
          'unmarried',
          'widowed',
          'divorced')
      ) !positionInHousehold \%in\% c('marriage partner','child')
    )
)




}
\seealso{
\code{\link{editrules.plotting}}, \code{\link{violatedEdits}}, \code{\link{localizeErrors}},
   \code{\link{editfile}}, \code{\link{editset}}, \code{\link{editmatrix}}, \code{\link{getVars}},
   \code{\link{blocks}}, \code{\link{eliminate}}, \code{\link{substValue}}, \code{\link{isFeasible}} 
   \code{\link{generateEdits}}, \code{\link{contains}}, \code{\link{is.editarray}}, \code{\link{isSubset}}
}
