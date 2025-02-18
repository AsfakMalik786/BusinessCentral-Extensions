page 51008 "Student Project Report"
{
    ApplicationArea = All;
    Caption = 'Student Project Report';
    PageType = Card;
    SourceTable = "Student Project Report";


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
                field("Student Project Title"; Rec."Student Project Title")
                {
                    ToolTip = 'Specifies the value of the Student Project Title field.', Comment = '%';
                }
                field("Project Technology"; Rec."Project Technology")
                {
                    ToolTip = 'Specifies the value of the Project Technology field.', Comment = '%';
                }
                field("Project Status"; Rec."Project Status")
                {
                    ToolTip = 'Specifies the value of the Project Status field.', Comment = '%';
                }
                field("Project Starting Date"; Rec."Project Starting Date")
                {
                    ToolTip = 'Specifies the value of the Project Starting Date field.', Comment = '%';
                }
                field("Project Progress"; Rec."Project Progress")
                {
                    ToolTip = 'Specifies the value of the Project Progress field.', Comment = '%';
                }
            }
        }
    }
}
