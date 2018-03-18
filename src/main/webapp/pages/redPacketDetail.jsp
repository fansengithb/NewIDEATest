<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/Validate.js">
</script>
	<jsp:include page="${pageContext.request.contextPath}/../head.jsp"/>
	<style type="text/css">
		.col-lg-3,.col-lg-2,.col-lg-1{
			padding-top: 1%;
		}
		#first_th:AFTER{
			display: none;
		}
		i:HOVER {
			cursor: pointer;
		}
	</style>
<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        	红包项目详情
      </h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/index.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li class="active">游戏记录查询</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
	          <div class="box box-success">
	          <form action="${pageContext.request.contextPath}/RedController/addProject" method="post" onsubmit="return checkRedConfig();">
		             <div class="row" style="margin-top: 1%;margin-buttom: 2%;">
		          		<div class="col-lg-3">
						    <div align="center" class="input-group" >
						      <span class="input-group-btn">
						        <label class="btn btn-default">项目名称：</label>
						      </span>
				              <input type="text" class="form-control" name="name" id="name" placeholder="项目名称" value="${name }">
						    </div>
						</div>
						<div class="col-lg-3">
						    <div align="center" class="input-group" >
						      <span class="input-group-btn">
						        <label class="btn btn-default">项目路径：</label>
						      </span>
				              <input type="text" class="form-control" name="pathName" id="pathName" placeholder="项目路径" value="${pathName }">
						    </div>
						</div>
		            </div>
	            	<div class="row" style="margin-top: 1%;margin-buttom: 2%;">
						<div class="col-lg-3">
						    <div class="input-group">
						      <span class="input-group-btn">
						        <label class="btn btn-default">起始时间：</label>
						      </span>
				              <input type="text" class="form-control pull-right reservationtime" name="starttime" value="${startTime }" id="starttime">
						    </div>
						</div>
				    	<div class="col-lg-3">
						    <div class="input-group">
						      <span class="input-group-btn">
						        <label class="btn btn-default">结束时间：</label>
						      </span>
				              <input type="text" class="form-control pull-right reservationtime" name="endtime" value="${endTime }" id="endtime">
						    </div>
						</div>
			            <div class="col-lg-3">
						    <div class="input-group">
						      <span class="input-group-btn">
						        <label class="btn btn-default">红包总金额：</label>
						      </span>
								<input type="text" class="form-control" name="pathName" id="totalMoney" placeholder="项目路径" value="${pathName }">

								<input type="text" class="form-control" id="totalMoney" readonly="readonly">
						    </div>
						</div>
					</div>
					<div  id="rowsOne">
						<div class="row" title="0">
							<div class="col-lg-2">
					              <div class="bootstrap-timepicker">
					                <div class="input-group">
					                  <span class="input-group-btn">
								        <label class="btn btn-default">不发红包时间：</label>
								      </span>
					                  <div class="input-group">
					                    <input type="text" class="form-control pull-right timepicker" name="starttime0" value="${startTime }">
					                  </div>
					                </div>
					              </div>
				            </div>
				    		<div class="col-lg-2">
				    			<div class="bootstrap-timepicker">
					                  <div class="input-group">
					                    <input type="text" class="form-control pull-right timepicker" name="endtime0" value="${endTime }">
					                  </div>
				                </div>
				             </div>
				            	<div class="col-lg-1" style="width: 5%;margin-top: 7px;">
									<a onclick="removeTime();"><span class="glyphicon glyphicon-remove"></span></a>
				            	</div>
			            	</div>
						</div>
						 <div class="row">
						 	<div class="col-lg-1" style="width: 5%">
								<button type="button"  onclick="addOne();" class="btn btn-info pull-right">新建</button>
			            	</div>
						 </div>
						 <div id="redconfig">
							<div class="row" style="margin-top: 1%;" title="0">
								<div class="form-group col-lg-2" style="padding-left: 0;padding-right: 0;">
				                  <label for="inputEmail3" class="col-sm-5 control-label" style="padding-top: 7px;">单个红包金额</label>
				                  <div class="col-sm-3" style="padding-left: 0;padding-right: 0">
				                    <input type="text" class="form-control" name="money0">
				                  </div>
				                  <label class="col-sm-1 control-label" style="padding-top: 7px;">元</label>
				                </div>
				                <div class="form-group col-lg-2">
				                  <label for="inputEmail3" class="col-sm-3 control-label" style="padding-top: 7px;">数量</label>
				                  <div class="col-sm-3" style="padding-left: 0;padding-right: 0">
				                    <input type="number" class="form-control" name="num0" min="0">
				                  </div>
				                  <label class="col-sm-1 control-label" style="padding-top: 7px;">个</label>
				                </div>
		            			<div class="col-lg-1" style="width: 5%;margin-top: 7px;padding-left: 0;padding-right: 0;">
									<a onclick="removeRedConfig();"><span class="glyphicon glyphicon-remove"></span></a>
				            	</div>
							</div>
						</div>
						 <div class="row" style="margin-buttom: 2%;">
						 	<div class="col-lg-1" style="width: 5%">
								<button type="button" onclick="addRedConfig();" class="btn btn-info pull-right">新建</button>
			            	</div>
						 </div>
						 <div class="row">
							<div class="col-sm-5" >
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					         	<button type="submit" class="btn btn-info pull-right" style="margin-top: -1%;" >保存</button>
		            		</div>
						</div>
						</form>
						</div>
					</div>
	            </div>
            </div>
          </div>
   	</section>
  </div>
<jsp:include page="${pageContext.request.contextPath}/../foot.jsp"/>
<script>
function checkRedConfig(){
    var name=$("#name").val();
    var pathName=$("#pathName").val();
    var starttime=$("#starttime").val();
    var endtime=$("#endtime").val();
    if(name == null ||name == '' ||pathName == null || pathName == ''){
      alert("");
      return  false;
	}
    if(starttime>=endtime)
    {
        alert("开始时间不能大于结束时间！");
        return false;
    }
}
function addOne(){
	var index = $('#rowsOne').children('div.row:last').attr('title');
	var now;
	if(typeof(index) == 'undefined'){
		now = 0;
	}else{
		now = parseInt(index)+1;
	}
	console.log(now);
	$('#rowsOne').append('<div class="row" title="'+(now)+'">'
		+'<div class="col-lg-2">'
	+'<div class="bootstrap-timepicker">'
	+'<div class="input-group">'
	+'<span class="input-group-btn">'
	+'<label class="btn btn-default">不发红包时间：</label>'
	+'</span>'
	+'<div class="input-group">'
	+'<input type="text" class="form-control pull-right timepicker" name="starttime'+(now)+'" value="${startTime }">'
	+'</div>'
	+'</div>'
	+'</div>'
	+'</div>'
	+'<div class="col-lg-2">'
	+'<div class="bootstrap-timepicker">'
	+'<div class="input-group">'
	+'<input type="text" class="form-control pull-right timepicker" name="endtime'+(now)+'" value="${endTime }">'
	+'</div>'
	+'</div>'
	+'</div>'
	+'<div class="col-lg-1" style="width: 5%;margin-top: 7px;">'
	+'<a onclick="removeTime();"><span class="glyphicon glyphicon-remove"></span></a>'
	+'</div>'+'</div>');
	$('.timepicker').timepicker({
	      showInputs: false
	    })
}
 function addRedConfig(){
	 	var index = $('#redconfig').children('div.row:last').attr('title');
		var now;
	 	if(typeof(index) == 'undefined'){
	 		now = 0;
	 	}else{
	 		now = parseInt(index)+1;
	 	}
		console.log(now);
		$('#redconfig').append('<div class="row" style="margin-top: 1%;" title="'+(now)+'">'
			+'<div class="form-group col-lg-2" style="padding-left: 0;padding-right: 0;">'
		+'<label for="inputEmail3" class="col-sm-5 control-label" style="padding-top: 7px;">单个红包金额</label>'
		+'<div class="col-sm-3" style="padding-left: 0;padding-right: 0">'
		+'<input type="text" class="form-control" name="money'+now+'">'
		+'</div>'
		+'<label class="col-sm-1 control-label" style="padding-top: 7px;">元</label>'
		+'</div>'
		+'"<div class="form-group col-lg-2">'
        +'<label for="inputEmail3" class="col-sm-3 control-label" style="padding-top: 7px;">数量</label>'
        +'<div class="col-sm-3" style="padding-left: 0;padding-right: 0">'
        +'<input type="number" class="form-control" name="num'+now+'">'
        +'</div>'
        +'<label class="col-sm-1 control-label" style="padding-top: 7px;">个</label>'
      	+'</div>'
		+'<div class="col-lg-1" style="width: 5%;margin-top: 7px;padding-left: 0;padding-right: 0;">'
		+'<a onclick="removeRedConfig();"><span class="glyphicon glyphicon-remove"></span></a>'
  		+'</div>'
		+'</div>'
		);
 }
 
 function removeTime(){
	 $('#rowsOne').children('div.row:last').remove();
 }
 function removeRedConfig(){
	 $('#redconfig').children('div.row:last').remove();
 }

function goSave()
{
    var name=$("#name").val();
    var pathName=$("#pathName").val();
    var starttime=$("#starttime").val();
    var endtime=$("#endtime").val();
    if(starttime>=endtime)
    {
        alert("开始时间不能大于结束时间！");
        return false;
    }
    var pagesize=$("#pageEach").val();
    var currentpage=$("#page").val();
    console.info(currentpage);
    console.info("${maxPage}");
    //console.info(www);
    if(currentpage>${maxPage} || currentpage<1)
        alert("请输入正确的页数");
    else
        window.location="${pageContext.request.contextPath}/GameLogController/showRoomLog?param="+param+"&starttime="+starttime+"&endtime="+endtime+"&pageSize="+pagesize+"&currentPage="+currentpage;
}
/*
function shaixuan()
{
	var starttime=$("#starttime").val();
	var endtime=$("#endtime").val();
	if(starttime>=endtime)
	{
		alert("开始时间不能大于结束时间！");
		return false;
	}
	else{
		$("#searchform").submit();
		return true;
	}
}

function doSearch(){
	var param=$("#param").val();
	var starttime=$("#starttime").val();
	var endtime=$("#endtime").val();
	if(starttime>=endtime)
	{
		alert("开始时间不能大于结束时间！");
		return false;
	}
	var pagesize=$("#pageEach option").val();
	window.location="${pageContext.request.contextPath}/GameLogController/showRoomLog?param="+param+"&starttime="+starttime+"&endtime="+endtime+"&pageSize="+pagesize;
}

function goPrev()
{
	var param=$("#param").val();
	var starttime=$("#starttime").val();
	var endtime=$("#endtime").val();
	if(starttime>=endtime)
	{
		alert("开始时间不能大于结束时间！");
		return false;
	}
	var pagesize=$("#pageEach").val();
	var currentpage=${currentPage};
	if(currentpage>1)
		currentpage--;
	else
		return;
	window.location="${pageContext.request.contextPath}/GameLogController/showRoomLog?param="+param+"&starttime="+starttime+"&endtime="+endtime+"&pageSize="+pagesize+"&currentPage="+currentpage;
}

function goNext()
{
	var param=$("#param").val(); 
	var starttime=$("#starttime").val();
	var endtime=$("#endtime").val();
	if(starttime>=endtime)
	{
		alert("开始时间不能大于结束时间！");
		return false;
	}
	var pagesize=$("#pageEach").val();
	var currentpage=${currentPage};
	// alert(currentpage);
	if(currentpage<${maxPage}){
		currentpage++;
	}else
		return; 
		//alert(currentpage);
	window.location="${pageContext.request.contextPath}/GameLogController/showRoomLog?param="+param+"&starttime="+starttime+"&endtime="+endtime+"&pageSize="+pagesize+"&currentPage="+currentpage;
}


function goSearch()
{
	var param=$("#param").val();
	var starttime=$("#starttime").val();
	var endtime=$("#endtime").val();
	if(starttime>=endtime)
	{
		alert("开始时间不能大于结束时间！");
		return false;
	}
	var pagesize=$("#pageEach").val();
	var currentpage=$("#page").val();
	console.info(currentpage);
	console.info("${maxPage}");
	//console.info(www);
	if(currentpage>${maxPage} || currentpage<1)
		alert("请输入正确的页数");
	else
		window.location="${pageContext.request.contextPath}/GameLogController/showRoomLog?param="+param+"&starttime="+starttime+"&endtime="+endtime+"&pageSize="+pagesize+"&currentPage="+currentpage;
}

function doSelect(){
	var param=$("#param").val();
	var starttime=$("#starttime").val();
	var endtime=$("#endtime").val();
	if(starttime>=endtime)
	{
		alert("开始时间不能大于结束时间！");
		return false;
	}
	var pagesize=$("#pageEach").val();
	var currentpage=$("#page").val();
	window.location="${pageContext.request.contextPath}/GameLogController/showRoomLog?param="+param+"&starttime="+starttime+"&endtime="+endtime+"&pageSize="+pagesize+"&currentPage="+currentpage;
}

function getpageContext(currentpage,pagesize)
{
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/UserController/searchByAjax",
		data:"currentpage="+currentpage+"&pagesize="+pagesize+"&${_csrf.parameterName}=${_csrf.token}",
		success:function(data){
			$.each(data.details,function(index,detail){
				alert(detail.goodname);
				$("#DFDS").val
			});
		}
	});
}
function toexpress1(goodname,username,expressCompany,trackno)
{
	$("#goodname").text(goodname);
	$("#username").text(username);
	$("#company1").text(expressCompany);
	$("#trackno1").text(trackno);
}
//修改模态框
function toexpress(id,company,trackno)
{
	$("#orderid").val(id);
}
$(function () {
$('#example').DataTable({
    'paging'      : false,//分页
    'lengthChange': false,//设置pageEach
    'searching'   : false,//设置搜索框
    'ordering'    : true,//
    'info'        : false,
    'autoWidth'   : true,
    //"aoColumnDefs": [{ "bSortable": false, "aTargets": [8]}],//设置第一列不自动排序
    //"aaSorting": [[0, "asc"]]//从第二列点击排序
  })
});

function doSelect(){
  if(document.getElementById("docheck").checked){
	  $("#example input[type=checkbox]").attr('checked',true);
  }else{
	  $("#example input[type=checkbox]").attr('checked',false);
  }
}
function checkArea(){
  
  var pval = $('select[name="province"] option:selected').val();
  var aval = $('select[name="area"] option:selected').val().split(",")[0];
  var zval = $('select[name="zone"] option:selected').val();
  var city = $('select[name="city"]');
  var area = $('select[name="area"]');
  var zone = $('select[name="zone"]');
  var areas = $('select[name="area"] option');
  var cities = $('select[name="city"] option');
  if(pval=="0"){
	  for(var i =1;i<cities.length;i++){
		  $(cities[i]).css('display','none');
	  }
	  for(var i =1;i<areas.length;i++){
		  $(areas[i]).css('display','none');
	  }
	  $('select[name="city"] option[value="0"]').attr('selected',true);
	  $('select[name="area"] option[value="0"]').attr('selected',true);
	  $('select[name="zone"] option[value="0"]').attr('selected',true);
	  city.attr('disabled',true);
	  area.attr('disabled',true);
	  zone.attr('disabled',true);
	  return;
  }else{
	  city.removeAttr('disabled');
	  
	  //city.empty();
	  //city '<option value="0">请选择</option>');
	  for(var i =0;i<cities.length;i++){
		  var areaParent = cities[i].value.split(",")[1];
		  if(areaParent==pval||cities[i].value==0){
			  $(cities[i]).css('display','block');  
		  }else{
			  $(cities[i]).css('display','none');
		  }
	  }
  }
  var cval = $('select[name="city"] option:selected').val().split(",")[0];
  if(cval=="0"){
	  for(var i =1;i<areas.length;i++){
		  $(areas[i]).css('display','none');
	  }
	  $('select[name="area"] option[value="0"]').attr('selected',true);
	  area.attr('disabled',true);
  }else{
	  area.removeAttr('disabled');
	  
	  //area.append('<option value="0">请选择</option>');
	  for(var i =0;i<areas.length;i++){
		  var areaParent = areas[i].value.split(",")[1]
		  if(areaParent==cval||areas[i].value==0){
			  $(areas[i]).css('display','block');
		  }else{
			  $(areas[i]).css('display','none');
		  }
	  }
  }
}
*/
$(function () {
    //Initialize Select2 Elements
    $('.select2').select2()

    //Datemask dd/mm/yyyy
    $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
    //Datemask2 mm/dd/yyyy
    $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
    //Money Euro
    $('[data-mask]').inputmask()

    //Date range picker
    $('#reservation').daterangepicker()
    //Date range picker with time picker
    $('.reservationtime').daterangepicker({ timePicker: true, timePickerIncrement: 1, format: 'MM/DD/YYYY h:mm A' })
    /*
        $(".reservationtime").datetimepicker({
        	format: 'dd MM yyyy - HH:ii P',//显示格式
        	initialDate: (new Date()),//初始化为当前日期,暂时没用
	        showMeridian: true,//
	        autoclose: true,//自动关闭
	        todayBtn: true,//显示今天按钮
	        language: 'zh-CN'//显示中文
	    });
    */
  	//Timepicker
    $('.timepicker').timepicker({
      showInputs: false
    })
});  
</script>
