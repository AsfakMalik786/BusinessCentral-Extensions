page 51026 "Customer Role Center Page"
{
    PageType = RoleCenter;
    Caption = 'Welcome To Student Role Center Page';
    ApplicationArea = All;
    AboutTitle = 'Customer Role Center Page Overview';
    AboutText = 'This page displays the details of the customer.';
    Extensible = true;


    layout
    {
        area(RoleCenter)
        {
            group(group1)
            {
                part(part1; "Role center Headline")
                {
                    ApplicationArea = All;
                }
            }
            group(group2)
            {
                part(part2; "Customer Card Part")
                {
                    ApplicationArea = All;
                }
                part(part4; "Card Part 2")
                {
                    ApplicationArea = All;
                }
            }
            group(group3)
            {
                part(part3; "List Part")
                {
                    ApplicationArea = All;
                }
            }



        }
    }

    actions
    {

        area(Sections)
        {
            group("Company Customers")
            {
                Caption = 'Customer Info';
                Image = List;

                action("Company Customer Card")
                {
                    RunObject = Page "Company Customer Page ";
                    Caption = 'Customer Card';
                    Image = Card;
                    ApplicationArea = All;
                }
                action("Comoany Customers List")
                {
                    RunObject = Page "Company Customers List ";
                    Caption = 'Company Customers List';
                    Image = List;
                    ApplicationArea = All;
                }
                action("Company Customer Page")
                {
                    RunObject = Page "Company Customer Page ";
                    Caption = 'Company Customer Page';
                    Image = Card;
                    ApplicationArea = All;
                }
                action("Customer List Plus")
                {
                    RunObject = Page "Customer List Plus";
                    Caption = 'Customer List Plus';
                    Image = List;
                    ApplicationArea = All;
                }
                action("My Cust Card")
                {
                    RunObject = Page "My Cust Card";
                    Caption = 'My Customer card';
                    Image = Accounts;
                    ApplicationArea = All;
                }


            }

        }
        area(Embedding)
        {
            action("Company Customers Card")
            {
                Caption = 'Customer Card';
                RunObject = Page "Company Customer Page ";
                ApplicationArea = All;
            }

            action("Company Customers List")
            {
                Caption = 'Customer List';
                RunObject = Page "Company Customers List ";
                ApplicationArea = All;
            }

            action("Customer Worksheet")
            {
                Caption = 'Customer Worksheet';
                RunObject = Page "Work Sheet";
                ApplicationArea = All;
            }



        }
        area(Creation)
        {
            action("Add Customer")
            {
                Caption = 'Customer Creation';
                RunObject = Page "Company Customer Page ";
                ApplicationArea = All;
                RunPageMode = View;
            }

            action("Add List")
            {
                Caption = 'Customer List Creation';
                RunObject = Page "Company Customers List ";
                ApplicationArea = All;
                RunPageMode = Create;
            }
        }
        area(Processing)
        {
            action("Update Customer")
            {
                Caption = 'Update Customer';
                RunObject = Page "Company Customer Page ";
                ApplicationArea = All;
                RunPageMode = Edit;
            }


        }
        area(Reporting)
        {
            action("Customer Report")
            {
                Caption = 'Customer Report';
                RunObject = Report "Sales Prepmt. Document Test";
                ApplicationArea = All;
                Image = Report;
            }

        }

    }
}
profile "Customer Profile"
{
    Caption = 'Customer Information';
    ProfileDescription = 'Customer Information';
    RoleCenter = "Customer Role Center Page";

}
