page 51018 "Company Customers List "
{
    ApplicationArea = All;
    Caption = 'Company Customer List ';
    PageType = List;
    SourceTable = "Customer Tables";
    CardPageId = "Company Customer Page ";
    HelpLink = 'https://www.youtube.com';





    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Caption = 'General';

                field("Customer Id"; Rec."Customer Id")
                {
                    ToolTip = 'Specifies the value of the Customer Id field.', Comment = '%';
                    Style = Standard;



                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.', Comment = '%';

                    HideValue = false;
                    Style = Ambiguous;
                }

                field("Customer Status"; Rec."Customer Status")
                {
                    ToolTip = 'Specifies the value of the Customer Status field.', Comment = '%';
                    Style = Strong;
                }

                field("Sales Order"; Rec."Sales Order")
                {
                    ToolTip = 'Specifies the value of the Sales Order field.', Comment = '%';
                    Style = Subordinate;


                }
                field("Total Sales Amount"; Rec."Total Sales Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Sales Amount field.', Comment = '%';


                }
                field("Customer Address"; Rec."Customer Address")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies The Address Of Customer';
                }
            }

        }


        area(FactBoxes)
        {
            part(part1; "Cust Factbox")
            {
                ApplicationArea = All;
                SubPageLink = "Customer Id" = field("Customer Id");
            }


        }

    }
    actions
    {
        area(Processing)
        {
            action("Get Customer Count")
            {
                ApplicationArea = All;
                Image = Import;
                trigger OnAction()
                begin
                    GetCustomerCount();
                end;
            }
            action("Find First")
            {
                ApplicationArea = All;
                Image = Find;
                trigger OnAction()
                begin
                    FindCustomer();
                end;
            }
            action("Get Customer")
            {
                ApplicationArea = All;
                Image = LinesFromTimesheet;
                trigger OnAction()
                begin
                    GetCustomer();
                end;
            }
            action("Show All Customers")
            {
                ApplicationArea = All;
                Image = SelectEntries;
                trigger OnAction()
                var
                    Cust: Record "Customer Tables";
                begin
                    ShowAllCustomers();


                end;
            }
            action("Get Total Sales")
            {
                ApplicationArea = All;
                Image = Totals;
                trigger OnAction()
                begin
                    GetTotalSales();
                end;
            }
            action("Get Customers Above Sales")
            {
                ApplicationArea = All;
                Image = Totals;
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction()
                begin
                    GetCustomersAboveSales(50000);
                end;
            }
            action("Add Link")
            {
                ApplicationArea = All;
                Image = Link;
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction()
                begin
                    AddLink();
                end;
            }
            action("Modify Amount")
            {
                ApplicationArea = All;
                Image = Edit;
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction()
                begin
                    ModifyAmount();
                end;
            }
            action("Delete All Inactive Customers")
            {
                ApplicationArea = All;
                Image = Delete;
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction()
                begin
                    Delete();
                end;
            }
            action("Set Status Range")
            {
                ApplicationArea = All;
                Image = Edit;
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction()
                begin
                    Rec.SetFilter("Customer Status", 'Active');
                    if Rec.FindSet() then
                        repeat
                            Message(Rec."Customer Name");
                        until Rec.NEXT = 0;
                end;
            }
            action("Set Amount Range")
            {
                Image = Filter;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction()
                begin
                    SetAmountrange();
                end;
            }
            action("Get Filters")
            {
                Image = Filter;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction()
                begin
                    GetFilter();
                end;
            }
            action("Get View")
            {
                Image = Filter;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction()
                begin
                    GetView();
                end;
            }
            action("Set View")
            {
                Image = FilterLines;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction()
                begin
                    SetView();
                end;
            }
            action("Get Min Id")
            {
                Image = FilterLines;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction()
                begin
                    GetMinId();
                end;
            }
            action("Get Max Id")
            {
                Image = FilterLines;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    GetMaxId();
                end;
            }
            action("Copy Filter")
            {
                Image = FilterLines;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    CopyFilter();
                end;
            }
            action("Check For Has Filters")
            {
                Image = FilterLines;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    CheckForHasFilters();
                end;
            }
            action("Set Record Filter")
            {
                ApplicationArea = All;
                Image = Filter;
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction()

                begin
                    Rec.SetRecFilter();
                    Message('Filtered : %1', Rec.GetFilters());
                end;

            }
            action("Filter Group")
            {

                ApplicationArea = All;
                Image = Group;
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction()

                begin
                    Rec.FilterGroup(2); // Sets filter group to 2
                    Rec.SetRange("Customer Status", Rec."Customer Status"::Active);
                    Message(Format(Rec."Customer Status"), Rec.FilterGroup(2)); // Returns to default filter group
                end;


            }
            action("Mark Filters")
            {
                ApplicationArea = All;
                Image = MachineCenterLoad;
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction()
                var
                    Cust: Record "Customer Tables";
                begin
                    // Clear any previous marks
                    if Cust.FindSet then
                        repeat
                            if Cust."Total Sales Amount" > 10000 then
                                Cust.MARK(true); // Marking customers with balance > 10,000
                        until Cust.Next = 0;
                end;

            }
            action("Field Name")
            {
                ApplicationArea = All;
                Image = MachineCenterLoad;
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction()
                var
                    Cust: Record "Customer Tables";
                begin
                    Message('Field Name: %1', Cust.FieldName("Customer Name"));
                end;
            }
            action("Field No")
            {
                ApplicationArea = All;
                Image = MachineCenterLoad;
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction()
                var
                    Cust: Record "Customer Tables";
                begin
                    Message('Field No: %1', Cust.FieldNo("Customer Name"));
                end;
            }
            action("Field Number")
            {
                ApplicationArea = All;
                Image = MachineCenterLoad;
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction()
                var
                    Cust: Record "Customer Tables";
                begin
                    Message('Field No: %1', Cust.FieldNo("Customer Name"));
                end;
            }
            action("Field Active")
            {
                ApplicationArea = All;
                Image = MachineCenterLoad;
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction()
                var
                    Cust: Record "Customer Tables";
                begin
                    Message('Field Active: %1', Cust.FieldActive("Customer Name"));
                end;
            }
            action("Field Caption")
            {
                ApplicationArea = All;
                Image = MachineCenterLoad;
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction()
                var
                    Cust: Record "Customer Tables";
                begin
                    Message('Field Caption: %1', Cust.FieldCaption("Customer Name"));
                end;

            }
            action("Relation")
            {
                ApplicationArea = All;
                Image = MachineCenterLoad;
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction()
                var
                    Cust: Record "Customer Tables";
                begin
                    Message('Relation: %1', Cust.Relation("Customer Id"));
                end;
            }
            action("Filter Group Action")
            {
                ApplicationArea = All;
                Image = Filter;
                Promoted = true;
                PromotedCategory = Category4;
                trigger OnAction()
                begin
                    filtergroup();
                end;
            }
            action("Filter Group 2")
            {
                ApplicationArea = All;
                Image = FilterLines;
                Promoted = true;
                PromotedCategory = Category4;
                trigger OnAction()
                begin
                    filtergroup1();
                end;
            }
            action("Filter Group 3")
            {
                ApplicationArea = All;
                Image = FilterLines;
                Promoted = true;
                PromotedCategory = Category4;
                trigger OnAction()
                begin
                    filtergroup2();
                end;
            }
            action("Set Range")
            {
                ApplicationArea = All;
                Image = Filter;
                Promoted = true;
                PromotedCategory = Category4;
                trigger OnAction()
                begin
                    Rec.SetRange("Customer Id", 11, 25);
                end;
            }
            action("Set Filter")
            {
                ApplicationArea = All;
                Image = Filter;
                Promoted = true;
                PromotedCategory = Category4;
                trigger OnAction()
                begin
                    Rec.SetFilter("Total Sales Amount", '5000');

                end;
            }

        }
    }

    procedure GetCustomerCount()
    var
        Cust: Record "Customer Tables";
    begin

        // Cust.ChangeCompany('Malek & Sons');
        // Message('Current Company: %1', Cust.CurrentCompany);

        Message('Total Customer Count : %1', Cust.Count);
        Message('Table Name: %1', Cust.TABLENAME);
        Message('Table Caption: %1', Cust.TABLECAPTION);
        Message('Record ID: %1', Cust.RECORDID);



    end;

    procedure FindCustomer()
    var
        cust: Record "Customer Tables";
    begin
        cust.Ascending := false;
        if cust.FindFirst() then
            Message('First Customer Name: %1', cust."Customer Name");

        if cust.FindLast() then
            Message('Last Customer Name: %1', cust."Customer Name");
    end;

    procedure GetCustomer()
    var

        Cust: Record "Customer Tables";
    begin

        if Cust.Get(Rec."Customer Id") then
            Message('Customer Found: %1', Cust."Customer Name")
        else
            Message('Customer Not Found');

    end;

    procedure ShowAllCustomers()
    var
        Cust: Record "Customer Tables";
    begin
        if Cust.GetAscending("Customer Id") then
            Message('Sorting In Ascending');
        if Cust.FINDSET then
            repeat
                Message('Customer: %1, Sales: %2', Cust."Customer Name", Cust."Sales Amount");
            until Cust.NEXT = 0;
    end;

    procedure GetTotalSales()
    var
        Cust: Record "Customer Tables";
    begin
        Cust.CalcSums("Sales Amount");
        Message('Total Sales Amount: %1', Cust."Sales Amount");
    end;

    procedure GetCustomersAboveSales(Amount: Decimal)
    var
        Cust: Record "Customer Tables";
    begin
        Cust.RESET;
        Cust.SETFILTER("Sales Amount", '> %1', Amount);
        if Cust.FINDSET then
            repeat
                Message('Customer: %1, Sales: %2', Cust."Customer Name", Cust."Sales Amount");
            until Cust.NEXT = 0;
    end;

    procedure AddLink()
    var
        Cust: Record "Customer Tables";
    begin
        if Cust.Get(25) then
            Cust.AddLink('https://www.google.com');
    end;

    procedure ModifyAmount()
    var
        Cust: Record "Customer Tables";
    begin
        Cust.ModifyAll("Sales Amount", 5000);
    end;

    procedure Delete()
    var
        Cust: Record "Customer Tables";
    begin
        Cust.SetRange("Customer Status", Cust."Customer Status"::Inactive);
        Cust.DeleteAll();
    end;

    procedure SetAmountrange()
    var
        Cust: Record "Customer Tables";
    begin
        Cust.SetFilter("Total Sales Amount", '>10000');
        if Cust.FindSet() then
            repeat
                Message(Cust."Customer Name");
            until Cust.NEXT = 0;
    end;

    procedure GetFilter()
    var
        Cust: Record "Customer Tables";
        Filters: Text;
    begin
        begin
            Cust.SetFilter("Customer Status", 'Active');
            Cust.SetFilter("Total Sales Amount", '5000');
            Filters := Cust.GetFilters();
            Message('Filters applied: ' + Filters);
        end;

    end;

    procedure GetView()
    var
        Cust: Record "Customer Tables";
        ViewText: Text;

    begin
        ViewText := Cust.GetView();
        Message('Current View: ' + ViewText);
    end;

    procedure SetView()
    var
        Cust: Record "Customer Tables";
        setview: Text;

    begin
        Cust.SetView('SetView :' + setview);
    end;

    procedure GetMinId()
    var
        Cust: Record "Customer Tables";
        MinValue: Code[20];
    begin
        Cust.SetRange("Customer Id", 11, 22);
        MinValue := Format(Cust.GetRangeMin("Customer Id"));
        Message('Minimum Customer Id in range: ' + MinValue);
    end;

    procedure GetMaxId()
    var
        Cust: Record "Customer Tables";
        MaxValue: Code[20];
    begin
        Cust.SetRange("Customer Id", 11, 22);
        MaxValue := Format(Cust.GetRangeMax("Customer Id"));
        Message('Maximum Customer Id in range: ' + MaxValue);
    end;

    procedure CopyFilter()
    var
        Cust1, Cust2 : Record "Customer Tables";
    begin

        if Cust1.FindSet() then begin
            Cust1.SetFilter("Customer Status", 'Active');

            Cust2.CopyFilters(Cust1);

            Message('Filters copied successfully.');
        end else
            Message('No active customers found.');
    end;

    procedure CheckForHasFilters()
    var
        Cust: Record "Customer Tables";
    begin
        if Cust.HasFilter then
            Message('Filters are applied')
        else
            Message('No filters applied');
    end;

    procedure SetRecoFilter()
    var
        Cust: Record "Customer Tables";
    begin
        // if Cust.Get(Cust."Customer Id") then begin
        Cust.SetRecFilter();
        Message(Cust.GetFilters());
    end;

    procedure filtergroup()

    var
        Cust: Record "Customer Tables";

    begin
        // Cust.FilterGroup(0);
        // Cust.SetRange("Customer Id", 0, 20);
        // Message('Filter Group 0 Applied: Customers from 10000 to 20000');



    end;

    procedure filtergroup1()
    var
        Cust: Record "Customer Tables";

    begin
        // Cust.FilterGroup(1);
        // Cust.SetFilter("Customer Address", 'Vadodara');  // Only Indian customers
        // Message('Filter Group 1 Applied: Only Indian customers shown');

    end;

    procedure filtergroup2()
        Cust: Record "Customer Tables";

    begin
        Cust.FilterGroup(-1);
        Cust.SetFilter("Customer Name", '@*Asfak*');
        Message('Filter Group -1 Applied: Searching "Asfak" in Name or Contact');


    end;



}
