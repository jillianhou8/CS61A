(define (accumulate combiner start n term)
  (if (= n 0)
      start
      (combiner (term n) (accumulate combiner start (- n 1) term))
  )
)

(define (accumulate-tail combiner start n term)
  (define (helper combiner start n term total)
  (if (= n 0)
      total
      (helper combiner start (- n 1) term (combiner total (term n)))
  ))
  (helper combiner start n term start)
)

(define-macro (list-of expr for var in seq if filter-fn)
  (map expr (filter filter-fn (list seq)))
)
