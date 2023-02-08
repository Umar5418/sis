<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.master" AutoEventWireup="true" CodeFile="SuccessMessage.aspx.cs" Inherits="Accounts_SuccessMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../packages/CSS_file_2.css" rel="stylesheet" />
    <style>
        #contain {
            margin-top: 50px;
            min-width: 55%;
            max-width: 55%;
            min-height:150px;
        }
        .animate {
            animation: color-change 2s infinite;
        }

        @keyframes color-change {
            0% {
                color: magenta;
            }

            20% {
                color: darkcyan;
            }

            40% {
                color: green;
            }

            60% {
                color: hotpink;
            }

            80% {
                color: indigo;
            }

            100% {
                color: orangered;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="container-fluid" id="contain">
        <div class="row m-4 p-2">

            <div class="col-12">
                <h4 class="alert alert-success alert-dismissible fade show animate">
                    <i class="fa fa-bell fa-shake"></i> 
                    <span class="badge bg-warning">
                        <%= Session["Username"] %>
                    </span> added Successfully as an ADMIN 
                </h4> 
            </div>

        </div>
    </div>

</asp:Content>

