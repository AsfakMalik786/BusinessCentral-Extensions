// codeunit 51000 "Events" 
// {
    
  
// //    [IntegrationEvent(true,false)]
// //     procedure OnAdressChanged(line: Text[100])
// //     begin
        
    
// //     end;

// //     [BusinessEvent(true)]
// //     procedure MyProcedure(line: Text[100])
// //     begin

// //     end;
// Access = Internal;
// [InternalEvent(true)]
// procedure MyInternal(line: Text[100])
// begin
    
// end;

    
// }
// codeunit 51001 "Event Subscriber"
// {
//     // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Events", 'OnAdressChanged','',false,false)]
//     // procedure HandleAddressChanged(line: Text[100])
//     // begin
        
//     //     if StrPos(line , '+')>0 then
//     //     Error('Please Enter Valid Adress')
//     //     else
//     //     Message('This Is Not Valid');
//     // end;

//     // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Events", 'MyProcedure', '', false, false)]
//     // local procedure MyProcedure(line: Text[100])
//     // begin
//     //     if StrPos(line , '+')>0 then
//     //     Error('Please Enter The Valid Name');

        
//     // end;
//     // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Events",'MyInternal', '', false, false)]
//     // procedure MyInternalEvent(line: Text[100])
//     // begin
//     //     if StrPos(line, '+') > 0 then
//     //         Error('Invalid character "+" found in line');
//     // end;

//     // On Before Events
// //     [EventSubscriber(ObjectType::Table, Database::"My Custom Table", 'OnBeforeDeleteEvent','',false,false)]
// //     procedure OnBeforeDeleteEvents(var Rec: Record "My Custom Table"; RunTrigger: Boolean)
// //     begin
// //         Message('On Before Delete Event Subscriber Triggered ');

// //     end;

// //     [EventSubscriber(ObjectType::Table, Database::"My Custom Table", 'OnBeforeInsertEvent','',false,false)]
// //     procedure OnBeforeInsertEvents(var Rec: Record "My Custom Table"; RunTrigger: Boolean)
// //     begin
// //         Message('On Before Insert Event Subscriber Triggered ');
// //     end;

// //      [EventSubscriber(ObjectType::Table, Database::"My Custom Table", 'OnBeforeModifyEvent','',false,false)]
// //     procedure OnBeforeModifyEvents(var Rec: Record "My Custom Table"; RunTrigger: Boolean)
// //     begin
// //         Message('On Before Modify Event Subscriber Triggered ');
// //     end;
// // // On After Events
// //      [EventSubscriber(ObjectType::Table, Database::"My Custom Table", 'OnAfterRenameEvent','',false,false)]
// //     procedure OnAfterRenameEvents(var Rec: Record "My Custom Table"; RunTrigger: Boolean)
// //     begin
// //         Message('On After Rename Event Subscriber Triggered ');
// //     end;

// //      [EventSubscriber(ObjectType::Table, Database::"My Custom Table", 'OnAfterModifyEvent','',false,false)]
// //     procedure OnAfterModifyEvents(var Rec: Record "My Custom Table"; RunTrigger: Boolean)
// //     begin
// //         Message('On After Modify Event Subscriber Triggered ');
// //     end;
// //      [EventSubscriber(ObjectType::Table, Database::"My Custom Table", 'OnAfterDeleteEvent','',false,false)]
// //     procedure OnAfterDeleteEvents(var Rec: Record "My Custom Table"; RunTrigger: Boolean)
// //     begin
// //         Message('On After Delete Event Subscriber Triggered ');
// //     end;
// //      [EventSubscriber(ObjectType::Table, Database::"My Custom Table", 'OnAfterInsertEvent','',false,false)]
// //     procedure OnAfterInsertEvents(var Rec: Record "My Custom Table"; RunTrigger: Boolean)
// //     begin
// //         Message('On After Insert Event Subscriber Triggered ');
// //     end;

// //     [EventSubscriber(ObjectType::Table, Database::"My Custom Table", 'OnBeforeValidateEvent', 'Total Amount', false, false)]
// // local procedure OnBeforeValidateEvents(var Rec: Record "My Custom Table")
// // begin
// //     Message('On Before Validate Event Trigger');
// // end;

// // [EventSubscriber(ObjectType::Table, Database::"My Custom Table", 'OnAfterValidateEvent', 'Total Amount', false, false)]
// // local procedure OnAfterValidateEvents(var Rec: Record "My Custom Table" )
// // begin
// //     Message('On After Validate Event Called');
// // end;

// // [EventSubscriber(ObjectType::Page, Page:: "My Cust Card", 'OnOpenPageEvent', '', false, false)]
// // local procedure OnOpenPageEvent(var Rec: Record "My Custom Table")
// // begin
// //     Message('On Open Page Event Called');
// // end;
    


// }


    

