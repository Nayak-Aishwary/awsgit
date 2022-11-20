<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!doctype html>
<html lang="en">

<head>

<title>Fun Travel Driver Profile Update</title>
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
					<div class="panel-title">Update Driver Profile</div>
				</div>

				<div style="padding-top: 30px; padding-left: 100px"
					class="panel-body">

					<form:form action="updateDriverDetails" modelAttribute="driver"
						method="POST" class="form-horizontal">

						<input type="hidden" name="driverId" placeholder="Id"
							class="form-control" value="${driver.driverId}">

						<table>
							<tr>
								<td style="width: 300px"><div style="margin-bottom: 25px"
										class="input-group">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-user"></i></span> <input type="text"
											name="dName" required="required" placeholder="Name"
											value="${driver.dName}" class="form-control">
									</div></td>
								<td>
									<div class="alert alert-primary" role="alert">
										<form:errors path="dName" />
									</div>
								</td>
							</tr>
							<tr>
								<td><div style="margin-bottom: 25px" class="input-group">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-user"></i></span> <input type="text"
											name="dSurname" required="required" placeholder="Surname"
											value="${driver.dSurname}" class="form-control">

									</div></td>
								<td><form:errors path="dSurname"></form:errors></td>
							</tr>
							<tr>
								<td>
									<div style="margin-bottom: 25px" class="input-group">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-envelope"></i></span> <input type="email"
											name="dEmail" placeholder="Email" required="required"
											value="${driver.dEmail}" class="form-control">
									</div>
								</td>
								<td><form:errors path="dEmail" /></td>
							</tr>
							<tr>
								<td>
									<div style="margin-bottom: 25px" class="input-group">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-cd"></i></span> <select
											name="dVehicleType" required="required" class="form-control">
											<option value="Taxi">Taxi</option>
											<option value="Bus" hidden="true">Bus</option>
											<option value="Train" hidden="true">Train</option>
										</select>
									</div>
								</td>
								<td><form:errors path="dVehicleType" /></td>
							</tr>
							<tr>
								<td>
									<div style="margin-bottom: 25px" class="input-group">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-yen"></i></span> <input type="number"
											name="baseFarePrice" value="${driver.baseFarePrice}"
											required="required" placeholder="Basefare Price"
											class="form-control">
									</div>
								</td>
								<td><form:errors path="baseFarePrice" /></td>
							</tr>
							<tr>
								<td>
									<div style="margin-bottom: 25px" class="input-group">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-resize-horizontal"></i></span> <input
											type="number" required="required" name="bfDistance"
											placeholder="Basefare Distance" value="${driver.bfDistance}"
											class="form-control">
									</div>
								</td>
								<td><form:errors path="bfDistance" /></td>
							</tr>
							<!-- Update Button -->
							<tr>
								<td>
									<div style="margin-top: 10px" class="form-group">
										<div class="col-sm-6 controls">
											<button type="submit" class="btn btn-success">Update</button>
										</div>
									</div>
								</td>
							</tr>
						</table>
					</form:form>
					<form action="${pageContext.request.contextPath}/driverdetails"
						method="GET" class="form-horizontal">
						<div style="margin-top: 5px" class="form-group">
							<div class="col-sm-6 controls">
								<button  type="submit" class="btn btn-info">
									Back</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>