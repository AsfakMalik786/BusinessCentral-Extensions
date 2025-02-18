page 51023 "My Custo List"
{
    ApplicationArea = All;
    Caption = 'My Custo List';
    PageType = List;
    SourceTable = "My Custom Table";
    UsageCategory = Lists;
    CardPageId = "My Cust Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Customer Code"; Rec."Customer Code")
                {
                    ToolTip = 'Specifies the value of the Customer Code field.', Comment = '%';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.', Comment = '%';
                }
                field("Order Date"; Rec."Order Date")
                {
                    ToolTip = 'Specifies the value of the Order Date field.', Comment = '%';
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

            }
        }

    }



}
