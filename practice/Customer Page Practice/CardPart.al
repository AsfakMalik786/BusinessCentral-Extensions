page 51010 "Customer Card Part"
{
    PageType = CardPart;
    SourceTable = "Customer Tables";
    Caption = 'Customer Card Part';

    layout
    {
        area(Content)
        {
            cuegroup(OverView)
            {
                CuegroupLayout = Wide;
                field("No. Of Customer"; Rec."Customer Id")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Company Customers List ";
                    MultiLine = true;

                }
                field("Order Quantity"; Rec."Sales Amount")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Company Customers List ";
                }
                field("Total Sales Amount"; Rec."Total Sales Amount")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Company Customers List ";


                }


            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }







}