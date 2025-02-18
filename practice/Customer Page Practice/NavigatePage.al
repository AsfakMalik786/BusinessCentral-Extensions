page 51020 "Customer Transactions Navigate"
{
    PageType = NavigatePage;
    SourceTable = Customer;
    Caption = 'Customer Transactions';

    layout
    {
        area(content)
        {
            group("Customer Details")
            {
                field("Customer Name"; Rec.Name)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Customer No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Balance"; Rec."Balance (LCY)")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }

            group("Transactions")
            {
                part("Posted Invoices"; "Posted Sales Invoice Subform")
                {
                    ApplicationArea = All;
                }

                part("Shipments"; "Posted Return Shipment Subform")
                {
                    ApplicationArea = All;
                }

                part("Payments"; "Customer Ledger Entry FactBox")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("View Customer Card")
            {
                Caption = 'View Customer Card';
                ApplicationArea = All;
                trigger OnAction()
                begin
                    PAGE.RUN(PAGE::"Customer Card", Rec);
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Message('Navigate page for customer transactions opened.');
    end;
}
