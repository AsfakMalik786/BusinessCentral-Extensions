table 51012 "Array Function"
{
    Caption = 'Array Function';

    fields
    {
        field(1; "Input "; Integer)
        {
            Caption = 'Input ';
        }
        field(2; Output; Integer)
        {
            Caption = 'Output';
        }
    }
    keys
    {
        key(PK; "Input ")
        {
            Clustered = true;
        }
    }

}
