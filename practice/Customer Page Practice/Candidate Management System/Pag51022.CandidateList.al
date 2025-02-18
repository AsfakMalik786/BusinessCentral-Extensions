page 51022 "Candidate List"
{
    ApplicationArea = All;
    Caption = 'Candidate List';
    PageType = List;
    SourceTable = Candidate;
    UsageCategory = Lists;
    CardPageId = "Candidate Card";


    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Candidate Id"; Rec."Candidate Id")
                {
                    ToolTip = 'Specifies the value of the Candidate Id field.', Comment = '%';
                    ApplicationArea = All;
                    Style = Standard;

                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                    ApplicationArea = All;
                    Style = Strong;
                }
                field(Phone; Rec.Phone)
                {
                    ToolTip = 'Specifies the value of the Phone field.', Comment = '%';
                    ApplicationArea = All;
                    Style = Subordinate;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                    ApplicationArea = All;
                    Style = Unfavorable;
                }
                field("Experience (Year)"; Rec."Experience (Year)")
                {
                    ToolTip = 'Specifies the value of the Experience (Year) field.', Comment = '%';
                    ApplicationArea = All;
                    Style = Ambiguous;
                }
            }
        }

    }
    actions
    {
        area(Processing)
        {
            action("Record Id")
            {
                ApplicationArea = All;
                Caption = 'Get Record Id';
                trigger OnAction()
                begin
                    GetCustomerRecordId();
                end;
            }
            action("Read Instream")
            {
                ApplicationArea = All;
                Caption = 'Read Stream';

                trigger OnAction()
                begin
                    ReadStream();
                end;
            }
            action(WriteAndReadBlob)
            {
                Caption = 'Write and Read Blob';
                ApplicationArea = All;

                trigger OnAction()
                var
                    RecMyTable: Record Candidate;
                    OutS: OutStream;
                    InS: InStream;
                    TextValue: Text;
                begin
                    // Ensure we have a record
                    // if not RecMyTable.Get(1) then begin
                    //     RecMyTable.Init();
                    //     RecMyTable.Insert();
                    // end;

                    // Write text to the Blob field
                    RecMyTable."Photos".CreateOutStream(OutS);
                    OutS.WriteText('Hello, i am asfak!');

                    // Modify & Save the Record
                    // RecMyTable.Modify();

                    // Read text from the Blob field using InStream
                    RecMyTable."Photos".CreateInStream(InS);
                    InS.ReadText(TextValue);

                    // Display the result
                    Message('Read from Blob: %1', TextValue);
                end;
            }
        }
    }
    procedure GetCustomerRecordId()
    var
        CandidateRec: Record Candidate;
        RecId: RecordId;
    begin
        CandidateRec.Get(Rec."Candidate Id");
        RecId := CandidateRec.RecordId;

        Message('RecordId: %1', RecId);
    end;

    procedure ReadStream()
    var
        InS: InStream;
        Data: Text;
    begin
        InS.ReadText(Data);
        if InS.EOS then
            Message('End of Stream reached!');
    end;






}
