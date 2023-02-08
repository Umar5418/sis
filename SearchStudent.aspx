<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.master" AutoEventWireup="true" CodeFile="SearchStudent.aspx.cs" Inherits="Accounts_SearchStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../packages/CSS_file_2.css" rel="stylesheet" />
    <style>

        #contain {
            min-width: 65%;
            max-width: 65%;
        }
    </style>
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container" id ="contain">
        <div class="row m-2">

            <div class="col-12 mt-3">
                <h5 class="alert alert-primary alert-dismissible fade show ">
                    <i class="fa-solid fa-magnifying-glass"></i> Student Search...
                </h5>
            </div>

            <%------Search Name-------%>
            <div class="col-12 mt-3">
                <asp:TextBox ID="SearchTextBox" runat="server" 
                    CssClass="form-control border-0" placeholder="Search by First Name or Last Name or Gender or District or Category"
                    Height="75px" >
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="SearchTextBoxRFV"
                    runat="server" ErrorMessage="Enter First Name or Last Name or Gender or District or Category"
                    ControlToValidate="SearchTextBox" ForeColor="Red" Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>
            <div class="mt-4"></div>
            
            <div class="col-2"></div>
            <div class="col-2 ">
                <asp:LinkButton ID="ExitButton" runat="server" CssClass="btn btn-primary btn-lg form-control"
                    CausesValidation="False" PostBackUrl="~/Admin/adminProfile.aspx">
                        <i class="fas fa-times"></i> Exit
                </asp:LinkButton>
            </div>

            <div class="col-4">
                <asp:LinkButton ID="ChangePasswordButton" runat="server"
                    CssClass="btn btn-success btn-lg form-control" OnClick="SearchButton_Click">
                        <i class="fas fa-search"></i> Search
                </asp:LinkButton>
            </div>

            <div class="col-2">
                <asp:LinkButton ID="ClearButton" runat="server" CssClass="btn btn-danger btn-lg form-control"
                    CausesValidation="False" OnClick="ClearButton_Click">
                        <i class="fas fa-trash"></i> Clear
                </asp:LinkButton>
            </div>
            
            <div class="col-2"></div>

            <div class="col-12 mt-4 mb-4">
                <asp:Label ID="MessageLabel" runat="server" Text="" Visible="false"></asp:Label>
            </div>

            <div class="col-12">
                <asp:Panel runat="server" ID="SearchPanel" Visible="false">
                    <asp:Panel runat="server" GroupingText="Search Results . . ." BackColor="#7431F9"
                        CssClass="mt-2 p-2" ForeColor="White" HorizontalAlign="Justify" Font-Size="XX-Large">  
                    </asp:Panel>
                    <asp:GridView ID="GridViewSearch" runat="server" BackColor="White" BorderColor="#CCCCCC"
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="table table-hover table-borderless"
                         Style="border: 0">
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#7431F9" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle  BackColor="Transparent" ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>
                </asp:Panel>
            </div>

        </div>
    </div>
</asp:Content>

