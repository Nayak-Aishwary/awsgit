<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!doctype html>
<html lang="en">

<head>

<title>Fun Travel Registration Successful</title>
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
<body>
	<div>
		<div id="loginbox" style="margin-top: 5px; margin-left: 200px"
			class="mainbox col-md-8 col-md-offset-1 col-sm-8 col-sm-offset-2">
			<div class="panel panel-info">
				<div class="panel-heading">
					<c:choose>
						<c:when test="${not empty deleteMessage }">
							<div class="panel-title">${deleteMessage}</div>
						</c:when>
						<c:when test="${not empty driverUpdated }">
							<div class="panel-title">${driverUpdated}</div>
						</c:when>
						<c:otherwise>
							<div class="panel-title">Registration Successful!</div>
						</c:otherwise>
					</c:choose>
				</div>
				<div style="padding-top: 25px; padding-left: 200px"
					class="panel-body">
					<!-- Login Form -->
					<form:form action="mainmenu" method="GET" class="form-horizontal">
						<table>
							<tr>
								<!-- User name -->
								<td><div style="margin-bottom: 25px" class="input-group">
										<span style="width: 200px" class="input-group-addon">Your
											ID </span> <span style="width: 200px" class="form-control">${driver.driverId}</span>
									</div></td>
							</tr>
							<tr>
								<!-- Password -->
								<td><div style="margin-bottom: 25px" class="input-group">
										<span style="width: 200px" class="input-group-addon">Driver
											Name</span> <span style="width: 200px" class="form-control">${driver.dName}</span>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div style="margin-bottom: 25px" class="input-group">
										<span style="width: 200px" class="input-group-addon">Driver
											Surname</span> <span style="width: 200px" class="form-control">${driver.dSurname}</span>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div style="margin-bottom: 25px" class="input-group">
										<span style="width: 200px" style="width: 150px"
											class="input-group-addon">Email ID </span> <span
											style="width: 200px" class="form-control">${driver.dEmail}</span>
									</div>
								</td>
							</tr>

							<tr>
								<td>
									<div style="margin-bottom: 25px" class="input-group">
										<span style="width: 200px" class="input-group-addon">Vehicle
											Type</span> <span style="width: 200px" class="form-control">${driver.dVehicleType}</span>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div style="margin-bottom: 25px" class="input-group">
										<span style="width: 200px" class="input-group-addon">Base
											Fare Price</span> <span style="width: 200px" class="form-control">${driver.baseFarePrice}</span>
									</div>
								</td>
							</tr>

							<tr>
								<td>
									<div style="margin-bottom: 25px" class="input-group">
										<span style="width: 200px" class="input-group-addon">Base
											Fare Distance</span> <span style="width: 200px" class="form-control">${driver.bfDistance}</span>
									</div>
								</td>
							</tr>

						</table>
					</form:form>
					<form action="${pageContext.request.contextPath}/mainmenu"
						method="GET" class="form-horizontal">
						<div style="margin-top: 5px" class="form-group">
							<div class="col-sm-6 controls">
								<button  type="submit" class="btn btn-info">
									Main Menu</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>