<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!doctype html>
<html lang="en">

<head>

<title>FUN TRAVEL FARE CALCULATION</title>
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
					<div class="panel-title">Calculate Cheapest Fare</div>
				</div>
				<div style="padding-top: 5px" class="panel-body">
					<table>
						<tr>
							<td style="padding-left: 10px"><form action="mainmenu"
									method="GET" class="form-horizontal">
									<div style="margin-top: 10px" class="form-group">
										<div class="col-sm-6 controls">
											<button type="submit" class="btn btn-success">Main
												Menu</button>
										</div>
									</div>
								</form>
							</td>
							<td style="padding-left: 30px"><form
									action="downloadfile/Sample.csv" method="GET"
									class="form-horizontal">
									<div style="margin-top: 10px" class="form-group">
										<div class="col-sm-6 controls">
											<button type="submit" class="btn btn-info">
												<i>Download Sample File</i>
											</button>
										</div>
									</div>
								</form>
							</td>
						</tr>
					</table>
				</div>
				<div style="padding-top: 5px" class="panel-body">
					<form action="uploadCsv" method="POST"
						enctype="multipart/form-data" class="form-horizontal">
						<table>
							<tr>
								<td><p align="left">
										<B>FILE UPLOAD</B></td>
							</tr>
							<tr>
								<c:if test="${not empty errorMsg }">
									<div style="margin-bottom: 25px" class="input-group">
										<span style="width: 200px" style="width: 150px"
											class="input-group-addon">Information :</span>
										<p class="form-control">${errorMsg}</p>
									</div>
								</c:if>
							</tr>
							<tr>
								<td colspan="2"><b>Please upload CSV file here:</b></td>
								<td ><input NAME="file" accept=".csv" TYPE="file" /></td>
							</tr>
							<tr>
								<td colspan="2">
									<div style="margin-top: 10px" class="form-group">
										<div class="col-sm-6 controls">
											<button type="submit" class="btn btn-success">
												Calculate Fare</button>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<c:if test="${not empty cheapestFare }">
									<div style="margin-bottom: 25px" class="input-group">
										<span style="width: 200px" style="width: 150px"
											class="input-group-addon">Cheapest Fare :</span>
										<p class="form-control">${cheapestFare}</p>
									</div>
								</c:if>
							</tr>
						</table>
					</form>
					<i>Calculation History:</i>
					<table class="table">
						<thead>
							<tr>
								<td>Cheapest Fare</td>
								<td>Total Distance</td>
								<td>Unit</td>
								<td>Cost per Unit</td>
							</tr>
						</thead>
						<tbody id="myTable">
							<c:choose>
								<c:when test="${searchHistory.size() > 0 }">
									<c:forEach var="searchHistory" items="${searchHistory}">
										<tr>
											<td>${searchHistory.cheapestFare}</td>
											<td>${searchHistory.totalDistance}</td>
											<td>${searchHistory.distTravelUnit}</td>
											<td>${searchHistory.costPerDistTraveled}</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5">No Search History</td>
									</tr>
								</c:otherwise>
							</c:choose>
							<c:if test="${searchHistory.size() > 0 }">
								<div style="position: absolute; right: 1; bottom: 0; left: 0;">
									Showing ${number+1} of ${size+1} of ${totalElements}
									<ul class="pagination">
										<c:forEach begin="0" end="${totalPages-1}" var="page">
											<li class="page-item"><a
												href="viewHistory?page=${page}&size=${size}" class="page-link">${page+1}</a>
											</li>
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