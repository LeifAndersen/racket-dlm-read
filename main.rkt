#lang racket/base

(provide dlm-read)
(require csv-reading net/url)

(define (make-reader [delimiter #\tab])
  (make-csv-reader-maker
   `((separator-chars              ,delimiter)
     (strip-leading-whitespace?  . #t)
     (strip-trailing-whitespace? . #t))))

(define (all-rows [port (current-input-port)] [delimiter #\tab])
  (define read-row ((make-reader delimiter) port))
  (apply map list
    (for/list ([row (in-producer read-row '())])
      (map string->number row))))

(define (dlm-read [file (current-input-port)] [delimiter #\tab])
  (if (port? file)
      (all-rows file delimiter)
      (with-input-from-file file
        (lambda () (all-rows (current-input-port) delimiter)))))
