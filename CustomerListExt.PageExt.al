pageextension 50000 "Customer List Ext" extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter("&Customer")
        {
            action(ExportToXML)
            {
                Caption = 'Export to XML';
                ToolTip = 'Export to XML';
                ApplicationArea = All;
                Image = XMLFile;
                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    CustomerXML: XmlPort "Customer XML";
                    OutStr: OutStream;
                    Instr: InStream;
                    FileName: Text;
                begin
                    TempBlob.CreateOutStream(OutStr);
                    CustomerXML.SetDestination(OutStr);
                    CustomerXML.Export();
                    TempBlob.CreateInStream(Instr);
                    FileName := 'Customers.xml';
                    File.DownloadFromStream(Instr, 'Download', '', '', FileName);
                end;
            }
        }
    }

}