page 51035 "Date Function List"
{
    ApplicationArea = All;
    Caption = 'Date Function List';
    PageType = List;
    SourceTable = "Date Function";
    UsageCategory = Lists;
    CardPageId = "Date Function Tester";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Input Date"; Rec."Input Date")
                {
                    ToolTip = 'Specifies the value of the Input Date field.', Comment = '%';
                }
                field("Output Date"; Rec."Output Date")
                {
                    ToolTip = 'Specifies the value of the Output Date field.', Comment = '%';
                }
            }
        }
    }
}
