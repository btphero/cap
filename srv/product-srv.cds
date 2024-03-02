// Exnteding the procuct service using "Extend"
using { sap.cap.ordershop as my } from '../db/schema';
service productshop {
   entity product as projection on my.Product
   entity supplier as projection on my.Supplier
   

   extend my.Product with {
      color : String
   }

function addNumberFunction(a: Integer, b:Integer) returns Integer;

action addNumberAction(a:Integer, b:Integer) returns Integer;





}