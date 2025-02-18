table 51014 "MediaSet Wala"
{
    Caption = 'MediaSet Wala';
    DataClassification = ToBeClassified;

    fields
    {
        field(2; Name; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(1; "Mediaset Wala"; MediaSet)
        {
            Caption = 'Mediaset Wala';

        }
    }
    keys
    {
        key(PK; "Name")
        {
            Clustered = true;
        }
    }

}
