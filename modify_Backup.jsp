<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Create a form that performs client-side validation">
	<meta name="author" content="Josh Howell">
	<link rel="icon" href="favicon.ico">

	<title>LIS4368 - JSP Forms</title>

	<%@ include file="/css/include_css.jsp" %>		
	
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
					
					<form id="add_customer_form" method="post" class="form-horizontal" action="${pageContext.request.contextPath}/customerAdmin">
					<% // goes to info/CustomerServlet.java %>
					<input type="hidden" name="add_customer" value="add">
					<input type="submit" value="Add">
					</form>
					
					<!-- Responsive table -->
					<div class="table-responsive">
						<table id="myTable" class="table table-striped table-condensed" >
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
									
									<!-- Create form buttons and hidden input fields to pass data //-->
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
									</div> <!-- end table-responsive -->
									</div>
									</div>
							<%@ include file="global/footer.jsp" %>
							
							</div> <!-- end starter template-->
							</div> <!-- end container -->
							
							<%@ include file="/js/include_js.jsp" %>
							
							<script type="text/javascript">
								$(document).ready(function(){
									//https://datatables.net/reference/option/lengthMenu
									//1st inner array page length values; 2nd inner array displayed options
									//Note: -1 is used to disable pagination (i.e., display all rows)
									//Note: pageLenght property automatically set to first value given in array
									$('#myTable').DataTable({
									"lengthMenu": [ [ 10,25,50,-1], [10,25,50,"All"] ],
									//permit sorting (i.e., no sorting on last two columns: delete and edit)
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
									{ "orderable": false },
									{ "orderable": false }
									]
										});
								});
									</script>
									
									</body>
									</html>
							
							
						
										
									
					
					
					
					
					
					
					
					