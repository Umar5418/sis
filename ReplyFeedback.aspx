<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.master" AutoEventWireup="true" CodeFile="ReplyFeedback.aspx.cs" Inherits="Admin_ReplyFeedback" %>

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
                    <i class="fas fa-reply"></i> Reply Feedbacks here...
                </h5>
            </div>

            <div class="col-12 mt-1">
                <strong>
                    <asp:Label ID="MessageLabel" runat="server" Text=""
                        CssClass="col-12 fas fa-exclamation-circle" Visible="false">
                    </asp:Label>
                </strong>
            </div>

            <%--Feedback ID--%>
            <div class="col-4 mt-3">
                <asp:Label ID="Label2" runat="server" CssClass="form-label" Text="Feedback ID: "></asp:Label>
                <asp:Label ID="FeedbackIdLabel" CssClass="form-control form-control-lg" runat="server"></asp:Label>
            </div>

            <%--Date of Posting--%>
            <div class="col-4 mt-3">
                <asp:Label ID="Label4" runat="server" CssClass="form-label" Text="Feedback Posting Date: "></asp:Label>
                <asp:Label ID="DateLabel" CssClass="form-control form-control-lg" runat="server" Text=""></asp:Label>
            </div>

            <%--Name--%>
            <div class="col-4 mt-3">
                <asp:Label ID="Label5" runat="server" CssClass="form-label" Text="Name: "></asp:Label>
                <asp:Label ID="NameLabel" CssClass="form-control form-control-lg" runat="server">
                </asp:Label>
            </div>

            <%--Email--%>
            <div class="col-4 mt-3">
                <asp:Label ID="Label1" runat="server" CssClass="form-label" Text="Email: "></asp:Label>
                <asp:Label ID="EmailLabel" CssClass="form-control form-control-lg" runat="server">
                </asp:Label>
            </div>

            <%--Feedback Subject--%>
            <div class="col-4 mt-3">
                <asp:Label ID="Label8" runat="server" CssClass="form-label" Text="Feedback Detail: ">
                </asp:Label>
                <asp:Label ID="FeedbackSubjectLabel" runat="server" CssClass="form-control form-control-lg">
                </asp:Label>
            </div>

            <%--Feedback Description--%>
            <div class="col-4 mt-3">
                <asp:Label ID="Label7" runat="server" CssClass="form-label" Text="Feedback Detail: ">
                </asp:Label>
                <asp:Label ID="FeedbackDescriptionLabel" runat="server" CssClass="form-control form-control-lg"  Height="120px">
                </asp:Label>
            </div>

            <%--Feedback  Status--%>
            <div class="col-4 mt-3">
                <asp:Label ID="Label6" runat="server" CssClass="form-label" Text="Feedback Status : ">
                </asp:Label>
                <asp:DropDownList ID="FeedbackStatusDDL" runat="server" CssClass="form-select form-select-lg">
                    <asp:ListItem Text="Processed"></asp:ListItem>
                    <asp:ListItem Text="Under Process"></asp:ListItem>
                    <asp:ListItem Text="Sorry Cannot be resolved"></asp:ListItem>
                    <asp:ListItem Text="Feedback Message is not clear"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="FeedbackStatusRFV"
                    runat="server" ErrorMessage="Feedback Status is Required"
                    ControlToValidate="FeedbackStatusDDL" ForeColor="Red"
                    Display="Dynamic" InitialValue="-1">
                </asp:RequiredFieldValidator>
            </div>
            <%--Feedback Reply--%>
            <div class="col-8 mt-3">
                <asp:Label ID="Label3" runat="server" CssClass="form-label" Text="Reply: "></asp:Label>
                <asp:TextBox ID="FeedbackReplyTextBox" runat="server" CssClass="form-control form-control-lg"
                    placeholder="Feedback Reply..." TextMode="MultiLine" Height="150px">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="FeedbackReplyRFV"
                    runat="server" ErrorMessage="Feedback Reply is Required"
                    ControlToValidate="FeedbackReplyTextBox" ForeColor="Red" Display="Dynamic">
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
                    CssClass="btn btn-danger btn-lg form-control" CausesValidation="False" OnClick="ClearButton_Click">
                                <i class="fas fa-trash-alt"></i> Clear
                </asp:LinkButton>
            </div>


           
        </div>
    </div>
</asp:Content>

