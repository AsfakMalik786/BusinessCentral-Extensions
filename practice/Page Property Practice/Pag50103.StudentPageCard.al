page 51000 "Student Page Card"
{
    ApplicationArea = All;
    Caption = 'Student Page Card';
    PageType = Card;
    SourceTable = "Student Table";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Sr.No."; Rec."Sr.No.")
                {
                    ToolTip = 'Specifies the value of the Sr.No. field.', Comment = '%';
                }


                field("Student Id"; Rec."Student Id")
                {
                    ToolTip = 'Specifies the value of the Student Id field.', Comment = '%';
                }
                field("Student Name"; Rec."Student Name")
                {
                    ToolTip = 'Specifies the value of the Student Name field.', Comment = '%';
                }
                field("Student Address"; Rec."Student Address")
                {
                    ToolTip = 'Specifies the value of the Student Address field.', Comment = '%';
                }
                field("Student Ph.No."; Rec."Student Ph.No.")
                {
                    ToolTip = 'Specifies the value of the Student Ph.No. field.', Comment = '%';
                }
                field(DOB; Rec.DOB)
                {
                    ToolTip = 'Specifies the value of the DOB field.', Comment = '%';
                }
            }
        }
    }
}
