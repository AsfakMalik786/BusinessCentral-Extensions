page 51028 "Headline Role Center Part"
{
    ApplicationArea = All;
    PageType = HeadlinePart;

    layout
    {
        area(Content)
        {
            group("Headline")
            {
                ShowCaption = false;

                field(Welcome; Welcome)
                {
                    ApplicationArea = All;
                }
                field(Label1; Label)
                {
                    ApplicationArea = All;

                    trigger OnDrillDown()
                    begin
                        Hyperlink('https://www.google.com');
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Welcome := StrSubstNo(WelcomeLbl, UserId);
    end;

    var
        Welcome: Text;

        WelcomeLbl: Label 'Welcome %1';
        Label: Label '<qualifier>Hello Students</qualifier><payload>Welcome To Student Info Panel<emphasize> Search </emphasize> For Future</payload>';

}
