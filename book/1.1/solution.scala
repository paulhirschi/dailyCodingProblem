val theList: List[Int] = List(1, 2, 3, 4, 5) // => List(120, 60, 40, 30, 24)

// Simple reduction and map
def getProductListDivision(list: List[Int]): List[Int] = {
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
      val product = prefix.product * xs.product
      val newPrefix = prefix :+ x
      val newAccum = acc :+ product
      getProductListRec(xs, newPrefix, newAccum)
    }
}

println(s"Should be: ${List(120, 60, 40, 30, 24)}")
println( getProductListDivision(theList) )
println( getProductListRec(theList, Nil, Nil) )
