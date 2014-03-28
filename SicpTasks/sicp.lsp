(define (test x y)
  (if (= x 0)
      0
      y))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt-iter-new guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter-new (improve guess x)
                     x)))

(define (sqrt x)
  (sqrt-iter-new 1.0 x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(define (f n) (A 0 n))

(define (g n) (A 1 n))

(define (h n) (A 2 n))

(define (k n) (* 5 n n))

(define (f34 g) (g 2))

(define (repeated f n)
  (cond 
    ((< n 0) (error "Illegal argument, N must be greater or equal to zero"))
    ((= n 0) (lambda (x) x))
    (else (compose f (repeated f (- n 1))))
  ))


(define (close-enough? x y)
  (< (abs (- x y)) 0.001))


(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value))
           (search f a b))
          ((and (negative? b-value) (positive? a-value))
           (search f b a))
          (else
           (error "Values are not of opposite sign" a b)))))

(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
        midpoint
        (let ((test-value (f midpoint)))
          (cond ((positive? test-value)
                 (search f neg-point midpoint))
                ((negative? test-value)
                 (search f midpoint pos-point))
                (else midpoint))))))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))


(define (cont-frac n d k) 
  (define (loop i) 
    (if (> i k) 0 
        (/ (n i) (+ (d i) (loop (+ i 1))))
  )) 
  (loop 1)
) 

(define (euler k) 
  (+ 2.0 (cont-frac (lambda (i) 1) 
                    (lambda (i)
                      (if (= (remainder i 3) 2)
                      (/ (+ i 1) 1.5) 1)
                    ) 
                    k)
)) 
    
(define (innerTest i)
  (if (= (remainder i 3) 2)
  (/ (+ i 1) 1.5) 1)
) 
