page 51005 "My Cust Card"
{
    ApplicationArea = All;
    Caption = 'My Cust Card';
    PageType = Card;
    SourceTable = "My Custom Table";


    layout
    {
        area(Content)
        {
            group("Customer Information")
            {
                Caption = 'Customer Information';

                field("Customer Code"; Rec."Customer Code")
                {
                    ToolTip = 'Specifies the value of the Customer Code field.', Comment = '%';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.', Comment = '%';

                    // trigger OnValidate()
                    // var
                    //     Publisher: Codeunit Events;
                    // begin
                    //     Publisher.MyProcedure(Rec."Customer Name");

                    // end;

                }
                field("Customer Image"; Rec."Customer Image")
                {
                    ToolTip = 'Specifies the value of the Customer Image field.', Comment = '%';

                }
                field("Work Description"; Rec."Work Description")
                {
                    ToolTip = 'Specifies the value of the Work Description field.', Comment = '%';
                }
            }
            group("Customer Sales Information")
            {
                Caption = 'Customer Sales Information';


                field("Order Date"; Rec."Order Date")
                {
                    ToolTip = 'Specifies the value of the Order Date field.', Comment = '%';
                }
                field("Order Quantity"; Rec."Order Quantity")
                {
                    ToolTip = 'Specifies the value of the Order Quantity field.', Comment = '%';
                }
                field("Order T/D"; Rec."Order T/D")
                {
                    ToolTip = 'Specifies the value of the Order T/D field.', Comment = '%';
                }
                field("Order Time"; Rec."Order Time")
                {
                    ToolTip = 'Specifies the value of the Order Time field.', Comment = '%';
                }
                field(Price; Rec.Price)
                {
                    ToolTip = 'Specifies the value of the Price field.', Comment = '%';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ToolTip = 'Specifies the value of the Total Amount field.', Comment = '%';
                }
            }
        }
        area(FactBoxes)
        {
            part(part1; "My Cust FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "Customer Code" = field("Customer Code");

            }
            part(part2; "Cue Group")
            {
                ApplicationArea = All;
                SubPageLink = "Customer Code" = field("Customer Code");

            }
        }


    }
    actions
    {
        area(Processing)
        {
            action(Action)
            {
                Image = Action;
                trigger OnAction()
                begin
                    Message('Action Trigger Is Called');
                end;
            }

        }
    }
    trigger OnOpenPage()
    begin
        Message('On Open Page Triggered');
    end;


}
