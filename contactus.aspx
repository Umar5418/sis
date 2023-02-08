<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.master" AutoEventWireup="true" CodeFile="contactus.aspx.cs" Inherits="contactus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        #contain {
            margin-top: 25px;
            font-size: medium;
            min-width: 100%;
            max-width: 100%;
        }
        .list-group a {
            color: black !important;
        }

        .card {
            margin: 0 1%;
            width: 23%;
        }
        .card:hover{
            background: rgba(116, 49, 249, 0.19);
            border-radius: 16px;
            backdrop-filter: blur(6.2px);
            -webkit-backdrop-filter: blur(6.2px);
            border: 1px solid rgba(116, 49, 249, 0.05);
            box-shadow: 0px 0px 31px 5px rgba(116,49,249,0.71);
            -webkit-box-shadow: 0px 0px 31px 5px rgba(116,49,249,0.71);
            -moz-box-shadow: 0px 0px 31px 5px rgba(116,49,249,0.71);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container" id="contain">
        <div class="row p-3">
            
<!----------------Contact No 1----------------------->
            <div class="col-3 card border-danger">
                <asp:Image ImageUrl="~/images/female1.jpg" runat="server" class="card-img-top rounded mx-auto d-block" Width="200" Height="220" />
                <div class="card-body">
                    <h5 class="card-title">Ishrat Rahim</h5>
                    <p class="card-text">
                        A student of MCA-6th Semester of P.G. Department of Computer Sciences 
                            and Applications at the North Campus, University of Kashmir
                    </p>
                </div>
                <!--Google map-->
                <div class="card-body z-depth-1-half map-container" style="text-align: center">
                    <h5 style="text-align:left"><i class="fa-solid fa-location-dot"></i> Address</h5>
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3304.423211354424!2d74.75987881504138!3d34.08429722348792!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x38e19b2e07a1c259%3A0xfa4db803d4408cc8!2sJVC%20Hospital%20Bemina%20Srinagar!5e0!3m2!1sen!2sin!4v1655733477628!5m2!1sen!2sin"
                        style="border: 0;" allowfullscreen="" width="100%" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        <i class="fa-solid fa-phone"></i> +917889731878<br>
                    </li>
                    <li class="list-group-item">
                        <i class="fa-solid fa-at"></i>
                        <a style="color:black" href="mailto:insertemailhere@xyz.com"> ishratzargar11@gmail.com</a>
                    </li>
                </ul>
                <div class="card-body" style="text-align: center">
                    <a href="https://www.facebook.com/" class="card-link" target="_blank">
                        <i class="fa-brands fa-facebook fa-2x" style="color: dodgerblue"></i>
                    </a>
                    <a href="https://www.twitter.com/" class="card-link" target="_blank">
                        <i class="fab fa-twitter fa-2x" style="color: deepskyblue"></i>
                    </a>
                    <a href="https://www.instagram.com/" class="card-link" target="_blank">
                        <i class="fab fa-instagram fa-2x" style="color: #F24C58"></i>
                    </a>
                    <a href="https://www.youtube.com/" class="card-link" target="_blank">
                        <i class="fab fa-youtube fa-2x" style="color: red"></i>
                    </a>
                    <a href="https://www.linkedin.com/" class="card-link" target="_blank">
                        <i class="fab fa-linkedin-in fa-2x" style="color: #0082CA"></i>
                    </a>
                </div>
            </div>

<!----------------Contact No 2----------------------->
            <div class="col-3 card border-success">
                <asp:Image ImageUrl="~/images/male1.jpg" runat="server" class="card-img-top rounded mx-auto d-block" Width="200" Height="220" />
                <div class="card-body">
                    <h5 class="card-title">Mohd. Umar</h5>
                    <p class="card-text">
                        A student of MCA-6th Semester of P.G. Department of Computer Sciences 
                        and Applications at the North Campus, University of Kashmir
                    </p>
                </div>
                <!--Google map-->
                <div class="card-body z-depth-1-half map-container" style="text-align: center">
                    <h5 style="text-align:left"><i class="fa-solid fa-location-dot"></i> Address</h5>
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3304.423211354424!2d74.75987881504138!3d34.08429722348792!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x38e19b2e07a1c259%3A0xfa4db803d4408cc8!2sJVC%20Hospital%20Bemina%20Srinagar!5e0!3m2!1sen!2sin!4v1655733477628!5m2!1sen!2sin"
                        style="border: 0;" allowfullscreen="" width="100%"  loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        <i class="fa-solid fa-phone"></i> +919541507436<br>
                    </li>
                    <li class="list-group-item">
                        <i class="fa-solid fa-at"></i>
                        <a style="color:black" href="mailto:insertemailhere@xyz.com">  umariqbal140@gmail.com</a>
                    </li>
                </ul>
                <div class="card-body" style="text-align: center">
                    <a href="https://www.facebook.com/" class="card-link" target="_blank">
                        <i class="fa-brands fa-facebook fa-2x" style="color: dodgerblue"></i>
                    </a>
                    <a href="https://www.twitter.com/" class="card-link" target="_blank">
                        <i class="fab fa-twitter fa-2x" style="color: deepskyblue"></i>
                    </a>
                    <a href="https://www.instagram.com/" class="card-link" target="_blank">
                        <i class="fab fa-instagram fa-2x" style="color: #F24C58"></i>
                    </a>
                    <a href="https://www.youtube.com/" class="card-link" target="_blank">
                        <i class="fab fa-youtube fa-2x" style="color: red"></i>
                    </a>
                    <a href="https://www.linkedin.com/" class="card-link" target="_blank">
                        <i class="fab fa-linkedin-in fa-2x" style="color: #0082CA"></i>
                    </a>
                </div>
            </div>
       
<!----------------Contact No 3----------------------->     
            <div class="col-3 card border-primary">
                <asp:Image ImageUrl="~/images/male2.jpg" runat="server" class="card-img-top rounded mx-auto d-block" Width="200" Height="220" />
                <div class="card-body">
                    <h5 class="card-title">Majid Fayaz</h5>
                    <p class="card-text">
                        A student of MCA-6th Semester of P.G. Department of Computer Sciences 
                            and Applications at the North Campus, University of Kashmir
                    </p>
                </div>
                <!--Google map-->
                <div class="card-body z-depth-1-half map-container" style="text-align: center">
                    <h5 style="text-align:left"><i class="fa-solid fa-location-dot"></i> Address</h5>
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3304.423211354424!2d74.75987881504138!3d34.08429722348792!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x38e19b2e07a1c259%3A0xfa4db803d4408cc8!2sJVC%20Hospital%20Bemina%20Srinagar!5e0!3m2!1sen!2sin!4v1655733477628!5m2!1sen!2sin"
                        style="border: 0;" allowfullscreen="" width="100%"  loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        <i class="fa-solid fa-phone"></i> +919797215363<br>
                    </li>
                    <li class="list-group-item">
                        <i class="fa-solid fa-at"></i>
                        <a style="color:black" href="mailto:insertemailhere@xyz.com"> Majidfayaz624@gmail.com</a>
                    </li>
                </ul>
                <div class="card-body" style="text-align: center">
                    <a href="https://www.facebook.com/" class="card-link" target="_blank">
                        <i class="fa-brands fa-facebook fa-2x" style="color: dodgerblue"></i>
                    </a>
                    <a href="https://www.twitter.com/" class="card-link" target="_blank">
                        <i class="fab fa-twitter fa-2x" style="color: deepskyblue"></i>
                    </a>
                    <a href="https://www.instagram.com/" class="card-link" target="_blank">
                        <i class="fab fa-instagram fa-2x" style="color: #F24C58"></i>
                    </a>
                    <a href="https://www.youtube.com/" class="card-link" target="_blank">
                        <i class="fab fa-youtube fa-2x" style="color: red"></i>
                    </a>
                    <a href="https://www.linkedin.com/" class="card-link" target="_blank">
                        <i class="fab fa-linkedin-in fa-2x" style="color: #0082CA"></i>
                    </a>
                </div>
            </div>
      
<!----------------Contact No 4----------------------->      
            <div class="col-3 card  border-info">
                <asp:Image ImageUrl="~/images/male3.jpg" runat="server" class="card-img-top rounded mx-auto d-block" Width="200" Height="220" />
                <div class="card-body">
                    <h5 class="card-title">Mukhtar Wani</h5>
                    <p class="card-text">
                        A student of MCA-6th Semester of P.G. Department of Computer Sciences 
                            and Applications at the North Campus, University of Kashmir
                    </p>
                </div>
                <!--Google map-->
                <div id="map-container-google-1" class="card-body z-depth-1-half map-container" style="text-align: center">
                    <h5 style="text-align:left"><i class="fa-solid fa-location-dot"></i> Address</h5>
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3304.423211354424!2d74.75987881504138!3d34.08429722348792!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x38e19b2e07a1c259%3A0xfa4db803d4408cc8!2sJVC%20Hospital%20Bemina%20Srinagar!5e0!3m2!1sen!2sin!4v1655733477628!5m2!1sen!2sin"
                        style="border: 0;" allowfullscreen="" width="100%"  loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        <i class="fa-solid fa-phone"></i> +917006291751<br>
                    </li>
                    <li class="list-group-item">
                        <i class="fa-solid fa-at"></i>
                        <a style="color:black" href="mailto:insertemailhere@xyz.com">  inayatwani8899@gmail.com</a>
                    </li>
                </ul>
                <div class="card-body" style="text-align: center">
                    <a href="https://www.facebook.com/" class="card-link" target="_blank">
                        <i class="fa-brands fa-facebook fa-2x" style="color: dodgerblue"></i>
                    </a>
                    <a href="https://www.twitter.com/" class="card-link" target="_blank">
                        <i class="fab fa-twitter fa-2x" style="color: deepskyblue"></i>
                    </a>
                    <a href="https://www.instagram.com/" class="card-link" target="_blank">
                        <i class="fab fa-instagram fa-2x" style="color: #F24C58"></i>
                    </a>
                    <a href="https://www.youtube.com/" class="card-link" target="_blank">
                        <i class="fab fa-youtube fa-2x" style="color: red"></i>
                    </a>
                    <a href="https://www.linkedin.com/" class="card-link" target="_blank">
                        <i class="fab fa-linkedin-in fa-2x" style="color: #0082CA"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

