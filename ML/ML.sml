Control.Print.printDepth := 100;
Control.Print.printLength := 100;

fun merge [] [] = [] 
	| merge L [] = L
	| merge [] M = M
	| merge (x::xs) (y::ys) =
		if x<y then x:: (merge xs (y::ys))
		else y::(merge (x::xs) ys)

fun split [] = ([],[])
	| split ([x]) = ([x], [])
	| split (x1::x2::xs) = 
		let 
			val (L, M) = split xs 
			in 
				((x1::L),(x2::M))
		end
		
fun mergeSort [] = []
	| mergeSort ([x]) = [x]
	| mergeSort L = 
		let 
			val (M,N) = split L 
			val M = mergeSort M
			val N = mergeSort N
			in 
				merge M N
		end
		
fun sort (op <) [] = []
	| sort (op <) [x] = [x]
	| sort (op <) L =
		let 
			fun merge [] [] = [] 
				| merge L [] = L
				| merge [] M = M
				| merge (x::xs) (y::ys) =
				if x<y then x:: (merge xs (y::ys))
				else y::(merge (x::xs) ys)

			fun split [] = ([],[])
				| split ([x]) = ([x], [])
				| split (x1::x2::xs) = 
					let 
						val (L, M) = split xs 
						in 
							((x1::L),(x2::M))
					end
			val (M,N) = split L 
			val M = sort (op <) M
			val N = sort (op <) N
			in
				merge M N
		end
		
datatype 'a tree =  empty | leaf of 'a | node of 'a * 'a tree * 'a tree

fun labels empty = []
 | labels (leaf x) = [x]
 | labels (node(x,left,right)) = labels left @ [x] @ labels right

infix == 

fun replace (op ==) x y empty = empty
 |	replace (op ==) x y (leaf a) = if a == x then (leaf y) else (leaf a)
 |	replace (op ==) x y (node(a, left, right)) = if a==x then ((node(y, replace (op ==) x y left, replace (op ==) x y right))) 
													else ((node(a, replace (op ==) x y left, replace (op ==) x y right)))
fun replaceEmpty y empty = y
 | replaceEmpty y (leaf l) = (leaf l)
 | replaceEmpty y (node(a, left, right)) =  (node(a, replaceEmpty y left, replaceEmpty y right))

fun increment empty = leaf 0
 | increment (leaf a) = leaf (a+1)
 | increment (node (a, L, R)) = node (a+1, L, R) 
 
fun mapTree g empty = g empty
		| mapTree g (leaf l) = g (leaf l)
		| mapTree g (node(a, left, right)) = g (node(a, mapTree g left, mapTree g right))
																				
fun sortTree (op <) T = 
		mapTree (fn empty => empty 
			| (leaf a) => (leaf (sort (op <) a))
			| (node(a,Left,Right)) => node((sort (op <) a), Left ,Right) 
		)T