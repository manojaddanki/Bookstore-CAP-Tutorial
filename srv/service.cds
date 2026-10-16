using {tutorial.db as db} from '../db/schema';
service BookstoreService {

    entity Books as projection on db.Books actions{
        action addStock();
        action changePublishDate(newDate:Date);
        
        action changeStatus(@(
           common:{ValueListWithFixedValues:true,
           Label          :'New Status',
                                },
           Common.ValueList : {
            $Type : 'Common.ValueListType',
           
            CollectionPath : 'BookStatus',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    //LocalDataProperty : status_code,
                    LocalDataProperty :newStatus,
                    ValueListProperty : 'code',
                },
            ],
            Label : 'Status',
        },)
        newStatus:String);
    };
    entity Authors as projection on db.Authors;
    entity Chapters as projection on db.Chapters;
    entity BookStatus as projection on db.BookStatus;
    entity GenresVH as projection on db.Genres
}
annotate BookstoreService.Books with @odata.draft.enabled;
annotate Library.Books with @odata.draft.enabled;
service Library {
    entity Books as projection on db.Books;
}