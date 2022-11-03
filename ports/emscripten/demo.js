const demo = require("./dist/bundle");

(async () => {
  console.log(demo)

  const a = await demo.default();

  console.log(a);
})()