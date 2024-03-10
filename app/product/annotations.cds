using productshop as service from '../../srv/product-srv';
using from '../../srv/product-srv';

annotate service.product with @(
UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Label: 'Product',
        Value: name,
    },
    {
        $Type: 'UI.DataField',
        Label: 'Stock',
        Value: stock,
    },
    {
        $Type: 'UI.DataField',
        Label: 'Price',
        Value: cost_price,
    },
    {
        $Type: 'UI.DataField',
        Label: 'Supplier',
        Value: supplier_ID,
    },
    {
        $Type: 'UI.DataField',
        Label: 'Color',
        Value: color,
    },
    {
        $Type      : 'UI.DataField',
        Label      : 'Emission',
        Value      : emission,
        Criticality: criticality
    },
    {
        $Type      : 'UI.DataFieldForAction',
        Action: 'productshop.orderProduct',
        Label      : 'Place Order'
    },

]);

annotate service.product with {
    supplier @Common.ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'supplier',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: supplier_ID,
                ValueListProperty: 'ID',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name',
            },
        ],
    }
};

annotate service.product with @(
    UI                            : {HeaderInfo: {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Product',
        TypeNamePlural: 'Products',
        Title         : {
            $Type: 'UI.DataField',
            Value: name
        },
        Description   : {
            $Type: 'UI.DataField',
            Value      : stock
        }
    }, },
    UI.SelectionFields            : [
        name,
        supplier_ID
    ],
    UI.Identification: [
    {
        $Type      : 'UI.DataFieldForAction',
        Action: 'service.updateColor',
        Label      : 'Update Color'
    },
    ],
    UI.FieldGroup #GeneratedGroup1: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Manufacture Date',
                Value: mfgDate,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Expiry Date',
                Value: expDate,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Price',
                Value: cost_price,
            },
            {
                $Type: 'UI.DataField',
                Label: 'color',
                Value: color,
            },
        ],
    },
    UI.FieldGroup #GeneratedGroup2: {
        $Type: 'UI.FieldGroupType',
        Data : [{Value: ord.orderDetail}],
    },
    UI.FieldGroup #GeneratedGroup3: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {Value: supplier_ID},
            {Value: supplier.name}
        ],
    },
    UI.FieldGroup #GeneratedGroup4: {
        $Type: 'UI.FieldGroupType',
        Data : [{
            Value      : emission,
            Criticality: criticality
        }],
    },
    UI.Facets                     : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet1',
            Label : 'General Information',
            Target: '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet2',
            Label : 'Order Information',
            Target: '@UI.FieldGroup#GeneratedGroup2',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet3',
            Label : 'Supplier Information',
            Target: '@UI.FieldGroup#GeneratedGroup3',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet4',
            Label : 'Co2 Information',
            Target: '@UI.FieldGroup#GeneratedGroup4',
        },
    ]
);


annotate service.Orders with {
    ID          @title: 'Order ID';
    orderDetail @title: 'Order Info'
};
