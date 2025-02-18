page 51039 "List Function"
{
    ApplicationArea = All;
    Caption = 'List Function';
    PageType = List;
    UsageCategory = Lists;

    actions
    {
        area(Processing)
        {
            action("Add Function")
            {
                Caption = 'Add Function';
                ApplicationArea = All;

                trigger OnAction()
                var
                    myIntegerList: List of [Integer];
                    integeritem: Integer;
                begin
                    myIntegerList.Add(2);
                    myIntegerList.Add(25);
                    myIntegerList.Add(21);
                    foreach integeritem in myIntegerList do
                        Message('The integer list added is %1', integeritem);
                end;

            }
            action(Contains)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    myIntegerList: List of [Integer];
                    exists: Boolean;
                begin
                    myIntegerList.Add(2);
                    myIntegerList.Add(25);
                    myIntegerList.Add(21);
                    exists := myIntegerList.Contains(25);
                    Message('%1', exists);
                    exists := myIntegerList.Contains(3);
                    Message('%1', exists);
                end;
            }
            action("Set index")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    myTextList: List of [Text];
                    textin: Text;
                begin
                    myTextList.Add('Business');
                    myTextList.Add('Central');
                    myTextList.Add('AL Programming');
                    myTextList.Set(1, 'Microsoft');
                    Message('The value is set in the specified index');
                    textin := myTextList.Get(1);
                    Message('The Text list added is %1', textin);
                    Message('%1 , %2', myTextList.Count, textin);
                end;
            }
            action("Insert")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    myTextList: List of [Text];
                    textin: Text;
                begin
                    myTextList.Add('Business');
                    myTextList.Add('Central');
                    myTextList.Add('AL Programming');
                    Message('Before insert');
                    foreach textin in myTextList do
                        Message('The data is %1', textin);
                    Message('After insert');
                    myTextList.Insert(1, 'Microsoft');
                    foreach textin in myTextList do
                        Message('The data is %1', textin);
                end;
            }
            action("Add Range")
            {
                ApplicationArea = All;
                trigger OnAction()

                var
                    myTextList: List of [Text];
                    textin: Text;
                begin
                    myTextList.AddRange('Microsoft', 'Dynamics', '365', 'Business', 'Central');
                    foreach textin in myTextList do
                        Message('%1', textin);

                end;
            }
            action("Get Range")
            {
                ApplicationArea = All;
                Caption = 'Get Range';
                trigger OnAction()
                var
                    CustList: List of [Text];
                    SubList: List of [Text];
                begin
                    CustList.Add('Customer A');
                    CustList.Add('Customer B');
                    CustList.Add('Customer C');
                    CustList.Add('Customer D');

                    // Extract 2 items starting from index 1 (zero-based index)
                    SubList := CustList.GetRange(1, 2);

                    Message('Sublist contains: %1, %2', SubList.Get(1), SubList.Get(2));
                end;

            }
            action("Index Of")
            {
                ApplicationArea = All;
                Caption = 'Index of';
                trigger OnAction()
                var
                    CustList: List of [Text];
                    Index: Integer;
                begin
                    CustList.Add('Customer A');
                    CustList.Add('Customer B');
                    CustList.Add('Customer C');

                    Index := CustList.IndexOf('Customer B'); // Should return 2 (1-based index)

                    if Index > 0 then
                        Message('Customer B is at index: %1', Index)
                    else
                        Message('Customer B not found.');
                end;
            }
            action("Last Index Of")
            {
                ApplicationArea = All;
                Caption = 'Last Index Of';
                trigger OnAction()
                var
                    CustList: List of [Text];
                    LastIndex: Integer;
                begin
                    CustList.Add('Customer A');
                    CustList.Add('Customer B');
                    CustList.Add('Customer C');
                    CustList.Add('Customer B'); // Duplicate value

                    LastIndex := CustList.LastIndexOf('Customer B'); // Should return 4

                    Message('Last occurrence of "Customer B" is at index: %1', LastIndex);
                end;
            }
            action("Remove")
            {
                ApplicationArea = All;
                Caption = 'Remove';
                trigger OnAction()
                var
                    CustList: List of [Text];
                begin
                    CustList.Add('Customer A');
                    CustList.Add('Customer B');
                    CustList.Add('Customer C');
                    CustList.Add('Customer B'); // Duplicate

                    CustList.Remove('Customer B'); // Removes the first "Customer B"

                    Message('List after Remove: %1, %2, %3', CustList.Get(1), CustList.Get(2), CustList.Get(3));
                end;
            }
            action("Remove At")
            {
                ApplicationArea = All;
                Caption = 'Remove At';
                trigger OnAction()

                var
                    CustList: List of [Text];
                begin
                    CustList.Add('Customer A');
                    CustList.Add('Customer B');
                    CustList.Add('Customer C');

                    CustList.RemoveAt(2); // Removes "Customer B" (Index 2)

                    Message('List after RemoveAt: %1, %2', CustList.Get(1), CustList.Get(2));
                end;

            }
            action("Remove Range")
            {
                ApplicationArea = All;
                Caption = 'Remove Range';
                trigger OnAction()
                var
                    CustList: List of [Text];
                begin
                    CustList.Add('Customer A');
                    CustList.Add('Customer B');
                    CustList.Add('Customer C');
                    CustList.Add('Customer D');
                    CustList.Add('Customer E');

                    CustList.RemoveRange(2, 2); // Removes 2 items starting at index 2

                    Message('List after RemoveRange: %1, %2, %3', CustList.Get(1), CustList.Get(2), CustList.Get(3));
                end;

            }
            action("List Reverse")
            {
                ApplicationArea = All;
                Caption = 'List Reverse';
                trigger OnAction()
                var
                    CustList: List of [Text];
                begin
                    CustList.Add('Customer A');
                    CustList.Add('Customer B');
                    CustList.Add('Customer C');

                    CustList.Reverse(); // Reverses the order

                    Message('Reversed List: %1, %2, %3', CustList.Get(1), CustList.Get(2), CustList.Get(3));
                end;
            }
            action("List Set")
            {
                ApplicationArea = All;
                Caption = 'List Set';
                trigger OnAction()
                var
                    CustList: List of [Text];
                begin
                    CustList.Add('Customer A');
                    CustList.Add('Customer B');
                    CustList.Add('Customer C');

                    CustList.Set(2, 'Customer X'); // Replaces "Customer B" with "Customer X"

                    Message('Updated List: %1, %2, %3', CustList.Get(1), CustList.Get(2), CustList.Get(3));
                end;
            }
        }
    }
}