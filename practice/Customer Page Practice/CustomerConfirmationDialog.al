page 51019 "Confirm Deletion Dialog"
{
    PageType = ConfirmationDialog;
    Caption = 'Confirm Deletion';

    layout
    {
        area(content)
        {
            field("Confirm Message"; ConfirmText)
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Yes")
            {
                Caption = 'Yes';
                ApplicationArea = All;
                trigger OnAction()
                begin

                    Message('You confirmed the deletion.');
                end;
            }

            action("No")
            {
                Caption = 'No';
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Message('Deletion was cancelled.');
                end;
            }
        }
    }

    var
        ConfirmText: Text[250];

    trigger OnDeleteRecord(): Boolean
    var
        ConfirmText: Text[250];
    begin

        ConfirmText := 'Are you sure you want to delete this record?';
    end;
}
