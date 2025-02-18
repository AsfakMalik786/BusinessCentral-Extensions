table 51004 "Student Project Report"
{
    Caption = 'Student Project Report';
    DataClassification = ToBeClassified;

    fields
    {
        field(010; "Sr.No."; BigInteger)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(1; "Student Id"; BigInteger)
        {
            Caption = 'Student Id';
        }
        field(2; "Student Name"; Code[50])
        {
            Caption = 'Student Name';
        }
        field(3; "Student Project Title"; Code[100])
        {
            Caption = 'Student Project Title';
        }
        field(4; "Project Technology"; Code[100])
        {
            Caption = 'Project Technology';
        }
        field(5; "Project Progress"; Decimal)
        {
            Caption = 'Project Progress';
        }
        field(6; "Project Status"; Option)
        {
            Caption = 'Project Status';
            OptionMembers = "In Progress","Completed","On Hold";
            OptionCaption = ',In Progress,Completed,On Hold';
        }
        field(7; "Project Starting Date"; Date)
        {
            Caption = 'Project Starting Date';
        }
    }
    keys
    {
        key(PK; "Sr.No.")
        {
            Clustered = true;
        }
        key(SK; "Student Id")
        {
            Clustered = false;
        }
    }
}
