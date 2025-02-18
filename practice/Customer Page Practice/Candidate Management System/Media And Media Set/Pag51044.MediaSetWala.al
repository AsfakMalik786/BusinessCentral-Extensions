page 51044 "Media Set Wala"
{
    ApplicationArea = All;
    Caption = 'Media Set Wala';
    PageType = List;
    SourceTable = "MediaSet Wala";
    UsageCategory = Lists;
    CardPageId = "MediaSet Wala Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Mediaset Wala"; Rec."Mediaset Wala")
                {
                    ToolTip = 'Specifies the value of the Mediaset Wala field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
            }
        }
    }
}
