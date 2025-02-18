table 51011 "Date Function"
{
    Caption = 'Date ';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Input Date"; Text[50])
        {
            Caption = 'Input Date';
        }
        field(2; "Output Date"; Text[50])
        {
            Caption = 'Output Date';
        }
    }
    keys
    {
        key(PK; "Input Date")
        {
            Clustered = true;
        }
    }
}
