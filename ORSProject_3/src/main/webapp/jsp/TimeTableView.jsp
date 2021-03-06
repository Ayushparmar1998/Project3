<%@page import="in.co.rays.ctl.TimeTableCtl"%>
<%@page import="in.co.rays.ctl.TimeTableCtl"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="in.co.rays.util.HTMLUtility"%>
<%@page import="in.co.rays.util.ServletUtility"%>
<%@page import="in.co.rays.util.DataUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Time Table View</title>
<link href="<%=ORSView.APP_CONTEXT%>/css/main.css" rel="stylesheet"
	id="bootstrap-css">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.1/js/mdb.min.js"></script>
<style type="text/css">
.log1 {
	padding-top: 4px;
	/* padding-left: 30%; */
}
i.css {
	border: 2px solid #8080803b;
	padding-left: 10px;
	 padding-bottom: 7px; 
	 background-color: #ebebe0;
}


.hm-gradient {
	background-image: url('<%=ORSView.APP_CONTEXT%>/img/bg.png');
}
</style>
</head>
<body class="hm-gradient">
	<div class="header">
		<%@include file="Header.jsp"%>
	</div>
	<div>
        <main>
		<form action="<%=ORSView.TIMETABLE_CTL%>" method="post">

			<div class="row log1">
				<jsp:useBean id="dto" class="in.co.rays.dto.TimetableDTO"
					scope="request"></jsp:useBean>
				<!-- Grid column -->
				<div class="col-md-4 mb-4"></div>
				<div class="col-md-4 mb-4">
					<div class="card">
						<div class="card-body">
							<%
								 long id = DataUtility.getLong(request.getParameter("id"));

								if (id > 0) {
							%>
							<h3 class="text-center default-text py-3">UPDATE TIMETABLE</h3>
							<%
								} else {
							%>
							<h3 class="text-center default-text py-3">ADD TIMETABLE</h3>
							<%
								}
							%>
							<!--Body-->
							<div>


								<H6 align="center">
									<%
										if (!ServletUtility.getSuccessMessage(request).equals("")) {
									%>
									<div class="alert alert-success alert-dismissible">
										<button type="button" class="close" data-dismiss="alert">&times;</button>
										<%=ServletUtility.getSuccessMessage(request)%>
									</div>
									<%
										}
									%>
								</H6>

								<H6 align="center">
									<%
										if (!ServletUtility.getErrorMessage(request).equals("")) {
									%>
									<div class="alert alert-danger alert-dismissible">
										<button type="button" class="close" data-dismiss="alert">&times;</button>
											<%=ServletUtility.getErrorMessage(request)%>
									</div>
									<%
										}
									%>

								</H6>
								<%
									List l = (List) request.getAttribute("courseList");
									List li = (List) request.getAttribute("subjectList");
								%>
								<input type="hidden" name="id" value="<%=dto.getId()%>">
								<input type="hidden" name="createdBy"
									value="<%=dto.getCreatedBy()%>"> <input type="hidden"
									name="modifiedBy" value="<%=dto.getModifiedBy()%>"> <input
									type="hidden" name="createdDatetime"
									value="<%=DataUtility.getTimestamp(dto.getCreatedDatetime())%>">
								<input type="hidden" name="modifiedDatetime"
									value="<%=DataUtility.getTimestamp(dto.getModifiedDatetime())%>">
							</div>
							<div class="md-form">
								<span class="pl-sm-5"><b>course</b><span
									style="color: red;">*</span></span> </br> <i
									class="fa fa-envelope prefix grey-text css" style="font-size: 1rem;"></i>
								 <div style="margin-left: 47px;">
									<%=HTMLUtility.getList("courseName", String.valueOf(dto.getCourseId()), l)%>
								</div>
								<font color="red" class="pl-sm-5"> <%=ServletUtility.getErrorMessage("courseName", request)%></font></br>

								<span class="pl-sm-5"><b>Subject</b><span
									style="color: red;">*</span></span> </br> <i
									class="fa fa-book prefix grey-text css" style="font-size: 1rem;"></i>
								 <div style="margin-left: 47px;">
									<%=HTMLUtility.getList("subjectName", String.valueOf(dto.getSubId()), li)%>
								</div> 
								<font color="red" class="pl-sm-5"> <%=ServletUtility.getErrorMessage("subjectName", request)%></font></br>

								<span class="pl-sm-5"><b>Semester</b><span
									style="color: red;">*</span></span> </br> <i
									class="fa fa-sort-numeric-asc prefix grey-text css" style="font-size: 1rem;"></i>
								<div style="margin-left: 47px;">
									<%
										HashMap map = new HashMap();
										map.put("1semester", "1semester");
										map.put("2semester", "2semester");
										map.put("3semester", "3semester");
										map.put("4semester", "4semester");
										map.put("5semester", "5semester");
										map.put("6semester", "6semester");
										map.put("7semester", "7semester");
										map.put("8semester", "8semester");
										map.put("9semester", "9semester");
										map.put("10semester", "10semester");

										String htmlList = HTMLUtility.getList("semesterId", dto.getSemester(), map);
									%>
									<%=htmlList%></div>
								<font color="red" class="pl-sm-5"> <%=ServletUtility.getErrorMessage("semesterId", request)%></font></br>

								<span class="pl-sm-5"><b>Exam Date</b><span
									style="color: red;">*</span></span> </br> <i
									class="fa fa-calendar-plus-o prefix grey-text css" style="font-size: 1rem;"></i> <input
									type="date" name="examDate" placeholder="Enter Exam Date"
									id="datepicker" style="border: 2px solid #8080803b;" onkeydown="return false"
									value="<%=DataUtility.getDateString(dto.getExamDate())%>">
								<font color="red" class="pl-sm-5"> <%=ServletUtility.getErrorMessage("examDate", request)%></font></br>

								<span class="pl-sm-5"><b>Exam Time</b><span
									style="color: red;">*</span></span> </br> <i
									class="fa fa-clock-o prefix grey-text css" style="font-size: 1rem;"></i>
								<div style="margin-left: 47px;">
									<%
										HashMap map1 = new HashMap();
										map1.put("08:00 AM to 11:00 AM", "08:00 AM to 11:00 AM");
										map1.put("12:00PM to 3:00PM", "12:00PM to 3:00PM");
										map1.put("3:00PM to 6:00PM", "3:00PM to 6:00PM");
										String htmlList1 = HTMLUtility.getList("examId", dto.getExamTime(), map1);
									%>
									<%=htmlList1%></div>
								<font color="red" class="pl-sm-5"> <%=ServletUtility.getErrorMessage("examId", request)%></font></br>

								<span class="pl-sm-5"><b>Description</b><span
									style="color: red;">*</span></span> </br> <i
									class="fa fa-sort-amount-desc prefix grey-text css" style="padding-bottom: 20px;font-size: 1rem; "></i>
								<textarea name="description" placeholder="Enter description"
									rows="5" cols="5"><%=DataUtility.getStringData(dto.getDescription())%></textarea>
								<font color="red" class="pl-sm-5"> <%=ServletUtility.getErrorMessage("description", request)%></font>

							</div>
						
							<%
								if (id > 0) {
							%>
							<div class="text-center">
								<input type="submit" name="operation"
									class="btn btn-success btn-md" style="font-size: 17px"
									value="<%=TimeTableCtl.OP_UPDATE%>"> <input
									type="submit" name="operation" class="btn btn-success btn-md"
									style="font-size: 17px" value="<%=TimeTableCtl.OP_CANCEL%>">
							</div>
							<%
								} else {
							%>
							<div class="text-center">
								<input type="submit" name="operation"
									class="btn btn-success btn-md" style="font-size: 17px"
									value="<%=TimeTableCtl.OP_SAVE%>"> <input type="submit"
									name="operation" class="btn btn-warning btn-md"
									style="font-size: 17px" value="<%=TimeTableCtl.OP_RESET%>">
							</div>
							<%
								}
							%>

						</div>
					</div>
				</div>
				<div class="col-md-4 mb-4"></div>
				</div>
				
		</form>
		</main>


	</div>

</body>
<%@include file="Footer.jsp"%>
</html>