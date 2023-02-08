<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.master" AutoEventWireup="true" CodeFile="ManageComplaints.aspx.cs" Inherits="Accounts_ViewAllComplaints" %>

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
                    <i class="fa-solid fa-comments"></i> Manage Complaints Here...
                </h5>
            </div>
            <div class="col-12 mb-2">
                <asp:LinkButton ID="backToAdminBtn" runat="server"
                    CssClass="btn btn-warning" PostBackUrl="~/Admin/adminProfile.aspx">
                <i class="fas fa-arrow-left-rotate"></i> Back to Admin Panel
                </asp:LinkButton>
            </div>

            <div class="col-12 border-0">
                <asp:GridView ID="GridViewComplaints" runat="server" AutoGenerateColumns="False"
                    CellPadding="4" DataKeyNames="ComplaintId" DataSourceID="SqlDataSourceComplaints"
                    CssClass="table table-hover table-borderless" Style="border: 0">
                    <AlternatingRowStyle BackColor="Transparent" ForeColor="Black" />
                    <Columns>
                        <asp:BoundField DataField="ComplaintId" HeaderText="Complaint ID" ReadOnly="True" SortExpression="ComplaintId">
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="UserName" HeaderText="User Name" ReadOnly="True" SortExpression="UserName">
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="RegisterDateTime" HeaderText=" Date of Registration" SortExpression="RegisterDateTime">
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ComplaintSubject" HeaderText="Complaint Subject" SortExpression="ComplaintSubject">
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ComplaintDetail" HeaderText="Complaint Detail" SortExpression="ComplaintDetail">
                            <ItemStyle HorizontalAlign="Left" Width="20%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ComplaintStatus" HeaderText="Complaint Status" SortExpression="ComplaintStatus">
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Reply Option">
                            <ItemTemplate>
                                <asp:LinkButton ID="ReplyButton" runat="server" CssClass="btn btn-warning"
                                    CommandArgument='<%#Eval("ComplaintId") %>' OnClick="ReplyButton_Click">
                                <i class="fas fa-reply"></i> Reply
                                </asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Delete Option">
                            <ItemTemplate>
                                <asp:LinkButton ID="DeleteLinkButton" runat="server" CausesValidation="False"
                                    CommandName="Delete" CssClass="btn btn-danger"
                                    OnClientClick="return confirm('Delete Confirmation !!. Are you sure you want to delete this record ?')">
                                    <i class="fas fa-trash"></i> Delete
                                </asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:TemplateField>

                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#7431F9" Font-Bold="True" ForeColor="White" BorderStyle="None" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Left" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </div>
            <asp:SqlDataSource ID="SqlDataSourceComplaints" runat="server"
                ConnectionString="<%$ ConnectionStrings:studentCS %>"
                SelectCommand="SELECT * FROM [ComplaintDetails] ORDER BY [ComplaintId] DESC"
                DeleteCommand="DELETE FROM [ComplaintDetails] WHERE [ComplaintId] = @ComplaintId"
                InsertCommand="INSERT INTO [ComplaintDetails] 
                                           ([ComplaintId], 
                                            [UserName], 
                                            [ComplaintSubject],     
                                            [ComplaintDetail], 
                                            [ComplaintStatus], 
                                            [ComplaintReply]) 
                                     VALUES (@ComplaintId, 
                                             @UserName, 
                                             @ComplaintSubject, 
                                             @ComplaintStatus,
                                             @ComplaintReply,
                                             @ComplaintDetail)"
                UpdateCommand="UPDATE [ComplaintDetails] 
                               SET 
                                      [UserName] = @UserName,
                                      [ComplaintSubject] = @ComplaintSubject, 
                                      [ComplaintDetail] = @ComplaintDetail, 
                                      [ComplaintStatus] = @ComplaintStatus, 
                                      [ComplaintReply] = @ComplaintReply

                               WHERE [ComplaintId] = @ComplaintId">
                <DeleteParameters>
                    <asp:Parameter Name="ComplaintId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ComplaintId" Type="Int32" />
                    <asp:Parameter Name="UserName" Type="String" />
                    <asp:Parameter Name="ComplaintSubject" Type="String" />
                    <asp:Parameter Name="ComplaintDetail" Type="String" />
                    <asp:Parameter Name="ComplaintStatus" Type="String" />
                    <asp:Parameter Name="ComplaintReply" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ComplaintId" Type="Int32" />
                    <asp:Parameter Name="UserName" Type="String" />
                    <asp:Parameter Name="ComplaintSubject" Type="String" />
                    <asp:Parameter Name="ComplaintDetail" Type="String" />
                    <asp:Parameter Name="ComplaintStatus" Type="String" />
                    <asp:Parameter Name="ComplaintReply" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

