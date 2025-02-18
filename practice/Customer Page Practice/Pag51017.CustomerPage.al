page 51017 "Company Customer Page "
{
    ApplicationArea = All;
    Caption = 'Company Customer Page ';
    PageType = Card;
    SourceTable = "Customer Tables";
    DataCaptionFields = "Customer Name", "Customer Id";
    AboutTitle = 'Customer Page OverView';
    AboutText = 'This page displays the details of the customer.';
    ContextSensitiveHelpPage = 'https://www.youtube.com';
    Description = 'This page displays the details of the customer.';
    // "Customer Tables".LinksAllowed = true;
    LinksAllowed = true;





    layout
    {

        area(Content)
        {

            group(General)
            {


                Caption = 'General';

                field("Customer Id"; Rec."Customer Id")
                {
                    ToolTip = 'Specifies the value of the Customer Id field.', Comment = '%';
                    AssistEdit = true;
                    Caption = 'Customer';
                    ShowCaption = true;

                    trigger OnValidate()

                    begin
                        Validate();

                    end;

                    trigger OnAfterLookup(Selected: RecordRef)
                    var
                        CustomerRec1: Record "Customer Tables";
                    begin
                        CustomerRec1.Get(Selected.RecordId);
                        Rec."Customer Name" := CustomerRec1."Customer Name";

                    end;


                    // AutoFormatExpression = 'Customer Id: %1';
                    // AutoFormatType = 1;
                    // trigger OnAssistEdit()
                    // begin
                    //     Message('Assist Edit Triggered');
                    // end;

                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.', Comment = '%';
                    trigger OnValidate()
                    begin
                        modifyrec();

                        Message(UpperCase(Rec."Customer Name"));
                    end;




                    // InstructionalText = 'Add Valid Customer Name.', Locked = true, Comment = 'Keep like this, do not translate.', MaxLength = 100;
                    // ColumnSpan = 2;

                    // trigger OnValidate()
                    // var
                    //     Publisher: Codeunit "Events";
                    // begin
                    //     Publisher.MyProcedure(Rec."Customer Name");
                    // end;




                }
                field("Customer Phone."; Rec."Customer Phone.")
                {
                    ToolTip = 'Specifies the value of the Customer Phone. field.', Comment = '%';

                    trigger OnValidate()
                    var
                        IsNumeric: Integer;
                    begin
                        onvalid();

                        if StrLen(Rec."Customer Phone.") <> 13 then
                            Error('Mobile Number Must Be Exactly 12 Digits Long')
                        else
                            Message('Phone Number is Added');
                    end;


                }
                field("Customer Email"; Rec."Customer Email")
                {
                    ToolTip = 'Specifies the value of the Customer Email field.', Comment = '%';
                }
                field("Customer Address"; Rec."Customer Address")
                {
                    ToolTip = 'Specifies the value of the Customer Address field.', Comment = '%';

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        CustomerRec: Record "Customer Tables";
                    begin
                        CustomerRec.SetFilter("Customer Address", 'Ahmedabad', 'Gujarat', 'Vadodara');

                        if Page.RunModal(Page::"Company Customers List ", CustomerRec) = Action::LookupOK then begin
                            Rec."Customer Address" := CustomerRec."Customer Address";

                        end;
                    end;

                    // trigger OnValidate()
                    // var
                    //     Publisher: Codeunit "Events";
                    // begin
                    //     Publisher.OnAdressChanged(Rec."Customer Address");
                    // end;
                    // trigger OnValidate()
                    // var
                    //     Publisher: Codeunit "Events";
                    // begin
                    //     Publisher.MyInternal(Rec."Customer Address");
                    // end;



                }
                field("Customer Status"; Rec."Customer Status")
                {
                    ToolTip = 'Specifies the value of the Customer Status field.', Comment = '%';
                    OptionCaption = ', Active, Inactive';

                }
                field("Sales Amount"; Rec."Sales Amount")
                {
                    ToolTip = 'Specifies the value of the Sales Amount field.', Comment = '%';
                    DecimalPlaces = 1 : 2;
                    AutoFormatExpression = '2,USD';
                    AutoFormatType = 10;
                    trigger OnValidate()
                    begin
                        if Rec."Sales Amount" < 5000 then
                            Message('Sorry! You Have Not Get Any Discount On This Price')
                        else
                            if (Rec."Sales Amount" > 6000) and
                            (Rec."Sales Amount" < 10000) then
                                Message('You Will Get 10% Discount')
                            else
                                if (Rec."Sales Amount" > 10000) and
                                (Rec."Sales Amount" < 15000) then
                                    Message('You Will Get 15% Discount');
                    end;

                }
                field("Sales Order"; Rec."Sales Order")
                {
                    ToolTip = 'Specifies the value of the Sales Order field.', Comment = '%';
                    QuickEntry = false;

                }
                field("order date"; Rec."order date")
                {
                    ToolTip = 'Specifies the value of the order date field.', Comment = '%';
                }
                field("Total Sales Amount"; Rec."Total Sales Amount")
                {
                    ToolTip = 'Specifies the value of the Total Sales Amount field.', Comment = '%';
                    AutoFormatExpression = '1,USD';
                    AutoFormatType = 5;
                    DecimalPlaces = 1 : 2;

                }
                field("Upload File"; Rec."File")
                {
                    ToolTip = 'Specifies the value of the Upload File field.', Comment = '%';


                }
            }

        }
        area(FactBoxes)
        {
            part(part2; "Cust FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "Customer Id" = field("Customer Id");
            }
            part(part3; "Cue Groups")
            {
                ApplicationArea = All;
                SubPageLink = "Customer Name" = field("Customer Name");

            }
        }


    }
    actions
    {
        area(Processing)
        {
            action("Confirmation Dialog")
            {
                RunObject = Page ConfirmationDialog;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = New;


            }

            action("Navigate Page")
            {
                RunObject = page "Customer Transactions Navigate";
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

            }
            action("Open Page")
            {
                RunObject = page "Customer Card";
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
            }
            action(" Grid layout")
            {

                RunObject = Page "Customer grid layout";
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
            }
            action(" REcord Id")
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    GetCustomerRecordId();
                end;
            }





        }




    }
    trigger OnInit()
    begin

    end;

    // trigger OnOpenPage()
    // begin
    //     Message('Welcome %1', UserId);

    // end;

    // trigger OnClosePage()
    // begin
    //     Message('Thank You For Using This Page %1', UserId);
    // end;

    // trigger OnNewRecord(BelowxRec: Boolean)
    // begin
    //     Message('New Record Initialize');
    // end;

    // trigger OnAfterGetRecord()
    // begin
    //     Message('After Get Record Customer : %1 Has A Balance Of %2', Rec."Customer Name", Rec."Sales Amount");
    // end;

    // trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    // begin
    //     Message('Customer %1 Has Been SuccessFully Added', Rec."Customer Name");
    // end;

    // trigger OnModifyRecord(): Boolean
    // begin
    //     Message('Customer %1 has Been Modified Thier Record', Rec."Customer Name");
    // end;

    // trigger OnQueryClosePage(CloseAction: Action): Boolean
    // begin

    //     Message(' This Page Is Closing.. %1', Rec."Customer Name");

    // end;

    // trigger OnAfterGetCurrRecord()
    // begin
    //     Message('Customer %1 Has Get Current Record', Rec."Customer Name");
    // end;

    // trigger OnPageBackgroundTaskError(TaskId: Integer; ErrorCode: Text; ErrorText: Text; ErrorCallStack: Text; var IsHandled: Boolean)
    // begin
    //     Message('task %1 Is Encounter Error : %2', TaskId, ErrorCode);
    // end;

    // trigger OnPageBackgroundTaskCompleted(TaskId: Integer; Results: Dictionary of [Text, Text])
    // begin
    //     Message('Task %1 is Completed With %2 ', TaskId, Results);
    // end;
    procedure Validate()
    var
        Cust: Record "Customer Tables";

    begin
        Cust.Validate("Customer Id");

    end;

    procedure GetCustomerRecordId()
    var
        CustomerRec: Record Customer;
        RecId: RecordId;
    begin
        CustomerRec.Get(Rec."Customer Id"); // Fetch customer with No. = '10000'
        RecId := CustomerRec.RecordId;

        Message('RecordId: %1', RecId);
    end;





    trigger OnDeleteRecord(): Boolean
    begin
        ConfirmDeletion()
    end;



    procedure ConfirmDeletion(): Boolean
    var
        ConfirmResult: Boolean;
    begin
        ConfirmResult := Dialog.Confirm('Are you sure you want to delete this record?');
        if ConfirmResult then
            Message('Record will be deleted.')
        else
            Message('Deletion canceled.');
        exit(ConfirmResult);
    end;

    trigger OnOpenPage()
    begin
        Message('On Modify The Address Is (Rec): %1', Rec."Customer Name");
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        if Rec."Customer Phone." = '' then
            Rec."Customer Phone." := '+91';
    end;

    local procedure IsNullOrEmpty(TextValue: Text): Boolean
    begin
        exit(TextValue = '');
    end;


    procedure modifyrec()
    begin
        Message('On Modify The Address Is (Rec): %1', Rec."Customer Name");
        Message('On modify, The Previous Address Is (xRec) : %1', xRec."Customer Name");
    end;



    procedure onvalid()
    var
        Cust: Record "Customer Tables";
    begin
        Cust.Validate("Customer Phone.", '+91');

    end;













}
