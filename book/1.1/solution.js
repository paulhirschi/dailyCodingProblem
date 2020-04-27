const theList = [1, 2, 3, 4, 5]
const answer = [120, 60, 40, 30, 24]

// simple reduce and map
const getProductListDivision = list => {
  const product = list.reduce((acc, val) => acc * val)
  return list.map(x => product / x)
}

// tail recursive approach.
const getProductListRec = (list, prefix, acc) => {

  const productReduce = (acc, val) => acc * val

  if (list.length <= 0) return acc
  else {
    const [head, ...tail] = list
    const product = prefix.reduce(productReduce, 1) * tail.reduce(productReduce, 1)
    // .push() is a much more straightforward approach to appending,
    // but its a mutator that changes the original value, so concat works
    const newPrefix = prefix.concat([head])
    const newAcc = acc.concat([product])
    return getProductListRec(tail, newPrefix, newAcc)
  }
}

console.log(getProductListDivision(theList))
console.log(getProductListRec(theList, [], []))
