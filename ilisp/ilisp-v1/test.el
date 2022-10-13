'a
'(a b c)
(car)
(car nil)
(car ())
(car 'a)
(car '(a b c))
(car '(a b c) '(d e f))
(cdr)
(cdr nil)
(cdr ())
(cdr 'a)
(cdr '(a)) 
(cdr '(a b c))
(cdr '(a b c) '(d e f))
(cons)
(cons 'a)
(cons 'a 'b)
(cons 'a nil)
(cons 'a ())
(cons 'a '(b c))
(cons 'a '(b c) '(d e))
(setq)
(setq b) 
(setq nil nil)
(setq b 'foo)
b
(defun)
(defun foo)
(defun foo (x))
(defun foo (x) x)
(foo 'a)
(defun bar (x y) x y)
(bar 'a 'b)
; Args are all eval'd then bound
(bar 'a x) ; should fail
(cond)
(cond 'a)
(cond ())
(cond () ())
(cond (t))
(cond (t 'a))
(cond (nil 'a))
(cond (nil 'a) (t 'b))
(cond (t nil) (t t))
(if t 'a)
(if nil 'a)
(if nil 'a 'b)
(if nil 'a 'b 'c)
; Currently representing integer n
; as list of t with length n. ;-)
; (length '(a b c)) => (t t t)
(defun length (l) 
  (if (equal l nil) 
      nil 
      (cons 't (length (cdr l)))
  )
)
(length nil)
(length '(a))
(length '(a b c d e))
(let)
(let ())
(let ((x bad)) x)
(let ((x 'a)) x)
(let ((x 'a 'b)) x)
(let ((x 'a) (y nil)) (cons x y))
(let ((x 'a) (y '(b c))) (cons x y))
x ; Make sure x is unbound after let

; let should eval all args, then bind
(let ((x 'a) (y x)) y) ; should fail

(let*)
(let* ())
(let* ((x bad)) x)
(let* ((x 'a)) x)
(let* ((x 'a 'b)) x)
(let* ((x 'a) (y nil)) (cons x y))
(let* ((x 'a) (y '(b c))) (cons x y))
x ; Make sure x is unbound after let

; let* should eval/bind in turn
(let* ((x 'a) (y x)) y) ; should work

