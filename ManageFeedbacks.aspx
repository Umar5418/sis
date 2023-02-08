<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.master" AutoEventWireup="true" CodeFile="ManageFeedbacks.aspx.cs" Inherits="Admin_ViewFeedbacks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../packages/CSS_file_2.css" rel="stylesheet" />
    <style>
       #contain {
            min-width: 80%;
            max-width: 80%;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container"  id="contain">

        <div class="row p-3">

            <div class="col-12">
                <h5 class="alert alert-primary alert-dismissible fade show ">
                    <i class="fa-solid fa-comments"></i> Manage All Feedbacks Here...
                </h5>
            </div>

            <div class="col-12 mb-2">
                <asp:LinkButton ID="backToAdminBtn" runat="server"
                    CssClass="btn btn-warning" PostBackUrl="~/Admin/adminProfile.aspx">
                <i class="fas fa-arrow-left-rotate"></i> Back to Admin Panel
                </asp:LinkButton>
            </div>

            <div class="col-12">
                <asp:GridView ID="GridViewComplaints" runat="server" AutoGenerateColumns="False"
                    CellPadding="4" DataKeyNames="FeedbackId" DataSourceID="SqlDataSourceComplaints" 
                    CssClass="table table-hover  table-borderless"  style="border:0">
                    <AlternatingRowStyle BackColor="Transparent" ForeColor="Black" />
                    <Columns>
                        <asp:BoundField DataField="FeedbackId" HeaderText="Feedback Id" ReadOnly="True" SortExpression="FeedbackId">
                            <ItemStyle HorizontalAlign="Justify" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                            <ItemStyle HorizontalAlign="Justify" />
                        </asp:BoundField>
                        <asp:BoundField DataField="FeedbackSubject" HeaderText="Subject" SortExpression="FeedbackSubject">
                            <ItemStyle HorizontalAlign="Justify" />
                        </asp:BoundField>
                        <asp:BoundField DataField="FeedbackStatus" HeaderText="Status" SortExpression="FeedbackStatus">
                            <ItemStyle HorizontalAlign="Justify" />
                        </asp:BoundField>
                        <asp:BoundField DataField="FeedbackReply" HeaderText="FeedbackReply" SortExpression="FeedbackReply">
                            <ItemStyle HorizontalAlign="Justify"  Width="20%"/>
                        </asp:BoundField>

                        <asp:TemplateField HeaderText="Reply Option">
                            <ItemTemplate>
                                <asp:LinkButton ID="FeedbackReplyButton" runat="server" CssClass="btn btn-warning"
                                    CommandArgument='<%#Eval("FeedbackId") %>' OnClick="FeedbackReplyButton_Click">
                                    <i class="fas fa-reply"></i> Reply
                                </asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:TemplateField  HeaderText="Delete Option">
                            <ItemTemplate>
                                <asp:LinkButton ID="DeleteLinkButton" runat="server" CausesValidation="False"
                                    CommandName="Delete" CssClass="btn btn-danger"
                                    OnClientClick="return confirm('Delete Confirmation !!. Are you sure you want to delete this record ?')">
                                        <i class="fas fa-trash"></i> Delete
                                </asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#7431F9" Font-Bold="True" ForeColor="White" BorderStyle="None" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
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
                SelectCommand="SELECT [FeedbackId], [Name], [FeedbackSubject], 
                [FeedbackStatus], [FeedbackReply] FROM [FeedbackDetails] 
                ORDER BY [FeedbackId] DESC"
                DeleteCommand="DELETE FROM [FeedbackDetails] WHERE [FeedbackId] = @FeedbackId"
                InsertCommand="INSERT INTO [FeedbackDetails] ([FeedbackId], [Name], [FeedbackSubject], 
                                               [FeedbackStatus], [FeedbackReply]) 
                               VALUES (@FeedbackId, @Name, @FeedbackSubject, @FeedbackStatus,@FeedbackReply)"
                UpdateCommand="UPDATE [FeedbackDetails] SET [Name] = @Name,[FeedbackSubject] = @FeedbackSubject, 
                                      [FeedbackStatus] = @FeedbackStatus, [FeedbackReply] = @FeedbackReply
                               WHERE [FeedbackId] = @FeedbackId">
                <deleteParameters>
                    <asp:Parameter Name="FeedbackId" Type="Int32" />
                </deleteParameters>
                <insertparameters>
                    <asp:Parameter Name="FeedbackId" Type="Int32" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="FeedbackSubject" Type="String" />
                    <asp:Parameter Name="FeedbackStatus" Type="String" />
                    <asp:Parameter Name="FeedbackReply" Type="String" />
                </insertparameters>
                <updateparameters>
                     <asp:Parameter Name="FeedbackId" Type="Int32" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="FeedbackSubject" Type="String" />
                    <asp:Parameter Name="FeedbackStatus" Type="String" />
                    <asp:Parameter Name="FeedbackReply" Type="String" />
                </updateparameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

