#lang info
(define collection "dlm-read")
(define deps '("base"
               "rackunit-lib"))
(define build-deps '("scribble-lib" "racket-doc"))
(define scribblings '(("scribblings/dlm-read.scrbl" ())))
(define pkg-desc "dlmread (as seen in matlab) for racket")
(define version "0.1")
(define pkg-authors '(leif))
