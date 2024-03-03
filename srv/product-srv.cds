// Exnteding the procuct service using "Extend"
using { sap.cap.ordershop as my } from '../db/schema';
service productshop {
   @odata.draft.enabled
   //bound actions --> Actions are now bound with your entity

   entity product as projection on my.Product actions {
   action orderProduct(name: String @title: 'Product Name', stock: Integer @title: 'Order Quantity');
    action updateProduct(name: String @title: 'Product Name', stock: Integer @title: 'Order Quantity')
   }

   @readonly
   entity supplier as projection on my.Supplier
   entity orders as projection on my.Orders
   

   extend my.Product with {
      color : String
   }

function addNumberFunction(a: Integer, b:Integer) returns Integer;
//unbound
action addNumberAction(a:Integer, b:Integer) returns Integer;

//unbound






}