<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/Validate.js"></script>
	<jsp:include page="${pageContext.request.contextPath}/../head.jsp"/>
	<script type="text/javascript">
			function MyAutoRun()
	　　{  
				//修改标签为激活
				document.getElementById("sysMessage").className = "active";
				document.getElementById("sysMessage").parentNode.parentNode.className = "treeview menu-open";
				document.getElementById("sysMessage").parentNode.style.cssText = "display: block;";
	　　}  
	　　window.onload=MyAutoRun(); //仅需要加这一句
	</script>
	<style type="text/css">
		.col-lg-3{
			padding-top: 1%;
		}
		#first_th:AFTER{
			display: none;
		}
		i:HOVER{
			cursor: pointer;
		}
	</style>
<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        	消息发送
      </h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/index.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="${pageContext.request.contextPath}/AnnoucementController/showAllAnno">公告管理</a></li>
        <li class="active">消息发送</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
      	<div class="col-md-6">
      		<div class="box box-primary">
	            <div class="box-header with-border">
	              <h3 class="box-title"></h3>
	            </div>
		        <form role="form" action="${pageContext.request.contextPath}/EmailController/addEmail" method="post">
		              <div class="box-body">
		                <div class="form-group">
		                  <label for="typeName">玩家ID</label>
		                  <input class="form-control" id="playerid" name="playerid" value="${playerid }" required="required" readonly="readonly">
		                </div>
		                <div class="form-group">
		                  <label for="typeName">玩家昵称</label>
		                  <input class="form-control" id="nickname" name="nickname" value="${nickname }" required="required" readonly="readonly">
		                </div>
		                <div class="form-group">
		                  <label for="typeName">消息主题</label>
		                  <input class="form-control" id="title" name="title" value="${mail.title }" required="required">
		                </div>
		                <div class="form-group">
		                  <label for="typeName">消息内容</label>
		                  <textarea class="form-control" id="message" name="message"  style="height: 200px" required="required" >${mail.message }</textarea>
		                </div>
		              </div>
		              <div class="box-footer">
		              	<input type="hidden" name="id" value="${message.id}" />
		              	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		                <button type="submit" class="btn btn-primary" >提交</button>
		                <button type="button" class="btn" style="margin-left: 5%;" onclick="javascript:window.history.back();">返回</button>
		              </div>
		            </form>
	            </div>
            </div>
       	</div>
   	</section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
<jsp:include page="${pageContext.request.contextPath}/../foot.jsp"/>
<script>
	function check(){
		var flag =false;
		var content = $('#content').val();
		var times  = $('#times').val();
		if(content!='${message.content }'){
			flag = true;
		}
		if(times!='${message.times }'){
			flag = true;
		}
		if(!flag){
			alert('请修改内容后提交！');
		}
		return flag;
	};
</script>