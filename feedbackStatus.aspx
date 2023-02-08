<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.master" AutoEventWireup="true" CodeFile="feedbackStatus.aspx.cs" Inherits="feedbackStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="packages/CSS_file_2.css" rel="stylesheet" />
    <style>

        #contain {
            min-width: 45%;
            max-width: 45%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container" id="contain">
        <div class="row">

            <div class="col-12 mt-3">
                <h5 class="alert alert-success alert-dismissible fade show ">
                    <i class="fa fa-magnifying-glass"></i> Please Check Your Feedback Status here...
                </h5>
            </div>

            <div class="col-12 mt-2">
                
                <strong>
                    <asp:Label ID="FeedbackErrorMessageLabel" runat="server" Text=""
                        Visible="false"  >
                    </asp:Label>
                    <asp:Label ID="FeedbackIdMessageLabel" runat="server" ForeColor="Green"
                        CssClass="alert alert-primary alert-dismissible" Visible="false"  >
                    </asp:Label>

                    <asp:Label ID="FeedbackStatusMessageLabel" runat="server" Visible="false"  >
                    </asp:Label>

                    <asp:Panel ID="Panel" runat="server" Visible="False"  >
                        <asp:Label ID="FeedbackPanelMessageLabel" runat="server" Visible="false"  >
                        </asp:Label>
                    </asp:Panel>
                </strong>

            </div>

            <%--Feedback ID--%>
            <div class="col-12 mt-4 mb-3">
                <asp:TextBox ID="FeedbackIdTextBox" runat="server" CssClass="form-control form-control-lg"
                    placeholder="Enter Your Feedback ID" TextMode="Number" MaxLength="0">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="FeedbackIdRFV"
                    runat="server" ErrorMessage=" Feedback Id is Required"
                    ControlToValidate="FeedbackIdTextBox" ForeColor="Red" Display="Dynamic">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="FeedbackIdREV" runat="server"
                    ErrorMessage=" Invalid Feedback ID" ControlToValidate="FeedbackIdTextBox"
                    SetFocusOnError="True" ValidationExpression="^[\s\S]{0,8}$" ForeColor="Red">
                </asp:RegularExpressionValidator>
            </div>

            <%--Cancel , Send , Clear Buttons--%>
            <div class="col-4 mb-3">
                <asp:LinkButton ID="CancelLinkButton" runat="server"
                    CssClass="btn btn-primary form-control btn-lg"
                    PostBackUrl="~/Home.aspx" CausesValidation="False">
                          <i class="fas fa-times"></i> Cancel
                </asp:LinkButton>
            </div>

            <div class="col-4 mb-3">
                <asp:LinkButton ID="CheckStatusLinkButton" runat="server"
                    CssClass="btn btn-success form-control btn-lg" OnClick="CheckStatusLinkButton_Click">
                          <i class="fas fa-search-plus"></i> Check Status
                </asp:LinkButton>
            </div>

            <div class="col-4 mb-3">
                <asp:LinkButton ID="ClearLinkButton" runat="server"
                    CssClass="btn btn-danger form-control btn-lg"
                    CausesValidation="False" OnClick="ClearLinkButton_Click">
                             <i class="fas fa-trash-alt"></i> Clear
                </asp:LinkButton>
            </div>
        </div>
    </div>
</asp:Content>

