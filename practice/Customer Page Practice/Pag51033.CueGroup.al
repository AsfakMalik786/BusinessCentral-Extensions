page 51033 "Cue Groups"
{
    ApplicationArea = All;
    Caption = 'Cue Groups';
    PageType = CardPart;
    SourceTable = "Customer Tables";

    layout
    {
        area(Content)
        {
            cuegroup(General)
            {
                Caption = 'General';

                field("Sales Amount"; Rec."Sales Amount")
                {
                    ToolTip = 'Displays the customer Amount.';
                }
                field("Sales Order"; Rec."Sales Order")
                {
                    ToolTip = 'Specifies the value of the Sales Order field.', Comment = '%';
                }
                field("Total Sales Amount"; Rec."Total Sales Amount")
                {
                    ToolTip = 'Specifies the value of the Total Sales Amount field.', Comment = '%';
                }
            }
        }
    }
}
