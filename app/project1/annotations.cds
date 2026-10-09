using BookstoreService as service from '../../srv/service';
annotate service.Chapters with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Chapter Details',
            ID : 'ChapterDetails',
            Target : '@UI.FieldGroup#ChapterDetails',
        },
    ],
    UI.FieldGroup #ChapterDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : book.Chapters.createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : book.Chapters.createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : book.Chapters.modifiedBy,
            },
            {
                $Type : 'UI.DataField',
                Value : book.Chapters.modifiedAt,
            },
        ],
    },
);

