codeunit 51050 "SendEmailWithTemplate"
{
    procedure SendEmail()
    var
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit "Email";
        Recipient: Text;
        Subject: Text;
        Body: Text;
    begin
        // Define email details
        Recipient := 'asfakmalek080@gmail.com';
        Subject := 'Hello Welcome Sir';
        Body := 'This is a test email from Business Central.';

        // Create email message
        EmailMessage.Create(Subject, Body, '');  // Set to 'true' for HTML email

        // Add recipient
        EmailMessage.Create('asfakmalek080@gmail.com', 'Send For Sells Quotes', 'Welcome');

        // Send the email using the default email account
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);

        // Show confirmation message
        Message('Email sent successfully.');
    end;
}
