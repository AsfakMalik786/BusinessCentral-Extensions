page 51015 ConfirmationDialog
{
    ApplicationArea = All;
    Caption = 'ConfirmationDialog';
    PageType = ConfirmationDialog;
    SourceTable = "Customer Amount";
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                    ToolTip = 'Specifies the value of the Amount (LCY) field.', Comment = '%';
                }
                field("Amount 2 (LCY)"; Rec."Amount 2 (LCY)")
                {
                    ToolTip = 'Specifies the value of the Amount 2 (LCY) field.', Comment = '%';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.', Comment = '%';
                }
            }
        }
    }
}
