<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="My online portfolio that illustrates skills acquired while working through various project requirements.">
	<meta name="author" content="Josh Howell">
	<link rel="icon" href="favicon.ico">

	<title>LIS4368 - Assignment 2</title>

	<%@ include file="/css/include_css.jsp" %>		
	
</head>
<body>

<!-- display application path -->
<% //= request.getContextPath()%>
	
<!-- can also find path like this...<a href="${pageContext.request.contextPath}${'/a5/index.jsp'}">A5</a> -->

	<%@ include file="/global/nav.jsp" %>	

	<div class="container">
		<div class="starter-template">
			<div class="row">
				<div class="col-sm-8 col-sm-offset-2">
					
					<div class="page-header">
						<%@ include file="global/header.jsp" %>
					</div>

					<img src="img/hello.png" class="img-responsive center-block" alt="hello" />

					<br /> <br />

					<img src="img/index.png" class="img-responsive center-block" alt="index" />
					
					<br /> <br />

					<img src="img/sayhello.png" class="img-responsive center-block" alt="sayhello" />
					
					<br /> <br />

					<img src="img/querybook.png" class="img-responsive center-block" alt="querybook" />
					
					<br /> <br />

					<img src="img/sayhi.png" class="img-responsive center-block" alt="sayhi" />
					
					<br /> <br />

					<img src="img/queryresults.png" class="img-responsive center-block" alt="queryresults" />
				</div>
			</div>

	<%@ include file="/global/footer.jsp" %>

	</div> <!-- end starter-template -->
 </div> <!-- end container -->

 	<%@ include file="/js/include_js.jsp" %>		

</body>
</html>
