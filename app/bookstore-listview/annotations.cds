using BookstoreService as service from '../../srv/service';
using from '@sap/cds/common';

annotate service.Books with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'genre',
                Value : genre_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'publishedAt',
                Value : publishedAt,
            },
            {
                $Type : 'UI.DataField',
                Label : 'pages',
                Value : pages,
            },
            {
                $Type : 'UI.DataField',
                Label : 'price',
                Value : price,
            },
            {
                $Type : 'UI.DataField',
                Value : currency_code,
                Label : '{i18n>Currency}',
            },
            {
                $Type : 'UI.DataField',
                Value : stock,
                Label : 'Stock',
            },
            {
                $Type : 'UI.DataField',
                Value : author.bookcount,
                Label : 'bookcount',
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Entry Information',
            ID : 'EntryInformation',
            Target : '@UI.FieldGroup#EntryInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Chapters',
            ID : 'Chapters',
            Target : 'Chapters/@UI.LineItem#Chapters',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : author_ID,
            Label : 'Author',
        },
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'Book ID',
        },
        {
            $Type : 'UI.DataField',
            Value : title,
            Label : 'Book Name',
        },
        {
            $Type : 'UI.DataField',
            Value : genre_code,
            Label : 'Genre',
        },
        {
            $Type : 'UI.DataField',
            Value : publishedAt,
            Label : 'published At',
        },
        {
            $Type : 'UI.DataField',
            Value : pages,
            Label : 'Pages',
        },
        {
            $Type : 'UI.DataField',
            Value : price,
            Label : 'Price',
        },
        {
            $Type : 'UI.DataField',
            Value : stock,
            Label : 'stock',
        },
        {
            $Type : 'UI.DataField',
            Value : status_code,
            Label : 'status_code',
            Criticality : status.critically,
            CriticalityRepresentation : #WithoutIcon,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'BookstoreService.addStock',
            Label : 'Add Stock',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'BookstoreService.EntityContainer/addDiscount',
            Label : '10% Discount',
        },
    ],
    UI.SelectionFields : [
        price,
        status_code,
    ],
    UI.HeaderInfo : {
        TypeName : 'Book',
        TypeNamePlural : 'Books',
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : genre_code,
        },
    },
    UI.FieldGroup #EntryInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedAt,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedBy,
            },
        ],
    },
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'BookstoreService.addStock',
            Label : 'Add stock',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'BookstoreService.changePublishDate',
            Label : 'Change publish date',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'BookstoreService.changeStatus',
            Label : 'changeStatus',
        },
    ],
);

annotate service.Books with {
    author @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Authors',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : author_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
        ],
    }
};

annotate service.Books with {
    price @Common.Label : 'price'
};

annotate service.Chapters with @(
    UI.LineItem #Chapters : [
        {
            $Type : 'UI.DataField',
            Value : book.Chapters.title,
            Label : 'Title',
        },
        {
            $Type : 'UI.DataField',
            Value : book.Chapters.pages,
            Label : 'Pages',
        },
        {
            $Type : 'UI.DataField',
            Value : book.Chapters.number,
            Label : 'Number',
        },
    ]
);

annotate service.Books with {
    status @(
        Common.Label : 'Status',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'BookStatus',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : status_code,
                    ValueListProperty : 'code',
                },
            ],
            Label : 'Status',
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.Books with {
    currency @Common.ValueListWithFixedValues : true
};

annotate service.Currencies with {
    code @Common.Text : descr
};

annotate service.Books with {
    genre @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'GenresVH',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : genre_code,
                    ValueListProperty : 'description',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
)};

annotate service.GenresVH with {
    code @Common.Text : description
};

