xmlport 50000 "Customer XML"
{
    Direction = Export;
    Format = Xml;
    Caption = 'Export Customers to XML';
    schema
    {
        textelement(Customers)
        {
            tableelement(Customer; Customer)
            {
                fieldattribute(Number; Customer."No.")
                {

                }
                fieldattribute(Language; Customer."Language Code")
                {

                }
                fieldattribute(Name; Customer.Name) { }
                fieldattribute(Phone; Customer."Phone No.") { }
                textelement(Address)
                {
                    XmlName = 'Address';
                    fieldelement(Street; Customer.Address) { }
                    fieldelement(City; Customer.City) { }
                    fieldelement(PostCode; Customer."Post Code") { }
                }
            }
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {

            }
        }

        actions
        {
            area(processing)
            {
            }
        }
    }

}