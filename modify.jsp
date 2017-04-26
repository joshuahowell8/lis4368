<%-- Use core library --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="My online portfolio is a way to show you some of the projects that we worked on this semester">
	<meta name="author" content="Lu Wei Huang">
	<link rel="icon" href="favicon.ico">

	<title>Lis 4368 - JSP Forms</title>

	<%@ include file="/css/include_css.jsp" %>
                                           
                                           <!-- Include FontAwesome CSS to use feedback icons provided by FontAwesome -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

<!-- Bootstrap for responsive, mobile-first design. -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">

<!-- Form validation styling. -->
<link rel="stylesheet" href="css/formValidation.min.css"/>

<!-- Starter template for individual styling. -->
<link href="css/starter-template.css" rel="stylesheet">

<!-- jQuery DataTables: http://www.datatables.net/ //-->
<link rel="stylesheet" type=""text/css" href="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css"/>
<link rel="stylesheet" type=""text/css" href="https://cdn.datatables.net/responsive/2.0.2/css/responsive.dataTables.min.css"/>

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

</head>
<body>

<!-- display application path -->
<% //= request.getContextPath()%>

<!-- can also find path like this...<a href="${pageContext.request.contextPath}${'/a5/index.jsp'}">A5</a> -->

	<%@ include file="/global/nav_global.jsp" %>


	<div class="container">
		<div class="starter-template">
			<div class="row">
				<div class="col-xs-12">

					<div class="page-header">
						<%@ include file="/p2/global/header.jsp" %>
					</div>

					<h2>Customers</h2>

				<form id="customerAdmin" method="post" class="form-horizontal" action="${pageContext.request.contextPath}/customerAdmin">

					<input type="hidden" name="add_customer" value="add">
					<input type="submit" value="Add">
				</form>

				<%
				//blah
				//blah again
				%>

					<!-- Responsive table. -->
					<div class="table-responsive" >
						<table id="myTable" class="table table-striped table-condensed">
							<thead>
								<tr>
									<th>Fname</th>
									<th>Lname</th>
									<th>Street</th>
									<th>City</th>
									<th>State</th>
									<th>Zip</th>
									<th>Phone</th>
									<th>Email</th>
									<th>Balance</th>
									<th>Total Sales</th>
									<th>Notes</th>
									<th>&nbsp;</th>
									<th>&nbsp;</th>
								</tr>
							</thead>

							<tbody>
							<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
							<c:forEach var="user" items="${users}">
								<tr>
									<td><c:out value="${user.fname}" /></td>
									<td><c:out value="${user.lname}" /></td>
									<td><c:out value="${user.street}" /></td>
									<td><c:out value="${user.city}" /></td>
									<td><c:out value="${user.state}" /></td>
									<td><c:out value="${user.zip}" /></td>
									<td><c:out value="${user.phone}" /></td>
									<td><c:out value="${user.email}" /></td>
									<td><c:out value="${user.balance}" /></td>
									<td><c:out value="${user.totalSales}" /></td>
									<td><c:out value="${user.notes}" /></td>

									<!-- Create form buttons and hidden input fields -->
									<td>
										<form id="edit_customer_form" method="post" class="form-horizontal" action="${pageContext.request.contextPath}/customerAdmin">
											<input type="hidden" name="display_customer" value="${user.id}" />
											<input type="submit" value="Edit" />
										</form>
									</td>

									<td>
										<form
												onsubmit="return confirm('Do you really want to delete record?');"
												id="edit_customer_form"
												action="customerAdmin"
												method="post">
											<input type="hidden" name="delete_customer" value="${user.id}" />
											<input type="submit" value="Delete" />
										</form>
									</td>

								</tr>
							</c:forEach>
						</tbody>

					</table>

				</div><!-- end table-responsive -->

			</div>
		</div>

	<%@ include file="global/footer.jsp" %>

</div><!--end starter-template -->
</div><!-- end container -->

<%@ include file="/js/include_js.jsp" %>

<script type="text/javascript">
	$(document).ready(function(){
		$('#myTable').DataTable({
			"lengthMenu":[[10, 25, 50, -1],[10, 25, 50, "All"]],
			//blah
		"columns":
		[
			null,
			null,
			null,
			null,
			null,
			null,
			null,
			null,
			null,
			null,
			null,
			{ "orderable": false},
			{ "orderable": false}
		]
		});
	});
	</script>

</body>
</html>
