page 51027 "Card Part 2"
{
    ApplicationArea = All;
    Caption = 'Card Part 2';
    PageType = CardPart;
    SourceTable = "Customer Tables";

    layout
    {
        area(Content)
        {
            cuegroup(General)
            {
                Caption = 'General';

                cuegroup("New Release")
                {

                    field("Customer Id"; Rec."Customer Id")
                    {
                        ApplicationArea = All;
                        DrillDownPageId = "Company Customers List ";

                    }
                    field("Total Amount"; Rec."Total Sales Amount")
                    {
                        ApplicationArea = All;
                        DrillDownPageId = "Company Customers List ";

                    }

                }

            }
        }
    }
}
