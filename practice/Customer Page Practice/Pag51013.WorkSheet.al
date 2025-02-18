page 51013 "Work Sheet"
{
    ApplicationArea = All;
    Caption = 'WorkSheet';
    PageType = Worksheet;
    SourceTable = "Customer Tables";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Customer Name"; Rec."Customer Id")
                {
                    ToolTip = 'Specifies the value of the Customer Id field.', Comment = '%';
                }
                field("Customer Number"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.', Comment = '%';
                }
                field("Customer Status"; Rec."Customer Status")
                {
                    ToolTip = 'Specifies the value of the Customer Status field.', Comment = '%';
                }
                field(Email; Rec."Customer Email")
                {
                    ToolTip = 'Specifies the value of the Email field.', Comment = '%';
                }
                field("Item Sell"; Rec."Customer Status")
                {
                    ToolTip = 'Specifies the value of the Order Sales field.', Comment = '%';
                }
                field("Sales Amount"; Rec."Sales Amount")
                {
                    ToolTip = 'Specifies the value of the Order Amount field.', Comment = '%';
                }
                field("Order date"; Rec."Order date")
                {
                    ToolTip = 'Specifies the value of the Order Date field.', Comment = '%';
                }
                field("Phone No."; Rec."Customer Phone.")
                {
                    ToolTip = 'Specifies the value of the Phone No. field.', Comment = '%';
                }
            }
        }
    }
}
