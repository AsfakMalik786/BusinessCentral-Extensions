table 51009 "Book Title Lists Table"
{
    Caption = 'Book Title Lists';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Book Genre"; Option)
        {
            Caption = 'Book Genre';
            OptionCaption = ' ,Fiction, Non-Fiction, Mystery, Romance, Sci-Fi';
            OptionMembers = " ",Fiction,NonFiction,Mystery,Romance,SciFi;
        }
        field(2; "Book Title"; Text[100])
        {
            Caption = 'Book Title';
        }
    }
    keys
    {
        key(PK; "Book Genre", "Book Title")
        {
            Clustered = true;
        }
    }
}
