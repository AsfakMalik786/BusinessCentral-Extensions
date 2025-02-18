codeunit 51002 "Book Titles"
{

    Subtype = Install;
    trigger OnInstallAppPerCompany()
    begin
        PopulateBookTitle();
    end;

    procedure PopulateBookTitle()
    var
        BookTitle: Record "Book Title Lists Table";

    begin
        if not BookTitle.IsEmpty then
            exit;
        InsertBookTitle('The Great Gatsby', BookTitle."Book Genre"::Fiction);
        InsertBookTitle('Tp Kill A Mockingbird', BookTitle."Book Genre"::Fiction);
        InsertBookTitle('1984', BookTitle."Book Genre"::Fiction);
        InsertBookTitle('Pride And Prejudice', BookTitle."Book Genre"::Fiction);
        InsertBookTitle('The Hobbit', BookTitle."Book Genre"::Fiction);

        InsertBookTitle('Lucy', BookTitle."Book Genre"::Mystery);
        InsertBookTitle('The Unicorn', BookTitle."Book Genre"::Mystery);
        InsertBookTitle('Harry Porter', BookTitle."Book Genre"::Mystery);
        InsertBookTitle('The Jungle Book', BookTitle."Book Genre"::Mystery);
        InsertBookTitle('You Can See Me', BookTitle."Book Genre"::Mystery);

        InsertBookTitle('The Book', BookTitle."Book Genre"::NonFiction);
        InsertBookTitle('The Safari', BookTitle."Book Genre"::NonFiction);
        InsertBookTitle('Real World', BookTitle."Book Genre"::NonFiction);
        InsertBookTitle('World Exist', BookTitle."Book Genre"::NonFiction);
        InsertBookTitle('Introvert', BookTitle."Book Genre"::NonFiction);

        InsertBookTitle('The Book Of Love', BookTitle."Book Genre"::Romance);
        InsertBookTitle('The Titanic', BookTitle."Book Genre"::Romance);
        InsertBookTitle('Joy Of Love', BookTitle."Book Genre"::Romance);
        InsertBookTitle('Secret Story', BookTitle."Book Genre"::Romance);
        InsertBookTitle('Are You In Love', BookTitle."Book Genre"::Romance);

        InsertBookTitle('The Facebook', BookTitle."Book Genre"::SciFi);
        InsertBookTitle('Hacker', BookTitle."Book Genre"::SciFi);
        InsertBookTitle('The Matrix', BookTitle."Book Genre"::SciFi);
        InsertBookTitle('The Terminator', BookTitle."Book Genre"::SciFi);
        InsertBookTitle('The Star Wars', BookTitle."Book Genre"::SciFi);
        InsertBookTitle('Lucy', BookTitle."Book Genre"::SciFi);

    end;

    procedure InsertBookTitle(Title: Text[100]; BookGenre: Option)
    var
        BookTitle: Record "Book Title Lists Table";
    begin
        BookTitle.Init();
        BookTitle."Book Title" := Title;
        BookTitle."Book Genre" := BookGenre;
        BookTitle.Insert();


    end;


}
