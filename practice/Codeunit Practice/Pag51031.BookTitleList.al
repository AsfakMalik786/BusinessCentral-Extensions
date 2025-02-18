page 51031 "Book Title List"
{
    ApplicationArea = All;
    Caption = 'Book Title List';
    PageType = List;
    SourceTable = "Book Title";
    UsageCategory = Lists;
    CardPageId = "Book Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Book Id"; Rec."Book Id")
                {
                    ToolTip = 'Specifies the value of the Book Id field.', Comment = '%';
                    Style = Favorable;
                }
                field("Book Publisher"; Rec."Book Publisher")
                {
                    ToolTip = 'Specifies the value of the Book Publisher field.', Comment = '%';
                    Style = StrongAccent;
                }
                field("Book Title"; Rec."Book Title")
                {
                    ToolTip = 'Specifies the value of the Title field.', Comment = '%';
                    Style = AttentionAccent;
                }
            }
        }
    }
}
