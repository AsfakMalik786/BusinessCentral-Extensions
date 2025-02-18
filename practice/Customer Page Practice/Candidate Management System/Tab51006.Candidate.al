table 51006 Candidate
{
    Caption = 'Candidate';
    DataClassification = ToBeClassified;

    fields
    {
        field(11; BigInteger; BigInteger)
        {
            DataClassification = ToBeClassified;
        }

        field(1; "Candidate Id"; Integer)
        {
            Caption = 'Candidate Id';
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }

        field(2; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(3; Email; Text[100])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;
        }
        field(4; Phone; Text[20])
        {
            Caption = 'Phone';
        }
        field(5; Education; Text[150])
        {
            Caption = 'Education';
        }
        field(6; "Experience (Year)"; Integer)
        {
            Caption = 'Experience (Year)';
        }
        field(7; Skills; Text[250])
        {
            Caption = 'Skills';
        }
        field(8; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = ',Pending,Shortlisted,Rejected';
            OptionMembers = Pending,Shortlisted,Rejected;
        }
        field(9; Resume; Media)
        {
            DataClassification = ToBeClassified;



        }
        field(10; Photos; Blob)
        {
            DataClassification = ToBeClassified;
            Subtype = Bitmap;

        }
    }
    keys
    {
        key(PK; "Candidate Id")
        {
            Clustered = true;
        }
    }


}
