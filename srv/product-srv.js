const cds = require('@sap/cds');
// service handler has to be done with "ON"
module.exports = cds.service.impl(async function(srv) {


// Function Impplementation    
 srv.on( 'addNumberFunction', async(req) => {
      console.log("Received Data ", req.data)
      let firstNumber = req.data.a;
      let secondNumber = req.data.b;;
     let sum = firstNumber + secondNumber;
     console.log("Sum of the number ", sum)
     return sum;
 })

// Action Impplementation  
 srv.on( 'addNumberAction', async(req) => {
    console.log("Received Data ", req.data)
    let firstNumber = req.data.a;
    let secondNumber = req.data.b;;
   let sum = firstNumber + secondNumber;
   console.log("Sum of the number ", sum)
   return sum;
})


})