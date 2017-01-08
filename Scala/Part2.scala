class OInt(x:Int) extends Ordered[OInt]{
	val a = x
	def get = a
	
	override def compare(that:OInt): Int = 
	{
		if (this.a == that.get) 
			return 0
		else if (this.a > that.get) 
			return 1
		else 
			return -1
	}
	
	override def toString(): String = {
		return "<" + this.a + ">"
	}
}

abstract class OTree[T <: Ordered[T]] extends Ordered[OTree[T]]

case class OLeaf[T <: Ordered[T]](v:T) extends OTree[T]{
	val value:T = v
	def get = value
	
	def compare(that: OTree[T]) = that match{
		case OLeaf(tvalue) => (this.get).compare(tvalue)
		case ONode(list) => -1
	}
}

case class ONode[T <: Ordered[T]](list: List[OTree[T]]) extends OTree[T]{
	val lis = list
	def get = lis
	
	def compare(that: OTree[T]) = that match{
		case OLeaf(tvalue) => 1
		case ONode(tlist) => compareLists(this.get,tlist)
	}
	
	def compareLists(L1: List[OTree[T]], L2: List[OTree[T]]):Int = (L1, L2)  match {
		case(List(), List()) => 0
		case (List(), _) => -1
		case (_, List()) => 1
		case(x::xs,y::ys) => 
			if (x.compare(y) == 0)
				compareLists(xs,ys)
			else
				x.compare(y)
	}
}

object Part2 {
	
	def main(args:Array[String]) {
		test()
	}
	
	def compareTrees[T<:Ordered[T]](firstTree:OTree[T], secondTree:OTree[T]){
		val compareValue = firstTree.compare(secondTree)
		if(compareValue == 0) 
			println("Equal")
		else if(compareValue == 1)
			println("Greater")
		else
			println("Less")
	}
	
	def test() {

		val tree1 = ONode(List(OLeaf(new OInt(6))))

		val tree2 = ONode(List(OLeaf(new OInt(3)),
							OLeaf(new OInt(4)),
							ONode(List(OLeaf(new OInt(5)))),
							ONode(List(OLeaf(new OInt(6)),
							OLeaf(new OInt(7))))));

		val treeTree1: OTree[OTree[OInt]] =
							ONode(List(OLeaf(OLeaf(new OInt(1)))))

		val treeTree2: OTree[OTree[OInt]] =
							ONode(List(OLeaf(OLeaf(new OInt(1))),
							OLeaf(ONode(List(OLeaf(new OInt(2)),
							OLeaf(new OInt(2)))))))


		print("tree1: ")
		println(tree1)
		print("tree2: ")
		println(tree2)
		print("treeTree1: ")
		println(treeTree1)
		print("treeTree2: ")
		println(treeTree2)
		print("Comparing tree1 and tree2: ")
		compareTrees(tree1, tree2)
		print("Comparing tree2 and tree2: ")
		compareTrees(tree2, tree2)
		print("Comparing tree2 and tree1: ")
		compareTrees(tree2, tree1)
		print("Comparing treeTree1 and treeTree2: ")
		compareTrees(treeTree1, treeTree2)
		print("Comparing treeTree2 and treeTree2: ")
		compareTrees(treeTree2, treeTree2)
		print("Comparing treeTree2 and treeTree1: ")
		compareTrees(treeTree2, treeTree1)
 }
}

