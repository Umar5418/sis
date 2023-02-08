<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.master" AutoEventWireup="true" CodeFile="ChangePasswordAdmin.aspx.cs" Inherits="ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../packages/CSS_file_2.css" rel="stylesheet" />
    <style>
        #contain {
            min-width: 40%;
            max-width: 40%;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container" id="contain">
        <div class="row p-3">

                <div class="col-12 mt-3">
                    <h5 class="alert alert-success alert-dismissible fade show ">
                        <i class="fas fa-key"></i>  Change your password...</h5>
                </div>

                <div class="col-12 mt-3 mb-3">
                    <strong>
                        <asp:Label ID="MessageLabel" runat="server" Text=""
                            CssClass="fas fa-exclamation-circle" Visible="false">
                        </asp:Label>
                    </strong>
                </div>

                <%------Current Password-------%>
                <div class="col-12 mt-3">
                    <asp:Label ID="Label1" runat="server" CssClass="col-md-4 col-form-label" Text="Current Password : "></asp:Label>
                        <asp:TextBox ID="CurrentPasswordTextBox" runat="server" MaxLength="20"
                            TextMode="Password" CssClass="form-control form-control-lg" placeholder="Current password">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator ID="CurrentPasswordRequiredFieldValidator"
                            runat="server" ErrorMessage="Current Password is Required"
                            ControlToValidate="CurrentPasswordTextBox" ForeColor="Red" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                </div>

                <%------New Password-------%>
                <div class="col-12 mt-3">
                    <asp:Label ID="Label2" runat="server" CssClass="col-md-4 col-form-label" Text="New Password : "></asp:Label>
                        <asp:TextBox ID="NewPasswordTextBox" runat="server" MaxLength="20"
                            TextMode="Password" CssClass="form-control form-control-lg" placeholder="New password">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator ID="NewPasswordRequiredFieldValidator"
                            runat="server" ErrorMessage="Password is Required"
                            ControlToValidate="NewPasswordTextBox" ForeColor="Red" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                </div>

                <%------Confirm New Password-------%>
                <div class="col-12 mt-3">
                    <asp:Label ID="Label3" runat="server" CssClass="col-md-4 col-form-label" Text="Confirm  Password: "></asp:Label>
                    <asp:TextBox ID="ConfirmNewPasswordTextBox" runat="server" MaxLength="20"
                        TextMode="Password" CssClass="form-control form-control-lg" placeholder="Confirm password">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequiredFieldValidator"
                        runat="server" ErrorMessage="Confirm Password is Required"
                        ControlToValidate="ConfirmNewPasswordTextBox" ForeColor="Red" Display="Dynamic">
                    </asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="passwordCompareValidator" runat="server"
                        ErrorMessage="Password and Confirm Password Should be same"
                        ForeColor="Red" ControlToValidate="ConfirmNewPasswordTextBox"
                        ControlToCompare="NewPasswordTextBox" Type="String" Operator="Equal" Display="Dynamic">
                    </asp:CompareValidator>
                </div>

                <div class="mt-3"></div>
                <div class="col-6">
                    <asp:LinkButton ID="ChangePasswordButton" runat="server" 
                        CssClass="btn btn-success btn-lg form-control"
                        OnClick="ChangePasswordButton_Click">
                                <i class="fas fa-key"></i> Change Password
                    </asp:LinkButton>
                 </div>

                <div class="col-6">
                    <asp:LinkButton ID="CancelButton" runat="server" 
                        CssClass="btn btn-danger btn-lg form-control"
                        OnClick="CancelButton_Click" CausesValidation="False">
                                <i class="fas fa-trash-alt"></i> Cancel
                    </asp:LinkButton>
                </div>
            
        </div>
    </div>
</asp:Content>

