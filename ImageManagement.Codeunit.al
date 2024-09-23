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
        if Item.Picture.Count > 0 then
            if not (Confirm(OverrideImageQst, false)) then
                exit;
        if File.UploadIntoStream('Import File', '', 'All Files(*.*)|*.*', FromFileName, PicInstream) then begin
            Clear(Item.Picture);
            Item.Picture.ImportStream(PicInstream, FromFileName);
            Item.Modify(true);
        end;
    end;
}