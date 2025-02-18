table 51003 "Data Classification"
{



    fields
    {
        field(1; "Customer Number"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Account Number"; Decimal)
        {
            DataClassification = AccountData;
        }
        field(3; "Customer Name"; Text[50])
        {
            DataClassification = EndUserIdentifiableInformation;
        }
        field(4; "Upload Document"; Blob)
        {
            DataClassification = CustomerContent;
        }
        field(5; "Log Details"; Text[200])
        {
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Key1; "Customer Name")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}