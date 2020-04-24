/**

This problem was asked recently by Google.

Given k sorted singly linked lists, write a function to merge all the lists into one sorted singly linked list

 */

val a = List(1, 7, 4, 12, 22)
val b = List(3, 12, 1, 5, 8)
val c = List(5, 3, 8, 37, 14)

def mergeSort(lists: List[Int]*): List[Int] = {
  lists
    .fold(Nil) {(acc, next) => acc ::: next}
    .sorted
}

println(mergeSort(a, b, c))
