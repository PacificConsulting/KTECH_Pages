page 50021 "FSR Order"
{
    // version NAVW19.00.00.45778,NAVIN9.00.00.45778

    CaptionML = ENU = 'FSR Order',
                ENN = 'FSR Order';
    PageType = Card;
    PromotedActionCategoriesML = ENU = 'New,Process,Report,Approve,Release,Posting,Prepare,Invoice,Request Approval',
                                 ENN = 'New,Process,Report,Approve,Release,Posting,Prepare,Invoice,Request Approval';
    RefreshOnActivate = true;
    SourceTable = 36;
    SourceTableView = WHERE("Document Type" = FILTER(Order));

    layout
    {
        area(content)
        {
            group(General)
            {
                CaptionML = ENU = 'General',
                            ENN = 'General';
                field("No."; rec."No.")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                    Visible = DocNoVisible;

                    trigger OnAssistEdit();
                    begin
                        IF rec.AssistEditFSR(xRec) THEN
                            CurrPage.UPDATE;
                    end;
                }
                field("Sell-to Customer No."; rec."Sell-to Customer No.")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                    ShowMandatory = true;

                    trigger OnValidate();
                    begin
                        SelltoCustomerNoOnAfterValidat;
                        //PCPL-25
                        IF Reccust.GET(rec."Sell-to Customer No.") THEN BEGIN
                            Custappl := FORMAT(Reccust.Application);
                            IF Custappl IN ['Paints & Coatings', 'Printing lnks', 'lastics (Polymers)', 'Rubber', 'Pigments', 'Textile', 'Leather', 'Pulp & Paper', 'Oil-field,Others'] THEN
                                EVALUATE(rec."Product Application Field", Custappl)
                            ELSE
                                rec."Product Application Field" := rec."Product Application Field"::" ";
                            rec.MODIFY;
                        END;
                        //PCPL-25
                    end;
                }
                field("Customer Order No."; rec."Customer Order No.")
                {
                    ApplicationArea = all;
                    Visible = true;
                }
                field("CC Attched"; rec."CC Attched")
                {
                    ApplicationArea = all;
                    Visible = true;
                }
                field("Booking To"; rec."Booking To")
                {
                    ApplicationArea = all;
                    Visible = true;
                }
                field("Do No."; rec."Do No.")
                {
                    ApplicationArea = all;
                }
                field("Sell-to Contact No."; rec."Sell-to Contact No.")
                {
                    ApplicationArea = all;
                    Importance = Additional;

                    trigger OnValidate();
                    begin
                        IF rec.GETFILTER(rec."Sell-to Contact No.") = xRec."Sell-to Contact No." THEN
                            IF rec."Sell-to Contact No." <> xRec."Sell-to Contact No." THEN
                                rec.SETRANGE(rec."Sell-to Contact No.");
                    end;
                }
                field("Sell-to Customer Name"; rec."Sell-to Customer Name")
                {
                    ApplicationArea = all;
                    QuickEntry = false;
                }
                field("Sell-to Address"; rec."Sell-to Address")
                {
                    ApplicationArea = all;
                    Importance = Additional;
                }
                field("Sell-to Address 2"; rec."Sell-to Address 2")
                {
                    ApplicationArea = all;
                    Importance = Additional;
                }
                field("Sell-to Post Code"; rec."Sell-to Post Code")
                {
                    ApplicationArea = all;
                    Importance = Additional;
                }
                field("Sell-to City"; rec."Sell-to City")
                {
                    ApplicationArea = all;
                    QuickEntry = false;
                }
                field("Sell-to Contact"; rec."Sell-to Contact")
                {
                    ApplicationArea = all;
                    Importance = Additional;
                }
                field("No. of Archived Versions"; rec."No. of Archived Versions")
                {
                    ApplicationArea = all;
                    Importance = Additional;
                }
                field(Structure; rec.Structure)
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("Posting Date"; rec."Posting Date")
                {
                    ApplicationArea = all;
                    QuickEntry = false;
                }
                field("Order Date"; rec."Order Date")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                    QuickEntry = false;
                }
                field("Document Date"; rec."Document Date")
                {
                    ApplicationArea = all;
                    QuickEntry = false;
                }
                field("Requested Delivery Date"; rec."Requested Delivery Date")
                {
                    ApplicationArea = all;
                }
                field("Promised Delivery Date"; rec."Promised Delivery Date")
                {
                    ApplicationArea = all;
                    Importance = Additional;
                }
                field("Quote No."; rec."Quote No.")
                {
                    ApplicationArea = all;
                    Importance = Additional;
                }
                field("External Document No."; rec."External Document No.")
                {

                    ApplicationArea = all;
                    Importance = Promoted;
                    ShowMandatory = ExternalDocNoMandatory;
                }
                field("Salesperson Code"; rec."Salesperson Code")
                {
                    ApplicationArea = all;
                    QuickEntry = false;

                    trigger OnValidate();
                    begin
                        SalespersonCodeOnAfterValidate;
                    end;
                }
                field("Issue No"; rec."Issue No")
                {
                    ApplicationArea = all;
                }
                field("Issue Date"; rec."Issue Date")
                {
                    ApplicationArea = all;
                }
                field("Date of Inquiry"; rec."Date of Inquiry")
                {
                    ApplicationArea = all;
                }
                field("Revision No"; rec."Revision No")
                {
                    ApplicationArea = all;
                }
                field("Revision Date"; rec."Revision Date")
                {
                    ApplicationArea = all;
                }
                field("Transport Name"; rec."Transport Name")
                {
                    ApplicationArea = all;
                }
                field("Courier Name"; rec."Courier Name")
                {
                    ApplicationArea = all;
                }

                field("AWB No."; rec."AWB No.")
                {
                    ApplicationArea = all;
                }
                field("Campaign No."; rec."Campaign No.")
                {
                    ApplicationArea = all;
                    Importance = Additional;
                }
                field("Opportunity No."; rec."Opportunity No.")
                {
                    ApplicationArea = all;
                    Importance = Additional;
                }
                field("Responsibility Center"; rec."Responsibility Center")
                {
                    ApplicationArea = all;
                    Importance = Additional;
                }
                field("Assigned User ID"; rec."Assigned User ID")
                {
                    ApplicationArea = all;
                    Importance = Additional;
                }
                field(Referenece; rec.Referenece)
                {
                    ApplicationArea = all;
                }
                field("Mode Of Communication"; rec."Mode Of Communication")
                {
                    ApplicationArea = all;
                }
                field("Product Application Field"; rec."Product Application Field")
                {
                    ApplicationArea = all;
                }
                field("Posting No."; rec."Posting No.")
                {
                    ApplicationArea = all;
                }
                field("Posting No. Series"; rec."Posting No. Series")
                {
                    ApplicationArea = all;
                }
                field(FSR; rec.FSR)
                {
                    ApplicationArea = all;
                }
                field("Job Queue Status"; rec."Job Queue Status")
                {
                    ApplicationArea = all;
                    Importance = Additional;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                    QuickEntry = false;
                }
            }
            part(SalesLines; 46)
            {
                Editable = DynamicEditable;
                SubPageLink = "Document No." = FIELD("No.");
                UpdatePropagation = Both;
            }
            group(Invoicing)
            {
                CaptionML = ENU = 'Invoicing',
                            ENN = 'Invoicing';
                field("Bill-to Customer No."; rec."Bill-to Customer No.")
                {
                    ApplicationArea = all;
                    Importance = Promoted;

                    trigger OnValidate();
                    begin
                        BilltoCustomerNoOnAfterValidat;
                    end;
                }
                field("Bill-to Contact No."; rec."Bill-to Contact No.")
                {
                    ApplicationArea = all;
                    Importance = Additional;
                }
                field("Bill-to Name"; rec."Bill-to Name")
                {
                    ApplicationArea = all;
                }
                field("Bill-to Address"; rec."Bill-to Address")
                {
                    ApplicationArea = all;
                    Importance = Additional;
                }
                field("Bill-to Address 2"; rec."Bill-to Address 2")
                {
                    ApplicationArea = all;
                    Importance = Additional;
                }
                field("Bill-to Post Code"; rec."Bill-to Post Code")
                {
                    ApplicationArea = all;
                    Importance = Additional;
                }
                field("Bill-to City"; rec."Bill-to City")
                {
                    ApplicationArea = all;
                }
                field("Bill-to Contact"; rec."Bill-to Contact")
                {
                    ApplicationArea = all;
                    Importance = Additional;
                }
                field("Applies-to Doc. Type"; rec."Applies-to Doc. Type")
                {
                    ApplicationArea = all;
                }
                field("Applies-to Doc. No."; rec."Applies-to Doc. No.")
                {
                    ApplicationArea = all;
                }
                field("Applies-to ID"; rec."Applies-to ID")
                {
                    ApplicationArea = all;
                }
                field("<Shortcut Dimension 1>"; rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = all;
                    CaptionML = ENU = '<Shortcut Dimension 1>',
                                ENN = 'Shortcut Dimension 1 Code';

                    trigger OnValidate();
                    begin
                        ShortcutDimension1CodeOnAfterV;
                    end;
                }
                field("<Shortcut Dimension 2>"; rec."Shortcut Dimension 2 Code")
                {
                    CaptionML = ENU = '<Shortcut Dimension 2>',
                                ENN = 'Shortcut Dimension 2 Code';

                    trigger OnValidate();
                    begin
                        ShortcutDimension2CodeOnAfterV;
                    end;
                }
                field("Payment Terms Code"; rec."Payment Terms Code")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("Due Date"; rec."Due Date")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("Payment Discount %"; rec."Payment Discount %")
                {
                    ApplicationArea = all;
                }
                field("Pmt. Discount Date"; rec."Pmt. Discount Date")
                {
                    ApplicationArea = all;
                }
                field("Payment Method Code"; rec."Payment Method Code")
                {
                    ApplicationArea = all;
                }
                field("Direct Debit Mandate ID"; rec."Direct Debit Mandate ID")
                {
                    ApplicationArea = all;
                }
                field("Prices Including VAT"; rec."Prices Including VAT")
                {
                    ApplicationArea = all;

                    trigger OnValidate();
                    begin
                        PricesIncludingVATOnAfterValid;
                    end;
                }
                field("VAT Bus. Posting Group"; rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = all;
                }
                // field("Credit Card No."; rec."Credit Card No.")
                // {
                //     ApplicationArea = all;
                // }
                // field(GetCreditcardNumber; rec.GetCreditcardNumber)
                // {
                //     ApplicationArea = all;
                //     CaptionML = ENU = 'Cr. Card Number (Last 4 Digits)',
                //                 ENN = 'Cr. Card Number (Last 4 Digits)';
                // }
                field("<Posting No. Series1>"; rec."Posting No. Series")
                {
                    ApplicationArea = all;
                    CaptionML = ENU = '<Posting No. Series1>',
                                ENN = 'Posting No. Series';
                }
            }
            group(Shipping)
            {
                CaptionML = ENU = 'Shipping',
                            ENN = 'Shipping';
                field("Ship-to Code"; rec."Ship-to Code")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("Ship-to Name"; rec."Ship-to Name")
                {
                    ApplicationArea = all;
                }
                field("Ship-to Address"; rec."Ship-to Address")
                {
                    ApplicationArea = all;
                    Importance = Additional;
                }
                field("Ship-to Address 2"; rec."Ship-to Address 2")
                {
                    ApplicationArea = all;
                    Importance = Additional;
                }
                field("Ship-to Post Code"; rec."Ship-to Post Code")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("Ship-to City"; rec."Ship-to City")
                {
                    ApplicationArea = all;
                }
                field("Ship-to Contact"; rec."Ship-to Contact")
                {
                    ApplicationArea = all;
                    Importance = Additional;
                }
                field("Location Code"; rec."Location Code")
                {
                    ApplicationArea = all;
                }
                field("Outbound Whse. Handling Time"; rec."Outbound Whse. Handling Time")
                {
                    ApplicationArea = all;
                    Importance = Additional;
                }
                field("Shipment Method Code"; rec."Shipment Method Code")
                {
                    ApplicationArea = all;
                }
                field("Shipping Agent Code"; rec."Shipping Agent Code")
                {
                    ApplicationArea = all;
                    Importance = Additional;
                }
                field("Shipping Agent Service Code"; rec."Shipping Agent Service Code")
                {
                    ApplicationArea = all;
                    Importance = Additional;
                }
                field("Shipping Time"; rec."Shipping Time")
                {
                    ApplicationArea = all;
                }
                field("Late Order Shipping"; rec."Late Order Shipping")
                {
                    ApplicationArea = all;
                    Importance = Additional;
                }
                field("Package Tracking No."; rec."Package Tracking No.")
                {
                    ApplicationArea = all;
                    Importance = Additional;
                }
                field("Shipment Date"; rec."Shipment Date")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("Shipping Advice"; rec."Shipping Advice")
                {
                    ApplicationArea = all;
                    Importance = Promoted;

                    trigger OnValidate();
                    begin
                        IF rec."Shipping Advice" <> xRec."Shipping Advice" THEN
                            IF NOT CONFIRM(Text001, FALSE, FIELDCAPTION(Rec."Shipping Advice")) THEN
                                ERROR(Text002);
                    end;
                }
            }
            group("Foreign Trade")
            {
                CaptionML = ENU = 'Foreign Trade',
                            ENN = 'Foreign Trade';
                field("Currency Code"; rec."Currency Code")
                {
                    ApplicationArea = all;
                    Importance = Promoted;

                    trigger OnAssistEdit();
                    begin
                        CLEAR(ChangeExchangeRate);
                        IF rec."Posting Date" <> 0D THEN
                            ChangeExchangeRate.SetParameter(rec."Currency Code", rec."Currency Factor", rec."Posting Date")
                        ELSE
                            ChangeExchangeRate.SetParameter(rec."Currency Code", rec."Currency Factor", WORKDATE);
                        IF ChangeExchangeRate.RUNMODAL = ACTION::OK THEN BEGIN
                            rec.VALIDATE(rec."Currency Factor", ChangeExchangeRate.GetParameter);
                            CurrPage.UPDATE;
                        END;
                        CLEAR(ChangeExchangeRate);
                    end;

                    trigger OnValidate();
                    begin
                        CurrPage.UPDATE;
                        SalesCalcDiscountByType.ApplyDefaultInvoiceDiscount(0, Rec);
                    end;
                }
                field("EU 3-Party Trade"; rec."EU 3-Party Trade")
                {
                    ApplicationArea = all;
                }
                field("Transaction Type"; rec."Transaction Type")
                {
                    ApplicationArea = all;
                }
                field("Transaction Specification"; rec."Transaction Specification")
                {
                    ApplicationArea = all;
                }
                field("Transport Method Code"; rec."Transport Method")
                {
                    ApplicationArea = all;
                    CaptionML = ENU = 'Transport Method Code',
                                ENN = 'Transport Method';
                }
                field("Exit Point"; rec."Exit Point")
                {
                    ApplicationArea = all;
                }
                field(Area_1; rec.Area)
                {
                    ApplicationArea = all;

                }
            }
            group(Prepayment)
            {
                CaptionML = ENU = 'Prepayment',
                            ENN = 'Prepayment';
                field("Prepayment %"; rec."Prepayment %")
                {
                    ApplicationArea = all;
                    Importance = Promoted;

                    trigger OnValidate();
                    begin
                        Prepayment37OnAfterValidate;
                    end;
                }
                field("Compress Prepayment"; rec."Compress Prepayment")
                {
                    ApplicationArea = all;
                }
                field("Prepmt. Payment Terms Code"; rec."Prepmt. Payment Terms Code")
                {
                    ApplicationArea = all;
                }
                field("Prepayment Due Date"; rec."Prepayment Due Date")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("Prepmt. Payment Discount %"; rec."Prepmt. Payment Discount %")
                {
                    ApplicationArea = all;
                }
                field("Prepmt. Pmt. Discount Date"; rec."Prepmt. Pmt. Discount Date")
                {
                    ApplicationArea = all;
                }
            }
            group("Tax Information")
            {
                CaptionML = ENU = 'Tax Information',
                            ENN = 'Tax Information';
                field("Transit Document"; rec."Transit Document")
                {

                    ApplicationArea = all;
                }
                field("Free Supply"; rec."Free Supply")
                {
                    ApplicationArea = all;
                }
                field("TDS Certificate Receivable"; rec."TDS Certificate Receivable")
                {
                    ApplicationArea = all;
                }
                field("Calc. Inv. Discount (%)"; rec."Calc. Inv. Discount (%)")
                {
                    ApplicationArea = all;
                }
                field("Export or Deemed Export"; rec."Export or Deemed Export")
                {
                    ApplicationArea = all;
                }
                field("VAT Exempted"; rec."VAT Exempted")
                {
                    ApplicationArea = all;
                }
                field(Trading; rec.Trading)
                {
                    ApplicationArea = all;
                }
                field("ST Pure Agent"; rec."ST Pure Agent")
                {
                    ApplicationArea = all;
                }
                field("Re-Dispatch"; rec."Re-Dispatch")
                {
                    ApplicationArea = all;

                    trigger OnValidate();
                    begin
                        ReDispatchOnPush;
                        IF NOT rec."Re-Dispatch" AND (rec."Return Re-Dispatch Rcpt. No." <> '') THEN
                            ERROR(Text16500);
                        IF rec."Re-Dispatch" THEN BEGIN
                            ReturnOrderNoVisible := TRUE;
                        END ELSE
                            ReturnOrderNoVisible := FALSE;
                    end;
                }
                field(PoT; rec.PoT)
                {
                    ApplicationArea = all;
                }
                field(ReturnOrderNo; rec."Return Re-Dispatch Rcpt. No.")
                {
                    ApplicationArea = all;
                    CaptionML = ENU = 'Return Receipt No.',
                                ENN = 'Return Receipt No.';
                    Visible = ReturnOrderNoVisible;
                }
                field("LC No."; rec."LC No.")
                {
                    ApplicationArea = all;
                }
                field("Form Code"; rec."Form Code")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("Form No."; rec."Form No.")
                {
                    ApplicationArea = all;
                }
                field("Posting Date2"; rec."Posting Date")
                {
                    ApplicationArea = all;
                    CaptionML = ENU = 'Date of Removal',
                                ENN = 'Date of Removal';
                }
                field("Time of Removal"; rec."Time of Removal")
                {
                    ApplicationArea = all;
                    CaptionML = ENU = 'Time of Removal',
                                ENN = 'Time of Removal';
                }
                field("Mode of Transport"; rec."Mode of Transport")
                {
                    ApplicationArea = all;
                    CaptionML = ENU = 'Mode of Transport',
                                ENN = 'Mode of Transport';
                }
                field("Vehicle No."; rec."Vehicle No.")
                {
                    ApplicationArea = all;
                    CaptionML = ENU = 'Vehicle No.',
                                ENN = 'Vehicle No.';
                }
                field("LR/RR No."; rec."LR/RR No.")
                {
                    ApplicationArea = all;
                    CaptionML = ENU = 'LR/RR No.',
                                ENN = 'LR/RR No.';
                }
                field("LR/RR Date"; rec."LR/RR Date")
                {
                    ApplicationArea = all;
                    CaptionML = ENU = 'LR/RR Date',
                                ENN = 'LR/RR Date';
                }
                field("Service Tax Rounding Precision"; rec."Service Tax Rounding Precision")
                {
                    ApplicationArea = all;
                }
                field("Service Tax Rounding Type"; rec."Service Tax Rounding Type")
                {
                    ApplicationArea = all;
                }
                group(GST)
                {
                    CaptionML = ENU = 'GST',
                                ENN = 'GST';
                    field("GST Bill-to State Code"; rec."GST Bill-to State Code")
                    {
                        ApplicationArea = all;
                    }
                    field("GST Ship-to State Code"; rec."GST Ship-to State Code")
                    {
                        ApplicationArea = all;
                    }
                    field("Location State Code"; rec."Location State Code")
                    {
                        ApplicationArea = all;
                    }
                    field("Nature of Supply"; rec."Nature of Supply")
                    {
                        ApplicationArea = all;
                    }
                    field("GST Customer Type"; rec."GST Customer Type")
                    {
                        ApplicationArea = all;
                    }
                    field("GST Without Payment of Duty"; rec."GST Without Payment of Duty")
                    {
                        ApplicationArea = all;
                    }
                    field("Invoice Type"; rec."Invoice Type")
                    {
                        ApplicationArea = all;
                    }
                    field("Bill Of Export No."; rec."Bill Of Export No.")
                    {
                        ApplicationArea = all;
                    }
                    field("Bill Of Export Date"; rec."Bill Of Export Date")
                    {
                        ApplicationArea = all;
                    }
                    field("e-Commerce Customer"; rec."e-Commerce Customer")
                    {
                        ApplicationArea = all;

                        trigger OnValidate();
                        var
                            Customer: Record 18;
                        begin
                        end;
                    }
                    field("e-Commerce Merchant Id"; rec."e-Commerce Merchant Id")
                    {
                        ApplicationArea = all;
                    }
                }
            }
        }
        area(factboxes)
        {
            part(part1; 9103)
            {
                SubPageLink = "Table ID" = CONST(36),
                             "Document Type" = FIELD("Document Type"),
                             "Document No." = FIELD("No.");
                Visible = OpenApprovalEntriesExistForCurrUser;
            }
            part(part2; 9080)
            {
                SubPageLink = "No." = FIELD("Sell-to Customer No.");
                Visible = true;
            }
            part(part3; 9082)
            {
                SubPageLink = "No." = FIELD("Bill-to Customer No.");
                Visible = false;
            }
            part(part4; 9084)
            {
                SubPageLink = "No." = FIELD("Sell-to Customer No.");
                Visible = false;
            }
            part(part5; 9087)
            {
                Provider = SalesLines;
                SubPageLink = "Document Type" = FIELD("Document Type"),
                              "Document No." = FIELD("Document No."),
                              "Line No." = FIELD("Line No.");
                Visible = true;
            }
            part(part6; 9089)
            {
                Provider = SalesLines;
                SubPageLink = "No." = FIELD("No.");
                Visible = false;
            }
            part(part7; 9092)
            {
                SubPageLink = "Table ID" = CONST(36),
                              "Document Type" = FIELD("Document Type"),
                              "Document No." = FIELD("No.");
                Visible = false;
            }
            part(IncomingDocAttachFactBox; 193)
            {
                ShowFilter = false;
                Visible = false;
            }
            part(part8; 9108)
            {
                Provider = SalesLines;
                SubPageLink = "No." = FIELD("No.");
                Visible = false;
            }
            part(part9; 9109)
            {
                Provider = SalesLines;
                SubPageLink = "No." = FIELD("No.");
                Visible = false;
            }
            part(part10; 9081)
            {
                SubPageLink = "No." = FIELD("Bill-to Customer No.");
                Visible = false;
            }
            part(WorkflowStatus; 1528)
            {
                Editable = false;
                Enabled = false;
                ShowFilter = false;
                Visible = ShowWorkflowStatus;
            }
            systempart(part11; Links)
            {
                Visible = false;
            }
            systempart(part12; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("O&rder")
            {
                CaptionML = ENU = 'O&rder',
                            ENN = 'O&rder';
                Image = "Order";
                action(Statistics)
                {
                    CaptionML = ENU = 'Statistics',
                                ENN = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'F7';

                    trigger OnAction();
                    begin
                        rec.OpenSalesOrderStatistics;
                        SalesCalcDiscountByType.ResetRecalculateInvoiceDisc(Rec);
                    end;
                }
                action(Card)
                {
                    CaptionML = ENU = 'Card',
                                ENN = 'Card';
                    Image = EditLines;
                    RunObject = Page 21;
                    RunPageLink = "No." = FIELD("Sell-to Customer No.");
                    ShortCutKey = 'Shift+F7';
                }
                action(Dimensions)
                {
                    AccessByPermission = TableData 348 = R;
                    CaptionML = ENU = 'Dimensions',
                                ENN = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction();
                    begin
                        rec.ShowDocDim;
                        CurrPage.SAVERECORD;
                    end;
                }
                action("A&pprovals")
                {
                    CaptionML = ENU = 'A&pprovals',
                                ENN = 'A&pprovals';
                    Image = Approvals;

                    trigger OnAction();
                    var
                        ApprovalEntries: Page 658;
                    begin
                        ApprovalEntries.Setfilters(DATABASE::"Sales Header", rec."Document Type", rec."No.");
                        ApprovalEntries.RUN;
                    end;
                }
                action("Co&mments")
                {
                    CaptionML = ENU = 'Co&mments',
                                ENN = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page 67;
                    RunPageLink = "Document Type" = FIELD("Document Type"),
                                  "No." = FIELD("No."),
                                  "Document Line No." = CONST(0);
                }
                action("Credit Cards Transaction Lo&g Entries")
                {
                    CaptionML = ENU = 'Credit Cards Transaction Lo&g Entries',
                                ENN = 'Credit Cards Transaction Lo&g Entries';
                    Image = CreditCardLog;
                    RunObject = Page 829;
                    RunPageLink = "Document No." = FIELD("No."),
                                  "Customer No." = FIELD(rec."Bill-to Customer No.");
                }

                // action("St&ructure")
                // {
                //     CaptionML = ENU = 'St&ructure',
                //                 ENN = 'St&ructure';
                //     Image = Hierarchy;
                //     RunObject = Page 16305;
                //     RunPageLink = Type = CONST(Sale),
                //                   "Document Type"=FIELD("Document Type"),
                //                   "Document No."=FIELD("No."),
                //                   "Structure Code"=FIELD("Structure),
                //                   Document Line No.=FILTER(0);
                // }
                // action("Transit Documents")
                // {
                //     CaptionML = ENU='Transit Documents',
                //                 ENN='Transit Documents';
                //     Image = TransferOrder;
                //     RunObject = Page 13705;
                //                     RunPageLink = Type=CONST(Sale),
                //                   PO / SO No.=FIELD(No.),
                //                   Vendor / Customer Ref.=FIELD(Sell-to Customer No.),
                //                   State=FIELD(State);
                // }
                // action("Detailed &Tax")
                // {
                //     CaptionML = ENU='Detailed &Tax',
                //                 ENN='Detailed &Tax';
                //     Image = TaxDetail;
                //     RunObject = Page 16342;
                //                     RunPageLink = Document Type=FIELD(Document Type),
                //                   Document No.=FIELD(No.),
                //                   Transaction Type=CONST(Sale);
                // }
                action("Assembly Orders")
                {
                    AccessByPermission = TableData 90 = R;
                    CaptionML = ENU = 'Assembly Orders',
                                ENN = 'Assembly Orders';
                    Image = AssemblyOrder;

                    trigger OnAction();
                    var
                        AssembleToOrderLink: Record 904;
                    begin
                        AssembleToOrderLink.ShowAsmOrders(Rec);
                    end;
                }
            }
            group(ActionGroupCRM)
            {
                CaptionML = ENU = 'Dynamics CRM',
                            ENN = 'Dynamics CRM';
                Visible = CRMIntegrationEnabled;
                action(CRMGoToSalesOrder)
                {
                    CaptionML = ENU = 'Sales Order',
                                ENN = 'Sales Order';
                    Enabled = CRMIntegrationEnabled AND CRMIsCoupledToRecord;
                    Image = CoupledOrder;
                    ToolTipML = ENU = 'Open the coupled Microsoft Dynamics CRM sales order.',
                                ENN = 'Open the coupled Microsoft Dynamics CRM sales order.';

                    trigger OnAction();
                    var
                        CRMIntegrationManagement: Codeunit 5330;
                    begin
                        CRMIntegrationManagement.ShowCRMEntityFromRecordID(RECORDID);
                    end;
                }
            }
            group(Documents)
            {
                CaptionML = ENU = 'Documents',
                            ENN = 'Documents';
                Image = Documents;
                action("S&hipments")
                {
                    CaptionML = ENU = 'S&hipments',
                                ENN = 'S&hipments';
                    Image = Shipment;
                    RunObject = Page 142;
                    RunPageLink = "Order No." = FIELD("No.");
                    RunPageView = SORTING("Order No.");
                }
                action(Invoices)
                {
                    CaptionML = ENU = 'Invoices',
                                ENN = 'Invoices';
                    Image = Invoice;
                    RunObject = Page 143;
                    RunPageLink = "Order No." = FIELD("No.");
                    RunPageView = SORTING("Order No.");
                }
            }
            group(Warehouse1)
            {
                CaptionML = ENU = 'Warehouse',
                            ENN = 'Warehouse';
                Image = Warehouse;
                action("In&vt. Put-away/Pick Lines")
                {
                    CaptionML = ENU = 'In&vt. Put-away/Pick Lines',
                                ENN = 'In&vt. Put-away/Pick Lines';
                    Image = PickLines;
                    RunObject = Page 5774;
                    RunPageLink = "Source Document" = CONST("Sales Order"),
                                  "Source No." = FIELD("No.");
                    RunPageView = SORTING("Source Document", "Source No.", "Location Code");
                }
                action("Whse. Shipment Lines")
                {
                    CaptionML = ENU = 'Whse. Shipment Lines',
                                ENN = 'Whse. Shipment Lines';
                    Image = ShipmentLines;
                    RunObject = Page 7341;
                    RunPageLink = "Source Type" = CONST(37),
                                  "Source Subtype" = FIELD("Document Type"),
                                  "Source No." = FIELD("No.");
                    RunPageView = SORTING("Source Type", "Source Subtype", "Source No.", "Source Line No.");
                }
            }
            group(Prepayment1)
            {
                CaptionML = ENU = 'Prepayment',
                            ENN = 'Prepayment';
                Image = Prepayment;
                action(PagePostedSalesPrepaymentInvoices)
                {
                    CaptionML = ENU = 'Prepa&yment Invoices',
                                ENN = 'Prepa&yment Invoices';
                    Image = PrepaymentInvoice;
                    RunObject = Page 143;
                    RunPageLink = "Prepayment Order No." = FIELD("No.");
                    RunPageView = SORTING("Prepayment Order No.");
                }
                action(PagePostedSalesPrepaymentCrMemos)
                {
                    CaptionML = ENU = 'Prepayment Credi&t Memos',
                                ENN = 'Prepayment Credi&t Memos';
                    Image = PrepaymentCreditMemo;
                    RunObject = Page 144;
                    RunPageLink = "Prepayment Order No." = FIELD("No.");
                    RunPageView = SORTING("Prepayment Order No.");
                }
            }
        }
        area(processing)
        {
            group(Approval)
            {
                CaptionML = ENU = 'Approval',
                            ENN = 'Approval';
                action(Approve)
                {
                    CaptionML = ENU = 'Approve',
                                ENN = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction();
                    var
                        ApprovalsMgmt: Codeunit 1535;
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(RECORDID);
                    end;
                }
                action(Reject)
                {
                    CaptionML = ENU = 'Reject',
                                ENN = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction();
                    var
                        ApprovalsMgmt: Codeunit 1535;
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(RECORDID);
                    end;
                }
                action(Delegate)
                {
                    CaptionML = ENU = 'Delegate',
                                ENN = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction();
                    var
                        ApprovalsMgmt: Codeunit 1535;
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(RECORDID);
                    end;
                }
                action(Comment)
                {
                    CaptionML = ENU = 'Comments',
                                ENN = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page 660;
                    RunPageLink = "Table ID" = CONST(36),
                                 "Document Type" = FIELD("Document Type"),
                                  "Document No." = FIELD("No.");
                    Visible = OpenApprovalEntriesExistForCurrUser;
                }
            }
            group(Release1)
            {
                CaptionML = ENU = 'Release',
                            ENN = 'Release';
                Image = ReleaseDoc;
                action(Release)
                {
                    CaptionML = ENU = 'Re&lease',
                                ENN = 'Re&lease';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction();
                    var
                        ReleaseSalesDoc: Codeunit 414;
                    begin
                        ReleaseSalesDoc.PerformManualRelease(Rec);
                    end;
                }
                action("Re&open")
                {
                    CaptionML = ENU = 'Re&open',
                                ENN = 'Re&open';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        ReleaseSalesDoc: Codeunit 414;
                    begin
                        ReleaseSalesDoc.PerformManualReopen(Rec);
                    end;
                }
            }
            group("F&unctions")
            {
                CaptionML = ENU = 'F&unctions',
                            ENN = 'F&unctions';
                Image = "Action";
                action(CalculateInvoiceDiscount)
                {
                    CaptionML = ENU = 'Calculate &Invoice Discount',
                                ENN = 'Calculate &Invoice Discount';
                    Image = CalculateInvoiceDiscount;

                    trigger OnAction();
                    begin
                        rec.CALCFIELDS(rec."Price Inclusive of Taxes");
                        IF NOT rec."Price Inclusive of Taxes" THEN
                            ApproveCalcInvDisc
                        ELSE
                            ERROR(STRSUBSTNO(Text16501, FIELDCAPTION(rec."Price Inclusive of Taxes")));
                        SalesCalcDiscountByType.ResetRecalculateInvoiceDisc(Rec);
                    end;
                }
                action("Get St&d. Cust. Sales Codes")
                {
                    CaptionML = ENU = 'Get St&d. Cust. Sales Codes',
                                ENN = 'Get St&d. Cust. Sales Codes';
                    Ellipsis = true;
                    Image = CustomerCode;

                    trigger OnAction();
                    var
                        StdCustSalesCode: Record 172;
                    begin
                        StdCustSalesCode.InsertSalesLines(Rec);
                    end;
                }
                action(CopyDocument)
                {
                    CaptionML = ENU = 'Copy Document',
                                ENN = 'Copy Document';
                    Ellipsis = true;
                    Image = CopyDocument;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        CopySalesDoc.SetSalesHeader(Rec);
                        CopySalesDoc.RUNMODAL;
                        CLEAR(CopySalesDoc);
                        // IF GET("Document Type", "No.") THEN;//PCPL 081022
                    end;
                }
                action(MoveNegativeLines)
                {
                    CaptionML = ENU = 'Move Negative Lines',
                                ENN = 'Move Negative Lines';
                    Ellipsis = true;
                    Image = MoveNegativeLines;

                    trigger OnAction();
                    begin
                        CLEAR(MoveNegSalesLines);
                        MoveNegSalesLines.SetSalesHeader(Rec);
                        MoveNegSalesLines.RUNMODAL;
                        MoveNegSalesLines.ShowDocument;
                    end;
                }
                action("Archive Document")
                {
                    CaptionML = ENU = 'Archi&ve Document',
                                ENN = 'Archi&ve Document';
                    Image = Archive;

                    trigger OnAction();
                    begin
                        ArchiveManagement.ArchiveSalesDocument(Rec);
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                action("Send IC Sales Order Cnfmn.")
                {
                    AccessByPermission = TableData 410 = R;
                    CaptionML = ENU = 'Send IC Sales Order Cnfmn.',
                                ENN = 'Send IC Sales Order Cnfmn.';
                    Image = IntercompanyOrder;

                    trigger OnAction();
                    var
                        ICInOutboxMgt: Codeunit 427;
                        ApprovalsMgmt: Codeunit 1535;
                    begin
                        IF ApprovalsMgmt.PrePostApprovalCheckSales(Rec) THEN
                            ICInOutboxMgt.SendSalesDoc(Rec, FALSE);
                    end;
                }
                group(IncomingDocument)
                {
                    CaptionML = ENU = 'Incoming Document',
                                ENN = 'Incoming Document';
                    Image = Documents;
                    action(IncomingDocCard)
                    {
                        CaptionML = ENU = 'View Incoming Document',
                                    ENN = 'View Incoming Document';
                        Enabled = HasIncomingDocument;
                        Image = ViewOrder;
                        ToolTipML =;

                        trigger OnAction();
                        var
                            IncomingDocument: Record 130;
                        begin
                            IncomingDocument.ShowCardFromEntryNo(rec."Incoming Document Entry No.");
                        end;
                    }
                    action(SelectIncomingDoc)
                    {
                        AccessByPermission = TableData 130 = R;
                        CaptionML = ENU = 'Select Incoming Document',
                                    ENN = 'Select Incoming Document';
                        Image = SelectLineToApply;
                        ToolTipML =;

                        trigger OnAction();
                        var
                            IncomingDocument: Record 130;
                        begin
                            rec.VALIDATE("Incoming Document Entry No.", IncomingDocument.SelectIncomingDocument(rec."Incoming Document Entry No."));
                        end;
                    }
                    action(IncomingDocAttachFile)
                    {
                        CaptionML = ENU = 'Create Incoming Document from File',
                                    ENN = 'Create Incoming Document from File';
                        Ellipsis = true;
                        Enabled = NOT HasIncomingDocument;
                        Image = Attach;
                        ToolTipML =;

                        trigger OnAction();
                        var
                            IncomingDocumentAttachment: Record 133;
                        begin
                            IncomingDocumentAttachment.NewAttachmentFromSalesDocument(Rec);
                        end;
                    }
                    action(RemoveIncomingDoc)
                    {
                        CaptionML = ENU = 'Remove Incoming Document',
                                    ENN = 'Remove Incoming Document';
                        Enabled = HasIncomingDocument;
                        Image = RemoveLine;
                        ToolTipML =;

                        trigger OnAction();
                        begin
                            "Incoming Document Entry No." := 0;
                        end;
                    }
                }
            }
            group(Plan)
            {
                CaptionML = ENU = 'Plan',
                            ENN = 'Plan';
                Image = Planning;
                action("Order &Promising")
                {
                    AccessByPermission = TableData 99000880 = R;
                    CaptionML = ENU = 'Order &Promising',
                                ENN = 'Order &Promising';
                    Image = OrderPromising;

                    trigger OnAction();
                    var
                        OrderPromisingLine: Record 99000880 temporary;
                    begin
                        OrderPromisingLine.SETRANGE("Source Type", rec."Document Type");
                        OrderPromisingLine.SETRANGE("Source ID", rec."No.");
                        PAGE.RUNMODAL(PAGE::"Order Promising Lines", OrderPromisingLine);
                    end;
                }
                action("Demand Overview")
                {
                    CaptionML = ENU = 'Demand Overview',
                                ENN = 'Demand Overview';
                    Image = Forecast;

                    trigger OnAction();
                    var
                        DemandOverview: Page 5830;
                    begin
                        DemandOverview.SetCalculationParameter(TRUE);
                        DemandOverview.Initialize(0D, 1, rec."No.", '', '');
                        DemandOverview.RUNMODAL;
                    end;
                }
                action("Pla&nning")
                {
                    CaptionML = ENU = 'Pla&nning',
                                ENN = 'Pla&nning';
                    Image = Planning;

                    trigger OnAction();
                    var
                        SalesPlanForm: Page 99000883;
                    begin
                        SalesPlanForm.SetSalesOrder(rec."No.");
                        SalesPlanForm.RUNMODAL;
                    end;
                }
            }
            group("Request Approval")
            {
                CaptionML = ENU = 'Request Approval',
                            ENN = 'Request Approval';
                Image = SendApprovalRequest;
                action(SendApprovalRequest)
                {
                    CaptionML = ENU = 'Send A&pproval Request',
                                ENN = 'Send A&pproval Request';
                    Enabled = NOT OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction();
                    var
                        ApprovalsMgmt: Codeunit 1535;
                    begin
                        IF ApprovalsMgmt.CheckSalesApprovalsWorkflowEnabled(Rec) THEN
                            ApprovalsMgmt.OnSendSalesDocForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    CaptionML = ENU = 'Cancel Approval Re&quest',
                                ENN = 'Cancel Approval Re&quest';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction();
                    var
                        ApprovalsMgmt: Codeunit 1535;
                    begin
                        ApprovalsMgmt.OnCancelSalesApprovalRequest(Rec);
                    end;
                }
            }
            group("Credit Card")
            {
                CaptionML = ENU = 'Credit Card',
                            ENN = 'Credit Card';
                Image = AuthorizeCreditCard;
                action(Authorize)
                {
                    CaptionML = ENU = 'Authorize',
                                ENN = 'Authorize';
                    Image = AuthorizeCreditCard;

                    trigger OnAction();
                    begin
                        Authorize;
                    end;
                }
                action("Void A&uthorize")
                {
                    CaptionML = ENU = 'Void A&uthorize',
                                ENN = 'Void A&uthorize';
                    Image = VoidCreditCard;

                    trigger OnAction();
                    begin
                        Void;
                    end;
                }

                action("Calc&ulate Structure Values")
                {
                    CaptionML = ENU = 'Calc&ulate Structure Values',
                                ENN = 'Calc&ulate Structure Values';
                    Image = CalculateHierarchy;

                    trigger OnAction();
                    begin
                        CALCFIELDS("Price Inclusive of Taxes");
                        IF "Price Inclusive of Taxes" THEN BEGIN
                            SalesLine.InitStrOrdDetail(Rec);
                            SalesLine.GetSalesPriceExclusiveTaxes(Rec);
                            SalesLine.UpdateSalesLinesPIT(Rec);
                        END;
                        SalesLine.CalculateStructures(Rec);
                        SalesLine.AdjustStructureAmounts(Rec);
                        SalesLine.UpdateSalesLines(Rec);
                    end;
                }
                action("Calculate TCS")
                {
                    CaptionML = ENU = 'Calculate TCS',
                                ENN = 'Calculate TCS';
                    Image = CalculateCollectedTax;

                    trigger OnAction();
                    begin
                        SalesLine.CalculateStructures(Rec);
                        SalesLine.AdjustStructureAmounts(Rec);
                        SalesLine.UpdateSalesLines(Rec);
                        SalesLine.CalculateTCS(Rec);
                    end;
                }
                action("Direct Debit To PLA / RG")
                {
                    CaptionML = ENU = 'Direct Debit To PLA / RG',
                                ENN = 'Direct Debit To PLA / RG';
                    Image = Change;

                    trigger OnAction();
                    begin
                        SalesLine.CalculateStructures(Rec);
                        SalesLine.AdjustStructureAmounts(Rec);
                        SalesLine.UpdateSalesLines(Rec);
                        OpenExciseCentvatClaimForm;
                    end;
                }
            }
            group(Warehouse)
            {
                CaptionML = ENU = 'Warehouse',
                            ENN = 'Warehouse';
                Image = Warehouse;
                action("Create Inventor&y Put-away/Pick")
                {
                    AccessByPermission = TableData 7342 = R;
                    CaptionML = ENU = 'Create Inventor&y Put-away/Pick',
                                ENN = 'Create Inventor&y Put-away/Pick';
                    Ellipsis = true;
                    Image = CreateInventoryPickup;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        CreateInvtPutAwayPick;

                        IF NOT FIND('=><') THEN
                            INIT;
                    end;
                }
                action("Create &Whse. Shipment")
                {
                    AccessByPermission = TableData 7320 = R;
                    CaptionML = ENU = 'Create &Whse. Shipment',
                                ENN = 'Create &Whse. Shipment';
                    Image = NewShipment;

                    trigger OnAction();
                    var
                        GetSourceDocOutbound: Codeunit 5752;
                    begin
                        GetSourceDocOutbound.CreateFromSalesOrder(Rec);

                        IF NOT FIND('=><') THEN
                            INIT;
                    end;
                }
            }
            group("P&osting")
            {
                CaptionML = ENU = 'P&osting',
                            ENN = 'P&osting';
                Image = Post;
                action(Post)
                {
                    CaptionML = ENU = 'P&ost',
                                ENN = 'P&ost';
                    Ellipsis = true;
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';

                    trigger OnAction();
                    begin
                        Post(CODEUNIT::"Sales-Post (Yes/No)");
                    end;
                }
                action("Post and &Print")
                {
                    CaptionML = ENU = 'Post and &Print',
                                ENN = 'Post and &Print';
                    Ellipsis = true;
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+F9';

                    trigger OnAction();
                    begin
                        Post(CODEUNIT::"Sales-Post + Print");
                    end;
                }
                action("Post and Email")
                {
                    CaptionML = ENU = 'Post and Email',
                                ENN = 'Post and Email';
                    Ellipsis = true;
                    Image = PostMail;

                    trigger OnAction();
                    var
                        SalesPostPrint: Codeunit 82;
                    begin
                        SalesPostPrint.PostAndEmail(Rec);
                    end;
                }
                action("Test Report")
                {
                    CaptionML = ENU = 'Test Report',
                                ENN = 'Test Report';
                    Ellipsis = true;
                    Image = TestReport;

                    trigger OnAction();
                    begin
                        ReportPrint.PrintSalesHeader(Rec);
                    end;
                }
                action("Post &Batch")
                {
                    CaptionML = ENU = 'Post &Batch',
                                ENN = 'Post &Batch';
                    Ellipsis = true;
                    Image = PostBatch;

                    trigger OnAction();
                    begin
                        REPORT.RUNMODAL(REPORT::"Batch Post Sales Orders", TRUE, TRUE, Rec);
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                action("Remove From Job Queue")
                {
                    CaptionML = ENU = 'Remove From Job Queue',
                                ENN = 'Remove From Job Queue';
                    Image = RemoveLine;
                    Visible = JobQueueVisible;

                    trigger OnAction();
                    begin
                        CancelBackgroundPosting;
                    end;
                }
                action(PreviewPosting)
                {
                    CaptionML = ENU = 'Preview Posting',
                                ENN = 'Preview Posting';
                    Image = ViewPostedOrder;

                    trigger OnAction();
                    begin
                        ShowPreview;
                    end;
                }
                group("Prepa&yment")
                {
                    CaptionML = ENU = 'Prepa&yment',
                                ENN = 'Prepa&yment';
                    Image = Prepayment;
                    action("Prepayment &Test Report")
                    {
                        CaptionML = ENU = 'Prepayment &Test Report',
                                    ENN = 'Prepayment &Test Report';
                        Ellipsis = true;
                        Image = PrepaymentSimulation;

                        trigger OnAction();
                        begin
                            ReportPrint.PrintSalesHeaderPrepmt(Rec);
                        end;
                    }
                    action(PostPrepaymentInvoice)
                    {
                        CaptionML = ENU = 'Post Prepayment &Invoice',
                                    ENN = 'Post Prepayment &Invoice';
                        Ellipsis = true;
                        Image = PrepaymentPost;

                        trigger OnAction();
                        var
                            SalesPostYNPrepmt: Codeunit 443;
                        begin
                            IF ApprovalsMgmt.PrePostApprovalCheckSales(Rec) THEN
                                SalesPostYNPrepmt.PostPrepmtInvoiceYN(Rec, FALSE);
                        end;
                    }
                    action("Post and Print Prepmt. Invoic&e")
                    {
                        CaptionML = ENU = 'Post and Print Prepmt. Invoic&e',
                                    ENN = 'Post and Print Prepmt. Invoic&e';
                        Ellipsis = true;
                        Image = PrepaymentPostPrint;

                        trigger OnAction();
                        var
                            SalesPostYNPrepmt: Codeunit 443;
                        begin
                            IF ApprovalsMgmt.PrePostApprovalCheckSales(Rec) THEN
                                SalesPostYNPrepmt.PostPrepmtInvoiceYN(Rec, TRUE);
                        end;
                    }
                    action(PostPrepaymentCreditMemo)
                    {
                        CaptionML = ENU = 'Post Prepayment &Credit Memo',
                                    ENN = 'Post Prepayment &Credit Memo';
                        Ellipsis = true;
                        Image = PrepaymentPost;

                        trigger OnAction();
                        var
                            SalesPostYNPrepmt: Codeunit 443;
                        begin
                            IF ApprovalsMgmt.PrePostApprovalCheckSales(Rec) THEN
                                SalesPostYNPrepmt.PostPrepmtCrMemoYN(Rec, FALSE);
                        end;
                    }
                    action("Post and Print Prepmt. Cr. Mem&o")
                    {
                        CaptionML = ENU = 'Post and Print Prepmt. Cr. Mem&o',
                                    ENN = 'Post and Print Prepmt. Cr. Mem&o';
                        Ellipsis = true;
                        Image = PrepaymentPostPrint;

                        trigger OnAction();
                        var
                            SalesPostYNPrepmt: Codeunit 443;
                        begin
                            IF ApprovalsMgmt.PrePostApprovalCheckSales(Rec) THEN
                                SalesPostYNPrepmt.PostPrepmtCrMemoYN(Rec, TRUE);
                        end;
                    }
                }
            }
            group("&Print")
            {
                CaptionML = ENU = '&Print',
                            ENN = '&Print';
                Image = Print;
                action("Work Order")
                {
                    CaptionML = ENU = 'Work Order',
                                ENN = 'Work Order';
                    Ellipsis = true;
                    Image = Print;

                    trigger OnAction();
                    begin
                        DocPrint.PrintSalesOrder(Rec, Usage::"Work Order");
                    end;
                }
                action("Pick Instruction")
                {
                    CaptionML = ENU = 'Pick Instruction',
                                ENN = 'Pick Instruction';
                    Image = Print;

                    trigger OnAction();
                    begin
                        DocPrint.PrintSalesOrder(Rec, Usage::"Pick Instruction");
                    end;
                }
            }
            group("&Order Confirmation")
            {
                CaptionML = ENU = '&Order Confirmation',
                            ENN = '&Order Confirmation';
                Image = Email;
                action("Email Confirmation")
                {
                    CaptionML = ENU = 'Email Confirmation',
                                ENN = 'Email Confirmation';
                    Ellipsis = true;
                    Image = Email;

                    trigger OnAction();
                    begin
                        DocPrint.EmailSalesHeader(Rec);
                    end;
                }
                action("Print Confirmation")
                {
                    CaptionML = ENU = 'Print Confirmation',
                                ENN = 'Print Confirmation';
                    Ellipsis = true;
                    Image = Print;

                    trigger OnAction();
                    begin
                        DocPrint.PrintSalesOrder(Rec, Usage::"Order Confirmation");
                    end;
                }
                action("Delivery Order")
                {
                    Image = Print;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        SH.RESET;
                        SH.SETRANGE(SH."No.", "No.");
                        REPORT.RUNMODAL(50015, TRUE, TRUE, SH);
                    end;
                }
                action("FSR Report Replica")
                {
                    Image = Print;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        //PCPL0041-31012020
                        SH.RESET;
                        SH.SETRANGE(SH."No.", "No.");
                        REPORT.RUNMODAL(50029, TRUE, TRUE, SH);
                        //PCPL0041-31012020
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    var
        CRMCouplingManagement: Codeunit 5331;
    begin
        DynamicEditable := CurrPage.EDITABLE;
        CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
        CRMIsCoupledToRecord := CRMIntegrationEnabled AND CRMCouplingManagement.IsRecordCoupledToCRM(RECORDID);
        ShowWorkflowStatus := CurrPage.WorkflowStatus.PAGE.SetFilterOnWorkflowRecord(RECORDID);
    end;

    trigger OnAfterGetRecord();
    begin
        SetControlVisibility;
        IF "Re-Dispatch" THEN
            ReturnOrderNoVisible := TRUE
        ELSE
            ReturnOrderNoVisible := FALSE;
    end;

    trigger OnDeleteRecord(): Boolean;
    begin
        CurrPage.SAVERECORD;
        EXIT(ConfirmDeletion);
    end;

    trigger OnInit();
    begin
        FSR := TRUE;    //PCPL-25
        ReturnOrderNoVisible := TRUE;
        SetExtDocNoMandatoryCondition;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean;
    begin
        CheckCreditMaxBeforeInsert;
    end;

    trigger OnModifyRecord(): Boolean;
    begin
        IF "Re-Dispatch" THEN
            ReturnOrderNoVisible := TRUE
        ELSE
            ReturnOrderNoVisible := FALSE;
        // CurrForm.SalesLines.PAGE.UPDATECONTROLS;
    end;

    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        FSR := TRUE;    //PCPL-25
        "Responsibility Center" := UserMgt.GetSalesFilter;
    end;

    trigger OnOpenPage();
    var
        CRMIntegrationManagement: Codeunit 5330;
    begin
        FSR := TRUE;    //PCPL-25

        IF UserMgt.GetSalesFilter <> '' THEN BEGIN
            FILTERGROUP(2);
            SETRANGE("Responsibility Center", UserMgt.GetSalesFilter);
            FILTERGROUP(0);
        END;

        SETRANGE("Date Filter", 0D, WORKDATE - 1);

        SetDocNoVisible;

        CRMIntegrationEnabled := CRMIntegrationManagement.IsCRMIntegrationEnabled;
    end;

    var
        CopySalesDoc: Report 292;
        MoveNegSalesLines: Report 6699;
        ApprovalsMgmt: Codeunit 1535;
        ReportPrint: Codeunit 228;
        DocPrint: Codeunit 229;
        ArchiveManagement: Codeunit 5063;
        SalesCalcDiscountByType: Codeunit 56;
        SalesSetup: Record 311;
        ChangeExchangeRate: Page 511;
        UserMgt: Codeunit 5700;
        Usage: Option "Order Confirmation","Work Order","Pick Instruction";
        SalesLine: Record 37;
        Text16500: TextConst ENU = 'You can not uncheck Re-Dispatch until Return Receipt No. is Blank.', ENN = 'You can not uncheck Re-Dispatch until Return Receipt No. is Blank.';
        Text16501: TextConst ENU = 'To calculate invoice discount, check Cal. Inv. Discount on header when Price Inclusive of Tax = Yes.\This option cannot be used to calculate invoice discount when Price Inclusive Tax = Yes.', ENN = 'To calculate invoice discount, check Cal. Inv. Discount on header when Price Inclusive of Tax = Yes.\This option cannot be used to calculate invoice discount when Price Inclusive Tax = Yes.';
        [InDataSet]



        ReturnOrderNoVisible: Boolean;
        [InDataSet]
        JobQueueVisible: Boolean;
        Text001: TextConst ENU = 'Do you want to change %1 in all related records in the warehouse?', ENN = 'Do you want to change %1 in all related records in the warehouse?';
        Text002: TextConst ENU = 'The update has been interrupted to respect the warning.', ENN = 'The update has been interrupted to respect the warning.';
        DynamicEditable: Boolean;
        HasIncomingDocument: Boolean;
        DocNoVisible: Boolean;
        ExternalDocNoMandatory: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        CRMIntegrationEnabled: Boolean;
        CRMIsCoupledToRecord: Boolean;
        ShowWorkflowStatus: Boolean;
        SH: Record 36;
        Reccust: Record 18;
        Custappl: Text;
        Optionappliaction: Text;

    local procedure Post(PostingCodeunitID: Integer);
    begin
        SendToPosting(PostingCodeunitID);
        IF "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting" THEN
            CurrPage.CLOSE;
        CurrPage.UPDATE(FALSE);
    end;

    local procedure ApproveCalcInvDisc();
    begin
        CurrPage.SalesLines.PAGE.ApproveCalcInvDisc;
    end;

    local procedure SelltoCustomerNoOnAfterValidat();
    begin
        IF GETFILTER("Sell-to Customer No.") = xRec."Sell-to Customer No." THEN
            IF "Sell-to Customer No." <> xRec."Sell-to Customer No." THEN
                SETRANGE("Sell-to Customer No.");
        CurrPage.UPDATE;
    end;

    local procedure SalespersonCodeOnAfterValidate();
    begin
        CurrPage.SalesLines.PAGE.UpdateForm(TRUE);
    end;

    local procedure BilltoCustomerNoOnAfterValidat();
    begin
        CurrPage.UPDATE;
    end;

    local procedure ShortcutDimension1CodeOnAfterV();
    begin
        CurrPage.UPDATE;
    end;

    local procedure ShortcutDimension2CodeOnAfterV();
    begin
        CurrPage.UPDATE;
    end;

    local procedure PricesIncludingVATOnAfterValid();
    begin
        CurrPage.UPDATE;
    end;

    local procedure Prepayment37OnAfterValidate();
    begin
        CurrPage.UPDATE;
    end;

    local procedure ReDispatchOnPush();
    begin
        IF "Re-Dispatch" THEN
            CurrPage.SalesLines.PAGE.MakeVisibleLineControl
        ELSE
            CurrPage.SalesLines.PAGE.MakeInvisibleLineControl;
    end;

    local procedure SetDocNoVisible();
    var
        DocumentNoVisibility: Codeunit 1400;
        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",Reminder,FinChMemo;
    begin
        DocNoVisible := DocumentNoVisibility.SalesDocumentNoIsVisible(DocType::Order, "No.");
    end;

    local procedure SetExtDocNoMandatoryCondition();
    var
        SalesReceivablesSetup: Record 311;
    begin
        SalesReceivablesSetup.GET;
        ExternalDocNoMandatory := SalesReceivablesSetup."Ext. Doc. No. Mandatory"
    end;

    local procedure ShowPreview();
    var
        SalesPostYesNo: Codeunit 81;
    begin
        SalesPostYesNo.Preview(Rec);
    end;

    local procedure SetControlVisibility();
    var
        ApprovalsMgmt: Codeunit 1535;
    begin
        JobQueueVisible := "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting";
        HasIncomingDocument := "Incoming Document Entry No." <> 0;
        SetExtDocNoMandatoryCondition;

        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);
    end;
}

