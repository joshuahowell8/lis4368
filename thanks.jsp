<%@page contentType="text/html" pageEncoding="utf-8"%>

<html lang="en">
<head>
<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="My online portfolio that illustrates skills acquired while working through various project requirements.">
	<meta name="author" content="Josh Howell">
	<link rel="icon" href="favicon.ico">

	<title>LIS4368 - JSP Forms</title>

	<%@ include file="/css/include_css.jsp" %>		
	
</head>
<body>

	<%@ include file="/global/nav_global.jsp" %>	

	<div class="container">
		<div class="starter-template">
			<div class="row">
				<div class="col-xs-12">
					
					<div class="page-header">
						<%@ include file="/global/header.jsp" %>
					</div>

    <h3>Thanks for joining our customer list!</h3>

    <p>Here is the information that you entered:</p>

		<div class="col-xs-12 col-sm-offset-4 text-left">

			<label>FName:</label> ${user.fname}<br />
			<label>LName:</label> ${user.lname}<br />
			<label>Street:</label> ${user.street}<br />
			<label>City:</label> ${user.city}<br />
			<label>State:</label> ${user.state}<br />
			<label>Zip:</label> ${user.zip}<br />
			<label>Phone:</label> ${user.phone}<br />
			<label>Email:</label> ${user.email}<br />
			<label>Balance:</label> ${user.balance}<br />
			<label>Total Sales:</label> ${user.totalSales}<br />
			<label>Notes:</label> ${user.notes}<br /><br />
			
			

			<p>To enter another email address, <br />
				click the Back button in your browser or Return button below.</p>
							
			<form action="" method="post">
				<input type="hidden" name="action" value="join">
				<input type="submit" value="Return">
			</form>
			
		</div>

				</div>
			</div>

	<%@ include file="/global/footer.jsp" %>

	</div> <!-- end starter-template -->
 </div> <!-- end container -->

 	<%--@ include file="/js/include_js.jsp" --%>		 
		
</body>
</html>
