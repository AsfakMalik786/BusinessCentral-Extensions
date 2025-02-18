page 51032 "Book Title Lists"
{
    ApplicationArea = All;
    Caption = 'Book Title Lists';
    PageType = List;
    SourceTable = "Book Title Lists Table";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Book Title"; Rec."Book Title")
                {
                    ToolTip = 'Specifies the value of the Title field.', Comment = '%';
                }
                field("Book Genre"; Rec."Book Genre")
                {
                    ToolTip = 'Specifies the value of the Book Genre field.', Comment = '%';
                }
            }
        }
    }
}