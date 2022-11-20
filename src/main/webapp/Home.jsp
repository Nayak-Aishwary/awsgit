<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">

<head>

<title>FUN TRAVEL COMPANY</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Reference Bootstrap files -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<!-- <body style="background-image: url(CabImage.jpg); background-size: 100%;"> -->
<body>
	<div >
		<div id="loginbox" style="margin-top: 80px; "
			class="mainbox col-md-8 col-md-offset-2 col-sm-6 col-sm-offset-2">

			<div class="panel panel-info">

				<div class="panel-heading">
					<div class="panel-title">FUN TRAVEL COMPANY - Travel Fare
						Service</div>
				</div>

				<div style="padding-top: 30px" class="panel-body">

					<form action="fareCalculate" method="GET" class="form-horizontal">

						<div class="form-group">
							<div class="col-xs-15">
								<div></div>
							</div>
						</div>

						<div style="margin-top: 10px" class="form-group">
							<div class="col-sm-6 controls">
								<button type="submit" class="btn btn-success">Cheapest
									Fare Calculation</button>
							</div>
						</div>

					</form>
					<form action="driverdetails" method="GET" class="form-horizontal">
						<div style="margin-top: 10px" class="form-group">
							<div class="col-sm-6 controls">
								<button type="submit" class="btn btn-success">Driver
									Profiles</button>
							</div>
						</div>
					</form>

					<form action="${pageContext.request.contextPath}/logout"
						method="POST" class="form-horizontal">
						<div style="margin-top: 10px" class="form-group">
							<div class="col-sm-6 controls">
								<button value="Logout" type="submit" class="btn btn-danger">
									Logout</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>