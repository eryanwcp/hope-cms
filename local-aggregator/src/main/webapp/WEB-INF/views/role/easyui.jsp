<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/included/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>测试整合easyui兼容性</title>
</head>

<body>

<div class="breadcrumbs" id="breadcrumbs">
    <ul class="breadcrumb">
        <li>
            <i class="icon-home home-icon"></i>
            <a href="${ctx}/dashboard">home</a>
        </li>

        <li class="active">
            测试整合easyui兼容性
        </li>
    </ul>
    <!--.breadcrumb-->

</div>

<div class="page-content">
    <div class="row-fluid">
        <div class="span12">



            <h2>easyui merge</h2>

            <div style="padding:5px;">
                <a href="javascript:;" class="easyui-linkbutton btn" data-options="toggle:true"><i
                        class="icon-plus"></i> Add</a>
                <a href="javascript:;" class="easyui-linkbutton btn btn-danger" data-options="toggle:true"><i
                        class="icon-trash"></i> Remove</a>
                <a href="javascript:;" class="easyui-linkbutton btn btn-primary" data-options="toggle:true"><i
                        class="icon-save"></i> Save</a>
                <a href="javascript:;" class="easyui-linkbutton btn btn-info" data-options="toggle:true"> Text
                    Button</a>
            </div>
            <div style="margin:10px 0;">
                <a href="javascript:;" class="easyui-linkbutton  " id="confirm1">Confirm</a>
                <a href="javascript:;" class="easyui-linkbutton   btn-info btn-small" id="prompt1">Prompt</a>
            </div>
            <div class="span4">
                <h4>easyui-tree</h4>
                <ul   id="easyui-tree" data-options="animate:true,checkbox:true,lines:true">
                    <li>
                        <span>My Documents</span>
                        <ul>
                            <li data-options="state:'closed'">
                                <span>Photos</span>
                                <ul>
                                    <li>
                                        <span>Friend</span>
                                    </li>
                                    <li>
                                        <span>Wife</span>
                                    </li>
                                    <li>
                                        <span>Company</span>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <span>Program Files</span>
                                <ul>
                                    <li>Intel</li>
                                    <li>Java</li>
                                    <li>Microsoft Office</li>
                                    <li>Games</li>
                                </ul>
                            </li>
                            <li>index.html</li>
                            <li>about.html</li>
                            <li>welcome.html</li>
                        </ul>
                    </li>
                </ul>

            </div>
            <div class="span6">
                <h4>1:combobox</h4>
                <select id="easyui-combobox" name="state" data-options="height:30,width:200" style="width:200px;">
                    <option value="MO">Missouri</option>
                    <option value="WI">Wisconsin</option>
                    <option value="WY">Wyoming</option>
                </select>
                <p> <h4 class="red">2:easyui tooltip与bootstrap有冲突.不推荐使用.</h4>
                </p>
                <h4>3:tree grid</h4>
                <table title="Folder Browser" id="easyui-treegrid" style="width:700px;height:250px"
                               data-options="
                        url: '${ctx}/static/plugins/easyui/treegrid_data1.json',
                        method: 'get',
                        rownumbers: true,
                        idField: 'id',
                        treeField: 'name'
                    ">
                            <thead>
                            <tr>
                                <th data-options="field:'name'" width="220">Name</th>
                                <th data-options="field:'size'" width="100" align="right">Size</th>
                                <th data-options="field:'date'" width="150">Modified Date</th>
                            </tr>
                            </thead>
                </table>

            </div>
        </div>
    </div>
</div>
<!--/.page-content-->
<script>
    $(function () {
        //test easyui
        using(['menu', 'messager','tree','combobox','treegrid'], function () {
            $('#confirm1').click(function () {
                $.messager.confirm('My Title', 'Are you confirm this?', function (r) {
                    if (r) {
                        alert('confirmed: ' + r);
                    }
                });
            })
            $('#prompt1').click(function () {
                $.messager.prompt('My Title', 'Please type something', function (r) {
                    if (r) {
                        alert('you type: ' + r);
                    }
                });
            });
            $('#easyui-treegrid').treegrid();
            $('#easyui-tree').tree();
            $('#easyui-combobox').tree();

        })
    })  //dom ready


</script>


</body>
</html>