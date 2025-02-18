page 51034 "String Function"
{
    ApplicationArea = All;
    Caption = 'String Function';
    PageType = List;
    CardPageId = "String Function";
    SourceTable = "String Function";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Caption = 'General';

                field("Input String"; Rec."Input String")
                {
                    ToolTip = 'Specifies the value of the String Name field.', Comment = '%';
                    trigger OnValidate()
                    begin
                        StringFun();
                    end;
                }
                field("Output String"; Rec."Output String")
                {
                    ToolTip = 'Specifies the value of the String Number field.', Comment = '%';
                }
                field(DATE; NormalDate(Today))
                {
                    ApplicationArea = All;
                    Caption = 'Date';

                }
            }

        }

    }
    procedure StringFun()
    var
        mainString: Text[100];
        subString: Text[10];
        position: Integer;
    begin
        mainString := 'Hello, Dynamics 365 Business Central!';
        subString := 'Dynamics';
        position := StrPos(mainString, subString);
    end;

    trigger OnOpenPage()
    var
        Datemsg: Label 'The Current Time And Date Is : %1';
        CurrentDateTime: DateTime;

    begin
        currentDateTime := CurrentDateTime;
        Message(Datemsg, CurrentDateTime);
    end;
}
