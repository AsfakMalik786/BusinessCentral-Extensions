page 51021 "Customer grid layout"
{
    ApplicationArea = All;
    Caption = 'Customer grid layout';
    PageType = Card;
    SourceTable = "Customer Tables";


    layout
    {
        area(Content)
        {
            grid(General)
            {


                Caption = 'General';


                field("Customer Id"; Rec."Customer Id")
                {
                    ToolTip = 'Specifies the value of the Customer Id field.', Comment = '%';
                    ColumnSpan = 4;


                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.', Comment = '%';

                }
                field("Customer Phone."; Rec."Customer Phone.")
                {
                    ToolTip = 'Specifies the value of the Phone No. field.', Comment = '%';

                }
                field("Customer Email"; Rec."Customer Email")
                {
                    ToolTip = 'Specifies the value of the Email field.', Comment = '%';
                }
                field("Customer Address"; Rec."Customer Address")
                {
                    ToolTip = 'Specifies the value of the Customer Address field.', Comment = '%';
                    ColumnSpan = 4;
                }
                field("Customer Status"; Rec."Customer Status")
                {
                    ToolTip = 'Specifies the value of the Customer Status field.', Comment = '%';
                }
            }
        }
    }
}
