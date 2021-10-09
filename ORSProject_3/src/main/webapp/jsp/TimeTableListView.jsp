<%@page import="in.co.rays.ctl.TimeTableListCtl"%>
<%@page import="in.co.rays.util.HTMLUtility"%>
<%@page import="in.co.rays.dto.TimetableDTO"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.co.rays.util.DataUtility"%>
<%@page import="in.co.rays.util.ServletUtility"%>
<%@page import="java.util.List"%>
<%@page import="in.co.rays.ctl.TimeTableListCtl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Time Table List View</title>
<script src="<%=ORSView.APP_CONTEXT%>/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=ORSView.APP_CONTEXT%>/js/CheckBox11.js"></script>
<style>
.hm-gradient {
	background-image: url('<%=ORSView.APP_CONTEXT%>/img/bg.png');
}

.p1 {
	padding: 3px;
}
</style>
</head>
<body class="hm-gradient">
	<div>
		<%@include file="Header.jsp"%>
	</div>
	<div>
		<form action="<%=ORSView.TIMETABLE_LIST_CTL%>" method="post">




			<jsp:useBean id="dto" class="in.co.rays.dto.TimetableDTO"
				scope="request"></jsp:useBean>
			<%
				List list1 = (List) request.getAttribute("courseList");
			List list2 = (List) request.getAttribute("subjectList");
			%>
			<%
				int pageNo = ServletUtility.getPageNo(request);
			int pageSize = ServletUtility.getPageSize(request);
			int index = ((pageNo - 1) * pageSize) + 1;
			int nextPageSize = DataUtility.getInt(request.getAttribute("nextListSize").toString());
			List list = ServletUtility.getList(request);
			Iterator<TimetableDTO> it = list.iterator();
			if (list.size() != 0) {
			%>
			<center>
				<h1 style="font-size: 40px; padding-top: 24px; color: #162390;">TIMETABLE LIST</h1>
			</center>
			</br>

			<div class="row">
				<div class="col-md-4"></div>

				<%
					if (!ServletUtility.getSuccessMessage(request).equals("")) {
				%>

				<div class="col-md-4 alert alert-success alert-dismissible"
					style="background-color: #80ff80">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<h4>
						<font color="#008000"><%=ServletUtility.getSuccessMessage(request)%></font>
					</h4>
				</div>
				<%
					}
				%>

				<div class="col-md-4"></div>
			</div>
			<div class="row">
				<div class="col-md-4"></div>

				<%
					if (!ServletUtility.getErrorMessage(request).equals("")) {
				%>
				<div class=" col-md-4 alert alert-danger alert-dismissible">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<h4>
						<font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
					</h4>
				</div>
				<%
					}
				%>
				<div class="col-md-4"></div>
			</div>
			<div class="row">
				<!-- <div class="col-sm-0"></div> -->

				<div class="col-sm-4">
					<%=HTMLUtility.getList("subjectName", String.valueOf(dto.getSubId()), list2)%>
				</div>
				<div class="col-sm-4"><%=HTMLUtility.getList("courseName", String.valueOf(dto.getCourseId()), list1)%></div>


				<div class="col-sm-2">
					<input placeholder="Enter Exam Date" type="date" id="datepicker"
						name="Exdate" class="p1" onkeydown="return false"
						value="<%=DataUtility.getDateString(dto.getExamDate())%>">
				</div>

				<div class="col-sm-2">
					<input type="submit" class="btn btn-primary btn-md"
						style="font-size: 15px" name="operation"
						value="<%=TimeTableListCtl.OP_SEARCH%>">&emsp; <input
						type="submit" class="btn btn-warning btn-md"
						style="font-size: 15px" name="operation"
						value="<%=TimeTableListCtl.OP_RESET%>">
				</div>

			</div>

			</br>
			<div style="margin-bottom: 20px;" class="table-responsive">
				<table class="table">
					<thead>
						<tr style="background-color: #f2c12dcc;">

							<th width="10%"><input type="checkbox" id="select_all"
						name="Select" type="text"> Select All</th>
							<th class="text">S.NO</th>
                            <th class="text">Course Name</th>
							<th class="text">Subject Name</th>
							<th class="text">Semester</th>
							<th class="text">Exam Date</th>
							<th class="text">Exam Time</th>
							<th class="text">Description</th>
							<th class="text">Edit</th>
						</tr>
					</thead>
					<%
						while (it.hasNext()) {
						dto = it.next();
					%>

					<tbody>
						<tr>
							<td class="text"><input type="checkbox" class="checkbox"
								name="ids" value="<%=dto.getId()%>"></td>
							<td class="text"><%=index++%></td>
							<td class="text"><%=dto.getCourseName()%></td>
							<td class="text"><%=dto.getSubName()%></td>
							<td class="text"><%=dto.getSemester()%></td>
							<td class="text"><%=DataUtility.getDateString(dto.getExamDate())%></td>
							<td class="text"><%=dto.getExamTime()%></td>
							<td class="text"><%=dto.getDescription()%></td>
							<td class="text"><a
								href="TimeTableCtl?id=<%=dto.getId()%>">Edit</a></td>
						</tr>
					</tbody>
					<%
						}
					%>
				</table>
			</div>
			<table width="100%">
				<tr>
					<td><input type="submit" name="operation"
						class="btn btn-info btn-md" style="font-size: 17px"
						value="<%=TimeTableListCtl.OP_PREVIOUS%>"
						<%=pageNo > 1 ? "" : "disabled"%>></td>
					<td><input type="submit" name="operation"
						class="btn btn-primary btn-md" style="font-size: 17px"
						value="<%=TimeTableListCtl.OP_NEW%>"></td>
					<td><input type="submit" name="operation"
						class="btn btn-danger btn-md" style="font-size: 17px"
						value="<%=TimeTableListCtl.OP_DELETE%>"></td>

					<td align="right"><input type="submit" name="operation"
						class="btn btn-info btn-md" style="font-size: 17px"
						style="padding: 5px;" value="<%=TimeTableListCtl.OP_NEXT%>"
						<%=(nextPageSize != 0) ? "" : "disabled"%>></td>
				</tr>
				<tr></tr>
			</table>
			</br>

			<%
				}
			if (list.size() == 0) {
			System.out.println("user list view list.size==0");
			%>
			<center>
				<h1 style="font-size: 40px; padding-top: 24px; color: #162390;">Time
					Table List</h1>
			</center>
			</br>
			<div class="row">
				<div class="col-md-4"></div>

				<%
					if (!ServletUtility.getErrorMessage(request).equals("")) {
				%>
				<div class=" col-md-4 alert alert-danger alert-dismissible">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<h4>
						<font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
					</h4>
				</div>
				<%
					}
				%>
				<%
					if (!ServletUtility.getSuccessMessage(request).equals("")) {
				%>
				<div class=" col-md-4 alert alert-primary alert-dismissible">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<h4>
						<font color="red"><%=ServletUtility.getSuccessMessage(request)%></font>
					</h4>
				</div>
				<%
					}
				%>
				<div class="col-md-4"></div>
			</div>
			</br>
			<div style="padding-left: 48%;">
				<input type="submit" name="operation" class="btn btn-primary btn-md"
					style="font-size: 17px" value="<%=TimeTableListCtl.OP_BACK%>">
			</div>
			<%
				}
			%>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">


		</form>

	</div>
	</br>
	</br>
</body>
<%@include file="Footer.jsp"%>

</html>