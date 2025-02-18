table 51000 "Student Table"
{
    Caption = 'Card Page Type';
    DataClassification = ToBeClassified;
    PasteIsValid = true;

    fields
    {
        field(101; "Sr.No."; BigInteger)
        {
            DataClassification = ToBeClassified;

        }
        field(1; "Student Id"; BigInteger)
        {
            Caption = 'Student Id';
            ToolTip = 'Enter Student Id';
            AutoIncrement = true;

        }
        field(2; "Student Name"; Code[30])
        {
            Caption = 'Student Name';
            ToolTip = 'Enter Student Name';

        }
        field(3; "Student Ph.No."; Code[15])
        {
            Caption = 'Student Ph.No.';
            AutoFormatExpression = '<<+91-###-###-####>>';

        }
        field(4; "Student Address"; Code[100])
        {
            Caption = 'Student Address';
        }
        field(5; DOB; Date)
        {
            Caption = 'DOB';
        }

    }
    keys
    {
        key(PK; "Sr.No.")
        {
            Clustered = true;
        }
        key(Sk; "Student Id")
        {
            Clustered = false;
        }
    }
}
