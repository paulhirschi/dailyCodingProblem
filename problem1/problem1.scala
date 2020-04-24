/**

This problem was recently asked by Google.

Given a list of numbers and a number k, return whether any two numbers from the list add up to k.

For example, given [10, 15, 3, 7] and k of 17, return true since 10 + 7 is 17.

Bonus: Can you do this in one pass?

*/

val list = List(10, 15, 3, 7)
val target = 17

def canGetTarget(list: List[Int], target: Int): Boolean = {

  @annotation.tailrec
  def go(list: List[Int], index: Int): Boolean = {
    val n = list(index)
    true
  }

  go(list, 0)
}

println(canGetTarget(list, target))
