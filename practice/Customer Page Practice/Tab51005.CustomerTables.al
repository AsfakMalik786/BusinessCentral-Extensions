table 51005 "Customer Tables"
{
    Caption = 'Customer Tables';
    DataClassification = ToBeClassified;
    DataCaptionFields = "Customer Name", "Customer Id";


    fields
    {

        field(1; "Customer Id"; Integer)
        {
            Caption = 'Customer Id';
            AutoIncrement = true;

        }
        field(2; "Customer Name"; Text[50])
        {
            Caption = 'Customer Name';

        }
        field(3; "Customer Address"; Text[100])
        {
            Caption = 'Customer Address';
        }
        field(4; "Customer Phone."; Code[15])
        {
            Caption = 'Customer Phone.';


        }
        field(5; "Customer Email"; Text[20])
        {
            Caption = 'Customer Email';
        }
        field(6; "Sales Order"; Integer)
        {
            Caption = 'Sales Order';

        }
        field(7; "Sales Amount"; Decimal)
        {
            Caption = 'Sales Amount';
            DecimalPlaces = 1 : 2;
            AutoFormatExpression = '2,USD';
            AutoFormatType = 2;




        }
        field(8; "Total Sales Amount"; Decimal)
        {
            Caption = 'Total Sales Amount';
            DecimalPlaces = 1 : 2;
            FieldClass = FlowField;
            CalcFormula = sum("Customer Tables"."Sales Amount" where("Customer Id" = FIELD("Customer Id")));


        }
        field(9; "Customer Status"; Option)
        {
            Caption = 'Customer Status';
            OptionMembers = " ","Active","Inactive";
            OptionCaption = ', Active , Inactive';

        }
        field(10; "Order Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Order Date';
        }
        field(11; "File"; Media)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; "Customer Id")
        {
            Clustered = true;
        }
    }


}
