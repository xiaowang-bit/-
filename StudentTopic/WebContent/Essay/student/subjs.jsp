<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>显示所有学生 </title>
		<link rel="stylesheet" type="text/css"
			href="../bootstrap/css/bootstrap.min.css" />
			<style type="text/css">
				*{
				font-size: 14px!important;
			}
			body{
				background:url(../img/BG.jpg) repeat;
			}

			</style>
		
	</head>

	<body>
		<div>
			<table class="table table-bordered table-hover">
				<thred>
					老师编号查询：
					<tr>
						
							<select name="mylink" id="mylink"> 
								<c:forEach var="item" items="${sessionScope.subjs }">
									<OPTION value="${item.topic_tea_id}">${item.topic_tea_id}</OPTION> 
				        		</c:forEach>
							</select> 
							<a href="/StudentTopic/StudentSelectByteaIdServlet"><button value="查询">查询</button></a>
						
					</tr>
					<tr>
						<th>题目编号</th>
						<th>老师名字</th>
						<th>题目名字</th>
						<th>课程名字</th>
						<th>题目内容</th>
						<th>限制人数</th>
						<th>操作</th>
					</tr>
				</thred>
		        <tbody>
		        	<c:forEach var="item" items="${sessionScope.subjs }">
			        	<tr>
				    	<td>${item.topic_id }</td>
				    	<td>${item.tea_name }</td>
				    	<td>${item.topic_name }</td>
				    	<td>${item.course_name}</td>
				    	<td>${item.topic_content}</td>
				    	<td>${item.topic_limit_stu}</td>
				    	<td>
			    			<a href="#" onclick="showDelete('${item.topic_id}','${item.course_id}','${item.tea_id}','${item.topic_semater} }')">选择 </a>
			    		</td>
				    	</tr>
		        	</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- 选题操作的模态框，对话框 -->
		<form action="/StudentTopic/StudentSelectTopicServlet?stu_id=${sessionScope.login_stu.stu_id}" method="post" class="form-horizontal">
		<input type="hidden" name="st_semater" id="st_semater">
		<input type="hidden" name="topic_id" id="topic_id">
		<input type="hidden" name="course_id" id="course_id">
		<input type="hidden" name="tea_id" id="tea_id">
			<div class="modal" id="modal_delete">
				<div class="modal-dialog">
				    <div class="modal-content">
					    <div class="modal-header">
						    <h1>提示</h1>
					    </div>
					    <div class="modal-body">
					    	请确定你的身份
						    <select name="st_stu_check">
							  <option value ="组长" >组长</option>
							  <option value ="组员">组员</option>
							</select>
							</br>
						       您确定要选择【<span id="u_name"></span>】吗？
					    </div>
					    <div class="modal-footer">
						    <button type="submit" class="btn btn-sm btn-danger">确定</button>
						    <button type="reset" class="btn btn-sm btn-default"
						    	data-dismiss="modal">取消</button>
	                    </div>
				    </div>
			    </div>
		    </div>
	    </form>
	</body>
	<script src="../js/jquery-3.2.1.min.js"type="text/javascript"charset="UTF-8"></script>
	<script src="../bootstrap/js/bootstrap.min.js"type="text/javascript"charset="UTF-8"></script>
	<script type="text/javascript">
		function showDelete(n,n1,n2,n3)
		{
			jQuery("#u_name").html(n);
			jQuery("#modal_delete").modal();
			jQuery("#topic_id").val(n);
			jQuery("#course_id").val(n1);
			jQuery("#st_semater").val(n3);
			jQuery("#tea_id").val(n2);
		}
	</script>
</html>