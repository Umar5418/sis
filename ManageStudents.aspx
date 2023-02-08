<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.master" AutoEventWireup="true" CodeFile="ManageStudents.aspx.cs" Inherits="Accounts_ManageStudents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../packages/CSS_file_2.css" rel="stylesheet" />
    <style>
        #contain {
            min-width: 90%;
            max-width: 90%;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container-fluid" id="contain">
        <div class="row">
                <!-------- Message label--------->
                <div class="col-12">
                    <asp:Label ID="MessageLabel" runat="server"></asp:Label> <br />
                </div>

                <!--  Students Grid View Control -->
                <div class="col-6">
                        <asp:LinkButton ID="BackLinkButton" runat="server" CssClass="btn btn-warning btn-lg mb-2" 
                            PostBackUrl="~/Admin/adminProfile.aspx">
                            <i class="fas fa-arrow-left-rotate"></i>  Back to Admin Page 
                        </asp:LinkButton>
                    <asp:GridView ID="GridViewStudent" runat="server" AutoGenerateColumns="False"
                            CellPadding="4" CssClass="table" DataKeyNames="StudentId" DataSourceID="GridViewStudentSqlDataSource"
                            ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:TemplateField  HeaderText="View Student">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="ViewButton" runat="server" CausesValidation="False"
                                            CommandName="Select" CssClass="btn btn-warning">
                                    View <i class="fa-solid fa-eye"></i>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="StudentId" HeaderText="Student Id" InsertVisible="False" ReadOnly="True" SortExpression="StudentId">
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName">
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName">
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Course" HeaderText="Course" SortExpression="Course">
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender">
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category">
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#7431F9" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                    <asp:SqlDataSource ID="GridViewStudentSqlDataSource" runat="server"
                        ConnectionString="<%$ ConnectionStrings:studentCS %>"
                        SelectCommand="SELECT [StudentId], [FirstName], [LastName], [Course], [Gender], [Category] FROM [students]">
                    </asp:SqlDataSource>

                </div>

                <!-- Students Details View Control -->
                <div class="col-6">
                     <!--------  Message label--------->
                    
                    <div class="mt-5"></div>
                     <!--------  Details View--------->
                    <asp:DetailsView ID="DetailsViewStudent" runat="server" Height="50px" CellPadding="4" CssClass="table table-hover"
                        DataSourceID="DetailsViewStudentSqlDataSource" ForeColor="#333333" GridLines="None"
                        OnItemDeleted="DetailsViewStudent_ItemDeleted"
                        OnItemInserted="DetailsViewStudent_ItemInserted"
                        OnItemUpdated="DetailsViewStudent_ItemUpdated" AutoGenerateRows="False" DataKeyNames="StudentId" Width="100%">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                        <EditRowStyle BackColor="#F8F9FA" />
                        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                        <Fields>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update"
                                        OnClientClick="return confirm('Update Confirmation !!. Are you sure you want to Update this record ?')" />
                                    <asp:Button ID="CancelButtonOne" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                                    <asp:Button ID="CancelButtonTwo" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </InsertItemTemplate>
                                <ItemTemplate>

                                    <asp:Button ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />

                                    <asp:Button ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"
                                        OnClientClick="return confirm('Delete Confirmation !!. Are you sure you want to delete this record ?')" />
                                </ItemTemplate>
                                <ControlStyle CssClass="btn btn-primary float-right m-1" />
                            </asp:TemplateField>

                            <%--StudentId--%>
                            <asp:TemplateField HeaderText="Student Id" InsertVisible="False" SortExpression="StudentId">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("StudentId") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label21" runat="server" Text='<%# Bind("StudentId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <%--UserName--%>
                            <asp:TemplateField HeaderText="User Name" SortExpression="UserName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="UserNameTextBox" runat="server" ReadOnly="true" CssClass="form-control" Text='<%# Bind("UserName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="UserNameTextBox" runat="server" ReadOnly="true" CssClass="form-control" Text='<%# Bind("UserName") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequiredFieldValidator" runat="server"
                                        ErrorMessage="Username is Required" SetFocusOnError="True"
                                        Display="Dynamic" ControlToValidate="UserNameTextBox" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" ReadOnly="true" Text='<%# Bind("UserName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <%--First Name--%>
                            <asp:TemplateField HeaderText="First Name" SortExpression="FirstName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="FirstNameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="FirstNameRequiredFieldValidator" runat="server"
                                        ErrorMessage="First Name is Required" SetFocusOnError="True"
                                        Display="Dynamic" ControlToValidate="FirstNameTextBox" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="firstNameRegularExpressionValidator" runat="server"
                                        ErrorMessage="Numeric and special characters, not allowed"
                                        ValidationExpression="^[A-Za-z\s]{1,}[\.]{0,1}[A-Za-z\s]{0,}$"
                                        ControlToValidate="FirstNameTextBox" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="FirstNameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="FirstNameRequiredFieldValidator" runat="server"
                                        ErrorMessage="First Name is Required" SetFocusOnError="True"
                                        Display="Dynamic" ControlToValidate="FirstNameTextBox" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                     <asp:RegularExpressionValidator ID="firstNameRegularExpressionValidator" runat="server"
                                        ErrorMessage="Numeric and special characters, not allowed"
                                        ValidationExpression="^[A-Za-z\s]{1,}[\.]{0,1}[A-Za-z\s]{0,}$"
                                        ControlToValidate="FirstNameTextBox" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <%--Last Name--%>
                            <asp:TemplateField HeaderText="Last Name" SortExpression="LastName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="LastNameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("LastName") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="LastNameRequiredFieldValidator" runat="server"
                                        ErrorMessage="Last Name is Required" SetFocusOnError="True"
                                        Display="Dynamic" ControlToValidate="LastNameTextBox" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="lastNameRegularExpressionValidator" runat="server"
                                        ErrorMessage="Numeric and special characters, not allowed"
                                        ValidationExpression="^[A-Za-z\s]{1,}[\.]{0,1}[A-Za-z\s]{0,}$"
                                        ControlToValidate="LastNameTextBox" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="LastNameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("LastName") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="LastNameRequiredFieldValidator" runat="server"
                                        ErrorMessage="Last Name is Required" SetFocusOnError="True"
                                        Display="Dynamic" ControlToValidate="LastNameTextBox" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="lastNameRegularExpressionValidator" runat="server"
                                        ErrorMessage="Numeric and special characters, not allowed"
                                        ValidationExpression="^[A-Za-z\s]{1,}[\.]{0,1}[A-Za-z\s]{0,}$"
                                        ControlToValidate="LastNameTextBox" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <%--Email--%>
                            <asp:TemplateField HeaderText="Email" SortExpression="Email">
                                <EditItemTemplate>
                                    <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Email") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="emailRequiredFieldValidator"
                                        runat="server" ErrorMessage="Email is Required"
                                        ControlToValidate="EmailTextBox" ForeColor="Red" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="emailRegularExpressionValidator" runat="server"
                                        ErrorMessage="Invalid Email" ControlToValidate="emailTextBox" ForeColor="Red"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic">
                                    </asp:RegularExpressionValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Email") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="emailRequiredFieldValidator"
                                        runat="server" ErrorMessage="Email is Required"
                                        ControlToValidate="EmailTextBox" ForeColor="Red" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="emailRegularExpressionValidator" runat="server"
                                        ErrorMessage="Invalid Email" ControlToValidate="EmailTextBox" ForeColor="Red"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic">
                                    </asp:RegularExpressionValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <%--Phone Number--%>
                            <asp:TemplateField HeaderText="Phone No" SortExpression="PhoneNo">
                                <EditItemTemplate>
                                    <asp:TextBox ID="PhoneNoTextBox" runat="server" CssClass="form-control" Text='<%# Bind("PhoneNo") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PhoneNoRequiredFieldValidator" runat="server"
                                        ErrorMessage="Phone No is Required" SetFocusOnError="True"
                                        Display="Dynamic" ControlToValidate="PhoneNoTextBox" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="PhoneNoRegularExpressionValidator" runat="server"
                                        ErrorMessage="Invalid Phone Number" ControlToValidate="PhoneNoTextBox" ForeColor="Red" Display="Dynamic"
                                        ValidationExpression="^[2-9]{2}[0-9]{8}$">
                                    </asp:RegularExpressionValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="PhoneNoTextBox" runat="server" CssClass="form-control" Text='<%# Bind("PhoneNo") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PhoneNoRequiredFieldValidator" runat="server"
                                        ErrorMessage="Phone No is Required" SetFocusOnError="True"
                                        Display="Dynamic" ControlToValidate="PhoneNoTextBox" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="PhoneNoRegularExpressionValidator" runat="server"
                                        ErrorMessage="Invalid Phone Number" ControlToValidate="PhoneNoTextBox" ForeColor="Red" Display="Dynamic"
                                        ValidationExpression="^[2-9]{2}[0-9]{8}$">
                                    </asp:RegularExpressionValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("PhoneNo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <%--Aadhaar Number--%>
                            <asp:TemplateField HeaderText="Aadhaar No" SortExpression="AadhaarNo">
                                <EditItemTemplate>
                                    <asp:TextBox ID="AadhaarNoTextBox"
                                        runat="server" CssClass="form-control" Text='<%# Bind("AadhaarNo") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="AadhaarNoRequiredFieldValidator"
                                        runat="server" ErrorMessage="Aadhaar Number is Required"
                                        ControlToValidate="AadhaarNoTextBox" ForeColor="Red" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="AadhaarNoRegularExpressionValidator" runat="server"
                                        ErrorMessage="Invalid Aadhaar Number" ControlToValidate="AadhaarNoTextBox" ForeColor="Red" Display="Dynamic"
                                        ValidationExpression="^[0-9]{10,12}$">
                                    </asp:RegularExpressionValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="AadhaarNoTextBox"
                                        runat="server" CssClass="form-control" Text='<%# Bind("AadhaarNo") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="AadhaarNoRequiredFieldValidator"
                                        runat="server" ErrorMessage="Aadhaar Number is Required"
                                        ControlToValidate="AadhaarNoTextBox" ForeColor="Red" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="AadhaarNoRegularExpressionValidator" runat="server"
                                        ErrorMessage="Invalid Aadhaar Number" ControlToValidate="AadhaarNoTextBox" ForeColor="Red" Display="Dynamic"
                                        ValidationExpression="^[0-9]{10,12}$">
                                    </asp:RegularExpressionValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("AadhaarNo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <%--Gender DDL--%>
                            <asp:TemplateField HeaderText="Gender" SortExpression="Gender">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="GenderDropDownList" runat="server" CssClass="form-select"
                                        DataSourceID="GenderDDLSqlDataSource" DataTextField="GenderName"
                                        DataValueField="GenderName" SelectedValue='<%# Bind("Gender") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="GenderDDLSqlDataSource" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:studentCS %>"
                                        SelectCommand="SELECT [GenderName] FROM [genders]"></asp:SqlDataSource>
                                    <asp:RequiredFieldValidator ID="GenderRequiredFieldValidator"
                                        runat="server" ErrorMessage="Gender is Required"
                                        ControlToValidate="GenderDropDownList" ForeColor="Red"
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="GenderDropDownList" runat="server" CssClass="form-select"
                                        DataSourceID="GenderDDLSqlDataSource" DataTextField="GenderName"
                                        DataValueField="GenderName">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="GenderDDLSqlDataSource" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:studentCS %>"
                                        SelectCommand="SELECT [GenderName] FROM [genders]"></asp:SqlDataSource>
                                    <asp:RequiredFieldValidator ID="GenderRequiredFieldValidator"
                                        runat="server" ErrorMessage="Gender is Required"
                                        ControlToValidate="GenderDropDownList" ForeColor="Red"
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <%--------------DOB--------------%>
                            <asp:TemplateField HeaderText="Dob" SortExpression="Dob">
                                <EditItemTemplate>
                                    <asp:TextBox ID="DobTextBox" runat="server" CssClass="form-control" TextMode="Date" Text='<%# Bind("Dob") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="dobRequiredFieldValidator"
                                        runat="server" ErrorMessage="Date Of Birth is Required"
                                        ControlToValidate="DobTextBox" ForeColor="Red" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                    <asp:RequiredFieldValidator ID="dobRegularExpFieldValidator"
                                        runat="server" ErrorMessage="Invalid Date of Birth" ValidationExpression=""
                                        ControlToValidate="dobTextBox" ForeColor="Red"
                                        Display="Dynamic" InitialValue="-1"></asp:RequiredFieldValidator>
                                    <asp:RangeValidator ErrorMessage="Invalid Date of Birth" ForeColor="Red"
                                        ControlToValidate="dobTextBox" runat="server" MinimumValue="1900" MaximumValue="2001" />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="DobTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Dob") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="dobRequiredFieldValidator"
                                        runat="server" ErrorMessage="Date Of Birth is Required"
                                        ControlToValidate="DobTextBox" ForeColor="Red" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                    <asp:RequiredFieldValidator ID="dobRegularExpFieldValidator"
                                        runat="server" ErrorMessage="Invalid Date of Birth" ValidationExpression=""
                                        ControlToValidate="dobTextBox" ForeColor="Red"
                                        Display="Dynamic" InitialValue="-1"></asp:RequiredFieldValidator>
                                    <asp:RangeValidator ErrorMessage="Invalid Date of Birth" ForeColor="Red"
                                        ControlToValidate="dobTextBox" runat="server" MinimumValue="1900" MaximumValue="2001" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("Dob") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <%-----Category-----%>
                            <asp:TemplateField HeaderText="Category" SortExpression="Category">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="CategoryDropDownList" runat="server" CssClass="form-select"
                                        DataSourceID="CategoryDDLSqlDataSource" DataTextField="CategoryName"
                                        DataValueField="CategoryName" SelectedValue='<%# Bind("Category") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="CategoryDDLSqlDataSource" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:studentCS %>"
                                        SelectCommand="SELECT [CategoryName] FROM [categories]"></asp:SqlDataSource>

                                    <asp:RequiredFieldValidator ID="categoryRequiredFieldValidator"
                                        runat="server" ErrorMessage="Category is Required"
                                        ControlToValidate="CategoryDropDownList" ForeColor="Red"
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="CategoryDropDownList" runat="server" CssClass="form-select"
                                        DataSourceID="CategoryDDLSqlDataSource" DataTextField="CategoryName" DataValueField="CategoryName">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="CategoryDDLSqlDataSource" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:studentCS %>"
                                        SelectCommand="SELECT [CategoryName] FROM [categories]"></asp:SqlDataSource>

                                    <asp:RequiredFieldValidator ID="categoryRequiredFieldValidator"
                                        runat="server" ErrorMessage="Category is Required"
                                        ControlToValidate="CategoryDropDownList" ForeColor="Red"
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("Category") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <%--Religion--%>
                            <asp:TemplateField HeaderText="Religion" SortExpression="Religion">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ReligionDropDownList" runat="server" CssClass="form-select"
                                        DataSourceID="ReligionSqlDataSource" DataTextField="ReligionName"
                                        DataValueField="ReligionName" SelectedValue='<%# Bind("Religion") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="ReligionSqlDataSource" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:studentCS %>"
                                        SelectCommand="SELECT [ReligionName] FROM [religions]"></asp:SqlDataSource>
                                    <asp:RequiredFieldValidator ID="religionRequiredFieldValidator"
                                        runat="server" ErrorMessage="Religion is Required"
                                        ControlToValidate="ReligionDropDownList" ForeColor="Red"
                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="ReligionDropDownList" runat="server" CssClass="form-select"
                                        DataSourceID="ReligionSqlDataSource" DataTextField="ReligionName"
                                        DataValueField="ReligionName">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="ReligionSqlDataSource" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:studentCS %>"
                                        SelectCommand="SELECT [ReligionName] FROM [religions]"></asp:SqlDataSource>
                                    <asp:RequiredFieldValidator ID="religionRequiredFieldValidator"
                                        runat="server" ErrorMessage="Religion is Required"
                                        ControlToValidate="ReligionDropDownList" ForeColor="Red"
                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("Religion") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <%--State--%>
                            <asp:TemplateField HeaderText="State" SortExpression="State">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="StateDropDownList" runat="server" CssClass="form-select"
                                        DataSourceID="stateDDLSqlDataSource" DataTextField="StateName"
                                        DataValueField="StateName" SelectedValue='<%# Bind("State") %>'>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="StateRequiredFieldValidator"
                                        runat="server" ErrorMessage="State is Required"
                                        ControlToValidate="StateDropDownList" ForeColor="Red"
                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:SqlDataSource ID="stateDDLSqlDataSource" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:studentCS %>"
                                        SelectCommand="SELECT [StateName] FROM [states]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="StateDropDownList" runat="server"
                                        DataSourceID="stateDDLSqlDataSource" CssClass="form-select"
                                        DataTextField="StateName" DataValueField="StateName">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="StateRequiredFieldValidator"
                                        runat="server" ErrorMessage="State is Required"
                                        ControlToValidate="StateDropDownList" ForeColor="Red"
                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:SqlDataSource ID="stateDDLSqlDataSource" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:studentCS %>"
                                        SelectCommand="SELECT [StateName] FROM [states]"></asp:SqlDataSource>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label13" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <%--City--%>
                            <asp:TemplateField HeaderText="City" SortExpression="City">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="cityDropDownList" runat="server" CssClass="form-select"
                                        DataSourceID="CityDDLSqlDataSource" DataTextField="CityName"
                                        DataValueField="CityName" SelectedValue='<%# Bind("City") %>'>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="cityRequiredFieldValidator"
                                        runat="server" ErrorMessage="City is Required"
                                        ControlToValidate="cityDropDownList" ForeColor="Red"
                                        Display="Dynamic" InitialValue="-1"></asp:RequiredFieldValidator>
                                    <asp:SqlDataSource ID="CityDDLSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:studentCS %>" SelectCommand="SELECT [CityName] FROM [cities]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="cityDropDownList" runat="server" CssClass="form-select"
                                        DataSourceID="CityDDLSqlDataSource" DataTextField="CityName"
                                        DataValueField="CityName">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="cityRequiredFieldValidator"
                                        runat="server" ErrorMessage="City is Required"
                                        ControlToValidate="cityDropDownList" ForeColor="Red"
                                        Display="Dynamic" InitialValue="-1"></asp:RequiredFieldValidator>
                                    <asp:SqlDataSource ID="CityDDLSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:studentCS %>" SelectCommand="SELECT [CityName] FROM [cities]"></asp:SqlDataSource>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label14" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <%--District--%>
                            <asp:TemplateField HeaderText="District" SortExpression="District">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DistrictDropDownList" runat="server" CssClass="form-select"
                                        DataSourceID="DistrictDDLSqlDataSource" DataTextField="DistrictName"
                                        DataValueField="DistrictName" SelectedValue='<%# Bind("District") %>'>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="districtRequiredFieldValidator"
                                        runat="server" ErrorMessage="District is Required"
                                        ControlToValidate="DistrictDropDownList" ForeColor="Red"
                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:SqlDataSource ID="DistrictDDLSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:studentCS %>" SelectCommand="SELECT [DistrictName] FROM [districts]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DistrictDropDownList" runat="server" CssClass="form-select"
                                        DataSourceID="DistrictDDLSqlDataSource" DataTextField="DistrictName" DataValueField="DistrictName">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="districtRequiredFieldValidator"
                                        runat="server" ErrorMessage="District is Required"
                                        ControlToValidate="DistrictDropDownList" ForeColor="Red"
                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:SqlDataSource ID="DistrictDDLSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:studentCS %>" SelectCommand="SELECT [DistrictName] FROM [districts]"></asp:SqlDataSource>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label15" runat="server" Text='<%# Bind("District") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <%--Pin Code--%>
                            <asp:TemplateField HeaderText="PinCode" SortExpression="PinCode">
                                <EditItemTemplate>
                                    <asp:TextBox ID="pinCodeTextBox" runat="server" CssClass="form-control" Text='<%# Bind("PinCode") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="pinCodeRequiredFieldValidator"
                                        runat="server" ErrorMessage="Pin Code is Required"
                                        ControlToValidate="pinCodeTextBox" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="pinCodeRegularExpressionValidator" runat="server"
                                        ErrorMessage="Invalid Pin Code" ControlToValidate="pinCodeTextBox" ForeColor="Red"
                                        Display="Dynamic" ValidationExpression="([0-9]{6}|[0-9]{3}\s[0-9]{3})"></asp:RegularExpressionValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox15" runat="server" CssClass="form-control" Text='<%# Bind("PinCode") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="pinCodeRequiredFieldValidator"
                                        runat="server" ErrorMessage="Pin Code is Required"
                                        ControlToValidate="pinCodeTextBox" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="pinCodeRegularExpressionValidator" runat="server"
                                        ErrorMessage="Invalid Pin Code" ControlToValidate="pinCodeTextBox" ForeColor="Red"
                                        Display="Dynamic" ValidationExpression="([0-9]{6}|[0-9]{3}\s[0-9]{3})"></asp:RegularExpressionValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label16" runat="server" Text='<%# Bind("PinCode") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <%--Course--%>
                            <asp:TemplateField HeaderText="Course" SortExpression="Course">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="CourseDropDownList" runat="server" CssClass="form-select"
                                        DataSourceID="CourseSqlDataSource" DataTextField="CourseName"
                                        DataValueField="CourseName" SelectedValue='<%# Bind("Course") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="CourseSqlDataSource" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:studentCS %>"
                                        SelectCommand="SELECT [CourseName] FROM [courses]"></asp:SqlDataSource>
                                    <asp:RequiredFieldValidator ID="CourseRequiredFieldValidator"
                                        runat="server" ErrorMessage="Course is Required"
                                        ControlToValidate="courseDropDownList" ForeColor="Red"
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                    <br />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="CourseDropDownList" runat="server" CssClass="form-select"
                                        DataSourceID="CourseSqlDataSource" DataTextField="CourseName" DataValueField="CourseName">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="CourseSqlDataSource" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:studentCS %>"
                                        SelectCommand="SELECT [CourseName] FROM [courses]"></asp:SqlDataSource>
                                    <asp:RequiredFieldValidator ID="CourseRequiredFieldValidator"
                                        runat="server" ErrorMessage="Course is Required"
                                        ControlToValidate="courseDropDownList" ForeColor="Red"
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label17" runat="server" Text='<%# Bind("Course") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <%------Semester-------%>
                            <asp:TemplateField HeaderText="Semester" SortExpression="Semester">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="SemesterDropDownList" runat="server" CssClass="form-select"
                                        DataSourceID="SemesterSqlDataSource" DataTextField="SemesterName"
                                        DataValueField="SemesterName" SelectedValue='<%# Bind("Semester") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SemesterSqlDataSource" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:studentCS %>"
                                        SelectCommand="SELECT [SemesterName] FROM [semesters]"></asp:SqlDataSource>
                                    <asp:RequiredFieldValidator ID="SemesterRequiredFieldValidator"
                                        runat="server" ErrorMessage="Semester is Required"
                                        ControlToValidate="SemesterDropDownList" ForeColor="Red"
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="SemesterDropDownList" runat="server" CssClass="form-select"
                                        DataSourceID="SemesterSqlDataSource" DataTextField="SemesterName"
                                        DataValueField="SemesterName">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SemesterSqlDataSource" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:studentCS %>"
                                        SelectCommand="SELECT [SemesterName] FROM [semesters]"></asp:SqlDataSource>
                                    <asp:RequiredFieldValidator ID="SemesterRequiredFieldValidator"
                                        runat="server" ErrorMessage="Semester is Required"
                                        ControlToValidate="SemesterDropDownList" ForeColor="Red"
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label18" runat="server" Text='<%# Bind("Semester") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <%--Year of Joining--%>
                            <asp:TemplateField HeaderText="Year Of Joining" SortExpression="YearOfJoining">
                                <EditItemTemplate>
                                    <asp:TextBox ID="YearOfJoiningTextBox" runat="server" CssClass="form-control" Text='<%# Bind("YearOfJoining") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="YearOfJoiningRequiredFieldValidator"
                                        runat="server" ErrorMessage="Year of Joining is Required"
                                        ControlToValidate="YearOfJoiningTextBox" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="YearOfJoiningRegularExpressionValidator" runat="server" ErrorMessage="Invalid Year"
                                        SetFocusOnError="True" Display="Dynamic"
                                        ValidationExpression="^(19[1-9][0-9]|190[0-9]|20[0-1][0-9]|202[0-2])$"
                                        ForeColor="Red"
                                        ControlToValidate="YearOfJoiningTextBox">
                                    </asp:RegularExpressionValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="YearOfJoiningTextBox" runat="server" Text='<%# Bind("YearOfJoining") %>'></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="YearOfJoiningRequiredFieldValidator"
                                        runat="server" ErrorMessage="Year of Joining is Required"
                                        ControlToValidate="YearOfJoiningTextBox" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="YearOfJoiningRegularExpressionValidator" runat="server" ErrorMessage="Invalid Year"
                                        SetFocusOnError="True" Display="Dynamic"
                                        ValidationExpression="^(19[1-9][0-9]|190[0-9]|20[0-1][0-9]|202[0-2])$"
                                        ForeColor="Red"
                                        ControlToValidate="YearOfJoiningTextBox">
                                    </asp:RegularExpressionValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="YearOfJoiningLabel" runat="server" Text='<%# Bind("YearOfJoining") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <%--Qualification--%>
                            <asp:TemplateField HeaderText="Qualification" SortExpression="Qualification">
                                <EditItemTemplate>
                                    <asp:TextBox ID="qualificationTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Qualification") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="QualificationRFV"
                                        runat="server" ErrorMessage="Qualification is Required"
                                        ControlToValidate="qualificationTextBox" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="qualificationRegularExpressionValidator" runat="server"
                                        ErrorMessage="Invalid Qualification"
                                        ValidationExpression="^([a-zA-z\s*.*-]{2,32})$"
                                        ControlToValidate="qualificationTextBox" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                   <asp:TextBox ID="qualificationTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Qualification") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="QualificationRFV"
                                        runat="server" ErrorMessage="Qualification is Required"
                                        ControlToValidate="qualificationTextBox" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="qualificationRegularExpressionValidator" runat="server"
                                        ErrorMessage="Invalid Qualification"
                                        ValidationExpression="^([a-zA-z\s*.*-]{2,32})$"
                                        ControlToValidate="qualificationTextBox" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="QualificationLabel" runat="server" Text='<%# Bind("Qualification") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <%--Percentage--%>
                            <asp:TemplateField HeaderText="Percentage" SortExpression="Percentage">
                                <EditItemTemplate>
                                    <asp:TextBox ID="PercentageTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Percentage") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PercentageRFV"
                                        runat="server" ErrorMessage="Qualification Percentage is Required"
                                        ControlToValidate="PercentageTextBox" ForeColor="Red" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="PercentageRegularExpressionValidator" runat="server"
                                        ErrorMessage="Invalid Percentage: Percentage should be 50% - 100% in Rounded Figures only"
                                        ValidationExpression="^([6-8][0-9]|5[0-9]|9[0-9]|100)*%?$"
                                        ControlToValidate="PercentageTextBox" ForeColor="Red" Display="Dynamic">
                                    </asp:RegularExpressionValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="PercentageTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Percentage") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PercentageRFV"
                                        runat="server" ErrorMessage="Qualification Percentage is Required"
                                        ControlToValidate="PercentageTextBox" ForeColor="Red" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="PercentageRegularExpressionValidator" runat="server"
                                        ErrorMessage="Invalid Percentage: Percentage should be 50% - 100% in Rounded Figures only"
                                        ValidationExpression="^([6-8][0-9]|5[0-9]|9[0-9]|100)*%?$"
                                        ControlToValidate="PercentageTextBox" ForeColor="Red" Display="Dynamic">
                                    </asp:RegularExpressionValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="PercentageLabel" runat="server" Text='<%# Bind("Percentage") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Fields>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="DetailsViewStudentSqlDataSource" runat="server"
                        ConnectionString="<%$ ConnectionStrings:studentCS %>"
                        SelectCommand="SELECT [StudentId], [UserName], [FirstName], [LastName], [Email], [AadhaarNo], [PhoneNo], [PinCode], [District], [City], [State], [Religion], [Category], [Dob], [Gender], [Qualification],[Percentage],[YearOfJoining], [Semester], [Course] FROM [students] WHERE ([StudentId] = @StudentId) ORDER BY [StudentId] DESC"
                        OnSelecting="DetailsViewStudentSqlDataSource_Selecting"
                        DeleteCommand="DELETE FROM [students] WHERE [StudentId] = @StudentId"
                        InsertCommand="INSERT INTO [students] ([UserName], [FirstName], [LastName], [Email], [AadhaarNo], [PhoneNo], [PinCode], [District], [City], [State], [Religion], [Category], [Dob], [Gender], [Qualification],[Percentage], [YearOfJoining], [Semester], [Course]) VALUES (@UserName, @FirstName, @LastName, @Email, @AadhaarNo, @PhoneNo, @PinCode, @District, @City, @State, @Religion, @Category, @Dob, @Gender, @Qualification,@Percentage, @YearOfJoining, @Semester, @Course)"
                        UpdateCommand="UPDATE [students] SET [UserName] = @UserName, [FirstName] = @FirstName, [LastName] = @LastName, [Email] = @Email, [AadhaarNo] = @AadhaarNo, [PhoneNo] = @PhoneNo, [PinCode] = @PinCode, [District] = @District, [City] = @City, [State] = @State, [Religion] = @Religion, [Category] = @Category, [Dob] = @Dob, [Gender] = @Gender, [Qualification] = @Qualification,[Percentage] = @Percentage, [YearOfJoining] = @YearOfJoining, [Semester] = @Semester, [Course] = @Course WHERE [StudentId] = @StudentId">
                        <DeleteParameters>
                            <asp:Parameter Name="StudentId" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="UserName" Type="String" />
                            <asp:Parameter Name="FirstName" Type="String" />
                            <asp:Parameter Name="LastName" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="AadhaarNo" Type="Int64" />
                            <asp:Parameter Name="PhoneNo" Type="Int64" />
                            <asp:Parameter Name="PinCode" Type="Int64" />
                            <asp:Parameter Name="District" Type="String" />
                            <asp:Parameter Name="City" Type="String" />
                            <asp:Parameter Name="State" Type="String" />
                            <asp:Parameter Name="Religion" Type="String" />
                            <asp:Parameter Name="Category" Type="String" />
                            <asp:Parameter Name="Dob" Type="String" />
                            <asp:Parameter Name="Gender" Type="String" />
                            <asp:Parameter Name="Qualification" Type="String" />
                            <asp:Parameter Name="Percentage" Type="String" />
                            <asp:Parameter Name="YearOfJoining" Type="String" />
                            <asp:Parameter Name="Semester" Type="String" />
                            <asp:Parameter Name="Course" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridViewStudent" Name="StudentId" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="UserName" Type="String" />
                            <asp:Parameter Name="FirstName" Type="String" />
                            <asp:Parameter Name="LastName" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="AadhaarNo" Type="Int64" />
                            <asp:Parameter Name="PhoneNo" Type="Int64" />
                            <asp:Parameter Name="PinCode" Type="Int64" />
                            <asp:Parameter Name="District" Type="String" />
                            <asp:Parameter Name="City" Type="String" />
                            <asp:Parameter Name="State" Type="String" />
                            <asp:Parameter Name="Religion" Type="String" />
                            <asp:Parameter Name="Category" Type="String" />
                            <asp:Parameter Name="Dob" Type="String" />
                            <asp:Parameter Name="Gender" Type="String" />
                            <asp:Parameter Name="Qualification" Type="String" />
                            <asp:Parameter Name="Percentage" Type="String" />
                            <asp:Parameter Name="YearOfJoining" Type="String" />
                            <asp:Parameter Name="Semester" Type="String" />
                            <asp:Parameter Name="Course" Type="String" />
                            <asp:Parameter Name="StudentId" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                </div>
        </div>
    </div>
</asp:Content>

