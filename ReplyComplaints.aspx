<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.master" AutoEventWireup="true" CodeFile="ReplyComplaints.aspx.cs" Inherits="Accounts_ReplyComplaints" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../packages/CSS_file_2.css" rel="stylesheet" />
    <style>
       #contain {
            min-width: 75%;
            max-width: 75%;
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="container" id="contain">
        <div class="row p-3">

            <div class="col-12">
                <h5 class="alert alert-primary alert-dismissible fade show ">
                    <i class="fa fa-atom"></i> Reply Complaints here...
                </h5>
            </div>

            <div class="col-12 mt-1">
                <strong>
                    <asp:Label ID="MessageLabel" runat="server" Text=""
                        CssClass="fas fa-exclamation-circle" Visible="false">
                    </asp:Label>
                </strong>
            </div>

            <%--Complaint ID--%>
            <div class="col-4 mt-3">
                <asp:Label ID="Label2" runat="server" CssClass="form-label" Text="Complaint ID: "></asp:Label>
                <asp:Label ID="ComplaintIdLabel" CssClass="form-control form-control-lg" runat="server"></asp:Label>
            </div>

            <%--Date of Registration--%>
            <div class="col-4 mt-3">
                <asp:Label ID="Label4" runat="server" CssClass="form-label" Text="Registration Date: "></asp:Label>
                <asp:Label ID="DateLabel" CssClass="form-control form-control-lg" runat="server" Text=""></asp:Label>
            </div>

            <%--Username--%>
            <div class="col-4 mt-3">
                <asp:Label ID="Label5" runat="server" CssClass="form-label" Text="Username: "></asp:Label>
                <asp:Label ID="UserNameLabel" CssClass="form-control form-control-lg" runat="server">
                </asp:Label>
            </div>

            <%--Complaint Subject--%>
            <div class="col-4 mt-3">
                <asp:Label ID="Label8" runat="server" CssClass="form-label" Text="Complaint Subject: ">
                </asp:Label>
                <asp:Label ID="ComplaintSubjectLabel" runat="server" CssClass="form-control form-control-lg">
                </asp:Label>
            </div>

            <%--Complaint Detail--%>
            <div class="col-8 mt-3">
                <asp:Label ID="Label7" runat="server" CssClass="form-label" Text="Complaint Detail: ">
                </asp:Label>
                <asp:Label ID="ComplaintDetailLabel" runat="server" CssClass="form-control form-control-lg" Height="100px">
                </asp:Label>
            </div>

            <%--Complaint Status--%>
            <div class="col-4 mt-3">
                <asp:Label ID="Label6" runat="server" CssClass="form-label" Text="Status : "></asp:Label>
                <asp:DropDownList ID="ComplaintStatusDDL" runat="server" CssClass="form-select form-select-lg">
                    <asp:ListItem Text="Processed"></asp:ListItem>
                    <asp:ListItem Text="Under Process"></asp:ListItem>
                    <asp:ListItem Text="Sorry Cannot be resolved"></asp:ListItem>
                    <asp:ListItem Text="Feedback Message is not clear"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="FeedbackStatusRFV"
                    runat="server" ErrorMessage="Feedback Status is Required"
                    ControlToValidate="ComplaintStatusDDL" ForeColor="Red"
                    Display="Dynamic" InitialValue="-1">
                </asp:RequiredFieldValidator>
            </div>

            <%--Complaint Reply--%>
            <div class="col-8 mt-3">
                <asp:Label ID="Label3" runat="server" CssClass="form-label" Text="Reply: "></asp:Label>
                <asp:TextBox ID="ComplaintReplyTextBox" runat="server" CssClass="form-control"
                    placeholder="Type Your Complaint Reply here..." TextMode="MultiLine" Height="150px">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="ComplaintReplyRFV"
                    runat="server" ErrorMessage="Complaint Reply is Required"
                    ControlToValidate="ComplaintReplyTextBox" ForeColor="Red" Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>
            
            <div class="mt-3"></div>
            <%--Cancel , Send , Clear Buttons--%>
            <div class="col-3">

                <asp:LinkButton ID="ExitButton" runat="server"
                    CssClass="btn btn-primary btn-lg form-control"
                    PostBackUrl="~/Admin/adminProfile.aspx" CausesValidation="False">
                          <i class="fas fa-times"></i> Exit
                </asp:LinkButton>
            </div>

            
            <div class="col-3">
                <asp:LinkButton ID="ViewAllComplaintsLinkButton" runat="server"
                   CssClass="btn btn-warning btn-lg form-control form-control-lg"
                    PostBackUrl="~/Admin/ManageFeedbacks.aspx" CausesValidation="False">
                      <i class="fas fa-arrow-left-rotate"></i>  Go back
                </asp:LinkButton>
            </div>

            <div class="col-3">
                <asp:LinkButton ID="ReplyButton" runat="server"
                    CssClass="btn btn-success btn-lg form-control" OnClick="ReplyButton_Click">
                          <i class="fas fa-paper-plane"></i> Reply
                </asp:LinkButton>
            </div>

            <div class="col-3">
                <asp:LinkButton ID="ClearButton" runat="server"
                    CssClass="btn btn-danger btn-lg form-control" OnClick="ClearButton_Click" CausesValidation="False">
                                    <i class="fas fa-trash-alt"></i> Clear
                </asp:LinkButton>
            </div>


        </div>
    </div>
</asp:Content>

