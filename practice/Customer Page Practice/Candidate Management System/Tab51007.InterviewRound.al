table 51007 "Interview Round"
{
    Caption = 'Interview Round';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Round Id"; Integer)
        {
            Caption = 'Round Id';
        }
        field(2; "Candidate ID"; Integer)
        {
            Caption = 'Candidate ID';
        }
        field(3; "Round Number"; Integer)
        {
            Caption = 'Round Number';
        }
        field(4; "Interviewer Name"; Text[100])
        {
            Caption = 'Interviewer Name';
        }
        field(5; "Date & Time"; DateTime)
        {
            Caption = 'Date & Time';
        }
        field(6; FeedBack; Text[250])
        {
            Caption = 'FeedBack';
        }
        field(7; OutCome; Option)
        {
            Caption = 'OutCome';
            OptionMembers = Pending,Passed,Failed;
            OptionCaption = ',Pending,Passed,Failed';

        }
        field(8; Image; MediaSet)
        {
            DataClassification = ToBeClassified;

        }
    }
    keys
    {
        key(PK; "Round Id")
        {
            Clustered = true;
        }
    }

}
