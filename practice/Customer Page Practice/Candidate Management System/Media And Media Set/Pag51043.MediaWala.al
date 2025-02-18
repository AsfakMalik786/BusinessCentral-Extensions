page 51043 "Media Wala"
{
    ApplicationArea = All;
    Caption = 'Media Wala';
    PageType = List;
    SourceTable = MediaWala;
    UsageCategory = Lists;
    CardPageId = "MediaWala Card";


    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Media; Rec.Media)
                {
                    ToolTip = 'Specifies the value of the Media field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
            }


        }



    }


}
