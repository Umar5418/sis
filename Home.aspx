<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="packages/CSS_file_2.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <!--Welcome Screen Message-->
  
    
    <div id="carouselExampleCaptions" class="carousel slide carousel-fade" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active" data-bs-interval="26000">
                <img src="images/library.jpg" class="d-block w-100" alt="..." height="500" >
                <div class="carousel-caption d-none d-md-block">
                    <h5>Welcome to SIS</h5>
                    <p>Every new beginning comes from some other beginning's end</p>
                </div>
            </div>
            <div class="carousel-item" data-bs-interval="2600">
                <img src="images/students-bb.jpg" class="d-block w-100" alt="..." height="500" >
                <div class="carousel-caption d-none d-md-block ">
                    <h5>First slide label</h5>
                    <p>Some representative placeholder content for the first slide.</p>
                </div>
            </div>
            <div class="carousel-item" data-bs-interval="2600">
                <img src="images/school1.jpg" class="d-block w-100" alt="..." height="500" >
                <div class="carousel-caption d-none d-md-block">
                    <h5>Second slide label</h5>
                    <p>Some representative placeholder content for the second slide.</p>
                </div>
            </div>
            <div class="carousel-item" data-bs-interval="2600">
                <img src="images/BigSizeQualification6.jpeg" class="d-block w-100" alt="..." height="500" >
                <div class="carousel-caption d-none d-md-block">
                    <h5>Third slide label</h5>
                    <p>Some representative placeholder content for the third slide.</p>
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


    <div class="row mt-3">
        <div class="col-sm-6">
            <div class="card border-success w-90 h-100">
                <div class="card-body  card-body-home ">
                    <h4 class="card-title ">Existing System</h4>
                    <p class="card-text"><i class="fa fa-check fa-2x"></i>
                         Most of the Existing systems used for Managing the Information of 
                Students in Schools / Colleges Are Manual systems or even if they are
                Automated they lack a lot of features and are outdated. It puts pressure 
                on people to be correct in all details of their work at all times, the problem
                being that people aren’t perfect.</p>
                    <p class="card-text"><i class="fa fa-check fa-2x"></i>
                         Most of the Existing systems used for Managing the Information of 
                Students in Schools / Colleges Are Manual systems or even if they are
                Automated they lack a lot of features and are outdated. It puts pressure 
                on people to be correct in all details of their work at all times, the problem
                being that people aren’t perfect.</p>
                    <p class="card-text"><i class="fa fa-check fa-2x"></i>
                         Most of the Existing systems used for Managing the Information of 
                Students in Schools / Colleges Are Manual systems or even if they are
                Automated they lack a lot of features and are outdated. It puts pressure 
                on people to be correct in all details of their work at all times, the problem
                being that people aren’t perfect.</p>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="card border-warning w-90 h-100">
                <div class="card-body  card-body-home">
                    <h4 class="card-title">Proposed System</h4>
                    <p class="card-text"><i class="fa fa-check fa-2x"></i>
                         The objective of the design of a new system is to automate the current 
                procedure of managing and controlling the information about the student 
                details and to reduce the overhead of managing paper documents.</p>
                    <p class="card-text"><i class="fa fa-check fa-2x"></i>
                         The Student Information System deals with the various activities 
                    related to the students like adding a new student, complaint posting, 
                    complaint reply, deleting a student etc.</p>
                    <p class="card-text"><i class="fa fa-check fa-2x"></i>
                         Student Information System will overcome all the problems posed by 
                the current outdated systems for managing student’s information. 
                The proposed system is purely an Automated system with Focus on 
                minimizing Data Redundancy, a good looking User Interface, 
                security of the student’s information.</p>
                </div>
            </div>
        </div>
</div>

</asp:Content>

