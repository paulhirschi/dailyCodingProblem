let theList: [Int] = [1, 2, 3, 4, 5]
let answer: [Int] = [120, 60, 40, 30, 24]

// Just a helper to make this reduction more terse inline below
func getProduct(list: [Int]) -> Int {
  return list.reduce(1, {x, y in x * y})
}

// Simple reduction and map
func getProductListDivision(list: [Int]) -> [Int] {
  let product = getProduct(list: list)
  return list.map { product / $0 }
}

// Tail recursive function that multiplies prefix elements to suffix elements
// and keeps track with accumulator
func getProductListRec(rest: [Int], prefix: [Int], acc: [Int]) -> [Int] {
  if let x = rest.first {
    let xs = Array(rest.dropFirst(1)) // cast ArraySlice<Int> into [Int]
    let newPrefix = prefix + [x]
    let newAccum = acc + [(getProduct(list: prefix) * getProduct(list: xs))]
    return getProductListRec(rest: xs, prefix: newPrefix, acc: newAccum)
  }
  else {
    return acc
  }
}

print(getProductListDivision(list: theList))
print(getProductListRec(rest: theList, prefix: [], acc: []))