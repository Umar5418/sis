<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Account_Login" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="packages/CSS_file_2.css" rel="stylesheet" />
    <style>

        #contain {
            min-width: 40%;
            max-width: 40%;
        }
    </style>
  
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="container" id="contain">
        <div class="row"> 

            <div class="col-12 mt-3">
                <h5 class="alert alert-success alert-dismissible fade show animate">
                    <i class="fa fa-arrow-right-to-bracket"></i> Login here.
                </h5>
            </div>

            <div class="col-12 mt-1 mb-1">
                <strong>
                    <asp:Label ID="errorMessageLabel" runat="server"
                        Visible="false" ForeColor="Red" Width="100%">
                    </asp:Label>
                </strong>
            </div>

            <div class="col-12 mb-3">
                <asp:TextBox ID="userNameTextBox" CssClass="form-control form-control-lg"
                    runat="server" TextMode="SingleLine" placeholder="Enter Username"></asp:TextBox>
                <asp:RequiredFieldValidator ID="UserNameRequiredFieldValidator" runat="server"
                    ErrorMessage="Username is Required" ControlToValidate="userNameTextBox"
                    Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </div>

            <div class="col-12 mb-3">
                <asp:TextBox ID="passwordTextBox" CssClass="form-control form-control-lg"
                    runat="server" TextMode="Password" placeholder="Enter Password">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="PasswordRequiredFieldValidator" runat="server"
                    ErrorMessage="Password is Required" ControlToValidate="passwordTextBox"
                    Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </div>

            <div class="col-12 mb-3">
                <asp:CheckBox ID="rememberMeCheckBox" runat="server"  CssClass="" />
                <asp:Label ID="CheckBoxLabel" Text="Remember Me" runat="server"  CssClass="form-check-label"/>
            </div>

            <div class="col-2"></div>

            <div class="col-4 mb-3">
                <asp:LinkButton ID="LoginButton" runat="server" OnClick="LoginButton_Click"
                    CssClass="btn btn-success form-control btn-lg">
                             <span class="fas fa-sign-in-alt"></span> Login
                </asp:LinkButton>
            </div>

            <div class="col-4 mb-3">
                <asp:LinkButton ID="ResetButton" runat="server" OnClick="ResetButton_Click"
                    CssClass="btn btn-danger form-control btn-lg" CausesValidation="False">
                            <span class="fas fa-trash"></span> Reset
                </asp:LinkButton>
            </div>

            <div class="col-2"></div>
            
            
            <div class="col-6">
                <asp:HyperLink NavigateUrl="~/Student/RegistrationInstructions.aspx" runat="server"
                    Text="New User? Register Here..." CssClass="page-link link-success animate" />
            </div>
            <div class="col-6">
                <asp:HyperLink NavigateUrl="/forgotPassword.aspx" runat="server"
                    Text="Forgot Password?" CssClass="page-link link-danger" />
            </div>
            
            <div class="mt-3"></div>
        </div>
    </div>
</asp:Content>

