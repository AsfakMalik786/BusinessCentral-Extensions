table 51020 "My Custom Table"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Customer Code"; BigInteger)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; "Customer Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Order Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Order Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Order T/D"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Order Quantity"; Integer)
        {

            // FieldClass = FlowField;
            // CalcFormula = sum("My Custom Table"."Order Quantity");
        }
        field(7; "Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Total Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("My Custom Table"."Price");
            trigger OnValidate()
            begin
                if "Total Amount" < 100 then begin
                    Error('Total Amount should be less than 100');
                end;
            end;

        }
        field(10; "Work Description"; Blob)
        {
            SubType = Bitmap;
            DataClassification = ToBeClassified;
        }
        field(11; "Customer Image"; Media)
        {
            DataClassification = ToBeClassified;
        }
    }
    fieldgroups
    {
        fieldgroup(Brick; "Customer Code", "Customer Name", "Customer Image")
        {

        }
    }
    trigger OnDelete()
    begin
        Message('On Delete Triggered');
    end;

    trigger OnInsert()
    begin
        Message('On Insert Triggered');
    end;

    trigger OnModify()
    begin
        Message('On Modify Triggered');
    end;

    trigger OnRename()
    begin
        Message('On Rename Triggered');
    end;
}
