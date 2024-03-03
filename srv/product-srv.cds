// Exnteding the procuct service using "Extend"
using { sap.cap.ordershop as my } from '../db/schema';
service productshop {
   @odata.draft.enabled
   entity product as projection on my.Product
   entity supplier as projection on my.Supplier
   entity orders as projection on my.Orders
   

   extend my.Product with {
      color : String
   }

function addNumberFunction(a: Integer, b:Integer) returns Integer;

action addNumberAction(a:Integer, b:Integer) returns Integer;

action orderProduct(name: String @title: 'Product Name', stock: Integer @title: 'Order Quantity');

action updateProduct(name: String @title: 'Product Name', stock: Integer @title: 'Order Quantity')





}