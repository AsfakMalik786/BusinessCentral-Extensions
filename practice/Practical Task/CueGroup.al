page 51029 "Cue Group"
{
    PageType = CardPart;
    ApplicationArea = All;
    SourceTable = "My Custom Table";

    layout
    {
        area(Content)
        {
            cuegroup("Information Cues")
            {

                cuegroup("Customer Info Cues")
                {

                    field("Order Quantity"; Rec."Order Quantity")
                    {
                        ApplicationArea = All;
                        DrillDownPageId = "My Custo List";
                    }
                    field("Total Order Amout"; Rec."Total Amount")
                    {
                        ApplicationArea = All;
                        DrillDownPageId = "My Custo List";
                    }
                }
            }
        }
    }


}