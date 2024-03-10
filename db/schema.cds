namespace sap.cap.ordershop;
using { managed, cuid } from '@sap/cds/common';

// will add the entity when you want to use . its  reusable component.
aspect additionInfo {
    mfgDate: String;
    expDate: String;
}


//type
type PriceDetails {
    price: String;
    quantity: String
}

entity Product : additionInfo, managed, cuid
{
    name : String @mandatory;
    stock : Integer;
    cost: PriceDetails; //to access the price and quntity --> cost_price , cost_quantity,
    supplier: Association to Supplier;
    emission: Integer;
    criticality: Integer;
    ord : Composition of many Orders on ord.execution = $self
}

entity Supplier 
{
    key ID : String;
    name : String;
    product: Association to many Product on product.supplier = $self
}


entity Orders {
    key ID: String;
    orderDetail : LargeString;
    execution: Association to Product
}