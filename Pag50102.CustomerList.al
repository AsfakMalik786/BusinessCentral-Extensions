page 51002 "Customers List"
{
    ApplicationArea = All;
    Caption = 'Customer List';
    PageType = List;
    SourceTable = "Customer Table";
    UsageCategory = Lists;
    CardPageId = "Customers Card";



    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.', Comment = '%';

                }
                field("Customer Number"; Rec."Customer Number")
                {
                    ToolTip = 'Specifies the value of the Customer Number field.', Comment = '%';
                }
                field("Customer Status"; Rec."Customer Status")
                {
                    ToolTip = 'Specifies the value of the Customer Status field.', Comment = '%';
                }
                field("Order Amount"; Rec."Order Amount")
                {
                    ToolTip = 'Specifies the value of the Order Amount field.', Comment = '%';
                }
                field("Item Sell"; Rec."Item Sell")
                {
                    ToolTip = 'Specifies the value of the Order Sales field.', Comment = '%';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ToolTip = 'Specifies the value of the Phone No. field.', Comment = '%';
                }
                field("Order Date"; Rec."Order date")
                {
                    ToolTip = 'Specifies the value of the Order Date field.', Comment = '%';
                }
            }
        }
    }

    trigger OnDeleteRecord(): Boolean
    begin
        Message('Record Deleted');
    end;
}
