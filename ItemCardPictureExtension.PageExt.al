pageextension 50110 "Item Card Picture Extension" extends "Item Card"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addlast(Functions)
        {
            action(ImportItemPicture)
            {
                Caption = 'Import Item Picture';
                ApplicationArea = All;
                Image = Import;
                ToolTip = 'Import Item Picture';
                trigger OnAction()
                var
                    ImageMgt: Codeunit "Image Management";
                begin
                    ImageMgt.ImportItemPicture(Rec);
                end;
            }
        }
    }

    var
        myInt: Integer;
}