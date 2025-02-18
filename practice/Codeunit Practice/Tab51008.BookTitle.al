table 51008 "Book Title"
{
    Caption = 'Book Title';
    DataClassification = ToBeClassified;

    fields
    {
        field(010; "Book Id"; BigInteger)
        {
            DataClassification = ToBeClassified;
            Caption = 'Book Id';
            AutoIncrement = true;
        }
        field(020; "Book Publisher"; Code[150])
        {
            DataClassification = ToBeClassified;
            Caption = 'Book Publisher';

        }
        field(1; "Book Title"; Text[100])
        {
            Caption = 'Book Title';
        }
        field(2; "Book Genre"; Option)
        {
            Caption = 'Book Genre';
            OptionMembers = " ",Fiction,NonFiction,Mystery,Romance,SciFi;
            OptionCaption = ' ,Fiction, Non-Fiction, Mystery, Romance, Sci-Fi';

        }

    }
    keys
    {
        key(PK; "Book Genre", "Book Title")
        {
            Clustered = true;
        }


    }
    trigger OnInsert()
    var
        BookEventPublisher: Codeunit "Book Event Publisher";
    begin
        BookEventPublisher.OnBookPublisher("Book Id", "Book Publisher");
    end;
}
