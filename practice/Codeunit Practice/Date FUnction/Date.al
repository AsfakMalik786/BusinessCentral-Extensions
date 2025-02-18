page 51046 "Date Function Tester"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group("Date Functions")
            {
                field(InputDate; InputDate)
                {
                    Caption = 'Enter Date';
                }

                field(OutputDate; OutputDate)
                {
                    Caption = 'Result Date';
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(GetToday)
            {
                Caption = 'Get Today';
                trigger OnAction()
                begin
                    Today();
                end;
            }

            action(GetWorkDate)
            {
                Caption = 'Get Work Date';
                trigger OnAction()
                begin
                    OutputDate := Format(WorkDate(), 0, '<Day,2>/<Month,2>/<Year,4>');
                end;
            }

            action(AddDays)
            {
                Caption = 'Add 7 Days';
                trigger OnAction()
                begin
                    OutputDate := Format(CalcDate('7D', InputDate), 0, '<Day,2>/<Month,2>/<Year,4>');
                end;
            }

            action(AddMonth)
            {
                Caption = 'Add 1 Month';
                trigger OnAction()
                begin
                    OutputDate := Format(CalcDate('1M', InputDate), 0, '<Day,2>/<Month,2>/<Year,4>');
                end;
            }

            action(GetYear)
            {
                Caption = 'Get Year';
                trigger OnAction()
                begin
                    OutputDate := Format(Date2DMY(InputDate, 3));
                end;
            }

            action(GetWeekNumber)
            {
                Caption = 'Get Week Number';
                trigger OnAction()
                begin
                    OutputDate := Format(Date2DWY(InputDate, 2));
                end;
            }

            action(FormatDate)
            {
                Caption = 'Format Date (DD/MM/YYYY)';
                trigger OnAction()
                begin
                    OutputDate := Format(InputDate, 0, '<Day,2>/<Month,2>/<Year,4>');
                end;
            }

            action(ConvertStringToDate)
            {
                Caption = 'Convert String to Date';
                trigger OnAction()
                begin
                    Evaluate(InputDate, '15-08-2024');
                    OutputDate := Format(InputDate, 0, '<Day,2>/<Month,2>/<Year,4>');
                end;
            }
        }
    }

    var
        InputDate: Date;
        OutputDate: Text[30];

    procedure Today();
    var
        Datemsg: Label 'The Current Time And Date Is : %1';
        CurrentDateTime: DateTime;

    begin
        currentDateTime := CurrentDateTime;
        Message(Datemsg, CurrentDateTime);
    end;

}
