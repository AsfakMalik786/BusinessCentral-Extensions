page 51014 "Customer List Plus"
{
    PageType = ListPlus;
    SourceTable = "Customer Tables";
    Caption = 'Customer List Plus';
    HelpLink = 'https://www.youtube.com';


    layout
    {
        area(Content)
        {
            group(Group)
            {
                field("Customer Id."; Rec."Customer Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Displays the customer number.';
                }

                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Displays the customer name.';
                    // Editable = true;
                }

                field("Sales Amount"; Rec."Sales Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Displays the customer Amount.';
                }
            }
        }

        area(FactBoxes)
        {
            part("Company Customer Card"; "Customer Card Part")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(EditCustomer)
            {
                ApplicationArea = All;
                Caption = 'Edit Customer';
                RunObject = Page "Company Customer Page ";
            }
        }
    }

    trigger OnOpenPage()
    begin
        Message('Welcome to the Customer List Plus page!');
    end;
}
