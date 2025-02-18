page 51024 "My Cust FactBox"
{
    ApplicationArea = All;
    Caption = 'My Cust FactBox';
    PageType = CardPart;
    SourceTable = "My Custom Table";



    layout
    {
        area(Content)
        {

            group("My Customer Image")
            {

                field("Customer Image"; Rec."Customer Image")
                {
                    ApplicationArea = All;
                }

            }
            group("Customer Information")
            {

                field("Customer Code"; Rec."Customer Code")
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
                field("Total Amount"; Rec."Total Amount")
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
                        Rec."Customer Image".ImportStream(InstreamPic, FromFileName);
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
                    if Rec."Customer Image".HasValue then
                        Clear(REc."Customer Image");
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

