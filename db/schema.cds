namespace sap.cap.ordershop;

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

entity Product : additionInfo
{
    key ID : String;
    name : String;
    stock : String;
    cost: PriceDetails; //to access the price and quntity --> cost_price , cost_quantity
}

entity Supplier : additionInfo
{
    key ID : String;
    name : String;
}
