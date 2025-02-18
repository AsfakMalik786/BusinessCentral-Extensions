page 51007 "Student Result Page"
{
    ApplicationArea = All;
    Caption = 'Student Result Page';
    PageType = Card;
    SourceTable = "Student Results";
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("Student Id"; Rec."Student Id")
                {
                    ToolTip = 'Specifies the value of the Student Id field.', Comment = '%';
                }
                field("Student Name"; Rec."Student Name")
                {
                    ToolTip = 'Specifies the value of the Student Name field.', Comment = '%';
                }
                field("Student Department"; Rec."Student Department")
                {
                    ToolTip = 'Specifies the value of the Student Department field.', Comment = '%';
                }
                field("Student Semester"; Rec."Student Semester")
                {
                    ToolTip = 'Specifies the value of the Student Semester field.', Comment = '%';
                }
                field(SGPA; Rec.SGPA)
                {
                    ToolTip = 'Specifies the value of the SGPA field.', Comment = '%';
                }
                field(CGPA; Rec.CGPA)
                {
                    ToolTip = 'Specifies the value of the CGPA field.', Comment = '%';
                }
                field("Current Backlog"; Rec."Current Backlog")
                {
                    ToolTip = 'Specifies the value of the Current Backlog field.', Comment = '%';
                }
                field("Total Backlog"; Rec."Total Backlog")
                {
                    ToolTip = 'Specifies the value of the Total Backlog field.', Comment = '%';
                }
            }
        }
    }
}
