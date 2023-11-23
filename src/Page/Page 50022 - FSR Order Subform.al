page 50022 "FSR Order Subform"
{
    // version NAVW19.00.00.45778,NAVIN9.00.00.45778

    AutoSplitKey = true;
    CaptionML = ENU = 'FSR Order Subform',
                ENN = 'FSR Order Subform';
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = 37;
    SourceTableView = WHERE("Document Type" = FILTER("Order"));

    layout
    {
        area(content)
        {
            repeater(Control001)
            {
                field(Type; rec.Type)
                {

                    trigger OnValidate();
                    begin
                        TypeOnAfterValidate;
                        NoOnAfterValidate;
                        TypeChosen := HasTypeToFillMandatotyFields;
                        SetLocationCodeMandatory;

                        IF xRec."No." <> '' THEN
                            RedistributeTotalsOnAfterValidate;
                        //pcpl0024
                        IF Type <> Type::" " THEN BEGIN
                            RecSlaesPersonCode.RESET;
                            RecSlaesPersonCode.SETRANGE(RecSlaesPersonCode.Code, SalesHeader."Salesperson Code");
                            IF RecSlaesPersonCode.FINDFIRST THEN
                                "Commission Percentage" := RecSlaesPersonCode."Commission Percentage";
                            "Commission Amount" := RecSlaesPersonCode."Commission Amount";
                        END;
                        //pcpl0024
                    end;
                }

                field("No."; rec."No.")
                {
                    ApplicationArea = all;
                    ShowMandatory = TypeChosen;

                    trigger OnValidate();
                    begin
                        ShowShortcutDimCode(ShortcutDimCode);
                        NoOnAfterValidate;

                        IF xRec."No." <> '' THEN
                            RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("No. of Packages"; rec."No. of Packages")
                {
                    ApplicationArea = all;
                }
                field("Cross-Reference No."; rec."Cross-Reference No.")
                {
                    Visible = false;
                    ApplicationArea = all;
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        CrossReferenceNoLookUp;
                        InsertExtendedText(FALSE);
                        NoOnAfterValidate;
                    end;

                    trigger OnValidate();
                    begin
                        CrossReferenceNoOnAfterValidat;
                        NoOnAfterValidate;
                    end;
                }
                field("Identification Mark"; "Identification Mark")
                {
                    ApplicationArea = all;
                }
                field("IC Partner Code"; "IC Partner Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Service Tax Group"; "Service Tax Group")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Claim Deferred Excise"; "Claim Deferred Excise")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Direct Debit To PLA / RG"; "Direct Debit To PLA / RG")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Service Tax Registration No."; "Service Tax Registration No.")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Units per Parcel"; "Units per Parcel")
                {
                    ApplicationArea = all;
                }
                field("IC Partner Ref. Type"; "IC Partner Ref. Type")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("IC Partner Reference"; "IC Partner Reference")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Packing Size"; "Packing Size")
                {
                    ApplicationArea = all;
                }
                field("Technical Function/s"; "Technical Function/s")
                {
                    ApplicationArea = all;
                }
                field("Variant Code"; "Variant Code")
                {
                    Visible = false;
                    ApplicationArea = all;
                    trigger OnValidate();
                    begin
                        VariantCodeOnAfterValidate;
                    end;
                }
                field("Substitution Available"; "Substitution Available")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Purchasing Code"; "Purchasing Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Free Supply"; "Free Supply")
                {
                    ApplicationArea = all;
                }
                field(Nonstock; Nonstock)
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("VAT Prod. Posting Group"; "VAT Prod. Posting Group")
                {
                    Visible = false;
                    ApplicationArea = all;
                    trigger OnValidate();
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field(Description; Description)
                {
                    ApplicationArea = all;
                    QuickEntry = false;
                }
                field("Drop Shipment"; "Drop Shipment")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field(MRP; rec.MRP)
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("MRP Price"; rec."MRP Price")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Abatement %"; rec."Abatement %")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("PIT Structure"; rec."PIT Structure")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Price Inclusive of Tax"; rec."Price Inclusive of Tax")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Unit Price Incl. of Tax"; rec."Unit Price Incl. of Tax")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Tax Category"; rec."Tax Category")
                {
                    ApplicationArea = all;
                }
                field("Tax Area Code"; rec."Tax Area Code")
                {
                    ApplicationArea = all;
                }
                field("Tax Liable"; rec."Tax Liable")
                {
                    ApplicationArea = all;
                }
                field("Tax Group Code"; rec."Tax Group Code")
                {
                    ApplicationArea = all;
                }
                field("Special Order"; rec."Special Order")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Return Reason Code"; rec."Return Reason Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Location Code"; rec."Location Code")
                {
                    QuickEntry = false;
                    ShowMandatory = LocationCodeMandatory;
                    ApplicationArea = all;
                    trigger OnValidate();
                    begin
                        LocationCodeOnAfterValidate;
                    end;
                }
                field("Bin Code"; rec."Bin Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Excise Bus. Posting Group"; rec."Excise Bus. Posting Group")
                {
                    ApplicationArea = all;
                }
                field("Excise Prod. Posting Group"; rec."Excise Prod. Posting Group")
                {
                    ApplicationArea = all;
                }
                field("TCS Nature of Collection"; rec."TCS Nature of Collection")
                {
                    ApplicationArea = all;
                }
                field("Net Weight"; rec."Net Weight")
                {
                    ApplicationArea = all;
                }
                field("Gross Weight"; rec."Gross Weight")
                {
                    ApplicationArea = all;
                }
                field("Gen. Bus. Posting Group"; rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = all;
                }
                field("Gen. Prod. Posting Group"; rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = all;
                }
                field(Reserve; rec.Reserve)
                {
                    Visible = false;
                    ApplicationArea = all;
                    trigger OnValidate();
                    begin
                        ReserveOnAfterValidate;
                    end;
                }
                field(Quantity; rec.Quantity)
                {
                    ApplicationArea = all;
                    BlankZero = true;
                    ShowMandatory = TypeChosen;

                    trigger OnValidate();
                    begin
                        QuantityOnAfterValidate;
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Qty. to Assemble to Order"; rec."Qty. to Assemble to Order")
                {
                    ApplicationArea = all;
                    BlankZero = true;
                    Visible = false;

                    trigger OnDrillDown();
                    begin
                        ShowAsmToOrderLines;
                    end;

                    trigger OnValidate();
                    begin
                        QtyToAsmToOrderOnAfterValidate;
                    end;
                }
                field("Purchase Order No."; rec."Purchase Order No.")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Reserved Quantity"; rec."Reserved Quantity")
                {
                    ApplicationArea = all;
                    BlankZero = true;
                    QuickEntry = false;
                }
                field("Unit of Measure Code"; rec."Unit of Measure Code")
                {
                    QuickEntry = false;
                    ApplicationArea = all;
                    trigger OnValidate();
                    begin
                        UnitofMeasureCodeOnAfterValida;
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Unit of Measure"; rec."Unit of Measure")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Unit Cost (LCY)"; rec."Unit Cost (LCY)")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field(SalesPriceExist; rec.PriceExists)
                {
                    ApplicationArea = all;
                    CaptionML = ENU = 'Sales Price Exists',
                                ENN = 'Sales Price Exists';
                    Editable = false;
                    Visible = false;
                }
                field("Unit Price"; rec."Unit Price")
                {
                    BlankZero = true;
                    ShowMandatory = TypeChosen;
                    ApplicationArea = all;
                    trigger OnValidate();
                    begin
                        TESTFIELD("Price Inclusive of Tax", FALSE);
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("BOM Item No."; rec."BOM Item No.")
                {
                    ApplicationArea = all;
                }
                field("Amount To Customer"; rec."Amount To Customer")
                {
                    ApplicationArea = all;
                }
                field("Charges To Customer"; rec."Charges To Customer")
                {
                    ApplicationArea = all;
                }
                field("Line Amount"; rec."Line Amount")
                {
                    BlankZero = true;
                    ApplicationArea = all;
                    trigger OnValidate();
                    begin
                        TESTFIELD("Price Inclusive of Tax", FALSE);
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field(SalesLineDiscExists; rec.LineDiscExists)
                {
                    ApplicationArea = all;
                    CaptionML = ENU = 'Sales Line Disc. Exists',
                                ENN = 'Sales Line Disc. Exists';
                    Editable = false;
                    Visible = false;
                }
                field("Line Discount %"; rec."Line Discount %")
                {
                    BlankZero = true;
                    ApplicationArea = all;
                    trigger OnValidate();
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Line Discount Amount"; rec."Line Discount Amount")
                {
                    Visible = false;
                    ApplicationArea = all;
                    trigger OnValidate();
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Prepayment %"; rec."Prepayment %")
                {
                    Visible = false;
                    ApplicationArea = all;
                    trigger OnValidate();
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Prepmt. Line Amount"; rec."Prepmt. Line Amount")
                {
                    Visible = false;
                    ApplicationArea = all;
                    trigger OnValidate();
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Prepmt. Amt. Inv."; rec."Prepmt. Amt. Inv.")
                {
                    Visible = false;
                    ApplicationArea = all;
                    trigger OnValidate();
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Assessable Value"; rec."Assessable Value")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("CIF Amount"; rec."CIF Amount")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("BCD Amount"; rec."BCD Amount")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("BED Amount"; rec."BED Amount")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("AED(GSI) Amount"; rec."AED(GSI) Amount")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("AED(TTA) Amount"; rec."AED(TTA) Amount")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("SED Amount"; rec."SED Amount")
                {
                    Visible = false;
                }
                field("SAED Amount"; rec."SAED Amount")
                {
                    Visible = false;
                }
                field("CESS Amount"; rec."CESS Amount")
                {
                    Visible = false;
                }
                field("NCCD Amount"; rec."NCCD Amount")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("ADE Amount"; rec."ADE Amount")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("ADET Amount"; rec."ADET Amount")
                {
                    Visible = false;
                }
                field("eCess Amount"; rec."eCess Amount")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("SHE Cess Amount"; rec."SHE Cess Amount")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("ADC VAT Amount"; rec."ADC VAT Amount")
                {
                    Visible = false;
                }
                field(Supplementary; rec.Supplementary)
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Source Document Type"; rec."Source Document Type")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Source Document No."; rec."Source Document No.")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Allow Invoice Disc."; rec."Allow Invoice Disc.")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Inv. Discount Amount"; rec."Inv. Discount Amount")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Qty. to Ship"; rec."Qty. to Ship")
                {
                    BlankZero = true;

                    trigger OnValidate();
                    begin
                        IF "Qty. to Asm. to Order (Base)" <> 0 THEN BEGIN
                            CurrPage.SAVERECORD;
                            CurrPage.UPDATE(FALSE);
                        END;
                    end;
                }
                field("Quantity Shipped"; "Quantity Shipped")
                {
                    ApplicationArea = all;
                    BlankZero = true;
                    QuickEntry = false;
                }
                field("Qty. to Invoice"; "Qty. to Invoice")
                {
                    ApplicationArea = all;
                    BlankZero = true;
                }
                field("Quantity Invoiced"; "Quantity Invoiced")
                {
                    ApplicationArea = all;
                    BlankZero = true;
                }
                field("Prepmt Amt to Deduct"; "Prepmt Amt to Deduct")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Prepmt Amt Deducted"; "Prepmt Amt Deducted")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Allow Item Charge Assignment"; "Allow Item Charge Assignment")
                {
                    Visible = false;
                }
                field("Qty. to Assign"; "Qty. to Assign")
                {
                    ApplicationArea = all;
                    BlankZero = true;
                    QuickEntry = false;

                    trigger OnDrillDown();
                    begin
                        CurrPage.SAVERECORD;
                        ShowItemChargeAssgnt;
                        UpdateForm(FALSE);
                    end;
                }
                field("Qty. Assigned"; "Qty. Assigned")
                {
                    ApplicationArea = all;
                    BlankZero = true;
                    QuickEntry = false;

                    trigger OnDrillDown();
                    begin
                        CurrPage.SAVERECORD;
                        ShowItemChargeAssgnt;
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                field("Requested Delivery Date"; "Requested Delivery Date")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Promised Delivery Date"; "Promised Delivery Date")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Planned Delivery Date"; "Planned Delivery Date")
                {
                    ApplicationArea = all;
                    QuickEntry = false;
                }
                field("Planned Shipment Date"; "Planned Shipment Date")
                {
                    ApplicationArea = all;
                }
                field("Shipment Date"; "Shipment Date")
                {
                    ApplicationArea = all;
                    QuickEntry = false;

                    trigger OnValidate();
                    begin
                        ShipmentDateOnAfterValidate;
                    end;
                }
                field("Shipping Agent Code"; "Shipping Agent Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Shipping Agent Service Code"; "Shipping Agent Service Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Shipping Time"; "Shipping Time")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Work Type Code"; "Work Type Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Whse. Outstanding Qty."; "Whse. Outstanding Qty.")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Whse. Outstanding Qty. (Base)"; "Whse. Outstanding Qty. (Base)")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("ATO Whse. Outstanding Qty."; "ATO Whse. Outstanding Qty.")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("ATO Whse. Outstd. Qty. (Base)"; "ATO Whse. Outstd. Qty. (Base)")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Outbound Whse. Handling Time"; "Outbound Whse. Handling Time")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Blanket Order No."; "Blanket Order No.")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Blanket Order Line No."; "Blanket Order Line No.")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("FA Posting Date"; "FA Posting Date")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Depr. until FA Posting Date"; "Depr. until FA Posting Date")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Depreciation Book Code"; "Depreciation Book Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Use Duplication List"; "Use Duplication List")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Duplicate in Depreciation Book"; "Duplicate in Depreciation Book")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Appl.-from Item Entry"; "Appl.-from Item Entry")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Appl.-to Item Entry"; "Appl.-to Item Entry")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Deferral Code"; "Deferral Code")
                {
                    ApplicationArea = all;
                    Enabled = (Type <> Type::"Fixed Asset") AND (Type <> Type::" ");
                    TableRelation = "Deferral Template"."Deferral Code";
                }
                field("GST Place of Supply"; "GST Place of Supply")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("GST Group Code"; "GST Group Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("GST Group Type"; "GST Group Type")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("GST Base Amount"; "GST Base Amount")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Total GST Amount"; "Total GST Amount")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("HSN/SAC Code"; "HSN/SAC Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("GST Jurisdiction Type"; "GST Jurisdiction Type")
                {
                    Visible = false;
                }
                field("Invoice Type"; "Invoice Type")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field(Exempted; Exempted)
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Process Carried Out"; "Process Carried Out")
                {
                    ApplicationArea = all;
                    Visible = "Process Carried OutVisible";
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field(ShortcutDimCode[3];ShortcutDimCode[3])
                {
                    ApplicationArea =all;
                    CaptionClass = '1,2,3';
                    TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(3),
                                                                  Dimension Value Type=CONST(Standard),
                                                                  Blocked=CONST(No));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(3,ShortcutDimCode[3]);
                    end;
                }
                field(ShortcutDimCode[4];ShortcutDimCode[4])
                {
                    ApplicationArea =all;
                    CaptionClass = '1,2,4';
                    TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(4),
                                                                  Dimension Value Type=CONST(Standard),
                                                                  Blocked=CONST(No));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(4,ShortcutDimCode[4]);
                    end;
                }
                field(ShortcutDimCode[5];ShortcutDimCode[5])
                {
                    ApplicationArea =all;
                    CaptionClass = '1,2,5';
                    TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(5),
                                                                  Dimension Value Type=CONST(Standard),
                                                                  Blocked=CONST(No));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(5,ShortcutDimCode[5]);
                    end;
                }
                field(ShortcutDimCode[6];ShortcutDimCode[6])
                {
                    ApplicationArea =all;
                    CaptionClass = '1,2,6';
                    TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(6),
                                                                  Dimension Value Type=CONST(Standard),
                                                                  Blocked=CONST(No));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(6,ShortcutDimCode[6]);
                    end;
                }
                field(ShortcutDimCode[7];ShortcutDimCode[7])
                {
                    ApplicationArea =all;
                    CaptionClass = '1,2,7';
                    TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(7),
                                                                  Dimension Value Type=CONST(Standard),
                                                                  Blocked=CONST(No));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(7,ShortcutDimCode[7]);
                    end;
                }
                field(ShortcutDimCode[8];ShortcutDimCode[8])
                {
                    ApplicationArea =all;
                    CaptionClass = '1,2,8';
                    TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(8),
                                                                  Dimension Value Type=CONST(Standard),
                                                                  Blocked=CONST(No));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(8,ShortcutDimCode[8]);
                    end;
                }
                field("Document No.";"Document No.")
                {
                    ApplicationArea =all;
                    Editable = false;
                    Visible = false;
                }
                field(Purity;Purity)
                {
                    ApplicationArea =all;
                }
                field(Unit;Unit)
                {
                    ApplicationArea =all;
                    Caption = 'Original PO Quantity';
                }
                field("Line No.";"Line No.")
                {
                    ApplicationArea =all;
                    Editable = false;
                    Visible = false;
                }
                field("Excise Amount";"Excise Amount")
                {
                    ApplicationArea =all;
                }
                field("Commission Percentage";"Commission Percentage")
                {
                    ApplicationArea =all;
                    Editable = false;
                }
                field("Commission Amount";"Commission Amount")
                {
                    ApplicationArea =all;
                    Editable = false;
                }
            }
            group()
            {
                group()
                {
                    field("Invoice Discount Amount";TotalSalesLine."Inv. Discount Amount")
                    {
                        ApplicationArea =all;
                        AutoFormatExpression = TotalSalesHeader."Currency Code";
                        AutoFormatType = 1;
                        CaptionML = ENU='Invoice Discount Amount',
                                    ENN='Invoice Discount Amount';
                        Editable = InvDiscAmountEditable;
                        Style = Subordinate;
                        StyleExpr = RefreshMessageEnabled;
                        Visible = false;

                        trigger OnValidate();
                        var
                            SalesHeader : Record "36";
                        begin
                            SalesHeader.GET("Document Type","Document No.");
                            SalesCalcDiscByType.ApplyInvDiscBasedOnAmt(TotalSalesLine."Inv. Discount Amount",SalesHeader);
                            CurrPage.UPDATE(FALSE);
                        end;
                    }
                    field("Invoice Disc. Pct.";SalesCalcDiscByType.GetCustInvoiceDiscountPct(Rec))
                    {
                        ApplicationArea =all;
                        CaptionML = ENU='Invoice Discount %',
                                    ENN='Invoice Discount %';
                        DecimalPlaces = 0:2;
                        Editable = false;
                        Style = Subordinate;
                        StyleExpr = RefreshMessageEnabled;
                        Visible = false;
                    }
                }
                group()
                {
                    field("Total Amount Excl. VAT";TotalSalesLine.Amount)
                    {
                        ApplicationArea =all;
                        AutoFormatExpression = TotalSalesHeader."Currency Code";
                        AutoFormatType = 1;
                        CaptionClass = DocumentTotals.GetTotalExclVATCaption(SalesHeader."Currency Code");
                        CaptionML = ENU='Total Amount Excl. VAT',
                                    ENN='Total Amount Excl. VAT';
                        DrillDown = false;
                        Editable = false;
                        Style = Subordinate;
                        StyleExpr = RefreshMessageEnabled;
                        Visible = false;
                    }
                    field("Total VAT Amount";VATAmount)
                    {
                        ApplicationArea =all;
                        AutoFormatExpression = TotalSalesHeader."Currency Code";
                        AutoFormatType = 1;
                        CaptionClass = DocumentTotals.GetTotalVATCaption(SalesHeader."Currency Code");
                        CaptionML = ENU='Total VAT',
                                    ENN='Total VAT';
                        Editable = false;
                        Style = Subordinate;
                        StyleExpr = RefreshMessageEnabled;
                        Visible = false;
                    }
                    field("Total Amount Incl. VAT";TotalSalesLine."Amount Including VAT")
                    {
                        ApplicationArea =all;
                        AutoFormatExpression = TotalSalesHeader."Currency Code";
                        AutoFormatType = 1;
                        CaptionClass = DocumentTotals.GetTotalInclVATCaption(SalesHeader."Currency Code");
                        CaptionML = ENU='Total Amount Incl. VAT',
                                    ENN='Total Amount Incl. VAT';
                        Editable = false;
                        StyleExpr = TotalAmountStyle;
                        Visible = false;
                    }
                    field(RefreshTotals;RefreshMessageText)
                    {
                        ApplicationArea =all;
                        DrillDown = true;
                        Editable = false;
                        Enabled = RefreshMessageEnabled;
                        ShowCaption = false;
                        Visible = false;

                        trigger OnDrillDown();
                        begin
                            DocumentTotals.SalesRedistributeInvoiceDiscountAmounts(Rec,VATAmount,TotalSalesLine);
                            CurrPage.UPDATE(FALSE);
                        end;
                    }
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                CaptionML = ENU='&Line',
                            ENN='&Line';
                Image = Line;
                group("Item Availability by")
                {
                    CaptionML = ENU='Item Availability by',
                                ENN='Item Availability by';
                    Image = ItemAvailability;
                    action("<Action3>")
                    {
                        CaptionML = ENU='Event',
                                    ENN='Event';
                        Image = "Event";

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromSalesLine(Rec,ItemAvailFormsMgt.ByEvent)
                        end;
                    }
                    action(Period)
                    {
                        CaptionML = ENU='Period',
                                    ENN='Period';
                        Image = Period;

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromSalesLine(Rec,ItemAvailFormsMgt.ByPeriod)
                        end;
                    }
                    action(Variant)
                    {
                        CaptionML = ENU='Variant',
                                    ENN='Variant';
                        Image = ItemVariant;

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromSalesLine(Rec,ItemAvailFormsMgt.ByVariant)
                        end;
                    }
                    action(Location)
                    {
                        AccessByPermission = TableData 14=R;
                        CaptionML = ENU='Location',
                                    ENN='Location';
                        Image = Warehouse;

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromSalesLine(Rec,ItemAvailFormsMgt.ByLocation)
                        end;
                    }
                    action("BOM Level")
                    {
                        CaptionML = ENU='BOM Level',
                                    ENN='BOM Level';
                        Image = BOMLevel;

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromSalesLine(Rec,ItemAvailFormsMgt.ByBOM)
                        end;
                    }
                }
                action("Reservation Entries")
                {
                    AccessByPermission = TableData 27=R;
                    CaptionML = ENU='Reservation Entries',
                                ENN='Reservation Entries';
                    Image = ReservationLedger;

                    trigger OnAction();
                    begin
                        ShowReservationEntries(TRUE);
                    end;
                }
                action(ItemTrackingLines)
                {
                    CaptionML = ENU='Item &Tracking Lines',
                                ENN='Item &Tracking Lines';
                    Image = ItemTrackingLines;
                    ShortCutKey = 'Shift+Ctrl+I';

                    trigger OnAction();
                    begin
                        OpenItemTrackingLines;
                    end;
                }
                action("Select Item Substitution")
                {
                    AccessByPermission = TableData 5715=R;
                    CaptionML = ENU='Select Item Substitution',
                                ENN='Select Item Substitution';
                    Image = SelectItemSubstitution;

                    trigger OnAction();
                    begin
                        ShowItemSub;
                    end;
                }
                action(Dimensions)
                {
                    AccessByPermission = TableData 348=R;
                    CaptionML = ENU='Dimensions',
                                ENN='Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction();
                    begin
                        ShowDimensions;
                    end;
                }
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                ENN='Co&mments';
                    Image = ViewComments;

                    trigger OnAction();
                    begin
                        ShowLineComments;
                    end;
                }
                action("Item Charge &Assignment")
                {
                    AccessByPermission = TableData 5800=R;
                    CaptionML = ENU='Item Charge &Assignment',
                                ENN='Item Charge &Assignment';
                    Image = ItemCosts;

                    trigger OnAction();
                    begin
                        ItemChargeAssgnt;
                    end;
                }
                action(OrderPromising)
                {
                    AccessByPermission = TableData 99000880=R;
                    CaptionML = ENU='Order &Promising',
                                ENN='Order &Promising';
                    Image = OrderPromising;

                    trigger OnAction();
                    begin
                        OrderPromisingLine;
                    end;
                }
                group("Assemble to Order")
                {
                    CaptionML = ENU='Assemble to Order',
                                ENN='Assemble to Order';
                    Image = AssemblyBOM;
                    action(AssembleToOrderLines)
                    {
                        AccessByPermission = TableData 90=R;
                        CaptionML = ENU='Assemble-to-Order Lines',
                                    ENN='Assemble-to-Order Lines';

                        trigger OnAction();
                        begin
                            ShowAsmToOrderLines;
                        end;
                    }
                    action("Roll Up &Price")
                    {
                        AccessByPermission = TableData 90=R;
                        CaptionML = ENU='Roll Up &Price',
                                    ENN='Roll Up &Price';
                        Ellipsis = true;

                        trigger OnAction();
                        begin
                            RollupAsmPrice;
                        end;
                    }
                    action("Roll Up &Cost")
                    {
                        AccessByPermission = TableData 90=R;
                        CaptionML = ENU='Roll Up &Cost',
                                    ENN='Roll Up &Cost';
                        Ellipsis = true;

                        trigger OnAction();
                        begin
                            RollUpAsmCost;
                        end;
                    }
                }
                action(DeferralSchedule)
                {
                    CaptionML = ENU='Deferral Schedule',
                                ENN='Deferral Schedule';
                    Enabled = "Deferral Code" <> '';
                    Image = PaymentPeriod;

                    trigger OnAction();
                    begin
                        SalesHeader.GET("Document Type","Document No.");
                        ShowDeferrals(SalesHeader."Posting Date",SalesHeader."Currency Code");
                    end;
                }
                action("Str&ucture Details")
                {
                    CaptionML = ENU='Str&ucture Details',
                                ENN='Str&ucture Details';
                    Image = Hierarchy;

                    trigger OnAction();
                    begin
                        ShowStrDetailsForm;
                    end;
                }
                action(Structure)
                {
                    CaptionML = ENU='Structure',
                                ENN='Structure';
                    Image = Hierarchy;

                    trigger OnAction();
                    begin
                        ShowStrOrderDetailsPITForm;
                    end;
                }
                action("Excise Detail")
                {
                    CaptionML = ENU='Excise Detail',
                                ENN='Excise Detail';
                    Image = Excise;

                    trigger OnAction();
                    begin
                        ShowExcisePostingSetup;
                    end;
                }
                action("Detailed Tax")
                {
                    CaptionML = ENU='Detailed Tax',
                                ENN='Detailed Tax';
                    Image = TaxDetail;

                    trigger OnAction();
                    begin
                        ShowDetailedTaxEntryBuffer;
                    end;
                }
            }
            group("F&unctions")
            {
                CaptionML = ENU='F&unctions',
                            ENN='F&unctions';
                Image = "Action";
                action(GetPrice)
                {
                    AccessByPermission = TableData 7002=R;
                    CaptionML = ENU='Get Price',
                                ENN='Get Price';
                    Ellipsis = true;
                    Image = Price;

                    trigger OnAction();
                    begin
                        ShowPrices;
                    end;
                }
                action("Get Li&ne Discount")
                {
                    AccessByPermission = TableData 7004=R;
                    CaptionML = ENU='Get Li&ne Discount',
                                ENN='Get Li&ne Discount';
                    Ellipsis = true;
                    Image = LineDiscount;

                    trigger OnAction();
                    begin
                        ShowLineDisc
                    end;
                }
                action(ExplodeBOM_Functions)
                {
                    AccessByPermission = TableData 90=R;
                    CaptionML = ENU='E&xplode BOM',
                                ENN='E&xplode BOM';
                    Image = ExplodeBOM;

                    trigger OnAction();
                    begin
                        ExplodeBOM;
                    end;
                }
                action("Insert Ext. Texts")
                {
                    AccessByPermission = TableData 279=R;
                    CaptionML = ENU='Insert &Ext. Texts',
                                ENN='Insert &Ext. Texts';
                    Image = Text;

                    trigger OnAction();
                    begin
                        InsertExtendedText(TRUE);
                    end;
                }
                action(Reserve)
                {
                    CaptionML = ENU='&Reserve',
                                ENN='&Reserve';
                    Ellipsis = true;
                    Image = Reserve;

                    trigger OnAction();
                    begin
                        FIND;
                        ShowReservation;
                    end;
                }
                action(OrderTracking)
                {
                    CaptionML = ENU='Order &Tracking',
                                ENN='Order &Tracking';
                    Image = OrderTracking;

                    trigger OnAction();
                    begin
                        ShowTracking;
                    end;
                }
                action("Nonstoc&k Items")
                {
                    AccessByPermission = TableData 5718=R;
                    CaptionML = ENU='Nonstoc&k Items',
                                ENN='Nonstoc&k Items';
                    Image = NonStockItem;

                    trigger OnAction();
                    begin
                        ShowNonstockItems;
                    end;
                }
            }
            group("O&rder")
            {
                CaptionML = ENU='O&rder',
                            ENN='O&rder';
                Image = "Order";
                group("Dr&op Shipment")
                {
                    CaptionML = ENU='Dr&op Shipment',
                                ENN='Dr&op Shipment';
                    Image = Delivery;
                    action("Purchase &Order")
                    {
                        AccessByPermission = TableData 120=R;
                        CaptionML = ENU='Purchase &Order',
                                    ENN='Purchase &Order';
                        Image = Document;

                        trigger OnAction();
                        begin
                            OpenPurchOrderForm;
                        end;
                    }
                }
                group("Speci&al Order")
                {
                    CaptionML = ENU='Speci&al Order',
                                ENN='Speci&al Order';
                    Image = SpecialOrder;
                    action(OpenSpecialPurchaseOrder)
                    {
                        AccessByPermission = TableData 120=R;
                        CaptionML = ENU='Purchase &Order',
                                    ENN='Purchase &Order';
                        Image = Document;

                        trigger OnAction();
                        begin
                            OpenSpecialPurchOrderForm;
                        end;
                    }
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        IF SalesHeader.GET("Document Type","Document No.") THEN;

        DocumentTotals.SalesUpdateTotalsControls(Rec,TotalSalesHeader,TotalSalesLine,RefreshMessageEnabled,
          TotalAmountStyle,RefreshMessageText,InvDiscAmountEditable,CurrPage.EDITABLE,VATAmount);

        TypeChosen := HasTypeToFillMandatotyFields;
        SetLocationCodeMandatory;
    end;

    trigger OnAfterGetRecord();
    begin
        ShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnDeleteRecord() : Boolean;
    var
        ReserveSalesLine : Codeunit 99000832;
    begin
        IF (Quantity <> 0) AND ItemExists("No.") THEN BEGIN
          COMMIT;
          IF NOT ReserveSalesLine.DeleteLineConfirm(Rec) THEN
            EXIT(FALSE);
          ReserveSalesLine.DeleteLine(Rec);
        END;
    end;

    trigger OnInit();
    begin
        "Process Carried OutVisible" := TRUE;
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        InitType;
        CLEAR(ShortcutDimCode);
    end;

    var
        TotalSalesHeader : Record 36;
        TotalSalesLine : Record 37;
        SalesHeader : Record 36;
        SalesPriceCalcMgt : Codeunit 7000;
        TransferExtendedText : Codeunit 378;
        ItemAvailFormsMgt : Codeunit 353;
        SalesCalcDiscByType : Codeunit 56;
        DocumentTotals : Codeunit 57;
        VATAmount : Decimal;
        ShortcutDimCode : array [8] of Code[20];
        Text001 : TextConst ENU='You cannot use the Explode BOM function because a prepayment of the sales order has been invoiced.',ENN='You cannot use the Explode BOM function because a prepayment of the sales order has been invoiced.';
        [InDataSet]
        ItemPanelVisible : Boolean;
        TypeChosen : Boolean;
        LocationCodeMandatory : Boolean;
        InvDiscAmountEditable : Boolean;
        TotalAmountStyle : Text;
        RefreshMessageEnabled : Boolean;
        RefreshMessageText : Text;
        [InDataSet]
        "Process Carried OutVisible" : Boolean;
        RecSlaesPersonCode : Record 13;

    procedure ApproveCalcInvDisc();
    begin
        CODEUNIT.RUN(CODEUNIT::"Sales-Disc. (Yes/No)",Rec);
    end;

    procedure CalcInvDisc();
    begin
        CODEUNIT.RUN(CODEUNIT::"Sales-Calc. Discount",Rec);
    end;

    procedure ExplodeBOM();
    begin
        IF "Prepmt. Amt. Inv." <> 0 THEN
          ERROR(Text001);
        CODEUNIT.RUN(CODEUNIT::"Sales-Explode BOM",Rec);
    end;

    procedure OpenPurchOrderForm();
    var
        PurchHeader : Record 38;
        PurchOrder : Page 50;
    begin
        TESTFIELD("Purchase Order No.");
        PurchHeader.SETRANGE("No.","Purchase Order No.");
        PurchOrder.SETTABLEVIEW(PurchHeader);
        PurchOrder.EDITABLE := FALSE;
        PurchOrder.RUN;
    end;

    procedure OpenSpecialPurchOrderForm();
    var
        PurchHeader : Record 38;
        PurchRcptHeader : Record 120;
        PurchOrder : Page 50;
    begin
        TESTFIELD("Special Order Purchase No.");
        PurchHeader.SETRANGE("No.","Special Order Purchase No.");
        IF NOT PurchHeader.ISEMPTY THEN BEGIN
          PurchOrder.SETTABLEVIEW(PurchHeader);
          PurchOrder.EDITABLE := FALSE;
          PurchOrder.RUN;
        END ELSE BEGIN
          PurchRcptHeader.SETRANGE("Order No.","Special Order Purchase No.");
          IF PurchRcptHeader.COUNT = 1 THEN
            PAGE.RUN(PAGE::"Posted Purchase Receipt",PurchRcptHeader)
          ELSE
            PAGE.RUN(PAGE::"Posted Purchase Receipts",PurchRcptHeader);
        END;
    end;

    procedure InsertExtendedText(Unconditionally : Boolean);
    begin
        IF TransferExtendedText.SalesCheckIfAnyExtText(Rec,Unconditionally) THEN BEGIN
          CurrPage.SAVERECORD;
          COMMIT;
          TransferExtendedText.InsertSalesExtText(Rec);
        END;
        IF TransferExtendedText.MakeUpdate THEN
          UpdateForm(TRUE);
    end;

    procedure ShowNonstockItems();
    begin
        ShowNonstock;
    end;

    procedure ShowTracking();
    var
        TrackingForm : Page 99000822;
    begin
        TrackingForm.SetSalesLine(Rec);
        TrackingForm.RUNMODAL;
    end;

    procedure ItemChargeAssgnt();
    begin
        ShowItemChargeAssgnt;
    end;

    procedure UpdateForm(SetSaveRecord : Boolean);
    begin
        CurrPage.UPDATE(SetSaveRecord);
    end;

    procedure ShowPrices();
    begin
        SalesHeader.GET("Document Type","Document No.");
        CLEAR(SalesPriceCalcMgt);
        SalesPriceCalcMgt.GetSalesLinePrice(SalesHeader,Rec);
    end;

    procedure ShowLineDisc();
    begin
        SalesHeader.GET("Document Type","Document No.");
        CLEAR(SalesPriceCalcMgt);
        SalesPriceCalcMgt.GetSalesLineLineDisc(SalesHeader,Rec);
    end;

    procedure OrderPromisingLine();
    var
        OrderPromisingLine : Record 99000880 temporary;
        OrderPromisingLines : Page 99000959;
    begin
        OrderPromisingLine.SETRANGE("Source Type","Document Type");
        OrderPromisingLine.SETRANGE("Source ID","Document No.");
        OrderPromisingLine.SETRANGE("Source Line No.","Line No.");

        OrderPromisingLines.SetSourceType(OrderPromisingLine."Source Type"::Sales);
        OrderPromisingLines.SETTABLEVIEW(OrderPromisingLine);
        OrderPromisingLines.RUNMODAL;
    end;

    local procedure TypeOnAfterValidate();
    begin
        ItemPanelVisible := Type = Type::Item;
    end;

    local procedure NoOnAfterValidate();
    begin
        InsertExtendedText(FALSE);
        IF (Type = Type::"Charge (Item)") AND ("No." <> xRec."No.") AND
           (xRec."No." <> '')
        THEN
          CurrPage.SAVERECORD;

        SaveAndAutoAsmToOrder;

        IF Reserve = Reserve::Always THEN BEGIN
          CurrPage.SAVERECORD;
          IF ("Outstanding Qty. (Base)" <> 0) AND ("No." <> xRec."No.") THEN BEGIN
            AutoReserve;
            CurrPage.UPDATE(FALSE);
          END;
        END;
    end;

    local procedure CrossReferenceNoOnAfterValidat();
    begin
        InsertExtendedText(FALSE);
    end;

    local procedure VariantCodeOnAfterValidate();
    begin
        SaveAndAutoAsmToOrder;
    end;

    local procedure LocationCodeOnAfterValidate();
    begin
        SaveAndAutoAsmToOrder;

        IF (Reserve = Reserve::Always) AND
           ("Outstanding Qty. (Base)" <> 0) AND
           ("Location Code" <> xRec."Location Code")
        THEN BEGIN
          CurrPage.SAVERECORD;
          AutoReserve;
          CurrPage.UPDATE(FALSE);
        END;
    end;

    local procedure ReserveOnAfterValidate();
    begin
        IF (Reserve = Reserve::Always) AND ("Outstanding Qty. (Base)" <> 0) THEN BEGIN
          CurrPage.SAVERECORD;
          AutoReserve;
          CurrPage.UPDATE(FALSE);
        END;
    end;

    local procedure QuantityOnAfterValidate();
    var
        UpdateIsDone : Boolean;
    begin
        IF Type = Type::Item THEN
          CASE Reserve OF
            Reserve::Always:
              BEGIN
                CurrPage.SAVERECORD;
                AutoReserve;
                CurrPage.UPDATE(FALSE);
                UpdateIsDone := TRUE;
              END;
            Reserve::Optional:
              IF (Quantity < xRec.Quantity) AND (xRec.Quantity > 0) THEN BEGIN
                CurrPage.SAVERECORD;
                CurrPage.UPDATE(FALSE);
                UpdateIsDone := TRUE;
              END;
          END;

        IF (Type = Type::Item) AND
           (Quantity <> xRec.Quantity) AND
           NOT UpdateIsDone
        THEN
          CurrPage.UPDATE(TRUE);
    end;

    local procedure QtyToAsmToOrderOnAfterValidate();
    begin
        CurrPage.SAVERECORD;
        IF Reserve = Reserve::Always THEN
          AutoReserve;
        CurrPage.UPDATE(TRUE);
    end;

    local procedure UnitofMeasureCodeOnAfterValida();
    begin
        IF Reserve = Reserve::Always THEN BEGIN
          CurrPage.SAVERECORD;
          AutoReserve;
          CurrPage.UPDATE(FALSE);
        END;
    end;

    local procedure ShipmentDateOnAfterValidate();
    begin
        IF (Reserve = Reserve::Always) AND
           ("Outstanding Qty. (Base)" <> 0) AND
           ("Shipment Date" <> xRec."Shipment Date")
        THEN BEGIN
          CurrPage.SAVERECORD;
          AutoReserve;
          CurrPage.UPDATE(FALSE);
        END;
    end;

    local procedure SaveAndAutoAsmToOrder();
    begin
        IF (Type = Type::Item) AND IsAsmToOrderRequired THEN BEGIN
          CurrPage.SAVERECORD;
          AutoAsmToOrder;
          CurrPage.UPDATE(FALSE);
        END;
    end;

    local procedure SetLocationCodeMandatory();
    var
        InventorySetup : Record 313;
    begin
        InventorySetup.GET;
        LocationCodeMandatory := InventorySetup."Location Mandatory" AND (Type = Type::Item);
    end;

    local procedure RedistributeTotalsOnAfterValidate();
    begin
        CurrPage.SAVERECORD;

        SalesHeader.GET("Document Type","Document No.");
        IF DocumentTotals.SalesCheckNumberOfLinesLimit(SalesHeader) THEN
          DocumentTotals.SalesRedistributeInvoiceDiscountAmounts(Rec,VATAmount,TotalSalesLine);
        CurrPage.UPDATE;
    end;

    // procedure ShowStrDetailsForm();
    // var
    //     StrOrderLineDetails : Record "13795";
    //     StrOrderLineDetailsForm : Page "16306";
    // begin
    //     StrOrderLineDetails.RESET;
    //     StrOrderLineDetails.SETCURRENTKEY("Document Type","Document No.",Type);
    //     StrOrderLineDetails.SETRANGE("Document Type","Document Type");
    //     StrOrderLineDetails.SETRANGE("Document No.","Document No.");
    //     StrOrderLineDetails.SETRANGE(Type,StrOrderLineDetails.Type::Sale);
    //     StrOrderLineDetails.SETRANGE("Item No.","No.");
    //     StrOrderLineDetails.SETRANGE("Line No.","Line No.");
    //     StrOrderLineDetailsForm.SETTABLEVIEW(StrOrderLineDetails);
    //     StrOrderLineDetailsForm.RUNMODAL;
    // end;

    procedure ShowStrOrderDetailsPITForm();
    begin
        ShowStrOrderDetailsPIT;
    end;

    procedure ShowExcisePostingSetup();
    begin
        GetExcisePostingSetup;
    end;

    procedure MakeVisibleLineControl();
    begin
        "Process Carried OutVisible" := TRUE;
    end;

    procedure MakeInvisibleLineControl();
    begin
        "Process Carried OutVisible" := FALSE;
    end;

    procedure ShowDetailedTaxEntryBuffer();
    var
        DetailedTaxEntryBuffer : Record 16480;
    begin
        DetailedTaxEntryBuffer.RESET;
        DetailedTaxEntryBuffer.SETCURRENTKEY("Transaction Type","Document Type","Document No.","Line No.");
        DetailedTaxEntryBuffer.SETRANGE("Transaction Type",DetailedTaxEntryBuffer."Transaction Type"::Sale);
        DetailedTaxEntryBuffer.SETRANGE("Document Type","Document Type");
        DetailedTaxEntryBuffer.SETRANGE("Document No.","Document No.");
        DetailedTaxEntryBuffer.SETRANGE("Line No.","Line No.");
        PAGE.RUNMODAL(PAGE::"Sale Detailed Tax",DetailedTaxEntryBuffer);
    end;
}

