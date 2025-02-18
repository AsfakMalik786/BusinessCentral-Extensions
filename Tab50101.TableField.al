table 51001 "Customer Table"
{
    Caption = 'Table Field';
    DataClassification = ToBeClassified;
    // LinkedObject = true;
    // LinkedInTransaction = true;


    DataCaptionFields = "Customer Name", "Customer Number";
    PasteIsValid = false;






    fields
    {
        field(010; "Customer Number"; Integer)
        {
            DataClassification = CustomerContent;
            AutoIncrement = true;


        }
        field(1; "Customer Name"; Text[20])
        {

            DataClassification = CustomerContent;
            CaptionClass = 'Customer Name';
            CaptionML = ENU = 'Customer NameSSS';


            trigger OnValidate()
            begin
                Message('Customer Name is validated : ', "Customer Name");
            end;

        }
        field(2; "Phone No."; Text[18])
        {
            Caption = 'Phone No.';
            DataClassification = CustomerContent;
        }
        field(3; "Item Sell"; Integer)
        {
            Caption = 'Order Sales';
            DataClassification = CustomerContent;



        }
        field(4; "Customer Status"; Option)
        {
            Caption = 'Customer Status';
            DataClassification = CustomerContent;
            OptionMembers = "","Active","Inactive";
            OptionCaption = ''',Active, Inactive';
        }
        field(5; "Order Amount"; Decimal)
        {
            Caption = 'Order Amount';
            DataClassification = CustomerContent;



        }
        field(6; "Order date"; Date)
        {
            DataClassification = ToBeClassified;
            ClosingDates = true;

        }
        field(7; Email; Code[80])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = Email;
        }

    }
    keys
    {
        key(PK; "Customer Number")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(Brick; "Customer Name", "Customer Number")
        {

        }
    }
}
