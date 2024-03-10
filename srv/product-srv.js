const cds = require('@sap/cds');
// service handler has to be done with "ON"
module.exports = cds.service.impl(async function(srv) {

   const { product } = srv.entities;

  //srv.before( 'READ', 'product', async(req) => {
  // console.log("<<<Before Reading Product")

  // update the  product color
  //const productUpdate = await cds.run(UPDATE(product).with({color:'Green'}).where({ID: 'ea069d9b-56c4-4d8e-b6ff-c23164430cc2'})) 
//})

   //srv.on( 'READ', 'product', async(req) => {
    //  console.log("<<<I am reading product now")

   //SELECT Query

    //Way 1: To fetch all record
  // const productdetail = await cds.run(SELECT.from(product)) 

   //Way 1: To fetch record based on field
   //const productdetail = await cds.run(SELECT.from(product).where({color:'Red'}))

   //Way 3: Select specific field on table
   //const productdetail = await cds.run(SELECT `ID, name, stock, color` .from(product))

   //return productdetail

   //})

   //srv.after( 'READ', 'product', async(req) => {
   //   console.log("<<<After Reading product")
  // })






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



srv.on('MyFunction', async(req) => {
   let result = {} //way to declare variable in Nodejs

   if(req.data.category == 1 ){
      result.productname = 'Product A';
      result.stock = '12';
      result.priceOption = [{"Price Option 1": "12.30" }, {"Price Option 2": "50.30" } ]
   } else {

      result.materialName = 'Product B';
      result.stock = '32';
      result.priceOption = [{"Price Option 1": "40" } ]
   }

     console.log(result)
    return result

})



srv.before('orderProduct', async(req) => {
   console.log(" Before Handler")

   console.log("<<fetch the id", req.params[0])

   const productColor = await cds.run(SELECT `color` .from(product).where({ID:req.params[0]}))

   console.log("<<color ", productColor[0].color)

   if(productColor[0].color == 'Blue') return req.reject(400, 'Product with Blue color cannot place order')

})

srv.on('orderProduct', async(req) => {
   console.log(" i am in order product")

   const productStock = await cds.run(SELECT `stock` .from(product).where({ID:req.params[0]}))

   let stock = productStock[0].stock

   console.log("<<stock ", stock)

   let updatedStock = stock + req.data.stock

   console.log("<<Updated stock ", updatedStock)

   const UpdateProduct = cds.run(UPDATE(product).with({stock: updatedStock}).where ({ID:req.params[0]}))

   return req.notify(`Product ` + req.data.name + ` Ordered with Quantity ` + req.data.stock)



})







})