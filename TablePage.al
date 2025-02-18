page 51003 "Data Clasiification"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Data Classification";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Customer Number"; Rec."Customer Number")
                {
                    ApplicationArea = All;
                }
                field("Account Number"; Rec."Account Number")
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Upload Document"; Rec."Upload Document")
                {
                    ApplicationArea = All;
                }
                field("Log Details"; Rec."Log Details")
                {
                    ApplicationArea = All;
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

    var
        myInt: Integer;
}