/*页面 全屏-添加*/
function o2o_edit(title, url) {
    var index = layer.open({
        type: 2,
        title: title,
        content: url
    });
    layer.full(index);
}

/*添加或者编辑缩小的屏幕*/
function o2o_s_edit(title, url, w, h) {
    layer_show(title, url, w, h);
}

/*-删除*/
function o2o_del(url) {
    layer.confirm('确认要删除吗？', function (index) {
        window.location.href = url;
    });
}

$('.list_order input').blur(function () {
    var id = $(this).attr('attr-id');
    var list_order = $(this).val();
    console.log(id)
    var postData = {
        id: id,
        list_order: list_order
    };
    var url = SCOPE.list_order_url;
    $.post(url, postData, function (res) {
        if (res.code === 1) {
            location.href = res.data;
        } else {
            alert('修改失败')
        }
    })
});