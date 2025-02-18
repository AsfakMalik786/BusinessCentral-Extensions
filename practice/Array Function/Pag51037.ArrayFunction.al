page 51037 "Array Function"
{
    ApplicationArea = All;
    Caption = 'Array Function';
    PageType = Card;
    SourceTable = "Array Function";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Input "; Input)
                {
                    ToolTip = 'Specifies the value of the Input field.', Comment = '%';
                }
                field(Output; Output)
                {
                    ToolTip = 'Specifies the value of the Output field.', Comment = '%';

                }
            }
        }


    }
    var

        Input: Integer;
        Output: Integer;

    procedure arraysfun()
    var
        MyArray: array[3] of Integer;

    begin
        MyArray[1] := 10;
        MyArray[2] := 20;
        MyArray[3] := 30;

        Message('First value: ' + Format(Input));  // Output: First value: 10
    end;

}
