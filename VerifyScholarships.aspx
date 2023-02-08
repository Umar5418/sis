<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.master" AutoEventWireup="true" CodeFile="VerifyScholarships.aspx.cs" Inherits="Admin_VerifyScholarships" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../packages/CSS_file_2.css" rel="stylesheet" />
    <style>
        #contain {
            min-width: 85%;
            max-width: 85%;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container" id="contain">
        <div class="row p-3">

            <div class="col-12">
                <h5 class="alert alert-primary alert-dismissible fade show ">
                    <i class="fa-solid fa-check-double"></i> Verify Scholarship Applications here...
                </h5>
            </div>

            <div class="col-12">
                <strong>
                    <asp:Label ID="MessageLabel" runat="server" Text=""
                        CssClass="fa fa-exclamation" Visible="false" Width="100%">
                    </asp:Label>
                </strong>
            </div>
            <%--Scholarship ID--%>
            <div class="col-3 mt-3">
                <asp:Label ID="Label2" runat="server" CssClass="form-label"
                    Text="Scholarship Application ID: ">
                </asp:Label>
                <asp:Label ID="ScholarshipIdLabel" CssClass="form-control" runat="server">
                </asp:Label>
            </div>

            <%--User Name--%>
            <div class="col-3 mt-3">
                <asp:Label ID="Label4" runat="server" CssClass="form-label" Text="User Name: ">
                </asp:Label>
                <asp:Label ID="UserNameLabel" CssClass="form-control" runat="server" Text="">
                </asp:Label>
            </div>

            <%--First Name--%>
            <div class="col-3 mt-3">
                <asp:Label ID="Label5" runat="server" CssClass="form-label" Text="First Name: ">
                </asp:Label>
                <asp:Label ID="FirstNameLabel" CssClass="form-control" runat="server">
                </asp:Label>
            </div>

            <%--Last Name--%>
            <div class="col-3 mt-3">
                <asp:Label ID="Label1" runat="server" CssClass="form-label" Text="Last Name: ">
                </asp:Label>
                <asp:Label ID="LastNameLabel" CssClass="form-control" runat="server">
                </asp:Label>
            </div>

            <%--Gender--%>
            <div class="col-3 mt-3">
                <asp:Label ID="Label8" runat="server" CssClass="form-label" Text="Gender: ">
                </asp:Label>
                <asp:Label ID="Genderlabel" runat="server" CssClass="form-control">
                </asp:Label>
            </div>

            <%--Category--%>
            <div class="col-3 mt-3">
                <asp:Label ID="Label9" runat="server" CssClass="form-label" Text="Category: ">
                </asp:Label>
                <asp:Label ID="CategoryLabel" runat="server" CssClass="form-control">
                </asp:Label>
            </div>

            <%--Qualification--%>
            <div class="col-3 mt-3">
                <asp:Label ID="Label7" runat="server" CssClass="form-label" Text="Qualification: ">
                </asp:Label>
                <asp:Label ID="QualificationLabel" runat="server" CssClass="form-control">
                </asp:Label>
            </div>

            <%--Percentage--%>
            <div class="col-3 mt-3">
                <asp:Label ID="Label723" runat="server" CssClass="form-label" Text="Percentage: ">
                </asp:Label>
                <asp:Label ID="PercentageLabel" runat="server" CssClass="form-control">
                </asp:Label>
            </div>

            <%--Qualification Certificate--%>
            <div class="col-3 mt-3">
                <asp:Label ID="Label10" runat="server" CssClass="form-label" Text="Qualification: ">
                </asp:Label>
                <asp:HyperLink ID="QualificationCertificateHyperLink" runat="server"
                    CssClass="form-control"  BackColor="#6666f">
                        <i class="fas fa-image"></i> View Certificate
                </asp:HyperLink>
            </div>


            <%--Religion--%>
            <div class="col-3 mt-3">
                <asp:Label ID="Label11" runat="server" CssClass="form-label" Text="Religion: ">
                </asp:Label>
                <asp:Label ID="ReligionLabel" runat="server" CssClass="form-control">
                </asp:Label>
            </div>

            <%--Minority religion Status--%>
            <div class="col-3 mt-3">
                <asp:Label ID="Label13" runat="server" CssClass="form-label" Text="Minority Religion Status: ">
                </asp:Label>
                <asp:Label ID="MinorityReligionStatusLabel" runat="server" CssClass="form-control">
                </asp:Label>
            </div>

            <%--Total Income--%>
            <div class="col-3 mt-3">
                <asp:Label ID="Label12" runat="server" CssClass="form-label" Text="Total Income: ">
                </asp:Label>
                <asp:Label ID="TotalIncomeLabel" runat="server" CssClass="form-control">
                </asp:Label>
            </div>

            <%--Income Certificate--%>
            <div class="col-3 mt-3">
                <asp:Label ID="Label15" runat="server" CssClass="form-label" Text="Income Certificate: ">
                </asp:Label>
                <asp:HyperLink ID="IncomeCertificateHyperLink" runat="server"
                    CssClass="form-control" BackColor="#6666f">
                        <i class="fas fa-image"></i>  View Certificate
                </asp:HyperLink>
            </div>

            <%--Scholarship Approval Status--%>
            <div class="col-3 mt-3">
                <asp:Label ID="Label6" runat="server" CssClass="form-label" Text="Scholarship Approval Status : ">
                </asp:Label>
                <asp:DropDownList ID="ScholarshipApprovalStatusDropDownList" runat="server" CssClass="form-select">
                    <asp:ListItem Text="Approved"></asp:ListItem>
                    <asp:ListItem Text="Rejected"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="ScholarshipApprovalStatusRequiredFieldValidator"
                    runat="server" ErrorMessage="Scholarship Approval Status is Required"
                    ControlToValidate="ScholarshipApprovalStatusDropDownList" ForeColor="Red"
                    Display="Dynamic" InitialValue="-1">
                </asp:RequiredFieldValidator>
            </div>


            <%--Scholarship Verification--%>
            <div class="col-6 mt-3">
                <asp:Label ID="Label3" runat="server" CssClass="form-label" Text="Comments : "></asp:Label>
                    <asp:TextBox ID="ScholarshipVerifyTextBox" runat="server"
                        placeholder="Please mention the reasons of approval or rejection of Scholarship" 
                        TextMode="MultiLine" CssClass="form-control" Height="150px">
                    </asp:TextBox>
                    <asp:RequiredFieldValidator ID="ScholarshipVerifyRequiredFieldValidator"
                        runat="server" ErrorMessage="Scholarship Verification Reply is Required"
                        ControlToValidate="ScholarshipVerifyTextBox" ForeColor="Red" Display="Dynamic">
                    </asp:RequiredFieldValidator>
            </div>

            <%--Cancel , Send , Clear Buttons--%>
            <div class="mt-3 mb-3"></div>

            <div class="col-3">
                <asp:LinkButton ID="ExitButton" runat="server"
                    CssClass="btn btn-primary btn-lg form-control"
                    PostBackUrl="~/Admin/adminProfile.aspx" CausesValidation="False">
                        <i class="fas fa-times"></i> Exit
                </asp:LinkButton>
            </div>

            <div class="col-3">
                <asp:LinkButton ID="VerifyScholarshipButton" runat="server"
                    CssClass="btn btn-success btn-lg form-control" OnClick="VerifyScholarshipButton_Click">
                        <i class="fas fa-paper-plane"></i> Verify
                </asp:LinkButton>
            </div>

        <div class="col-3">
            <asp:LinkButton ID="ViewAllScholarshipsLinkButton" runat="server"
                CssClass="btn btn-warning btn-lg form-control"
                PostBackUrl="~/Admin/ManageScholarships.aspx" CausesValidation="False">
                    <i class="fas fa-eye"></i>  View All Scholarships
            </asp:LinkButton>
        </div>

        <div class="col-3">
            <asp:LinkButton ID="ClearScholarshipButton" runat="server"
                CssClass="btn btn-danger btn-lg form-control" CausesValidation="False">
                            <i class="fas fa-trash-alt"></i> Clear
            </asp:LinkButton>
        </div>

        </div>
    </div>
</asp:Content>

