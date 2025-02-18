table 51013 MediaWala
{
    Caption = 'Media';
    DataClassification = ToBeClassified;

    fields
    {
        field(2; Name; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(1; Media; Media)
        {
            Caption = 'Media';


        }
    }
    keys
    {
        key(PK; Name)
        {
            Clustered = true;
        }

    }
    fieldgroups
    {
        fieldgroup(Brick; Media, Name)
        {

        }
    }


}
