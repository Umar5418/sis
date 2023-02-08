<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.master" AutoEventWireup="true" CodeFile="adminProfile.aspx.cs" Inherits="Admin_adminP" %>

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
    <div class="container-fluid" id="contain">
        <div class="row p-3">
            <%--Menu Bar--%>
            <div class="col-3">
                <div class="list-group">
                    <asp:LinkButton ID="AdminLinkButton" runat="server"
                        CssClass="btn  btn-primary mb-2 p-2">
                                <i class="fas fa-user-graduate"></i> Admin
                    </asp:LinkButton>

                    <asp:LinkButton ID="AddAdminLinkButton" runat="server" PostBackUrl="~/Admin/addAdmins.aspx"
                        CssClass="btn  btn-success mb-2 p-2">
                                <i class="fa-solid fa-plus"></i> Add Admins
                    </asp:LinkButton>

                    <asp:LinkButton ID="SearchStudentsLinkButton" runat="server"
                        CssClass="btn btn-primary mb-2 p-2" PostBackUrl="~/Admin/SearchStudent.aspx">
                                <i class="fas fa-search"></i> Search Students
                    </asp:LinkButton>

                    <asp:LinkButton ID="ManageStudentsLinkButton" runat="server"
                        CssClass="btn btn-danger mb-2 p-2" PostBackUrl="~/Admin/ManageStudents.aspx">
                                <i class="fa-solid fa-people-roof"></i>  Manage Students
                    </asp:LinkButton>

                    <asp:LinkButton ID="ScholarshipsLinkButton" runat="server"
                        PostBackUrl="~/Admin/ManageScholarships.aspx"
                        CssClass="btn btn-success mb-2 p-2">
                                    <i class="fas fa-hands"></i> Manage Scholarships
                    </asp:LinkButton>

                    <asp:LinkButton ID="ViewComplaintsLinkButton" runat="server" PostBackUrl="~/Admin/ManageComplaints.aspx"
                        CssClass="btn btn-primary mb-2 p-2">
                                <i class="fas fa-comments"></i> Manage Complaints
                    </asp:LinkButton>

                    <asp:LinkButton ID="ViewFeedbackLinkButton" runat="server" PostBackUrl="~/Admin/ManageFeedbacks.aspx"
                        CssClass="btn btn-danger mb-2 p-2">
                                <i class="fas fa-comment-dots"></i> Manage Feedbacks
                    </asp:LinkButton>

                    
                    <asp:LinkButton ID="changePasswordAdminLinkButton" runat="server"
                        CssClass="btn  btn-success mb-2 p-2" PostBackUrl="~/Admin/ChangePasswordAdmin.aspx">
                                <i class="fas fa-key"></i> Change Password
                    </asp:LinkButton>

                </div>
            </div>
            <div class="col-9">
                <div id="carouselExampleCaptions" class="carousel slide carousel-fade" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active" data-bs-interval="2600">
                            <img src="../images/admin1.jpg" class="d-block w-100" alt="..." height="400">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>Welcome to SIS</h5>
                                <p>"No one is more cherished in this world than someone who lightens the burden of another. Thank you."  - Joseph Addison</p>
                            </div>
                        </div>
                        <div class="carousel-item" data-bs-interval="2600">
                            <img src="../images/admin2.jpg" class="d-block w-100" alt="..." height="400">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>Welcome to SIS</h5>
                                <p>"Success isn't about the money you make, it is about the difference you make in people's lives." - Michelle Obama</p>
                            </div>
                        </div>
                        <div class="carousel-item" data-bs-interval="2600">
                            <img src="../images/admin3.jpg" class="d-block w-100" alt="..." height="400">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>Welcome to SIS</h5>
                                <p>"Set impossible challenges, then catch up with them." - Richard Branson." </p>
                            </div>
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>



