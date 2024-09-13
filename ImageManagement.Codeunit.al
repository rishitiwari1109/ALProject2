codeunit 50000 "Image Management"
{
    trigger OnRun()
    begin

    end;

    procedure ImportItemPicture(Item: Record Item)
    var
        PicInstream: InStream;
        FromFileName: Text;
        OverrideImageQst: Label 'Would you like to replace the existing picture ?';
    begin
        with Item do begin
            if Picture.Count > 0 then
                IF NOT (Confirm(OverrideImageQst, false)) then
                    EXIT;
            IF File.UploadIntoStream('Import File', '', 'All Files(*.*)|*.*', FromFileName, PicInstream) then begin
                Clear(Picture);
                Picture.ImportStream(PicInstream, FromFileName);
                Modify(true);
            end;
        end;
    end;
}