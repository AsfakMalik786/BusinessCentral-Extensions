table 51002 "Student Results"
{
    Caption = 'Student Results';
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
        field(3; "Student Department"; Code[50])
        {
            Caption = 'Student Department';
        }
        field(4; "Student Semester"; Integer)
        {
            Caption = 'Student Semester';
        }
        field(5; CGPA; Decimal)
        {
            Caption = 'CGPA';
        }
        field(6; SGPA; Decimal)
        {
            Caption = 'SGPA';
        }
        field(7; "Current Backlog"; Integer)
        {
            Caption = 'Current Backlog';
        }
        field(8; "Total Backlog"; Integer)
        {
            Caption = 'Total Backlog';
            DataClassification = ToBeClassified;
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
