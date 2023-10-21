const doThing = () => {
  console.log(7)
}

for (const x of [1, 2, 4]) {
  if (x === 2) {

    console.log(9)
    if (x * 2 === 6) {
      doThing();
      doThing();
      doThing();
      doThing();
    }
  }
}
