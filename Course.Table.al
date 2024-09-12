table 50100 Course
{
    DataClassification = CustomerContent;

    fields
    {
        field(10; Code; Code[10])
        {
            DataClassification = CustomerContent;

        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }
}