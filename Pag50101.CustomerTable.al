page 51001 "Customers Card"
{
    ApplicationArea = All;
    Caption = 'Customer Card';
    PageType = Card;
    SourceTable = "Customer Table";
    UsageCategory = Lists;




    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';


                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.', Comment = '%';
                    ShowMandatory = true;
                    CaptionClass = 'Customer Name';
                    NotBlank = true;
                    LookupPageId = "Customer Card";
                    DrillDownPageId = "Customer Card";



                }
                field("Customer Number"; Rec."Customer Number")
                {
                    ToolTip = 'Specifies the value of the Customer Number field.', Comment = '%';
                }
                field("Customer Status"; Rec."Customer Status")
                {
                    ToolTip = 'Specifies the value of the Customer Status field.', Comment = '%';
                }
                field("Order Amount"; Rec."Order Amount")
                {
                    ToolTip = 'Specifies the value of the Order Amount field.', Comment = '%';



                }
                field("Item Sell"; Rec."Item Sell")
                {
                    ToolTip = 'Specifies the value of the Order Sales field.', Comment = '%';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ToolTip = 'Specifies the value of the Phone No. field.', Comment = '%';
                    ShowMandatory = true;
                    NotBlank = true;
                    Enabled = true;
                    ExtendedDatatype = PhoneNo;

                }
                field("Order Date"; Rec."Order date")
                {
                    ToolTip = 'Specifies the value of the Order Date field.', Comment = '%';
                    ClosingDates = true;
                    Enabled = true;

                }
                field(Email; Rec.Email)
                {
                    ToolTip = 'Specifies the value of the Email field.', Comment = '%';
                    Enabled = true;
                    ExtendedDatatype = Email;

                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        myInt: Integer;
    begin
        Message('Record Inserted');

    end;
}
