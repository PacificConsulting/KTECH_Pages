page 50027 "Posted FSR Invoices"
{
    // version NAVW19.00.00.48067,NAVIN9.00.00.48067

    CaptionML = ENU = 'Posted FSR Invoices',
                ENN = 'Posted Sales Invoices';
    CardPageID = "Posted Sales Invoice";
    Editable = false;
    PageType = List;
    PromotedActionCategoriesML = ENU = 'New,Process,Report,Invoice,Navigate',
                                 ENN = 'New,Process,Report,Invoice,Navigate';
    SourceTable = 112;
    SourceTableView = WHERE("No. Series" = FILTER("FSB"));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("No."; rec."No.")
                {
                    ApplicationArea = all;
                }
                field("Sell-to Customer No."; rec."Sell-to Customer No.")
                {
                    ApplicationArea = all;
                }
                field("Sell-to Customer Name"; rec."Sell-to Customer Name")
                {
                    ApplicationArea = all;
                }
                field("Currency Code"; rec."Currency Code")
                {
                    ApplicationArea = all;
                }
                field(Amount; rec.Amount)
                {
                    ApplicationArea = all;

                    trigger OnDrillDown();
                    begin
                        SETRANGE(rec."No.");
                        PAGE.RUNMODAL(PAGE::"Posted Sales Invoice", Rec)
                    end;
                }
                field("Amount Including VAT"; rec."Amount Including VAT")
                {
                    ApplicationArea = all;

                    trigger OnDrillDown();
                    begin
                        SETRANGE(rec."No.");
                        PAGE.RUNMODAL(PAGE::"Posted Sales Invoice", Rec)
                    end;
                }
                field("Sell-to Post Code"; rec."Sell-to Post Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Sell-to Country/Region Code"; rec."Sell-to Country/Region Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Sell-to Contact"; rec."Sell-to Contact")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Bill-to Customer No."; rec."Bill-to Customer No.")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Bill-to Name"; rec."Bill-to Name")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Bill-to Post Code"; rec."Bill-to Post Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Bill-to Country/Region Code"; rec."Bill-to Country/Region Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Bill-to Contact"; rec."Bill-to Contact")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Ship-to Code"; rec."Ship-to Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Ship-to Name"; rec."Ship-to Name")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Ship-to Post Code"; rec."Ship-to Post Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Ship-to Country/Region Code"; rec."Ship-to Country/Region Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Ship-to Contact"; rec."Ship-to Contact")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Posting Date"; rec."Posting Date")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Salesperson Code"; rec."Salesperson Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code"; rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code"; rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Location Code"; rec."Location Code")
                {
                    ApplicationArea = all;
                    Visible = true;
                }
                field("No. Printed"; rec."No. Printed")
                {
                    ApplicationArea = all;
                }
                field("Document Date"; rec."Document Date")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Payment Terms Code"; rec."Payment Terms Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Due Date"; rec."Due Date")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Payment Discount %"; rec."Payment Discount %")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Shipment Method Code"; rec."Shipment Method Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Shipment Date"; rec."Shipment Date")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Document Exchange Status"; rec."Document Exchange Status")
                {
                    ApplicationArea = all;
                    StyleExpr = DocExchStatusStyle;

                    trigger OnDrillDown();
                    begin
                        DocExchStatusDrillDown;
                    end;
                }
                field("Invoice Type"; rec."Invoice Type")
                {
                    ApplicationArea = all;
                }
                field("Coupled to CRM"; rec."Coupled to CRM")
                {
                    ApplicationArea = all;
                    Visible = CRMIntegrationEnabled;
                }
            }
        }
        area(factboxes)
        {
            part(IncomingDocAttachFactBox; 193)
            {
                ShowFilter = false;
            }
            systempart(part1; Links)
            {
                Visible = false;
            }
            systempart(part2; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Invoice")
            {
                CaptionML = ENU = '&Invoice',
                            ENN = '&Invoice';
                Image = Invoice;
                action(Card)
                {
                    CaptionML = ENU = 'Card',
                                ENN = 'Card';
                    Image = EditLines;
                    ShortCutKey = 'Shift+F7';

                    trigger OnAction();
                    begin
                        PAGE.RUN(PAGE::"Posted Sales Invoice", Rec)
                    end;
                }
                action(Statistics)
                {
                    CaptionML = ENU = 'Statistics',
                                ENN = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page 397;
                    RunPageLink = "No." = FIELD("No.");
                    ShortCutKey = 'F7';
                }
                action("Co&mments")
                {
                    CaptionML = ENU = 'Co&mments',
                                ENN = 'Co&mments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page 67;
                    RunPageLink = "Document Type" = CONST("Posted Invoice"),
                                  "No." = FIELD("No.");
                }
                action(Dimensions)
                {
                    AccessByPermission = TableData 348 = R;
                    CaptionML = ENU = 'Dimensions',
                                ENN = 'Dimensions';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction();
                    begin
                        rec.ShowDimensions;
                    end;
                }
                action(IncomingDoc)
                {
                    AccessByPermission = TableData 130 = R;
                    CaptionML = ENU = 'Incoming Document',
                                ENN = 'Incoming Document';
                    Image = Document;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction();
                    var
                        IncomingDocument: Record 130;
                    begin
                        IncomingDocument.ShowCard(rec."No.", rec."Posting Date");
                    end;
                }
            }
            group(ActionGroupCRM)
            {
                CaptionML = ENU = 'Dynamics CRM',
                            ENN = 'Dynamics CRM';
                Visible = CRMIntegrationEnabled;
                action(CRMGotoInvoice)
                {
                    CaptionML = ENU = 'Invoice',
                                ENN = 'Invoice';
                    Enabled = CRMIsCoupledToRecord;
                    Image = CoupledInvoice;
                    ToolTipML = ENU = 'Open the coupled Microsoft Dynamics CRM account.',
                                ENN = 'Open the coupled Microsoft Dynamics CRM account.';

                    trigger OnAction();
                    var
                        CRMIntegrationManagement: Codeunit 5330;
                    begin
                        CRMIntegrationManagement.ShowCRMEntityFromRecordID(RECORDID);
                    end;
                }
                action(CreateInCRM)
                {
                    CaptionML = ENU = 'Create Invoice in Dynamics CRM',
                                ENN = 'Create Invoice in Dynamics CRM';
                    Enabled = NOT CRMIsCoupledToRecord;
                    Image = NewInvoice;

                    trigger OnAction();
                    var
                        SalesInvoiceHeader: Record 112;
                        CRMIntegrationManagement: Codeunit 5330;
                        SalesInvoiceHeaderRecordRef: RecordRef;
                    begin
                        CurrPage.SETSELECTIONFILTER(SalesInvoiceHeader);
                        SalesInvoiceHeader.NEXT;

                        IF SalesInvoiceHeader.COUNT = 1 THEN
                            CRMIntegrationManagement.CreateNewRecordInCRM(RECORDID, FALSE)
                        ELSE BEGIN
                            SalesInvoiceHeaderRecordRef.GETTABLE(SalesInvoiceHeader);
                            CRMIntegrationManagement.CreateNewRecordsInCRM(SalesInvoiceHeaderRecordRef);
                        END;
                    end;
                }
            }
        }
        area(processing)
        {
            action(SendCustom)
            {
                CaptionML = ENU = 'Send',
                            ENN = 'Send';
                Ellipsis = true;
                Image = SendToMultiple;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction();
                var
                    SalesInvHeader: Record 112;
                begin
                    SalesInvHeader := Rec;
                    CurrPage.SETSELECTIONFILTER(SalesInvHeader);
                    // Call SendRecords to open sending profile dialog
                    SalesInvHeader.SendRecords;
                end;
            }
            action("&Print")
            {
                CaptionML = ENU = '&Print',
                            ENN = '&Print';
                Ellipsis = true;
                Image = Print;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;

                trigger OnAction();
                var
                    SalesInvHeader: Record 112;
                begin
                    SalesInvHeader := Rec;
                    CurrPage.SETSELECTIONFILTER(SalesInvHeader);
                    SalesInvHeader.PrintRecords(TRUE);
                end;
            }
            action("&Email")
            {
                CaptionML = ENU = '&Email',
                            ENN = '&Email';
                Image = Email;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;

                trigger OnAction();
                var
                    SalesInvHeader: Record 112;
                begin
                    SalesInvHeader := Rec;
                    CurrPage.SETSELECTIONFILTER(SalesInvHeader);
                    SalesInvHeader.EmailRecords(TRUE);
                end;
            }
            action("&Navigate")
            {
                CaptionML = ENU = '&Navigate',
                            ENN = '&Navigate';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    rec.Navigate;
                end;
            }
            action(ActivityLog)
            {
                CaptionML = ENU = 'Activity Log',
                            ENN = 'Activity Log';
                Image = Log;

                trigger OnAction();
                var
                    ActivityLog: Record 710;
                begin
                    ActivityLog.ShowEntries(RECORDID);
                end;
            }
            action(Taxable)
            {
                CaptionML = ENU = 'Taxable',
                            ENN = 'Taxable';
                Ellipsis = true;
                Image = "Filter";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    ShowInvoiceTypeDoc("Invoice Type"::Taxable);
                end;
            }
            action("Bill of Supply")
            {
                CaptionML = ENU = 'Bill of Supply',
                            ENN = 'Bill of Supply';
                Ellipsis = true;
                Image = "Filter";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    ShowInvoiceTypeDoc("Invoice Type"::"Bill of Supply");
                end;
            }
            action(Export)
            {
                CaptionML = ENU = 'Export',
                            ENN = 'Export';
                Ellipsis = true;
                Image = "Filter";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    ShowInvoiceTypeDoc("Invoice Type"::Export);
                end;
            }
            action(Supplementary)
            {
                CaptionML = ENU = 'Supplementary',
                            ENN = 'Supplementary';
                Ellipsis = true;
                Image = "Filter";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    ShowInvoiceTypeDoc("Invoice Type"::Supplementary);
                end;
            }
            action("Debit Note")
            {
                CaptionML = ENU = 'Debit Note',
                            ENN = 'Debit Note';
                Ellipsis = true;
                Image = "Filter";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    ShowInvoiceTypeDoc("Invoice Type"::"Debit Note");
                end;
            }
            action("Non GST")
            {
                CaptionML = ENU = 'Non GST',
                            ENN = 'Non GST';

                trigger OnAction();
                begin
                    ShowInvoiceTypeDoc("Invoice Type"::"Non-GST");
                end;
            }
            action("Posted FSR")
            {
                CaptionML = ENU = 'Posted FSR',
                            ENN = 'Print Tax Invoice';
                Image = PrintVAT;

                trigger OnAction();
                begin
                    SalesInvHeader.RESET;
                    SalesInvHeader.SETRANGE("No.", rec."No.");
                    REPORT.RUNMODAL(REPORT::"FSR Report", TRUE, TRUE, SalesInvHeader);
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    var
        CRMCouplingManagement: Codeunit 5331;
    begin
        DocExchStatusStyle := rec.GetDocExchStatusStyle;
        CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
        CRMIsCoupledToRecord := CRMIntegrationEnabled AND CRMCouplingManagement.IsRecordCoupledToCRM(RECORDID);
    end;

    trigger OnAfterGetRecord();
    begin
        DocExchStatusStyle := rec.GetDocExchStatusStyle;
    end;

    trigger OnOpenPage();
    var
        CRMIntegrationManagement: Codeunit 5330;
    begin

        rec.SetSecurityFilterOnRespCenter;
        CRMIntegrationEnabled := CRMIntegrationManagement.IsCRMIntegrationEnabled;
    end;

    var
        DocExchStatusStyle: Text;
        CRMIntegrationEnabled: Boolean;
        CRMIsCoupledToRecord: Boolean;
        SalesInvHeader: Record 112;

    local procedure ShowInvoiceTypeDoc(InvoiceType: Option Taxable,"Bill of Supply",Export,Supplementary,"Debit Notes");
    var
        SalesInvHeader: Record 112;
    begin
        SETRANGE("Invoice Type", InvoiceType);
        IF FINDSET THEN
            PAGE.RUN(PAGE::"Posted Sales Invoices", Rec);
    end;
}

