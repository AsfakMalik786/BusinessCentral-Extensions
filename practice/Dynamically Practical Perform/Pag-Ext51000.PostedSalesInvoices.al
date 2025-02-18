pageextension 51076 "Customer List Ext" extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action("Count Sell To CUstomer Sales Invoices")
            {
                Caption = 'Count Sales Invoices';
                ApplicationArea = All;
                Image = Filter;
                trigger OnAction()
                var
                    SalesInvHeader: Record "Sales Invoice Header";
                    cust: Record Customer;
                begin
                    SalesInvHeader.SetRange("Sell-to Customer No.", Rec."No.");
                    if SalesInvHeader.FindSet() then
                        Message('Posted Sales Invoice Counts %1 : %2', cust.Name, SalesInvHeader.Count);
                end;
            }
            action("Show Customer Numbers")
            {
                Caption = 'Show Customer Numbers';
                ApplicationArea = All;

                trigger OnAction()
                var
                    CustomerNos: array[10] of Code[20];
                    CustomerRec: Record Customer;
                    i: Integer;
                    OutputMessage: Text;
                begin
                    i := 1;

                    if CustomerRec.FindSet() then
                        repeat
                            if i > 10 then
                                break;

                            CustomerNos[i] := CustomerRec."No.";
                            i := i + 1;
                        until CustomerRec.Next() = 0;

                    for i := 1 to ArrayLen(CustomerNos) do
                        if CustomerNos[i] <> '' then
                            OutputMessage += CustomerNos[i] + ',';

                    if OutputMessage = '' then
                        Message('No customers found!')
                    else
                        Message('Customer Numbers Found: %1', OutputMessage);
                end;
            }
            action("RecRef Field")

            {
                ApplicationArea = All;
                Caption = 'Record Ref Field';
                trigger OnAction()
                var
                    RecRef: RecordRef;
                begin
                    RecRef.Open(Database::Customer);
                    RecRef.FindFirst();
                    Message('Field Index Of 28 %1', Format(RecRef.FieldIndex(28).Caption));
                    Message('Field Caption %1', Format(RecRef.Field(28).Caption));
                    Message('Key Index %1', Format(RecRef.KeyIndex(3)));

                end;

            }

            action("Field Ref")
            {
                ApplicationArea = All;
                Caption = 'Field Ref';
                trigger OnAction()
                var
                    Cust1: Record Customer;
                    Cust2: Record Customer;
                begin

                    begin
                        Cust1.Get(''); // Provide appropriate customer number
                        Cust2.Get(''); // Provide appropriate customer number
                        FieldReftest(Cust1, Cust2, 2); // Provide appropriate field number
                    end;
                end;
            }
            action(setgettable)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Invent.FIND('-');
                    RecID := Invent."Source Line ID";
                    RecRef := RecID.GETRECORD;
                    //SetTable => Sets the table to which a Record variable refers as the same table as a RecordRef variable.
                    RecRef.SETTABLE(prodorder);


                end;
            }
            action(gettable)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    recref.GetTable(prodorder);
                    Message('The table used to get set %1', prodorder);

                end;
            }





        }
        addfirst(Promoted)
        {
            group("Customer List Action")
            {
                actionref("Count"; "Count Sell To CUstomer Sales Invoices")
                {

                }
                actionref("Array Fun"; "Show Customer Numbers")
                {

                }
            }
        }
    }
    procedure FieldReftest(var Cust1: Record Customer; Cust2: Record Customer; FieldNumber: Integer)
    var
        FRef1: FieldRef;
        FRef2: FieldRef;
        RecRef1: RecordRef;
        RecRef2: RecordRef;
    begin
        RecRef1.GetTable(Cust1);
        RecRef2.GetTable(Cust2);
        FRef1 := RecRef1.Field(FieldNumber);
        FRef2 := RecRef2.Field(FieldNumber);

        if FRef1.Value = FRef2.Value then
            Message('%1 Is Equal', FRef1.Caption)
        else
            Message('%1 Are Not Equal', FRef1.Caption);
    end;

    var
        Invent: Record "Inventory Event Buffer";
        recid: RecordId; //RecordID Contains the table number and the primary key of a table.We can use two methods=> GetRecord(), TableNo()
        recref: RecordRef;// RecordRef => The RecordRef object can refer to any table in the database. 
        prodorder: Record "Prod. Order Routing Line"; //Record => Complex data type

        custom: Record Customer;
}
