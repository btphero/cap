// Exnteding the procuct service using "Extend"
using { sap.cap.ordershop as my } from '../db/schema';
// Expose service with your own custom path using "path"
//service productshop @(path: '/browseshop'){
//@protocol: 'rest'
service productshop {   
   //@odata.draft.enabled
   //bound actions --> Actions are now bound with your entity

   @open
   type object {};
   function MyFunction(category:Integer) returns object;

    //@odata.draft.enabled
   entity product as projection on my.Product actions {
   action orderProduct(name: String @title: 'Product Name', stock: Integer @title: 'Order Quantity');
    action updateColor(color: Integer @title: 'Update Color');
   } 


   @readonly
   entity supplier as projection on my.Supplier 
//Exclude field from entity at service layer using excluding {}
   //entity supplier as projection on my.Supplier excluding { name };
   entity orders as projection on my.Orders
   

   extend my.Product with {
      color : String
   }

function addNumberFunction(a: Integer, b:Integer) returns Integer;
//unbound
action addNumberAction(a:Integer, b:Integer) returns Integer;

//unbound






}