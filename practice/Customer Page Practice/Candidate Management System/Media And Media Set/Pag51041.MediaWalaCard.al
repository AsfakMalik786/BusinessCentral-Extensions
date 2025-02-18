page 51041 "MediaWala Card"
{
    ApplicationArea = All;
    Caption = 'MediaWala';
    PageType = Card;
    SourceTable = MediaWala;

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
                field(Media; Rec.Media)
                {
                    ToolTip = 'Specifies the value of the Media field.', Comment = '%';
                    ApplicationArea = All;


                }
            }

        }

    }
    actions
    {
        area(Processing)
        {
            action("Upload Photo")
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    onactionmedia();
                end;
            }
        }
    }
    procedure onactionmedia()
    var
        InS: InStream;
        FileText: Text;
    begin
        if UploadIntoStream('Select a file', '', '', FileText, InS) then begin
            Rec.Media.ImportStream(InS, 'Candidate Resume');
            Rec.Modify();
            Message('File uploaded successfully!');
        end;
    end;


}
