<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.master" AutoEventWireup="true" CodeFile="addAdmins.aspx.cs" Inherits="Student_studentRegistration" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link href="../packages/CSS_file_2.css" rel="stylesheet" />
    <style>
        #mainHeading {
            margin-top: 10px;
            padding: 10px 15px;
            font-size: large;
            color: #ffffff;
            background-color: #278e8eff;
            text-align: center;
        }


        #contain {
            min-width: 75%;
            max-width: 75%;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="container" id="contain">
        <div class="row p-3">
            <%--Head Row--%>
            <div class=" col-12">
                <h3 id="mainHeading"><i class="fa fa-registered"></i> ADMIN REGISTRATION FORM</h3>
            </div>
            <div class="col-12 mt-2 mb-2">
                <strong>
                    <asp:Label ID="MessageLabel" runat="server" width="100%"
                        CssClass="alert alert-danger" Visible="False"
                        Font-Size="Medium" Font-Bold="True" BorderStyle="None" ForeColor="#33CC33"></asp:Label>
                </strong>
            </div>

            <%---------Name----------%>
            <div class="col-4 mt-1">
                <asp:Label ID="Label2" runat="server" CssClass="form-label" Text="First Name: "></asp:Label>
                <asp:TextBox ID="NameTextBox" runat="server"
                    CssClass="form-control" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="NameRequiredFieldValidator" runat="server"
                    ErrorMessage="Name is Required" SetFocusOnError="True"
                    Display="Dynamic" ControlToValidate="NameTextBox" ForeColor="Red">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="NameRegularExpressionValidator" runat="server"
                    ErrorMessage="Numeric and special characters, not allowed"
                    ValidationExpression="^[A-Za-z\s]{1,}[\.]{0,1}[A-Za-z\s]{0,}$"
                    ControlToValidate="NameTextBox" ForeColor="Red" Display="Dynamic">
                </asp:RegularExpressionValidator>
            </div>


            <%---------Gender----------%>
            <div class="col-4 mt-1">
                <asp:Label ID="Label14" runat="server" CssClass="form-label" Text="Gender: "></asp:Label>
                <asp:DropDownList ID="genderDropDownList" runat="server"
                    CssClass="form-select" DataTextField="GenderName" DataValueField="GenderId">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="GenderRequiredFieldValidator"
                    runat="server" ErrorMessage="Gender is Required"
                    ControlToValidate="genderDropDownList" ForeColor="Red"
                    Display="Dynamic" InitialValue="-1"></asp:RequiredFieldValidator>

            </div>

            <%--Date of Birth --%>
            <div class="col-4 mt-1">
                <asp:Label ID="dobLabel" runat="server" CssClass="form-label" Text="Date of Birth: "></asp:Label>

                <asp:TextBox ID="dobTextBox" runat="server"
                    CssClass="form-control" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="dobRequiredFieldValidator"
                    runat="server" ErrorMessage="Date Of Birth is Required"
                    ControlToValidate="dobTextBox" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RangeValidator ErrorMessage="Invalid Date of Birth" ForeColor="Red" 
                    ControlToValidate="dobTextBox" runat="server" MinimumValue="1900" MaximumValue="2001" />
            </div>


            <%---------Aadhaar Number----------%>
            <div class="col-4 mt-1">
                <asp:Label ID="Label12" runat="server" CssClass="form-label" Text="Aadhaar No: "></asp:Label>
                <asp:TextBox ID="AadhaarNoTextBox"
                    runat="server" CssClass="form-control" TextMode="Number">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="AadhaarNoRequiredFieldValidator"
                    runat="server" ErrorMessage="Aadhaar Number is Required"
                    ControlToValidate="AadhaarNoTextBox" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="AadhaarNoRegularExpressionValidator" runat="server"
                    ErrorMessage="Invalid Aadhaar Number" ControlToValidate="AadhaarNoTextBox" ForeColor="Red" Display="Dynamic"
                    ValidationExpression="^([1-9][0-9]{11})$"></asp:RegularExpressionValidator>

            </div>


            <%----- Year of Joining ----%>
            <div class="col-4 mt-1">
                <asp:Label ID="Label19" runat="server" CssClass="form-label" Text="Year Of Joining: "></asp:Label>

                <asp:TextBox ID="YearOfJoiningTextBox" runat="server" CssClass="form-control" TextMode="Number">
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
            </div>

            <%----------- Email -----------%>
            <div class="col-4 mt-1">
                <asp:Label ID="Label9" runat="server" CssClass="form-label" Text="Email: "></asp:Label>
                <asp:TextBox ID="emailTextBox" runat="server" CssClass="form-control"
                    TextMode="SingleLine">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="emailRequiredFieldValidator"
                    runat="server" ErrorMessage="Email is Required"
                    ControlToValidate="emailTextBox" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="emailRegularExpressionValidator" runat="server"
                    ErrorMessage="Invalid Email" ControlToValidate="emailTextBox" ForeColor="Red"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic">
                </asp:RegularExpressionValidator>
            </div>

            <%----------- Phone No: -----------%>
            <div class="col-4 mt-1">
                <asp:Label ID="Label6" runat="server" CssClass="form-label" Text="Phone No: "></asp:Label>
                <asp:TextBox ID="phoneNoTextBox" runat="server" CssClass="form-control" TextMode="Number">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="phoneNoRequiredFieldValidator"
                    runat="server" ErrorMessage="Phone Number is Required"
                    ControlToValidate="phoneNoTextBox" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="phoneNoRegularExpressionValidator" runat="server"
                    ErrorMessage="Invalid Phone Number" ControlToValidate="phoneNoTextBox" ForeColor="Red" Display="Dynamic"
                    ValidationExpression="^[2-9]{2}[0-9]{8}$"></asp:RegularExpressionValidator>
            </div>

            <%----------- State -----------%>
            <div class="col-4 mt-1">
                <asp:Label runat="server" ID="stateLabel" CssClass="form-label" Text="State: "></asp:Label>
                <asp:DropDownList ID="stateDropDownList" runat="server" AutoPostBack="true"
                    CssClass="form-select" DataTextField="StateName" DataValueField="StateId"
                    OnSelectedIndexChanged="stateDropDownList_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="stateRequiredFieldValidator"
                    runat="server" ErrorMessage="State is Required"
                    ControlToValidate="stateDropDownList" ForeColor="Red"
                    Display="Dynamic" InitialValue="-1"></asp:RequiredFieldValidator>
            </div>
            <%----------- City -----------%>
            <div class="col-4 mt-1">
                <asp:Label runat="server" ID="Label4" CssClass="form-label" Text="City: "></asp:Label>
                <asp:DropDownList ID="cityDropDownList" runat="server" AutoPostBack="true"
                    CssClass="form-select" DataTextField="CityName" DataValueField="CityId"
                    OnSelectedIndexChanged="cityDropDownList_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="cityRequiredFieldValidator"
                    runat="server" ErrorMessage="City is Required"
                    ControlToValidate="cityDropDownList" ForeColor="Red"
                    Display="Dynamic" InitialValue="-1"></asp:RequiredFieldValidator>
            </div>
            <%----------- District -----------%>
            <div class="col-4 mt-1">
                <asp:Label runat="server" ID="Label15" CssClass="form-label" Text="District: "></asp:Label>
                <asp:DropDownList ID="districtDropDownList" runat="server"
                    CssClass="form-select" DataTextField="DistrictName" DataValueField="DistrictId">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="districtRequiredFieldValidator"
                    runat="server" ErrorMessage="District is Required"
                    ControlToValidate="districtDropDownList" ForeColor="Red"
                    Display="Dynamic" InitialValue="-1"></asp:RequiredFieldValidator>
            </div>
            <%----------- Pincode -----------%>
            <div class="col-4 mt-1">
                <asp:Label ID="Label18" runat="server" CssClass="form-label" Text="Pin Code: "></asp:Label>
                <asp:TextBox ID="pinCodeTextBox" runat="server" CssClass="form-control" TextMode="Number">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="pinCodeRequiredFieldValidator"
                    runat="server" ErrorMessage="Pin Code is Required"
                    ControlToValidate="pinCodeTextBox" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="pinCodeRegularExpressionValidator" runat="server"
                    ErrorMessage="Invalid Pin Code" ControlToValidate="pinCodeTextBox" ForeColor="Red"
                    Display="Dynamic" ValidationExpression="([0-9]{6}|[0-9]{3}\s[0-9]{3})"></asp:RegularExpressionValidator>
            </div>

            <%---------User Name----------%>
            <div class="col-4 mt-1">
                <asp:Label ID="Label1" runat="server" CssClass="form-label" Text="Username: "></asp:Label>
                <asp:TextBox ID="UsernameTextBox" runat="server" CssClass="form-control" CausesValidation="False"
                    placeholder="Enter Username"></asp:TextBox>
                <asp:RequiredFieldValidator ID="UserNameRequiredFieldValidator" runat="server"
                    ErrorMessage="Username is Required" ControlToValidate="UsernameTextBox"
                    Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </div>

            <%---------Password----------%>
            <div class="col-4 mt-1">
                <asp:Label ID="Label22" runat="server" CssClass="form-label" Text="Password: "></asp:Label>
                <asp:TextBox ID="passwordTextBox" runat="server" CssClass="form-control"
                    TextMode="Password" placeholder="Enter Password">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="passwordRequiredFieldValidator"
                    runat="server" ErrorMessage="Password is Required"
                    ControlToValidate="passwordTextBox" ForeColor="Red" Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>

            <%---------Confirm Password----------%>
            <div class="col-4 mt-1">
                <asp:Label ID="Label8" runat="server" CssClass="form-label" Text="Confirm Password: "></asp:Label>
                <asp:TextBox ID="confirmPasswordTextBox" runat="server" CssClass="form-control"
                    TextMode="Password" placeholder="Confirm Password">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="confirmPasswordRequiredFieldValidator"
                    runat="server" ErrorMessage="Confirm Password is Required"
                    ControlToValidate="confirmPasswordTextBox" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="passwordCompareValidator" runat="server"
                    ErrorMessage="Password and Confirm Password Should be same"
                    ForeColor="Red" ControlToValidate="confirmPasswordTextBox"
                    ControlToCompare="passwordTextBox" Type="String" Operator="Equal" Display="Dynamic"></asp:CompareValidator>
            </div>

            <div class="col-12 mt-3"></div>

            <%-------------------------  Register Button , clear button , back button----------------%>

            <div class="col-2"></div>
            <div class="col-2">
                <asp:LinkButton ID="BackLinkButton" runat="server" PostBackUrl="~/Admin/adminProfile.aspx"
                    CssClass="btn btn-success btn-lg form-control" CausesValidation="False"> 
                            <span class="fas fa-undo-alt"></span> Back 
                </asp:LinkButton>
            </div>
            <div class="col-4">
                <asp:LinkButton ID="RegisterLinkButton" runat="server"
                    CssClass="btn btn-primary btn-lg form-control" OnClick="RegisterLinkButton_Click"> 
                            <span class="fas fa-user-plus"></span> Register 
                </asp:LinkButton>
            </div>
            <div class="col-2">
                <asp:LinkButton ID="ClearLinkButton" runat="server"
                    CssClass="btn btn-danger btn-lg form-control" CausesValidation="False" OnClick="ClearLinkButton_Click">
                            <span class="fas fa-trash"></span> Clear 
                </asp:LinkButton>
            </div>
            <div class="col-12 mt-3"></div>
        </div>
    </div>

</asp:Content>

