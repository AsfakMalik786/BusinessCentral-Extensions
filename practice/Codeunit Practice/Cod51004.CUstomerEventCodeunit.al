codeunit 51004 "Book Event Publisher"
{
    [IntegrationEvent(false, false)]
    procedure OnBookPublisher(BookId: BigInteger; BookPublisher: Code[150])
    begin

    end;

}

codeunit 51005 BookManagement
{
    procedure CreateNewBookId(BookId: BigInteger; BookPublisher: Code[150])
    var
        Book: Record "Book Title";
        BookEventPublisher: Codeunit "Book Event Publisher";
    begin
        Book.Init();
        Book."Book Id" := BookId;
        Book."Book Publisher" := BookPublisher;
        Book.Insert();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Book Event Publisher", 'OnBookPublisher', '', false, false)]
    procedure NotifyOnBookPublisher(BookId: BigInteger; BookPublisher: Code[150])
    begin
        // Message('Book Id : %1, Book Publisher : %2', BookId, BookPublisher);

    end;

}

