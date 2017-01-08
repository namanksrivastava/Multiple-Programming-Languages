;;; Base Case: L is empty, return 0
;;; Assumption: (count-numbers M) returns a count of the numbers in M, for
;;; any list M smaller than L (including (car L) and (cdr L)).
;;; Step: If (car L) is a list, then return the sum of the count of the
;;; numbers in (car L) and the count of the numbers in (cdr L).
;;; If (car L) is a number, return 1 plus the count of the numbers in
;;; (cdr L). Otherwise, return the count of the numbers in (cdr L).
(define (count-numbers L)
  (cond ((null? L) 0)
        (else (cond((list? (car L))(+ (count-numbers (car L)) (count-numbers (cdr L))))
                  ((number? (car L))(+ 1 (count-numbers (cdr L))))
        (else (count-numbers (cdr L)))))))

;;; Base Case: L is empty, return (cons x L), ie. insert x in empty list L and return list
;;; Assumption: (insert x M) returns a sorted list M where x is inserted into correct location in M , that is
;;; expect (insert x M) works for any list M smaller than L (including (car L) and (cdr L))
;;; Step: If x is less than (car L) then insert x in L and return the new list
;;; If x is greater than (car L) call insert on remaining list, ie. (insert x (cdr L)) which we have established works.
;;; Also cons the car L term so that even though we have moved forward in the list we have the complete list. 
(define (insert x L)
  (cond ((null? L)(cons x L))
        (else (cond ((< x (car L))(cons x L))
              (else (cons (car L) (insert x (cdr L))))))))

;;; Base Case: L is empty, return the sorted list M
;;; Assumption: (insert-all Lnew M) has inserted the last n-1 terms of L correctly in M,
;;; Lnew is a list of n-1 terms of L
;;; Step: insert the last element of L in correct position at M using the insert method we created previously
;;; In reality we repeatedly do the same for all elements in L using recursion
;;; return the final list
(define (insert-all L M)
  (cond ((null? L) M)
        (else (insert-all (cdr L) (insert (car L) M)))))

;;; Base Case: L is null, return '()
;;; Assumption: (sort M) returns a sorted list M, for
;;; any list M smaller than L (including (car L) and (cdr L)).
;;; Step: use letrec to create a lambda function insertInSort (x M), which inserts a number x at correct position in M recursively.
;;; Use insertInSort to insert (car L) in sorted (cdr L), where (cdr L) has been sorted using (sort (cdr L)) which we have established works.
;;; In reality we repeatedly do the same for all elements in L using recursion
;;; return the final list
(define (sort L)
  (cond ((null? L) '())
        (else (letrec((insertInSort (lambda (x M)
                                (cond ((null? M) (list x))
                                      ((< x (car M)) (cons x M))
                                      (else (cons (car M) (insertInSort x (cdr M))))))))(insertInSort (car L) (sort (cdr L)))))))

;;; Use lambda function to return the correct operator using eq for operator match
(define (translate op)
    (cond ((eq? op '-)-)
          ((eq? op '+)+)
          ((eq? op '/)/)
          ((eq? op '*)*)))

;;; Base Case: exp is a number return exp
;;; Assumption: (postfix-eval exp1) will return me a computation where operator is caddr of exp1
;;; where exp1 is a list of 3 , 2 numbers and an operator
;;; Step: If  we encounter another list inside the main list exp we recall the same method with
;;; translate for operator and postfix-eval on the list
(define (postfix-eval exp)
  (cond ((number? exp) exp)
        ((list? exp) ((translate (caddr exp)) (postfix-eval (car exp)) (postfix-eval (cadr exp))))))

;;; Base Case: S is empty, return the set containing the empty
;;; set, i.e. '(()).
;;; Assumption: (powerset M) returns the powerset of M, for any set M
;;; smaller than S (including (cdr S)).
;;; Step: We append the element we get to all the powersets (sets that we have generated yet); using map 
(define (powerset S)
  (cond ((null? S) '(()))
        (else (let ((A (powerset (cdr S))))
                (append A(map(lambda(ele) (cons (car S) ele)) A))))))

  