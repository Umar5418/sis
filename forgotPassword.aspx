<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.master" AutoEventWireup="true" CodeFile="forgotPassword.aspx.cs" Inherits="Manage_resetPassword" %>


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
        <div class="row p-4">

            <div class="col-12 mt-4 mb-1">
                <h5 class="alert alert-success alert-dismissible fade show ">
                    <i class="fas fa-recycle"></i> Reset your password...
                </h5>
            </div>
<%-------------------------------Message Label-------------------------------%>
            <div class="col-12 mt-3">
                <strong>
                    <asp:Label ID="MessageLabel" runat="server" Text=""
                        Visible="false" Width="100%">
                    </asp:Label>
                </strong>
<%-------------------------------User Name-------------------------------%>
            </div>
            <div class="col-6 mt-3">
                <asp:Label ID="Label5" runat="server" CssClass="col-md-4 col-form-label" Text="Username: "></asp:Label>
                    <asp:TextBox ID="userNameTextBox" runat="server" CssClass="form-control" placeholder="Enter Your Username"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="UserNameRequiredFieldValidator" runat="server"
                        ErrorMessage="Username is Required" ControlToValidate="UsernameTextBox"
                        Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </div>
<%-------------------------------D.O.B-------------------------------%>
            <div class="col-6 mt-3">
                <asp:Label ID="Label6" runat="server" CssClass="col-md-4 col-form-label" Text="Date of Birth: "></asp:Label>
                    <asp:TextBox ID="dobTextBox" runat="server" CssClass="form-control" 
                        placeholder="Enter Your Date of Birth" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="dobRequiredFieldValidator"
                        runat="server" ErrorMessage="Date Of Birth is Required"
                        ControlToValidate="dobTextBox" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="dobRegularExpFieldValidator"
                    runat="server" ErrorMessage="Invalid Date of Birth" ValidationExpression=""
                    ControlToValidate="dobTextBox" ForeColor="Red"
                    Display="Dynamic" InitialValue="-1"></asp:RequiredFieldValidator>
                <asp:RangeValidator ErrorMessage="Invalid Date of Birth" ForeColor="Red" 
                    ControlToValidate="dobTextBox" runat="server" MinimumValue="1900" MaximumValue="2001" />
            </div>
<%-------------------------------New Password-------------------------------%>
            <div class="col-6 mt-3">
                <asp:Label ID="Label2" runat="server" CssClass="col-md-4 col-form-label" Text="New Password : "></asp:Label>
                    <asp:TextBox ID="NewPasswordTextBox" runat="server" MaxLength="20"
                        TextMode="Password" CssClass="form-control" placeholder="New password">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="passwordRequiredFieldValidator"
                        runat="server" ErrorMessage="Password is Required"
                        ControlToValidate="NewPasswordTextBox" ForeColor="Red" Display="Dynamic">
                    </asp:RequiredFieldValidator>
            </div>
<%-------------------------------Confirm Password-------------------------------%>
            <div class="col-6 mt-3">
                <asp:Label ID="Label3" runat="server" CssClass="col-md-4 col-form-label" Text="Confirm  Password: "></asp:Label>
                    <asp:TextBox ID="ConfirmNewPasswordTextBox" runat="server" MaxLength="20"
                        TextMode="Password" CssClass="form-control" placeholder="Confirm password">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="confirmPasswordRequiredFieldValidator"
                        runat="server" ErrorMessage="Confirm Password is Required"
                        ControlToValidate="ConfirmNewPasswordTextBox" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="passwordCompareValidator" runat="server"
                        ErrorMessage="Password and Confirm Password Should be same"
                        ForeColor="Red" ControlToValidate="ConfirmNewPasswordTextBox"
                        ControlToCompare="NewPasswordTextBox" Type="String" Operator="Equal" Display="Dynamic"></asp:CompareValidator>
            </div>


            <div class="m-3"></div>

<%-------------------------------Cancel Button-------------------------------%>
            <div class="col-3">

                <asp:LinkButton ID="ExitButton" runat="server"
                    CssClass="btn btn-primary btn-lg form-control"
                    PostBackUrl="~/Home.aspx" CausesValidation="False">
                          <i class="fas fa-times"></i> Exit
                </asp:LinkButton>
            </div>

<%-------------------------------Cancel Button-------------------------------%>
            <div class="col-6">
                <asp:LinkButton ID="ChangePasswordButton" runat="server"
                    CssClass="btn btn-success btn-lg form-control"
                    OnClick="changePasswordButton_Click">
                                <i class="fas fa-key"></i> Change Password
                </asp:LinkButton>
            </div>

<%-------------------------------Clear Button-------------------------------%>
            <div class="col-3">
                <asp:LinkButton ID="ClearButton" runat="server"
                    CssClass="btn btn-danger btn-lg form-control"
                    OnClick="ClearButton_Click" CausesValidation="False">
                                <i class="fas fa-trash-alt"></i> Clear
                </asp:LinkButton>
            </div>

        </div>
    </div>
</asp:Content>

