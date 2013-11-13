<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/included/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>菜单管理</title>
</head>

<body>

<div class="breadcrumbs" id="breadcrumbs">
    <ul class="breadcrumb">
        <li>
            <a href="${ctx}/dashboard" class="grey"> <i class="icon-home home-icon"></i></a>
        </li>
        <li class="active">
            菜单管理
        </li>
    </ul>
    <!--.breadcrumb-->

</div>

<div class="page-content">
    <div class="row-fluid">
        <div class="span12">
            <div class="table-funtion-bar clear-both">
                <div class="btn-group">
                    <button class="btn no-border tooltips" id="create-function" data-original-title="新增" >
                        <i class="icon-plus"></i>
                    </button>
                    <button class="btn no-border tooltips" id="refresh-function" data-original-title="刷新">
                        <i class="icon-refresh"></i>
                    </button>
                    <button class="btn no-border tooltips" id="delete-function" style="display:none;" data-original-title="删除">
                        <i class="icon-trash"></i>
                    </button>
                </div>

            </div><!--/.table-funtion-bar-->


             <div class="pull-left">
                 <table id="menuTreeGrid" style="width:520px;height:500px;" ></table>
             </div>

            <div id="eastMenuRelated"  style="margin-left:506px;padding:0 20px 0 20px;">

            </div><!--/.eastMenuRelated-->


        </div>
    </div>
</div>

<!--/.page-content-->
<script>
    var selectedMenuId;
$(function(){
    //表单提交后,iframe回调函数
    window.actionCallback = function (resp) {
        $.colorbox.close();
        lework.notify(resp.attributes.title, resp.attributes.message, resp.attributes.type);
        $('#menuTreeGrid').treegrid('reload');
    };
    window.deleteCallback = function (resp) {
        lework.notify(resp.attributes.title, resp.attributes.message, resp.attributes.type);
        $('#menuTreeGrid').treegrid('reload');
    };

    using(['treegrid'], function () {
        var $menuTreeGrid = $('#menuTreeGrid');
        $menuTreeGrid.treegrid({
            url: 'menu/getTreeGrid',
            method: 'post',
            rownumbers: false,
            idField: 'id',
            treeField: 'name',
            columns: [
                [
                    {field: 'name', title: '菜单名称', width: 145},
                    {field: 'code', title: '菜单代码', width: 145, align: 'left'},
                    {field: 'url', title: 'URL', width: 200}
                ]
            ],
            onClickRow: function (row) {
                checkIconStatus(true)
            },
            onDblClickRow: function (row) {
                //双击编辑
                $.colorbox({
                    href: 'menu/update?$SiteMesh=false&id=' + row.id,
                    adjustY: '40%',
                    width: '700px',
                    height: '415px', /**设置高度固定,弹出层load之后,有新的DOM加入,高度会增加,影响实际显示**/
                    overlayClose: false,
                    scrolling: false
                })
            },
            onSelect: function (node) {
                //加载选中节点east界面
                loadEast(node.id);
            },
            onLoadSuccess: function () {
                $('.tooltips').tooltip();
                //修复 treegrid IE下border-right不可见bug.
                var $wrap = $('.datagrid-wrap'), root;
                $wrap.width($wrap.width() - 2);
                //默认选择根节点.
                root = $menuTreeGrid.treegrid('getRoot');
                loadEast(root.id);
            }
        });
    })
    //新增
    $('#create-function').click(function () {
        $(this).colorbox({
            href :'menu/update?$SiteMesh=false' ,
            adjustY:'40%',
            width: '700px',
            height :'415px' , /**设置高度固定,弹出层load之后,有新的DOM加入,高度会增加,影响实际显示**/
            overlayClose: false,
            scrolling: false
        })
    });
    //刷新
    $('#refresh-function').click(function () {
        $('#menuTreeGrid').treegrid('reload');
        //重置function bar状态
        checkIconStatus(false);
    });

    //删除widget
    $('#delete-function').confirmDelete({text: '<span class="text-warning">确认删除？</span>',
        onDelete: function () {
            var row = $('#menuTreeGrid').treegrid('getSelected');
            if(!row){
                return lework.notify('操作提示','请选择要删除的记录')
            }

            $('#hiddenForm').prop({   //提交隐藏的表单域.
                'target': '$iframe',
                 action: 'menu/delete?deleteId=' + row.id
            }).submit();
            checkIconStatus(false);
            return true;
        }
    });

    /**
     *根据选择的菜单节点,ajax加载对应基本信息,关联信息
     * @param menuId  菜单ID
     */
    function loadEast(menuId) {

        $('#eastMenuRelated').load('menu/eastMenuRelated?$SiteMesh=false', {'menuId': menuId, '_d': (new Date()).getTime()})
    }

    //根据所选行,修改function bar状态.
    function checkIconStatus(hasSelected) {
        if (hasSelected == true) {
            $('#delete-function').show();
        } else {
            $('#delete-function').hide();
        }
    }
})
</script>

</body>
</html>