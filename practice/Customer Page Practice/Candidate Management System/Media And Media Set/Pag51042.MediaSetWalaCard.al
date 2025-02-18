page 51042 "MediaSet Wala Card"
{
    ApplicationArea = All;
    Caption = 'MediaSet Wala';
    PageType = Card;
    SourceTable = "MediaSet Wala";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Mediaset Wala"; Rec."Mediaset Wala")
                {
                    ToolTip = 'Specifies the value of the Mediaset Wala field.', Comment = '%';
                    ApplicationArea = All;

                }
            }

        }


    }
    actions
    {
        area(Processing)
        {
            action("Upload File")
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    onmedia();
                end;
            }
        }
    }
    procedure onmedia()
    var
        InS: InStream;
        FileText: Text;
    begin
        if UploadIntoStream('Select a file', '', '', FileText, InS) then begin
            Rec."Mediaset Wala".ImportStream(InS, 'Candidate Resume');
            Rec.Modify();
            Message('File uploaded successfully!');
        end;
    end;
}
