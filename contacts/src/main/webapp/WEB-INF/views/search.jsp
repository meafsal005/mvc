<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<title>Search Results Page</title>
<style>
.container {
	max-width: 1100px;
	margin: 0 auto;
}
.cards {
	display: -webkit-flex;
	display: flex;
	-webkit-justify-content: center;
	justify-content: space-evenly;
	-webkit-flex-wrap: wrap;
	flex-wrap: wrap;
	margin-top: 15px;
	padding: 1.5%;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}
.card {
	position: relative;
	width:30%;
	height:50px
	margin-bottom: 10px; 
	padding-bottom: 5px; 
	background: black;
	color: #363636; //the whole content of the card becomes linked, so this will give the text a "norma;" appearance
	text-decoration: none;
	@include box-shadow(rgba(black, 0.19) 0 0 8px 0);
	@include border-radius(4px);
	@include breakpoint(700px, $no-query: true) {
	//switch to 2 columns
		max-width: 320px;
		margin-right: 10px;
		margin-bottom: 10px;
		&:nth-child(even) {
			margin-right: 0;
		}
	}
	@include breakpoint(980px, $no-query: true) {
	//switch to 3 columns
		&:nth-child(even) {
			margin-right: 20px;
		}
		&:nth-child(3n) {
			margin-right: 0;
		}
	}
	span {
		display: block;
	}
	.card-header {
		position: center;
		height: 50px;
		overflow: hidden;
		background-repeat: no-repeat;
		background-size: cover;
		background-position: center;
		background-color: lightgreen;
		font:bold italic 30px;
		text-transform: uppercase;
		
 		background-blend-mode: overlay;
		@include border-radius(4px 4px 0 0);
		&:hover, &:focus {
			background-color: rgba(white, 0);
		}
	}
	.card-title {
		background: rgba(157, 187, 63, .85);
		padding: 3.5% 0 2.5% 0;
		color: grey;
		font-family: 'Roboto Condensed', sans-serif;
		text-transform: uppercase;
		position: relative;
		bottom: 0;
		width: 100%;}
	p {
			font-size: 2em;
			line-height: 1.2;
			padding: 0 3.5%;
			margin: 0;
	}
	
	.card-meta {
		max-height: 0;
		overflow: hidden;
		color: #666;
		font-size: .78em;
		text-transform: uppercase;
		position: absolute;
		bottom: 5%;
		padding: 0 5%;
		@include transition-property(max-height);
		@include transition-duration(.4s);
		@include transition-timing-function(ease-in-out);
	}
	&:hover, &:focus {
		background: white;
	  @include box-shadow(rgba(black, 0.45) 0px 0px 20px 0px);
		.card-title {
			background: rgba(157, 187, 63, .95);
		}
		.card-meta {
			max-height: 1em;
		}
	}
}
.form-style-9{
	max-width: 450px;
	background: silver;
	padding: 30px;
	margin: 50px auto;
	box-shadow: 1px 1px 25px rgba(0, 0, 0, 0.35);
	border-radius: 10px;
	border: 6px solid #305A72;
}
.form-style-9 ul{
	padding:0;
	margin:0;
	list-style:none;
}
.form-style-9 ul li{
	display: block;
	margin-bottom: 10px;
	min-height: 35px;
}
.form-style-9 ul li  .field-style{
	box-sizing: border-box; 
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box; 
	padding: 8px;
	outline: none;
	border: 1px solid #B0CFE0;
	-webkit-transition: all 0.30s ease-in-out;
	-moz-transition: all 0.30s ease-in-out;
	-ms-transition: all 0.30s ease-in-out;
	-o-transition: all 0.30s ease-in-out;

}.form-style-9 ul li  .field-style:focus{
	box-shadow: 0 0 5px #B0CFE0;
	border:1px solid #B0CFE0;
}
.form-style-9 ul li .field-split{
	width: 49%;
}
.form-style-9 ul li .field-full{
	width: 100%;
}
.form-style-9 ul li input.align-left{
	float:left;
}
.form-style-9 ul li input.align-right{
	float:right;
}
.form-style-9 ul li textarea{
	width: 100%;
	height: 100px;
}
.form-style-9 ul li input[type="button"], 
.form-style-9 ul li input[type="submit"] {
	-moz-box-shadow: inset 0px 1px 0px 0px #3985B1;
	-webkit-box-shadow: inset 0px 1px 0px 0px #3985B1;
	box-shadow: inset 0px 1px 0px 0px #3985B1;
	background-color: #216288;
	border: 1px solid #17445E;
	display: inline-block;
	cursor: pointer;
	color: #FFFFFF;
	padding: 8px 18px;
	text-decoration: none;
	font: 12px Arial, Helvetica, sans-serif;
}
.form-style-9 ul li input[type="button"]:hover, 
.form-style-9 ul li input[type="submit"]:hover {
	background: linear-gradient(to bottom, #2D77A2 5%, #337DA8 100%);
	background-color: #28739E;
}
body{
	background-image: url("https://images.pexels.com/photos/891252/pexels-photo-891252.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260");
	background-position: center;
    background-origin: content-box;
    background-repeat: no-repeat;
    background-size: cover;
	min-height:100vh;
	font-family: 'Noto Sans', sans-serif;
}
p{
	color:lightgreen;	
    font-size: 20px;
    text-align: center;
}
box{
	position:absolute;
	left:50%;
	top:50%;
	transform: translate(-50%,-50%);
    background-color: rgba(0, 0, 0, 0.89);
	border-radius:3px;
	padding:40px 100px;
}
input{
	position:relative;
	margin-bottom:25px;
	top:0px;
	left:0px;
	font-size:16px;
    pointer-event:none;
	transition: all 0.5s ease-in-out;
}
input-container label{
	position:absolute;
	top:0px;
	left:0px;
	font-size:16px;
	color:#fff;	
    pointer-event:none;
	transition: all 0.5s ease-in-out;
}
input-container input{ 
  border:0;
  border-bottom:1px solid #555;  
  background:transparent;
  width:100%;
  padding:8px 0 5px 0;
  font-size:16px;
  color:#fff;
}
input-container input:focus{ 
 border:none;	
 outline:none;
 border-bottom:1px solid #e74c3c;	
}
btn{
	color:#fff;
	background-color:#e74c3c;
	outline: none;
    border: 0;
    color: #fff;
	padding:10px 20px;
	text-transform:uppercase;
	margin-top:50px;
	border-radius:2px;
	cursor:pointer;
	position:relative;
}
btn:after{
	content:"";
	position:absolute;
	background:rgba(0,0,0,0.50);
	top:0;
	right:0;
	width:100%;
	height:100%;
}
input-container input:focus ~ label,
input-container input:valid ~ label{
	top:-12px;
	font-size:12px;
	
}
h4 {
    margin: 1em 0 0.5em 0;
	color: #343434;
	font-weight: normal;
	font-family: 'Ultra', sans-serif;   
	font-size: 36px;
	line-height: 42px;
	text-transform: uppercase;
	text-shadow: 0 2px white, 0 3px #777;
 	
}
h5 {
    margin: 1em 0 0.5em 0;
	color: darkblue;
	font-weight: bold;
	font-family: 'Ultra', sans-serif;   
	font-size: 30px;
	line-height: 32px;
	text-transform: uppercase;
	text-shadow: 0 2px white, 0 3px #777;
	text-align:center;
 	
}
</style>
</head>
<body>

<c:if test="${!empty search}">
<a href="index">BACK TO HOME</a>
<h5>Found</h5>
<div class="container">
<div class="cards">

<div class="card" >
  <div class="card-header">
     <h5>${search.name}</h5>
  </div>

    <p>${search.email}</p>  <p>${search.mobile} </p>
  
    <p>Category: ${searh.category}</p>
    <div><h6>Address</h6>
    <p>${search.address.addressLine}
    ${search.address.city} </p>
    <p>${search.address.pincode}</p></div>
    

</div>
</div>	
</div>
	</c:if>
	<c:if test="${empty search}"><h4>NOT FOUND</h4><a href="index">BACK TO HOME</a></c:if>




<c:if test="${!empty catgSearch}">
<a href="index">BACK TO HOME</a>
<div class="container">
<div class="cards">

<c:forEach items="${catgSearch}" var="contact"> 
<div class="card" >
  <div class="card-header">
     <h5>${contact.name}</h5>
  </div>

    <p>${contact.email}</p>  <p>${contact.mobile} </p>
  
    <p>Category: ${contact.category}</p>
    <div><h6>Address</h6>
    <p>${contact.address.addressLine}
    ${contact.address.city} </p>
    <p>Pin : ${contact.address.pincode}</p></div>
   

</div>
</c:forEach>
</div>	
</div>
<a href="index">BACK TO HOME</a>
</c:if>
<c:if test="${empty catgSearch}"><h4>NOT FOUND</h4><a href="index">BACK TO HOME</a></c:if>
</body>