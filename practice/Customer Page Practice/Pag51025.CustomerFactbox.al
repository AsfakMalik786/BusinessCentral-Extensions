page 51025 "Cust FactBox"
{
    ApplicationArea = All;
    Caption = 'My Cust FactBox';
    PageType = CardPart;
    SourceTable = "Customer Tables";


    layout
    {
        area(Content)
        {

            group("My Customer Image")
            {

                field("Customer Image"; Rec."File")
                {
                    ApplicationArea = All;
                }

            }
            group("Customer Information")
            {
                field("Customer Code"; Rec."Customer Id")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Code';
                    Editable = true;



                }
                field("Customer Name"; rec."Customer Name")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Name';
                    Editable = true;

                }
                field("Total's Amount"; Rec."Total Sales Amount")
                {
                    ApplicationArea = All;
                    Style = Strong;

                }

            }



        }

    }
    actions
    {
        area(Processing)
        {
            action("Upload Image")
            {
                Caption = 'Upload Image';
                ApplicationArea = All;
                Image = Import;

                trigger OnAction()
                var
                    InstreamPic: InStream;
                    FromFileName: Text;

                begin
                    if UploadIntoStream('Import Pic', '', 'All Files (*.*)|*.*', FromFileName, InstreamPic) then
                        Rec."File".ImportStream(InstreamPic, FromFileName);
                    Rec.Modify();
                    Message('Import Done');
                end;



            }
            action(Delete)
            {
                ApplicationArea = All;
                Image = Delete;

                trigger OnAction()
                begin
                    if Rec."File".HasValue then
                        Clear(Rec."File");
                    Rec.Modify(true);
                    Message('Delete Done');
                end;
            }
            action("Image Download")
            {
                Caption = 'Download Image';
                ApplicationArea = All;
                Image = Download;

                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    InStream: InStream;
                    OutStream: OutStream;
                    FileName: Text;
                    Rec: Record "My Custom Table";
                begin

                    TempBlob.CreateOutStream(OutStream);
                    Rec."Customer Image".ExportStream(OutStream);
                    TempBlob.CreateInStream(InStream);
                    DownloadFromStream(InStream, '', '', '', FileName);
                    Message('File Downloaded Successfully');

                end;

            }
        }
    }
}
