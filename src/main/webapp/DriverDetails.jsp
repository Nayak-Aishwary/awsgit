<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html lang="en">

<head>

<title>Fun Travel Driver Profiles</title>
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
		<div id="loginbox" style="margin-top: 25px;"
			class="mainbox col-md-8 col-md-offset-1 col-sm-8 col-sm-offset-2">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">FUN TRAVEL DRIVER PROFILES</div>
				</div>
				<table class="table">
					<tr>
						<td>
							<form action="register" method="GET" class="form-horizontal">
								<div style="margin-top: 10px" class="form-group">
									<div class="col-sm-6 controls">
										<button type="submit" class="btn btn-success">Driver
											Registration</button>
									</div>
								</div>
							</form>
						</td>
						<td>
							<form action="findDriver" method="GET" class="form-horizontal">
								<div style="margin-top: 10px" class="form-group">
									<div class="col-sm-5 controls">
										<button type="submit" class="btn btn-success">Find
											Driver By Name</button>
									</div>
									<div style="margin-bottom: 5px" class="input-group">
										<input style="margin-left: 5px" type="text" name="driverName"
											placeholder="Enter Name" class="form-control">
									</div>
								</div>
							</form>
						</td>
						<td>
							<form action="mainmenu" method="GET" class="form-horizontal">
								<div style="margin-top: 10px" class="form-group">
									<div class="col-sm-6 controls">
										<button type="submit" class="btn btn-success">Main
											Menu</button>
									</div>
								</div>
							</form>
						</td>
					</tr>
				</table>
				<c:if test="${not empty deleted }">
					<div style="margin-bottom: 25px" class="input-group">
						<span style="width: 200px" style="width: 150px"
							class="input-group-addon">INFO:</span>
						<p class="form-control">${deleted}</p>
					</div>
				</c:if>
				<div style="padding-top: 30px" class="panel-body">
					<table class="table">
						<thead>
							<tr>
								<td>Driver Id</td>
								<td>Driver Name</td>
								<td>Driver Surname</td>
								<td>Email ID</td>
								<td>Vehicle Type</td>
								<td>Base Fare Price</td>
								<td>Base Fare Distance</td>
								<td></td>
							</tr>
						</thead>
						<tbody id="myTable">
							<c:choose>
								<c:when test="${driverDetails.size() > 0 }">
									<c:forEach var="driver" items="${driverDetails}">
										<tr>
											<td>${driver.driverId}</td>
											<td>${driver.dName}</td>
											<td>${driver.dSurname}</td>
											<td>${driver.dEmail}</td>
											<td>${driver.dVehicleType}</td>
											<td>${driver.baseFarePrice}</td>
											<td>${driver.bfDistance}</td>
											<td><a href="updateDriver/${driver.driverId}"
												class="btn btn-outline-info">Edit</a></td>
											<td><a href="deleteDriver/${driver.driverId}"
												class="btn btn-outline-danger">Delete</a></td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5">No Records Found</td>
									</tr>
								</c:otherwise>
							</c:choose>
							<c:if test="${driverDetails.size() > 0 }">
								<div style="position: absolute; right: 1; bottom: 0; left: 0;">
									Showing ${number+1} of ${size+1} of ${totalElements}
									<ul class="pagination">
										<c:forEach begin="0" end="${totalPages-1}" var="page">
											<li class="page-item"><a
												href="viewdriver?page=${page}&size=${size}"
												class="page-link">${page+1}</a></li>
										</c:forEach>
									</ul>
								</div>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>