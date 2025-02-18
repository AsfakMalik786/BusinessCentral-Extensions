page 51011 "List Part"
{
    PageType = ListPart;
    ApplicationArea = All;
    Caption = 'List Part';

    SourceTable = "Customer Tables";

    layout
    {
        area(Content)
        {
            repeater("Customer List Part")
            {
                field("Customer Id"; Rec."Customer Id")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Customer List";
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Customer Card";
                }

                field("Total Sales Amount"; Rec."Total Sales Amount")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Customer List";
                }
            }
        }
    }
}