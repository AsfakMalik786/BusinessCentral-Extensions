page 51030 "Book Card"
{
    ApplicationArea = All;
    Caption = 'Book Card';
    PageType = Card;
    SourceTable = "Book Title";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Book Id"; Rec."Book Id")
                {
                    ToolTip = 'Specifies the value of the Book Id field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Book Publisher"; Rec."Book Publisher")
                {
                    ToolTip = 'Specifies the value of the Book Publisher field.', Comment = '%';
                    ApplicationArea = All;

                }

                field("Book Genre"; Rec."Book Genre")
                {
                    ToolTip = 'Specifies the value of the Book Genre field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Book Title"; Rec."Book Title")
                {
                    ToolTip = 'Specifies the value of the Title field.', Comment = '%';
                    ApplicationArea = All;
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        BookTitle: Record "Book Title Lists Table";

                    begin
                        if Rec."Book Genre" = Rec."Book Genre"::" " then begin
                            Message('Please select a Book Genre first.');
                            exit(false);
                        end;
                        BookTitle.SetRange("Book Genre", Rec."Book Genre");
                        if Page.RunModal(Page::"Book Title Lists", BookTitle) = Action::LookupOK then begin
                            Text := BookTitle."Book Title";
                            exit(true);
                        end;
                        exit(false);
                    end;
                }
            }

        }

    }

}
