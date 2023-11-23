page 50023 "FSR Order List"
{
    // version NAVW19.00.00.45778

    CaptionML = ENU = 'FSR Orders',
                ENN = 'FSR Orders';
    CardPageID = "FSR Order";
    Editable = false;
    PageType = List;
    SourceTable = 36;
    SourceTableView = WHERE("Document Type" = CONST(Order));
    //"FSR" = CONST(Yes)); //PCPL_PS

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
                field("External Document No."; rec."External Document No.")
                {
                    ApplicationArea = all;
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
                field("Salesperson Code"; rec."Salesperson Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Assigned User ID"; rec."Assigned User ID")
                {
                    ApplicationArea = all;
                }
                field("Currency Code"; rec."Currency Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Document Date"; rec."Document Date")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Requested Delivery Date"; rec."Requested Delivery Date")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Campaign No."; rec."Campaign No.")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = all;
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
                field("Shipping Agent Code"; rec."Shipping Agent Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Shipment Date"; rec."Shipment Date")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Shipping Advice"; rec."Shipping Advice")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Completely Shipped"; rec."Completely Shipped")
                {
                    ApplicationArea = all;
                }
                field("Job Queue Status"; rec."Job Queue Status")
                {
                    ApplicationArea = all;
                    Visible = JobQueueActive;
                }
            }
        }
        area(factboxes)
        {
            part(part1; 9082)
            {
                SubPageLink = "No." = FIELD("Bill-to Customer No."),
                              "Date Filter" = FIELD("Date Filter");
                Visible = true;
            }
            part(part2; 9084)
            {
                SubPageLink = "No." = FIELD("Bill-to Customer No."),
                              "Date Filter" = FIELD("Date Filter");
                Visible = true;
            }
            part(IncomingDocAttachFactBox; 193)
            {
                ShowFilter = false;
                Visible = false;
            }
            systempart(part3; Links)
            {
                Visible = false;
            }
            systempart(part4; Notes)
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
                action(Dimensions)
                {
                    AccessByPermission = TableData 348 = R;
                    CaptionML = ENU = 'Dimensions',
                                ENN = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction();
                    begin
                        Rec.ShowDocDim;
                    end;
                }
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
                        Rec.OpenSalesOrderStatistics;
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
                action(PostedSalesInvoices)
                {
                    CaptionML = ENU = 'Invoices',
                                ENN = 'Invoices';
                    Image = Invoice;
                    RunObject = Page 143;
                    RunPageLink = "Order No." = FIELD("No.");
                    RunPageView = SORTING("Order No.");
                }
                action(PostedSalesPrepmtInvoices)
                {
                    CaptionML = ENU = 'Prepa&yment Invoices',
                                ENN = 'Prepa&yment Invoices';
                    Image = PrepaymentInvoice;
                    RunObject = Page 143;
                    RunPageLink = "Prepayment Order No." = FIELD("No.");
                    RunPageView = SORTING("Prepayment Order No.");
                }
                action("Prepayment Credi&t Memos")
                {
                    CaptionML = ENU = 'Prepayment Credi&t Memos',
                                ENN = 'Prepayment Credi&t Memos';
                    Image = PrepaymentCreditMemo;
                    RunObject = Page 144;
                    RunPageLink = "Prepayment Order No." = FIELD("No.");
                    RunPageView = SORTING("Prepayment Order No.");
                }
            }
            group(Warehouse1)
            {
                CaptionML = ENU = 'Warehouse',
                            ENN = 'Warehouse';
                Image = Warehouse;
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
            }
            group(ActionGroupCRM)
            {
                CaptionML = ENU = 'Dynamics CRM',
                            ENN = 'Dynamics CRM';
                Visible = CRMIntegrationEnabled;
                action(CRMGoToSalesOrderListInNAV)
                {
                    CaptionML = ENU = 'Sales Order List',
                                ENN = 'Sales Order List';
                    Enabled = CRMIntegrationEnabled;
                    Image = "Order";
                    ToolTipML = ENU = 'Open the Dynamics CRM Sales Order List page in NAV',
                                ENN = 'Open the Dynamics CRM Sales Order List page in NAV';
                    Visible = CRMIntegrationEnabled;

                    trigger OnAction();
                    var
                        CRMSalesorder: Record 5353;
                    begin
                        PAGE.RUN(PAGE::"CRM Sales Order List", CRMSalesorder);
                    end;
                }
            }
        }
        area(processing)
        {
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
                action(Reopen)
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
                action("Pla&nning")
                {
                    CaptionML = ENU = 'Pla&nning',
                                ENN = 'Pla&nning';
                    Image = Planning;

                    trigger OnAction();
                    var
                        SalesOrderPlanningForm: Page 99000883;
                    begin
                        SalesOrderPlanningForm.SetSalesOrder(rec."No.");
                        SalesOrderPlanningForm.RUNMODAL;
                    end;
                }
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
            }
            group("Request Approval")
            {
                CaptionML = ENU = 'Request Approval',
                            ENN = 'Request Approval';
                action(SendApprovalRequest)
                {
                    CaptionML = ENU = 'Send A&pproval Request',
                                ENN = 'Send A&pproval Request';
                    Enabled = NOT OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;

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

                    trigger OnAction();
                    var
                        ApprovalsMgmt: Codeunit 1535;
                    begin
                        ApprovalsMgmt.OnCancelSalesApprovalRequest(Rec);
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
                    Image = CreatePutawayPick;

                    trigger OnAction();
                    begin
                        rec.CreateInvtPutAwayPick;

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
                        rec.SendToPosting(CODEUNIT::"Sales-Post (Yes/No)");
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
                        rec.SendToPosting(CODEUNIT::"Sales-Post + Print");
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
                    Promoted = true;
                    PromotedCategory = Process;

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
                    Visible = JobQueueActive;

                    trigger OnAction();
                    begin
                        rec.CancelBackgroundPosting;

                    end;
                }
                action("Preview Posting")
                {
                    CaptionML = ENU = 'Preview Posting',
                                ENN = 'Preview Posting';
                    Image = ViewPostedOrder;

                    trigger OnAction();
                    begin
                        ShowPreview
                    end;
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
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        DocPrint.PrintSalesOrder(Rec, Usage::"Order Confirmation");
                    end;
                }
            }
        }
        area(reporting)
        {
            action("Sales Reservation Avail.")
            {
                CaptionML = ENU = 'Sales Reservation Avail.',
                            ENN = 'Sales Reservation Avail.';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report 209;
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        SetControlVisibility;
        CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
    end;

    trigger OnOpenPage();
    var
        SalesSetup: Record 311;
        CRMIntegrationManagement: Codeunit 5330;
    begin
        IF UserMgt.GetSalesFilter <> '' THEN BEGIN
            FILTERGROUP(2);
            Rec.SETRANGE(rec."Responsibility Center", UserMgt.GetSalesFilter);
            FILTERGROUP(0);
        END;

        Rec.SETRANGE("Date Filter", 0D, WORKDATE - 1);

        JobQueueActive := SalesSetup.JobQueueActive;
        CRMIntegrationEnabled := CRMIntegrationManagement.IsCRMIntegrationEnabled;
    end;

    var
        DocPrint: Codeunit 229;
        ReportPrint: Codeunit 228;
        UserMgt: Codeunit 5700;
        Usage: Option "Order Confirmation","Work Order","Pick Instruction";
        [InDataSet]
        JobQueueActive: Boolean;
        OpenApprovalEntriesExist: Boolean;
        CRMIntegrationEnabled: Boolean;
    //RecordID : Page 9305;

    procedure ShowPreview();
    var
        SalesPostYesNo: Codeunit 81;
    begin
        SalesPostYesNo.Preview(Rec);
    end;

    local procedure SetControlVisibility();
    var
        ApprovalsMgmt: Codeunit 1535;
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordID);

}

