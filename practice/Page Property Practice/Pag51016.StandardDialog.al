page 51016 "Custom Dialog Example"
{
    PageType = StandardDialog;
    ApplicationArea = All;
    Caption = 'Custom Dialog Example';

    layout
    {
        area(content)
        {
            group("Parameters")
            {
                field("Start Date"; StartDate)
                {
                    ApplicationArea = All;
                    Caption = 'Start Date';
                }
                field("End Date"; EndDate)
                {
                    ApplicationArea = All;
                    Caption = 'End Date';
                }
                field("Include Archived"; IncludeArchived)
                {
                    ApplicationArea = All;
                    Caption = 'Include Archived';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(OK)
            {
                Caption = 'OK';
                // Promoted = true;
                // PromotedCategory = Process;

                trigger OnAction()
                begin
                    // Logic for processing input data
                    Message('Start Date: %1, End Date: %2, Include Archived: %3', StartDate, EndDate, IncludeArchived);
                    CurrPage.Close();
                end;
            }
            action(Cancel)
            {
                Caption = 'Cancel';

                trigger OnAction()
                begin
                    CurrPage.Close();
                end;
            }
        }
    }

    var
        StartDate: Date;
        EndDate: Date;
        IncludeArchived: Boolean;
}
