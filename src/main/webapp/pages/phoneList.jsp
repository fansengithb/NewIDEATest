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
		function doModify(id){
			var type = $('#type').val();
			window.location.href="${pageContext.request.contextPath}/PlayerController/toModifyPlayer?id="+id+"&type="+type;
		}
		function MyAutoRun()
		　　{  
				//修改标签为激活
				document.getElementById("sendPhoneList").className = "active";
				document.getElementById("sendPhoneList").parentNode.parentNode.className = "treeview menu-open";
				document.getElementById("sendPhoneList").parentNode.style.cssText = "display: block;";
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
  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        	接收短信手机号
      </h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/index.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li><a href="#">控制面板</a></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row" style="margin-top: 1%;">
		        <div class="col-xs-12">
		        	<div class="box box-primary">
						<div class="box-body" style="overflow: scroll;">
							<div id="example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
								<div class="row">
									<form action="${pageContext.request.contextPath}/RedBackController/addPhone">
									<div class="col-sm-12">
							        	<table id="example" class="table table-bordered table-hover">
							        		<thead>
							        			<tr>
							        				<th>发送手机号</th>
							        				<th>操作</th>
							        			</tr>
							        		</thead>
					   		                 <tbody style="border: 1px;" id="addBody">
											 	<c:if test="${phoneList != null }">
												 <c:forEach var="phone" items="${phoneList }" varStatus="status">
													 <tr title="${status.index }">
														 <td>${phone.phonenum }</td>
														 <td>
															 <!-- <a title="删除"
						            				      	 onclick="if(confirm('确定删除吗？')){deletePhone(${phone.id});return true;}return false;"
						            				      	 > -->
															 <a title="删除" onclick="deletePhone(${phone.id})">
																 <span class="glyphicon glyphicon-remove"></span>
															 </a>
														 </td>
													 </tr>
											 	  </c:forEach>
												 </c:if>
			                				</tbody>
			              					</table>
											 <div id="submit">
												 <tr>
													 <%--<td colspan="2"><a href="${pageContext.request.contextPath}/pages/phone/addPhone.jsp"><span class="glyphicon glyphicon-plus"></span></a></td>--%>
													 <td colspan="2"><a onclick="addPhone();"><span class="glyphicon glyphicon-plus"></span></a></td>
												 </tr>
											 </div>
										</div>
									<div class="row">
										<div class="col-sm-5" >
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
											<button type="submit" class="btn btn-info pull-right" style="margin-top: -1%;">保存</button>
										</div>
									</div>
									</form>
									</div>
							</div>
							</div>
							</div>
							</div>
			
	            </div>
	            <!-- /.box-body -->
    	</section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
<jsp:include page="${pageContext.request.contextPath}/../foot.jsp"/>
<script>
	function deletePhone(id){
		if(confirm('确定删除吗？')){
			window.location="${pageContext.request.contextPath}/RedBackController/deletePhone?id="+id;
			return true;
		}
		return false;
	};

	function doAddPhone() {
        window.location="${pageContext.request.contextPath}/RedBackController/addPhone";
    };

    function addPhone() {
    	var lastTr = $('#addBody tr:last');
    	var index;
    	if(lastTr.length){
	    	var lastTitle = $('#addBody tr:last').attr('title');
    		index = parseInt(lastTitle)+1;
    	}else{
    		index = 0;
    	}
		console.log(index);
//        var index = $('#body').children('div.row:last').attr('title');
//        var now;
//        if(typeof(index) == 'undefined'){
//            now = 0;
//        }else{
//            now = parseInt(index)+1;
//        }
//        console.log(now);

        $('#addBody').append('<tr title="'+index+'">'
            +'<td>'
			+'<input class="form-control" name="phone'+index+'"  placeholder="输入手机号" required="required" onchange="checkPhone(this);">'
			+'<div  id="checkResult">'
			+'</div>'
            +'</td>'
            +'<td>'
            +' <a title="删除" onclick="removeTemp(this);">'
            +' <span class="glyphicon glyphicon-remove">'
			+'</span>'
            +'</a>'
            +'</td>'
            +'</tr>'
        );
    }
    function removeTemp(arg){
    	console.log(arg);
    	$(arg).parent().parent().remove();
        //$('#addBody').children('tr:last').remove();
    }
    function checkPhone(arg){
    	var phoneNum = $(arg).val();
    	console.log(phoneNum);
    	if(!phoneByReg(phoneNum)){
    		alert('不是正确的手机号，请重新输入！');
    		$(arg).val('');
    	}
    }
    
    function phoneByReg(phone) {
		var reg = /^1[3|4|5|7|8][0-9]{9}$/;
		if(reg.test(phone)){
		    return true;
		}else {
		    return false;
		}
    }

    $(function(){
        $("#phone").keyup(function () {
            var  phone = ("#phone").val();
			if(phoneByReg(phone)){

			}else{
                alert('输入电话号码不正确!');
			}
        });
	});




    /*

    function  doSort(){

        var sort=$("#selectSort").val();
        var currentpage="${currentpage}";
        console.info(sort);
		var pagesize=$("#pageEach").val();
		var param=$("#searchText").val();
    	window.location="${pageContext.request.contextPath}/PlayerController/showAll_Two?currentpage="+currentpage+"&pagesize="+pagesize+"&param="+param+"&starttime="+"&type=${type}"+"&sort="+sort;
    }
	function doSelect()
	{
		var currentpage="${currentpage}";
		var pagesize=$("#pageEach").val();
		var param=$("#searchText").val();
		window.location="${pageContext.request.contextPath}/PlayerController/showAll?currentpage="+currentpage+"&pagesize="+pagesize+"&param="+param+"&starttime="+"&type=${type}";
		return true;
	}
	
	function goPrev()
	{
		var currentpage="${currentpage}";
		var pagesize=$("#pageEach").val();
		var param=$("#searchText").val();
		if(currentpage>1)
			currentpage--;
		window.location="${pageContext.request.contextPath}/PlayerController/showAll?currentpage="+currentpage+"&pagesize="+pagesize+"&param="+param+"&starttime="+"&type=${type}";
		return true;
	}
	
	function goNext()
	{
		var currentpage="${currentpage}";
		var pagesize=$("#pageEach").val();
		var param=$("#searchText").val();
		if(currentpage<${pagecount})
			currentpage++;
		window.location="${pageContext.request.contextPath}/PlayerController/showAll?currentpage="+currentpage+"&pagesize="+pagesize+"&param="+param+"&starttime="+"&type=${type}";
		return true;
	}
	
	function goSearch()
	{
		var currentpage=$("#page").val();
		var pagesize=$("#pageEach").val();
		var param=$("#searchText").val();
		if(currentpage>${pagecount} || currentpage<1)
		{
			alert("请输入正确的页数");
			return false;
		}
		window.location="${pageContext.request.contextPath}/PlayerController/showAll?currentpage="+currentpage+"&pagesize="+pagesize+"&param="+param+"&starttime="+"&type=${type}";
		return true;
	}
  $(function () {
    $('#example').DataTable({
        'paging'      : false,//分页
        'lengthChange': false,//设置pageEach
        'searching'   : false,//设置搜索框
        'ordering'    : false,//
        'info'        : false,
        'autoWidth'   : true,
      })
  });
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
  $(function () {
	    $('.select2').select2()

	    $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
	    $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
	    $('[data-mask]').inputmask()

	    $('#reservation').daterangepicker()
	    $('.reservationtime').daterangepicker({ timePicker: true, timePickerIncrement: 1, format: 'MM/DD/YYYY h:mm A' })
	    $(".form_datetime").datetimepicker({format: 'dd MM yyyy - HH:ii P',
	        showMeridian: true,
	        autoclose: true,
	        todayBtn: true
	    	});
	    $('#daterange-btn').daterangepicker(
	      {
	        ranges   : {
	          'Today'       : [moment(), moment()],
	          'Yesterday'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
	          'Last 7 Days' : [moment().subtract(6, 'days'), moment()],
	          'Last 30 Days': [moment().subtract(29, 'days'), moment()],
	          'This Month'  : [moment().startOf('month'), moment().endOf('month')],
	          'Last Month'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
	        },
	        startDate: moment().subtract(29, 'days'),
	        endDate  : moment()
	      },
	      function (start, end) {
	        $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
	      }
	    )

	    $('#datepicker').datepicker({
	      autoclose: true
	    })

	    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
	      checkboxClass: 'icheckbox_minimal-blue',
	      radioClass   : 'iradio_minimal-blue'
	    })
	    $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
	      checkboxClass: 'icheckbox_minimal-red',
	      radioClass   : 'iradio_minimal-red'
	    })
	    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
	      checkboxClass: 'icheckbox_flat-green',
	      radioClass   : 'iradio_flat-green'
	    })

	    $('.my-colorpicker1').colorpicker()
	    $('.my-colorpicker2').colorpicker()

	    $('.timepicker').timepicker({
	      showInputs: false
	    })
	  })
	  $(document).ready(function () {
            $('#dataTables-example').DataTable({
                "aoColumnDefs": [{ "bSortable": false, "aTargets": [0]}],
                "aaSorting": [[1, "desc"]]
            });
        })
        */
</script>
