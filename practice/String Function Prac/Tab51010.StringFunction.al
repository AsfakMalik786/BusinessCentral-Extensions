table 51010 "String Function"
{
    Caption = 'String Function';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Input String"; Code[200])
        {
            Caption = 'String Input';
        }
        field(2; "Output String"; Code[100])
        {
            Caption = 'String Output';
        }
        field(3; "Date"; Date)
        {
            Caption = 'Date';
            DataClassification = ToBeClassified;
        }

    }
    keys
    {
        key(PK; "Input String")
        {
            Clustered = true;
        }

    }
}
