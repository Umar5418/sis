<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.master" AutoEventWireup="true" CodeFile="ManageScholarships.aspx.cs" Inherits="Accounts_ManageScholarships" %>

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
                <asp:LinkButton ID="LinkButton1" runat="server"
                    CssClass="btn btn-warning btn-lg mb-2" PostBackUrl="~/Admin/adminProfile.aspx">
                    <i class="fas fa-arrow-left-rotate"></i> Back to Admin Panel
                </asp:LinkButton>
            </div>

            <div class="col-12">
                <h5 class="alert alert-warning alert-dismissible fade show">
                    <i class="fa fa-search-plus"></i> Manage Scholarships Here . . .
                </h5>
            </div>

            <div class="col-12">
                <asp:GridView ID="GridViewScholarship" runat="server" AutoGenerateColumns="False" 
                    CssClass="table table-hover table-borderless" CellPadding="4" DataKeyNames="ScholarshipId" 
                    DataSourceID="SqlDataSourceScholarship" ForeColor="#333333" GridLines="None"   style="border:0">
                    <alternatingrowstyle backcolor="White" forecolor="#284775" />
                    <columns>
                        <asp:BoundField DataField="ScholarshipId" HeaderText="Scholarship Id" ReadOnly="True" SortExpression="ScholarshipId">
                            <ItemStyle HorizontalAlign="Justify" />
                        </asp:BoundField>

                        <asp:BoundField DataField="UserName" HeaderText="User Name" SortExpression="UserName">
                            <ItemStyle HorizontalAlign="Justify" />
                        </asp:BoundField>

                        <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName">
                            <ItemStyle HorizontalAlign="Justify" />
                        </asp:BoundField>

                        <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName">
                            <ItemStyle HorizontalAlign="Justify" />
                        </asp:BoundField>

                        <asp:BoundField DataField="ScholarshipApprovalStatus" HeaderText="Scholarship Approval Status"
                            SortExpression="ScholarshipApprovalStatus">
                            <ItemStyle HorizontalAlign="Justify" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Reply Option">
                            <itemtemplate>
                                <asp:LinkButton ID="VerifyButton" runat="server" CssClass="btn btn-warning"
                                    CommandArgument='<%#Eval("ScholarshipId") %>' OnClick="VerifyButton_Click">
                                    <i class="fas fa-reply"></i> Verify
                                </asp:LinkButton>
                            </itemtemplate>
                            <itemstyle horizontalalign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField  HeaderText="Delete Option">
                            <itemtemplate>
                                <asp:LinkButton ID="DeleteLinkButton" runat="server" CausesValidation="False"
                                    CommandName="Delete" CssClass="btn btn-danger"
                                    OnClientClick="return confirm('Delete Confirmation !!. Are you sure you want to delete this record ?')">
                                    <i class="fas fa-trash"></i> Delete
                                </asp:LinkButton>
                            </itemtemplate>
                            <itemstyle horizontalalign="Center" />
                        </asp:TemplateField>
                    </columns>
                    <editrowstyle backcolor="#999999" />
                    <footerstyle backcolor="#5D7B9D" font-bold="True" forecolor="White" />
                    <headerstyle backcolor="#7431F9" font-bold="True" forecolor="White" borderstyle="None" />
                    <pagerstyle backcolor="#284775" forecolor="White" horizontalalign="Center" />
                    <rowstyle backcolor="#F7F6F3" forecolor="#333333" />
                    <selectedrowstyle backcolor="#E2DED6" font-bold="True" forecolor="#333333" />
                    <sortedascendingcellstyle backcolor="#E9E7E2" />
                    <sortedascendingheaderstyle backcolor="#506C8C" />
                    <sorteddescendingcellstyle backcolor="#FFFDF8" />
                    <sorteddescendingheaderstyle backcolor="#6F8DAE" />
                </asp:GridView>
                
            </div>
            <asp:SqlDataSource ID="SqlDataSourceScholarship" runat="server"
                ConnectionString="<%$ ConnectionStrings:studentCS %>"
                SelectCommand="SELECT [ScholarshipId], [UserName], [FirstName], [LastName], 
                [ScholarshipApprovalStatus] FROM [ScholarshipDetails] 
                ORDER BY [ScholarshipId] DESC"
                DeleteCommand="DELETE FROM [ScholarshipDetails] WHERE [ScholarshipId] = @ScholarshipId"
                InsertCommand="INSERT INTO [ScholarshipDetails] 
                                            ([ScholarshipId], 
                                            [UserName], 
                                            [FirstName],                
                                            [LastName], 
                                            [ScholarshipApprovalStatus]) 
                                     VALUES 
                                            (@ScholarshipId, 
                                            @UserName, 
                                            @FirstName, 
                                            @LastName, 
                                            @ScholarshipApprovalStatus)"
                UpdateCommand="UPDATE [ScholarshipDetails] 
                               SET 
                                      [UserName] = @UserName, 
                                      [FirstName] = @FirstName, 
                                      [LastName] = @LastName, 
                                      [ScholarshipApprovalStatus] = @ScholarshipApprovalStatus 
                               WHERE [ScholarshipId] = @ScholarshipId">
                <deleteparameters>
                    <asp:Parameter Name="ScholarshipId" Type="Int32" />
                </deleteparameters>
                <insertparameters>
                    <asp:Parameter Name="ScholarshipId" Type="Int32" />
                    <asp:Parameter Name="UserName" Type="String" />
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="ScholarshipApprovalStatus" Type="String" />
                </insertparameters>
                <updateparameters>
                    <asp:Parameter Name="UserName" Type="String" />
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="ScholarshipApprovalStatus" Type="String" />
                    <asp:Parameter Name="ScholarshipId" Type="Int32" />
                </updateparameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

