val theList: List[Int] = List(1, 2, 3, 4, 5)
val answer: List[Int] = List(120, 60, 40, 30, 24)

// Simple reduction and map
def getProductListDivision: List[Int] => List[Int] = list => {
  val product = list.product // list.reduceLeft(_ * _) list.foldLeft(1)(_ * _)
  list map (product / _)
}

// Tail recursive function that multiplies prefix elements to suffix elements
// and keeps track with accumulator
@scala.annotation.tailrec
def getProductListRec(rest: List[Int], prefix: List[Int], acc: List[Int]): List[Int] =
  rest match {
    case Nil => acc
    case x :: xs => {
      val newPrefix = prefix :+ x
      val newAccum = acc :+ (prefix.product * xs.product)
      getProductListRec(xs, newPrefix, newAccum)
    }
  }

println( getProductListDivision(theList) )
println( getProductListRec(theList, Nil, Nil) )
