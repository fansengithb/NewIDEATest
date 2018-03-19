<%--
  Created by IntelliJ IDEA.
  User: fansen
  Date: 2018/1/25
  Time: 0:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>员工列表</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <!-- web路径：
    不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
    以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:3306)；需要加上项目名
            http://localhost:3306/crud
     -->
    <script type="text/javascript"
            src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
    <link
            href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
            rel="stylesheet">
    <script
            src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

<!-- 员工添加模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">

                <%-- bootstrap官网中直接查询表单样式   使用即可 --%>
                <form class="form-horizontal">

                    <%-- 每一个div对应一行输入框 --%>
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <%--  name属性要和employee中成员属性相对应 --%>
                            <input type="text" name="empName"  class="form-control" id="empName_add_input" placeholder="empName">
                                <span class="help-block"></span>

                        </div>
                    </div>


                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text"  name="email" class="form-control" id="email_add_input" placeholder="email@qq.com">
                            <span class="help-block"></span>

                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-5">
                            <%-- 提交部门ID即可 --%>
                            <select class="form-control" name="dId" id="dept_add_select">

                            </select>
                        </div>
                    </div>

                    <%--<div class="form-group">--%>
                        <%--<div class="col-sm-offset-2 col-sm-10">--%>
                            <%--<div class="checkbox">--%>
                                <%--<label>--%>
                                    <%--<input type="checkbox"> Remember me--%>
                                <%--</label>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="form-group">--%>
                        <%--<div class="col-sm-offset-2 col-sm-10">--%>
                            <%--<button type="submit" class="btn btn-default">Sign in</button>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <!-- 标题 -->
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <!-- 按钮 -->
    <div class="row">
        <%-- 偏移8列 --%>
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <%--显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-bordered" id="emps_table">
                <thead>
                <tr>
                    <th></th>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>

                </tr>
                </thead>
                <tbody>


                </tbody>




            </table>

        </div>


    </div>
    <%-- 显示分页信息 --%>
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-md-6" id="page_info_area"></div>
        <%--分页条信息--%>
        <div class="col-md-6" id="page_nav_area">
            

        </div>
    </div>
</div>
<script type="text/javascript">

    var totalRecord;
    $(function(){
//        去首页

//        在页面输出1
//        alert(1);
        to_page(1);

    });

    function  to_page(pn) {
        <%--  页面加载完成之后，直接发送ajax数据,获取分页数据 --%>
        $.ajax({
            url:"${APP_PATH}/emps",
            data:"pn="+pn,
            type:"get",
            success:function(result){
//                console.log(result);
                //1、解析并显示员工数据
                build_emps_table(result);
//            //2、解析并显示分页信息
                build_page_info(result);
//            //3、解析显示分页条数据
                build_page_nav(result);
            }
        });
    }



    function build_emps_table(result){
        //清空table表格
        $("#emps_table tbody").empty();
        var emps = result.extend.pageInfo.list;
        $.each(emps,function(index,item){
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var genderTd = $("<td></td>").append(item.gender=='M'?"男":"女");
            var emailTd = $("<td></td>").append(item.email);
            var deptNameTd = $("<td></td>").append(item.department.deptName);

            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");

            var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");

            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);


            //append方法执行完成以后还是返回原来的元素
            $("<tr></tr>").append(checkBoxTd)
                .append(empIdTd)
                .append(empNameTd)
                .append(genderTd)
                .append(emailTd)
                .append(deptNameTd)
                .append(btnTd)
                .appendTo("#emps_table tbody");
        });
    }

//    解析显示分页信息
       function build_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum +"页,总"+
           result.extend.pageInfo.pages+"页,总"+result.extend.pageInfo.total+"条记录"
           );
           totalRecord = result.extend.pageInfo.total;

       }
//       解析显示分页条信息
    function build_page_nav (result) {
//        page_nav_area
        $("#page_nav_area").empty();

        var ul = $("<ul></ul>").addClass("pagination");

//        构建元素
        var  fistPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.pageInfo.hasPreviousPage==false){
            fistPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else {
//        为元素添加翻页的点击事件
            fistPageLi.click(
                function () {
                    to_page(1);
                }
            );

            prePageLi.click(
                function () {
                    to_page(result.extend.pageInfo.pageNum-1);
                }
            );
        }





        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var  lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(result.extend.pageInfo.hasNextPage==false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{

            nextPageLi.click(
                function () {
                    to_page(result.extend.pageInfo.pageNum+1);
                }
            );

            lastPageLi.click(
                function () {
                    to_page(result.extend.pageInfo.pages);
                }
            );
        }





//        添加首页，前一页提示
        ul.append(fistPageLi).append(prePageLi);
//        遍历出 1 2 3 页号
        $.each(result.extend.pageInfo.navigatepageNums,function(index,item){
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if (result.extend.pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(
                function () {
                    to_page(item);
                }
            );
            ul.append(numLi);
        });
        ul.append(nextPageLi).append(lastPageLi);

//          根据bootstrap模板，把ul添加nav中
        var  navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }


    //清空表单样式及内容
    function reset_form(ele){
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }

//  点击新增按钮，弹出模态框
    $("#emp_add_modal_btn").click(function () {
//        清除表单数据
//        $("#empAddModal form")[0].reset();
        reset_form("#empAddModal form");


//        发送ajax请求，查出部门信息，显示在下拉列表中
        getDepts();



//        弹出模态框
        $("#empAddModal").modal({
            backdrop:"static"
        });
    });
    
//    查询所有部门信息，显示在下拉列表中
    function getDepts() {
        $.ajax({
            url:"${APP_PATH}/depts",
            type:"GET",
            success:function (result) {
//                打印在浏览器的控制台
//      extend":{"depts":[{"deptId":1,"deptName":"开发部"},{"deptId":2,"deptName":"测试部"},{"deptId":3,"deptName":"后勤部"}]
                console.log(result)
//                $("#dept_add_select").append(")
            $.each(result.extend.depts,function () {
                var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
                optionEle.appendTo("#dept_add_select");
            });
            }

        });
        
    }

    function  validate_add_form() {

//        使用正则表达式进行校验
        var empName = $("#empName_add_input").val();
        var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;

        if(!regName.test(empName)){
//            alert("用户名是2-5位中文或者6-16位英文和数字的组合！");
            show_validate_msg("#empName_add_input", "error", "邮箱格式不正确");
            return false;
        }else{
            show_validate_msg("#empName_add_input", "success", "");

        };


//        邮箱校验信息
//2、校验邮箱信息
        var email = $("#email_add_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            alert("邮箱格式不正确");

            //应该清空这个元素之前的样式
            show_validate_msg("#email_add_input", "error", "邮箱格式不正确");

            return false;
        }else{
            show_validate_msg("#email_add_input", "success", "");

        };


        return true;
    }

//    校验结果的提示信息
    function  show_validate_msg(ele,status,msg) {
//        清除当前元素的校验状态
         $(ele).parent().removeClass("has-success  has-error");
        $(ele).next("span").text("");

        if("success" == status){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text("");
        }else  if ("error" == status){

            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }


    //校验用户名是否可用
    $("#empName_add_input").change(function(){
        //发送ajax请求校验用户名是否可用
        var empName = this.value;
        $.ajax({
            url:"${APP_PATH}/checkuser",
            data:"empName="+empName,
            type:"POST",
            success:function(result){
                if(result.code==100){
                    show_validate_msg("#empName_add_input","success","用户名可用");
                    $("#emp_save_btn").attr("ajax-va","success");
                }else{
                    show_validate_msg("#empName_add_input","error",result.extend.va_msg);
                    $("#emp_save_btn").attr("ajax-va","error");
                }
            }
        });
    });

    $("#emp_save_btn").click(function () {
//      1 --  将模态框中填写的提交后台保存
//        1  -- 先要对数据进行校验

//        清除表单数据


        if(!validate_add_form()){
            return false;
        };


        //1、判断之前的ajax用户名校验是否成功。如果成功。
        if($(this).attr("ajax-va")=="error"){
            return false;
        }

//      2 --  发送ajax请求保存员工
        $.ajax({
            url:"${APP_PATH}/emp",
            type:"POST",
//            发送表格序列化后的数据
            data:$("#empAddModal form").serialize(),
            success:function (result) {
//                alert(result.msg);
//                员工保存成功时，
//                1 -- 关闭模态框
                $("#empAddModal").modal('hide');
//                2 -- 显示新添加的数据
//                发送ajax显示最后一页数据
                to_page(totalRecord);
            }

        });
    });
    

</script>

</body>
</html>
