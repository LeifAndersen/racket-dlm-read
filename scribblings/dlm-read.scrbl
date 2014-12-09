#lang scribble/manual
@require[@for-label[dlm-read
                    racket/base
                    racket/port]
         scribble/eval]

@title[#:tag "top"]{Delimited Reading}
@author{Leif Andersen}

@defmodule[dlm-read]

The goal of dlm-read is to provide functionality similar to dlmread in Matlab/Octave.

@bold{WARNING!} this library is unstable. The actual results of @racket[dlm-read]
may change, however the result will remain something easily to plot.

@defproc[(dlm-read [file (or/c port? path-string?) (current-input-port)]
                   [delimiter char? #\tab])
         (listof (listof number?))]{
Parsed delimited data into a matrix ready for plotting.

@racket[file] is the input file or port containing the data.

@racket[delimiter] is the character used to delimit the data.
}

@section{Examples}

Here is an example matrix in text (separated by tags):

@filebox["simple.tab"]{
@verbatim{
1       2
3       4
}
}

To parse this data:
@#reader scribble/comment-reader
(interaction
 (require dlm-read)

 (dlm-read "examples/simple.tab"))

Alternatively, a port can be used:

@#reader scribble/comment-reader
(interaction
 (require dlm-read
          racket/port)
 (with-input-from-string "1\t2\n3\t4"
  (lambda () (dlm-read))))
