(define (find s predicate)
  (cond ((null? s) #f)
        ((predicate (car s)) (car s))
        (else (find (cdr-stream s) predicate))
  )
)

(define (scale-stream s k)
  (cons-stream (* k (car s)) (scale-stream (cdr-stream s) k))
)

(define (has-cycle s)
  (define (helper slow fast)
    (if (or (null? slow) (null? fast)) #f
    (if (eq? fast (cdr-stream slow)) #t
      (helper (cdr-stream slow) (cdr-stream (cdr-stream fast)))))
  )
  (helper s s)
)



(define (has-cycle-constant s)
  'YOUR-CODE-HERE
)



        ((eq? s (cdr-stream s)) #t)
