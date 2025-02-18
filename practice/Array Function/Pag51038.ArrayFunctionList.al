page 51038 "Array Function List"
{
    ApplicationArea = All;
    Caption = 'Array Function List';
    PageType = List;
    SourceTable = "Array Function";
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Input "; Rec."Input ")
                {
                    ToolTip = 'Specifies the value of the Input field.', Comment = '%';
                }
                field(Output; Rec.Output)
                {
                    ToolTip = 'Specifies the value of the Output field.', Comment = '%';
                }
            }
        }
    }
}
