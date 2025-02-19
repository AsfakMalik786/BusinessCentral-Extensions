page 51009 "Candidate Card"
{
    ApplicationArea = All;
    Caption = 'Candidate Card';
    PageType = Card;
    SourceTable = Candidate;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Candidate Id"; Rec."Candidate Id")
                {
                    ToolTip = 'Specifies the value of the Candidate Id field.', Comment = '%';
                    ApplicationArea = All;

                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field(Phone; Rec.Phone)
                {
                    ToolTip = 'Specifies the value of the Phone field.', Comment = '%';
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field(Email; Rec.Email)
                {
                    ToolTip = 'Specifies the value of the Email field.', Comment = '%';
                    ApplicationArea = All;
                    ExtendedDatatype = Email;

                }
                field(Education; Rec.Education)
                {
                    ToolTip = 'Specifies the value of the Education field.', Comment = '%';
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Experience (Year)"; Rec."Experience (Year)")
                {
                    ToolTip = 'Specifies the value of the Experience (Year) field.', Comment = '%';
                    ApplicationArea = All;

                }
                field(Skills; Rec.Skills)
                {
                    ToolTip = 'Specifies the value of the Skills field.', Comment = '%';
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                    ApplicationArea = All;
                }
                field(Photo; Rec.Photos)
                {
                    ApplicationArea = All;
                    Caption = 'Upload Your Photo';

                }
                field(BigInteger; Rec.BigInteger)
                {
                    ApplicationArea = All;
                }
            }
        }
        area(FactBoxes)
        {
            part(part2; "Candidate Information")
            {
                ApplicationArea = All;
                SubPageLink = "Candidate Id" = field("Candidate Id");
            }
            systempart(Link; Links)
            {
                ApplicationArea = All;
            }
            systempart(Note; Notes)
            {
                ApplicationArea = All;
            }

        }



    }



    actions
    {
        area(Processing)
        {
            action("Send Email")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    codeun: Codeunit SendEmailWithTemplate;
                begin
                    codeun.SendEmail();

                end;
            }

            action("Add Link")
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Rec.AddLink('https://www.youtube.com/', 'Youtube');
                end;
            }
            action("Read Single Guid")
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    ReadSingleGuid();
                end;
            }
            action("Read Single Text")
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    ReadSingleText();
                end;
            }
            action("Read Text From Stream")
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    ReadTextFromStream();
                end;
            }
            action("In Bytes")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    OutS: OutStream;
                    InS: InStream;
                    ByteVal: Byte;
                begin
                    TempBlob.CreateOutStream(OutS);
                    OutS.Write(ByteVal);

                    TempBlob.CreateInStream(InS);
                    InS.Read(ByteVal);

                    Message('Read Byte: %1', ByteVal);
                end;
            }
            action("In Char")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    OutS: OutStream;
                    InS: InStream;
                    CharVal: Char;
                begin
                    Rec.Photos.CreateOutStream(OutS);
                    CharVal := 'A';
                    OutS.Write(CharVal);

                    Rec.Photos.CreateInStream(InS);
                    InS.Read(CharVal);
                    Message('Read Char: %1', CharVal);
                end;
            }
            action("In Integer")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    OutS: OutStream;
                    InS: InStream;
                    Inte: Integer;
                begin
                    Inte := 45;
                    TempBlob.CreateOutStream(OutS);
                    OutS.Write(Inte);

                    TempBlob.CreateInStream(InS);
                    InS.Read(Inte);

                    Message('Read Integer: %1', Inte);
                end;
            }
            action("In Decimal")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    OutS: OutStream;
                    InS: InStream;
                    CharVal: Decimal;
                    LargeDeci: Decimal;
                    DecimalRead: Integer;
                begin
                    LargeDeci := 1245.215;
                    TempBlob.CreateOutStream(OutS);
                    OutS.Write(LargeDeci);
                    TempBlob.CreateInStream(InS);
                    DecimalRead := InS.Read(CharVal);
                    Message('Decimal Read : %1', CharVal);


                end;
            }
            action("Decimal From Blob")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    RecCandidate: Record "Candidate";
                    InS: InStream;
                    MyDecimal: Decimal;
                    BytesRead: Integer;
                    OutS: OutStream;
                begin
                    if RecCandidate.FindFirst() then begin
                        MyDecimal := 123.45;

                        RecCandidate.Photos.CreateOutStream(OutS);
                        OutS.Write(MyDecimal);
                        RecCandidate.Modify();

                        Message('Decimal %1 stored successfully in BLOB!', MyDecimal);
                    end else
                        Message('No record found.');
                end;

            }
            action("Length of stream")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    InS: InStream;
                    FileLength: BigInteger;
                    Out: OutStream;
                    tempb: Codeunit "Temp Blob";
                begin
                    if Rec.Resume.HasValue then begin
                        FileLength := Rec.Photos.Length();
                        Message('This Blob Contains %1 Length', FileLength);
                    end else
                        Message('There is No Blob Length');
                    // Assume InS is initialized
                    // FileLength := InS.Length();
                    // Message('Stream length: %1 bytes', FileLength);
                end;

            }
            action("Text String Stored In Blob")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    RecCandidate: Record "Candidate";
                    InS: InStream;
                    MyText: Text[100];
                    BytesRead: Integer;
                begin
                    if RecCandidate.FindFirst() then begin
                        RecCandidate.CalcFields(RecCandidate.Photos);

                        if RecCandidate.Photos.HasValue then begin
                            RecCandidate.Photos.CreateInStream(InS);

                            BytesRead := InS.Read(MyText);

                            Message('Bytes Read: %1, Text: %2', BytesRead, MyText);
                        end else
                            Message('No data found in the BLOB field.');
                    end else
                        Message('No record found.');
                end;

            }
            action("Eos")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    InS: InStream;
                    MyText: Text[100];
                    outst: OutStream;
                begin
                    TempBlob.CreateOutStream(outst);
                    outst.WriteText('Out Stream Write Text');
                    TempBlob.CreateInStream(InS);

                    while not InS.EOS() do begin
                        InS.ReadText(MyText);
                        Message('buffering!');
                    end;
                    Message('Read : %1', MyText);
                end;

            }

            // Outstream Actions

            action("OutStream Char")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    Reccandidate: Record Candidate;
                    TempBlob: Codeunit "Temp Blob";
                    OutS: OutStream;
                    MyChar: Char;
                    Ins: InStream;


                begin
                    MyChar := 'A';

                    TempBlob.CreateOutStream(OutS);
                    OutS.Write(MyChar);

                    Message('Char written to stream: %1', MyChar);
                end;

            }

            action("Outstream Integer")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    OutS: OutStream;
                    MyInt: Integer;
                begin
                    MyInt := 12345;

                    TempBlob.CreateOutStream(OutS);
                    OutS.Write(MyInt);

                    Message('Integer written to stream: %1', MyInt);
                end;

            }
            action("Outstream BigInteger")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    OutS: OutStream;
                    MyBigInt: BigInteger;
                begin
                    MyBigInt := 999999999; // BigInteger example

                    TempBlob.CreateOutStream(OutS);
                    OutS.Write(MyBigInt); // Writing BigInteger to stream

                    Message('BigInteger written to stream: %1', MyBigInt);
                end;

            }
            action("Outstream Decimal")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    OutS: OutStream;
                    MyDecimal: Decimal;
                begin
                    MyDecimal := 123.456; // Decimal example

                    TempBlob.CreateOutStream(OutS);
                    OutS.Write(MyDecimal); // Writing decimal to stream

                    Message('Decimal written to stream: %1', MyDecimal);
                end;

            }

            action("Outstream GUID")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    OutS: OutStream;
                    MyGuid: Guid;
                begin
                    MyGuid := CreateGuid(); // Generate a random GUID

                    TempBlob.CreateOutStream(OutS);
                    OutS.Write(MyGuid); // Writing GUID to stream

                    Message('GUID written to stream: %1', MyGuid);
                end;

            }

            action("Outstream Text")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    OutS: OutStream;
                    MyText: Text;
                begin
                    MyText := 'Hello, Business Central!'; // Text example

                    TempBlob.CreateOutStream(OutS);
                    OutS.WriteText(MyText); // Writing text to stream

                    Message('Text written to stream: %1', MyText);
                end;

            }
            action("Outstream Date")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    OutS: OutStream;
                    MyDate: Date;
                begin
                    MyDate := Today(); // Get current date

                    TempBlob.CreateOutStream(OutS);
                    OutS.Write(MyDate); // Writing date to stream

                    Message('Date written to stream: %1', MyDate);
                end;

            }
            action("Outstream Date Time")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    OutS: OutStream;
                    MyDateTime: DateTime;
                begin
                    MyDateTime := CurrentDateTime(); // Get current DateTime

                    TempBlob.CreateOutStream(OutS);
                    OutS.Write(MyDateTime); // Writing DateTime to stream

                    Message('DateTime written to stream: %1', MyDateTime);
                end;

            }

            // Record Ref Example

            action("Record Refe")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    RecRef: RecordRef;
                    FieldRef: FieldRef;
                    CustomerNo: Code[20];
                begin
                    RecRef.Open(Database::Candidate); // Open Customer table dynamically

                    if RecRef.FindFirst() then begin
                        FieldRef := RecRef.Field(1); // Get the "No." field dynamically
                        CustomerNo := FieldRef.Value(); // Read field value
                        Message('Customer No: %1', Rec."Candidate Id");
                    end else
                        Message('No records found.');
                end;



            }
            action("Guin Allowed")
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    if GuiAllowed() then
                        Dialog.Error('Gui Not Supported');
                end;

            }
            action("Record Refe Loop")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    RecRef: RecordRef;
                    FieldRef: FieldRef;
                    i: Integer;
                begin
                    RecRef.Open(Database::Candidate); // Open Customer table dynamically

                    if RecRef.FindFirst() then begin
                        for i := 1 to RecRef.FieldCount() do begin
                            FieldRef := RecRef.FieldIndex(i);
                            Message('Field Name: %1, Value: %2', FieldRef.Name(), FieldRef.Value());
                        end;
                    end;
                end;

            }
            action("Record Id")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    Record: Record Candidate;
                    RecID: RecordID;

                begin
                    if Rec.Get(Rec."Candidate Id") then begin
                        RecID := Rec.RecordId();
                        Message('Record ID: %1', RecID);
                    end
                    else
                        Message('Record not found!');
                end;
            }
            action("Variant")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    MyVariant: Variant;
                    MyText: Text;
                    MyNumber: Integer;
                    Record: Record Candidate;
                begin

                    begin
                        MyVariant := Rec.Name; // Assign text
                        MyText := MyVariant; // Extract as Text

                        MyVariant := Rec.Status; // Assign integer
                        MyNumber := MyVariant; // Extract as Integer

                        Message('Candidate Name: %1, Status: %2', MyText, MyNumber);
                    end;

                end;
            }
            action("If Variant")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    MyVariant: Variant;
                begin
                    MyVariant := 'Asfak';


                    if MyVariant.IsInteger then
                        Message('Variant contains an Integer: %1', MyVariant)
                    else if MyVariant.IsText then
                        Message('Variant contains Text %1', MyVariant)
                    else
                        Message('Variant contains an unknown type!');
                end;

            }
            action("Multiple Variant")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    MyVariant: Variant;
                    MyText: Text;
                    MyNumber: Integer;
                    MyDate: Date;
                    Record: Record Candidate;
                begin
                    // Store different types
                    MyVariant := Rec."Name";
                    MyText := MyVariant; // Extract as Text

                    MyVariant := Rec."Experience (Year)";
                    MyNumber := MyVariant; // Extract as Integer

                    MyVariant := Today;
                    MyDate := MyVariant; // Extract as Date

                    Message('Candidate Name: %1, Expirience: %2, Date: %3', MyText, MyNumber, MyDate);
                end;

            }
            action("IsAction Variant")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    MyAction: Action;
                    MyVariant: Variant;
                    varResult: Boolean;
                    Text000: Label 'Does the variant contain an Action variable? %1.';
                    Text001: Label 'Does the variant- contain a code variable? %1.';
                begin
                    MyVariant := MyAction;
                    varResult := MyVariant.IsAction;
                    Message(Text000, varResult);
                    varResult := MyVariant.IsCode;
                    Message(Text001, varResult);
                end;
            }
            action("Automative Variant")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    MyVariant: Variant;
                    varResult: Boolean;
                    Text000: Label 'Does the variant contain an Automation variable? %1.';
                    Text001: Label 'Does the variant- contain a code variable? %1.';
                begin
                    //MyVariant := MyAutomation;
                    varResult := MyVariant.IsAutomation;
                    Message(Text000, varResult);
                    varResult := MyVariant.IsCode;
                    Message(Text001, varResult);
                end;
            }
            action("BigInteger Variant")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    variant: Variant;
                    varresult: Boolean;
                    Text002: Label 'It Is BigInteger Variant : %1';
                begin
                    variant := Rec.BigInteger;
                    varresult := variant.IsBigInteger();
                    Message(Text002, varresult);
                end;
            }
            action("Binary Variant")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    variant: Variant;
                    varresult: Boolean;
                begin
                    variant := Rec."Candidate Id";
                    varresult := variant.IsBinary;
                    Message('This Is Binary Variant : %1', varresult);

                end;
            }
            separator("My Seperator")
            {
                IsHeader = true;
            }
            action("Check Skill Variant")
            {
                ApplicationArea = All;
                trigger OnAction()

                var
                    MyVariant: Variant;
                begin
                    MyVariant := Rec.Skills;

                    if MyVariant.IsInteger() then
                        Message('Variant contains an Integer.')
                    else if MyVariant.IsText() then
                        Message('Variant contains a Text.')
                    else if MyVariant.IsDate() then
                        Message('Variant contains a Date.')
                    else
                        Message('Variant contains an unknown type.');
                end;

            }
            action("Option Variant")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    variant: Variant;
                begin
                    variant := rec.Status;

                    if variant.IsOption() then
                        Message('This Is option Variant Called : %1', variant)
                    else
                        Message('it Is Not Option Variant %1', variant);
                end;
            }
            action("Data Classification Variant")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    variant: Variant;
                begin
                    variant := Rec."Candidate Id";

                    if variant.IsDataClassification() then
                        Message('It Is Data Classification : %1', variant)
                    else
                        Message('It Is Not data Classified %1', variant);
                end;
            }
            action("Boolean Variant")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    variant: Variant;
                begin
                    variant := Rec.Status;

                    if variant.IsBoolean() then
                        Message('It Is Boolean Variant : %1', variant)
                    else
                        Message('It Is Not Boolean Variant %1', variant);
                end;
            }
        }
        area(Promoted)
        {
            group("Instream Action")
            {

                Caption = 'Instream Action';
                actionref(a1; "Eos")
                {

                }
                actionref(a2; "Text String Stored In Blob")
                {

                }
                actionref(a3; "Length of stream")
                {

                }
                actionref(a4; "Decimal From Blob")
                {

                }
                actionref(a5; "In DEcimal")
                {

                }
                actionref(a6; "In Integer")
                {

                }
                actionref(a7; "In Char")
                {

                }
                actionref(a8; "In Bytes")
                {

                }
                actionref(a9; "Read Single Guid")
                {

                }
                actionref(a10; "Read Single Text")
                {

                }
                actionref(a11; "Read Text From Stream")
                {

                }
            }
            group("OutStream Actions")

            {
                Caption = 'Outstream Action';

                actionref(o1; "OutStream Char")
                {

                }
                actionref(o2; "Outstream Integer")
                {

                }
                actionref(o3; "Outstream BigInteger")
                {

                }
                actionref(o4; "Outstream Decimal")
                {

                }
                actionref(o5; "Outstream GUID")
                {

                }
                actionref(o6; "Outstream Text")
                {

                }
                actionref(o7; "Outstream Date")
                {

                }
                actionref(o8; "Outstream Date Time")
                {

                }

            }
            group("Record Ref")

            {
                actionref(r1; "Record Refe")
                {

                }
                actionref(r2; "Record Refe Loop")
                {

                }
            }
            group("Variant Example")
            {
                actionref(v1; "Variant")
                {

                }
                actionref(v2; "If Variant")
                {

                }
                actionref(v3; "Multiple Variant")
                {

                }
                actionref(v4; "IsAction Variant")
                {

                }
                actionref(v5; "Automative Variant")
                {

                }
                actionref(v6; "BigInteger Variant")
                {

                }
                actionref(v7; "Check Skill Variant")
                {

                }
                actionref(v8; "Option Variant")
                {

                }
                actionref(v9; "Binary Variant")
                {

                }
                actionref(v10; "Data Classification Variant")
                {

                }
                actionref(v11; "Boolean Variant")
                {

                }
            }
        }
    }



    procedure ReadSingleGuid()
    var
        OutStr: OutStream;
        InStr: InStream;
        TempBlob: Codeunit "Temp Blob";
        ReadGuid: Guid;
        NumGuidsRead: Integer;
        MyGuid: Guid;
    begin
        MyGuid := CreateGuid();

        TempBlob.CreateOutStream(OutStr);

        OutStr.Write(MyGuid);

        TempBlob.CreateInStream(InStr);

        NumGuidsRead := InStr.Read(ReadGuid);

        Message('GUID Read: %1', ReadGuid);
    end;

    procedure ReadSingleText()
    var
        OutStr: OutStream;
        InStr: InStream;
        TempBlob: Codeunit "Temp Blob";
        ReadText: Text[50];
        NumCharsRead: Integer;
        SampleText: Text;
    begin
        SampleText := 'Welcome To  Business Central!';

        TempBlob.CreateOutStream(OutStr);

        OutStr.Write(SampleText);

        TempBlob.CreateInStream(InStr);

        NumCharsRead := InStr.Read(ReadText, 20);

        Message('Text Read: %1 (Characters Read: %2)', ReadText, NumCharsRead);
    end;

    procedure ReadTextFromStream()
    var
        OutStr: OutStream;
        InStr: InStream;
        TempBlob: Codeunit "Temp Blob";
        ReadText: Text[100];
        NumCharsRead: Integer;
        SampleText: Text;
    begin
        SampleText := 'Welcome To Business Central';

        TempBlob.CreateOutStream(OutStr);

        OutStr.WriteText(SampleText);

        TempBlob.CreateInStream(InStr);

        NumCharsRead := InStr.ReadText(ReadText, 20);

        Message('Text Read: %1 (Characters Read: %2)', ReadText, NumCharsRead);
    end;

    trigger OnOpenPage()

    begin
        Message('1, %1', CurrentClientType);
        if CurrentClientType = CurrentClientType::Web then
            Message('It Is Running On Web Client ');
    end;





}


