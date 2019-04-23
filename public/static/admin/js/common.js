/* 页面 全屏-添加 */
function o2o_edit(title, url) {
    var index = layer.open({
        type: 2,
        title: title,
        content: url
    });
    layer.full(index);
}

/* 添加或者编辑缩小的屏幕 */
function o2o_s_edit(title, url, w, h) {
    layer_show(title, url, w, h);
}

/* 删除 */
function o2o_del(url) {
    layer.confirm('确认要删除吗？', function (index) {
        window.location.href = url;
    });
}

$('.list_order input').blur(function () {
    var id = $(this).attr('attr-id');
    var list_order = $(this).val();
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

/* 城市相关二级内容 */
$('.cityId').change(function () {
    var city_id = $(this).val();
    var url = '/api/city/getCitiesByParentId';
    var postData = {id: city_id};
    $.post(url, postData, function (res) {
        if (res.status === 1) {
            var data = res.data;
            var cityHtml = '';
            $(data).each(function (i) {
                cityHtml += '<option value="' + this.id + '">' + this.name + '</option>';
            });
            $('.se_city_id').html(cityHtml);
        } else if (res.status === 0) {
            $('.se_city_id').html('');
        }
    }, 'json')
});

/* 分类相关二级内容 */
$('.categoryId').change(function () {
    var category_id = $(this).val();
    var url = '/api/category/getCategoryByParentId';
    var postData = {id: category_id};
    $.post(url, postData, function (res) {
        if (res.status === 1) {
            var data = res.data;
            var categoryHtml = '';
            $(data).each(function (i) {
                categoryHtml += '<input id="category_checkbox" name="se_category_id[]" type="checkbox" value="' + this.id + '" />' + '<label for="category_checkbox">&nbsp;' + this.name + '</label>';
            });
            $('.se_category_id').html(categoryHtml);
        } else if (res.status === 0) {
            $('.se_category_id').html('');
        }
    }, 'json')
});
