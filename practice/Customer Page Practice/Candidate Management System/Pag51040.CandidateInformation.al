page 51040 "Candidate Information"
{
    ApplicationArea = All;
    Caption = 'Candidate Information';
    PageType = CardPart;
    SourceTable = Candidate;

    layout
    {
        area(Content)
        {

            group("Candidate Resume")
            {
                field("Resume"; Rec.Resume)
                {
                    ApplicationArea = All;


                }

            }

            group(Information)
            {
                Caption = 'General';
                field("Candidate Id"; Rec."Candidate Id")
                {
                    ToolTip = 'Specifies the value of the Candidate Id field.', Comment = '%';
                }

                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field(Education; Rec.Education)
                {
                    ToolTip = 'Specifies the value of the Education field.', Comment = '%';
                }
                field("Experience (Year)"; Rec."Experience (Year)")
                {
                    ToolTip = 'Specifies the value of the Experience (Year) field.', Comment = '%';
                }
                field(Skills; Rec.Skills)
                {
                    ToolTip = 'Specifies the value of the Skills field.', Comment = '%';
                }
                field(Email; Rec.Email)
                {
                    ToolTip = 'Specifies the value of the Email field.', Comment = '%';
                }
                field(Phone; Rec.Phone)
                {
                    ToolTip = 'Specifies the value of the Phone field.', Comment = '%';
                }
            }
        }

    }
    actions
    {


        area(Processing)
        {

            action("Import the Profile Photo")
            {
                Caption = 'Import the Profile Photo';
                ApplicationArea = all;
                trigger OnAction()
                var
                    instream: InStream;
                    Filename: Text;
                    MyVariant: Variant;
                    MyFile: File;
                begin
                    if UploadIntoStream(Filename, '', 'All files (*.*)|*.*', Filename, instream) then
                        Rec."Resume".ImportStream(instream, Filename);
                    rec.Modify();
                    Message('profile photo upload SuccessFully!!');

                end;
            }
            action("Export The Profile Photo")
            {
                Caption = 'Export Profile Photo';
                ApplicationArea = all;
                trigger OnAction()
                var
                    Instr: InStream;
                    OutStr: OutStream;
                    TempBlob: Codeunit "Temp Blob";
                    Filename: Text;
                    Imglbl: Label '%1 image.jpg';
                begin

                    if rec."Resume".HasValue then begin
                        // Read the written data (for understanding)
                        TempBlob.CreateInStream(Instr);
                        // Initialize temporary blob
                        TempBlob.CreateOutStream(OutStr);
                        rec."Resume".ExportStream(OutStr);
                        Filename := StrSubstNo(Imglbl, Rec."Name");
                        DownloadFromStream(Instr, '', '', '', Filename);
                        Message('downloaded successfully..!');
                    end
                    else begin
                        Message('image is not available...!');
                    end;
                end;
            }



        }




    }
















}
