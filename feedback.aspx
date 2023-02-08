<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.master" AutoEventWireup="true" CodeFile="feedback.aspx.cs" Inherits="feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="packages/CSS_file_2.css" rel="stylesheet" />
    <style>
        #contain {
            min-width: 50%;
            max-width: 50%;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container" id="contain">
        <div class="row p-3">

                <div class="col-12 mt-3">
                    <h5 class="alert alert-success alert-dismissible fade show ">
                        <i class="fa fa-registered"></i> Please Give your Feedback here...</h5>
                </div>

                <div class="col-12 mt-3 mb-4">
                    <asp:Label ID="MessageLabel" runat="server" Text=""
                        CssClass="fa fa-exclamation-circle" Visible="false">
                    </asp:Label>
                </div>

                <%--Date of Feedback Posting--%>
                <div class="col-4 mb-3">
                    <asp:Label ID="Label4" runat="server" CssClass="form-label" Text=" Date of Posting: "></asp:Label>
                    <asp:TextBox ID="DateLabel" runat="server" CssClass="form-control"
                       ReadOnly="true">
                    </asp:TextBox>
                </div>

                <%--Name--%>
                <div class="col-4 mb-3">
                    <asp:Label ID="Label5" runat="server" CssClass="form-label" Text="Name: "></asp:Label>
                    <asp:TextBox ID="NameTextBox" runat="server" CssClass="form-control"
                        TextMode="SingleLine" placeholder="Please type your name">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="NameTextBoxRFV"
                        runat="server" ErrorMessage="Your Name is Required"
                        ControlToValidate="NameTextBox" ForeColor="Red" Display="Dynamic" >
                    </asp:RequiredFieldValidator>
                    
                    <asp:RegularExpressionValidator ID="firstNameRegularExpressionValidator" runat="server"
                        ErrorMessage="Numeric and special characters, not allowed"
                        ValidationExpression="^[A-Za-z\s]{1,}[\.]{0,1}[A-Za-z\s]{0,}$"
                        ControlToValidate="NameTextBox" ForeColor="Red" Display="Dynamic">
                    </asp:RegularExpressionValidator>
                </div>

                <%--Email--%>
                <div class="col-4 mb-3">
                    <asp:Label ID="Label9" runat="server" CssClass="form-label" Text="Email: "></asp:Label>
                    <asp:TextBox ID="emailTextBox" runat="server" CssClass="form-control"
                        TextMode="SingleLine" placeholder="abc@abc.com">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="emailRequiredFieldValidator"
                        runat="server" ErrorMessage="Email is Required"
                        ControlToValidate="emailTextBox" ForeColor="Red" Display="Dynamic" >
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="emailRegularExpressionValidator" runat="server"
                    ErrorMessage="Invalid Email" ControlToValidate="emailTextBox" ForeColor="Red"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic">
                     </asp:RegularExpressionValidator>
                </div>

                <%--Feedback Subject--%>
                <div class="col-6 mb-3">
                    <asp:Label ID="Label6" runat="server" CssClass="form-label" Text="Feedback Subject: "></asp:Label>

                    <asp:TextBox ID="FeedbackSubjectTextBox" runat="server" CssClass="form-control" TextMode="MultiLine"
                        placeholder="Please mention some feedback subject" Height="30px">
                    </asp:TextBox>

                    <asp:RequiredFieldValidator ID="ComplaintSubjectRequiredFieldValidator"
                        runat="server" ErrorMessage="Complaint Subject is Required"
                        ControlToValidate="FeedbackSubjectTextBox" ForeColor="Red" Display="Dynamic" >
                    </asp:RequiredFieldValidator>
                </div>

                <%--Feedback Description--%>
                <div class="col-6 mb-3">
                    <asp:Label ID="Label7" runat="server" CssClass="form-label" Text="Feedback Description: "></asp:Label>
                    <asp:TextBox ID="FeedbackDescriptionTextBox" runat="server" CssClass="form-control"
                        placeholder="Please give a discription of your feedback..." 
                        TextMode="MultiLine" Height="160px">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="FeedbackDescriptionRFV"
                        runat="server" ErrorMessage="Complaint Details are Required"
                        ControlToValidate="FeedbackDescriptionTextBox" ForeColor="Red" Display="Dynamic" >
                    </asp:RequiredFieldValidator>
                </div>

                <%--Cancel , Send , Clear Buttons--%>

                    <div class="col-4">
                        <asp:LinkButton ID="ExitButton" runat="server"
                            CssClass="btn btn-primary btn-lg form-control"
                            PostBackUrl="~/Student/studentProfile.aspx" CausesValidation="False" OnClick="CancelButton_Click">
                          <i class="fas fa-times"></i> Exit
                        </asp:LinkButton>
                    </div>

                    <div class="col-4">
                        <asp:LinkButton ID="PostButton" runat="server"
                            CssClass="btn btn-success btn-lg form-control" OnClick="PostButton_Click">
                          <i class="fas fa-paper-plane"></i> Post
                        </asp:LinkButton>
                    </div>

                    <div class="col-4">
                        <asp:LinkButton ID="ClearButton" runat="server"
                            CssClass="btn btn-danger btn-lg form-control" OnClick="ClearButton_Click"
                            >
                             <i class="fas fa-trash-alt"></i> Clear
                        </asp:LinkButton>
                    </div>
                </div>
    </div>
</asp:Content>

