// var a = {
//     'swf': SCOPE.uploadify_swf,
//     'uploader': SCOPE.image_upload,
//     'buttonText': '图片上传',
//     'onUploadSuccess': function (file, data, response) {
//         // alert('The file ' + file.name + ' was successfully uploaded with a response of ' + response + ':' + data);
//     }
// }
var SCOPE = {
    uploadify_swf: '__STATIC__/admin/webuploader/Uploader.swf',
    image_upload: '/api/image/upload',
};

var logo = WebUploader.create({
    // 选完文件后，是否自动上传。
    auto: true,
    // swf文件路径
    swf: SCOPE.uploadify_swf,
    // 文件接收服务端。
    server: SCOPE.image_upload,
    // 选择文件的按钮。可选。
    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
    pick: '#logo_upload',
    // 只允许选择图片文件。
    accept: {
        title: 'Images',
        extensions: 'gif,jpg,jpeg,bmp,png',
        mimeTypes: 'image/*'
    },
    fileNumLimit: 1,
});

logo.on('fileQueued', function (file) {
    var $li = $('<div id="' + file.id + '" class="file-item thumbnail"><img><div class="info">' + file.name + '</div></div>'),
        $img = $li.find('img');
    // $list为容器jQuery实例
    $('#logoList').append($li);
    // 创建缩略图
    // 如果为非图片文件，可以不用调用此方法。
    // thumbnailWidth x thumbnailHeight 为 100 x 100
    logo.makeThumb(file, function (error, src) {
        if (error) {
            $img.replaceWith('<span>不能预览</span>');
            return;
        }
        $img.attr('src', src);
    }, 100, 100);
});

// 文件上传成功，给item添加成功class, 用样式标记上传成功。
logo.on('uploadSuccess', function (file, response) {
    $('#' + file.id).addClass('upload-state-done');
    $('#logo').val(response.data);
});

var license_logo = WebUploader.create({
    // 选完文件后，是否自动上传。
    auto: true,
    // swf文件路径
    swf: SCOPE.uploadify_swf,
    // 文件接收服务端。
    server: SCOPE.image_upload,
    // 选择文件的按钮。可选。
    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
    pick: '#license_logo_upload',
    // 只允许选择图片文件。
    accept: {
        title: 'Images',
        extensions: 'gif,jpg,jpeg,bmp,png',
        mimeTypes: 'image/*'
    },
    fileNumLimit: 1,
});

license_logo.on('fileQueued', function (file) {
    var $li = $('<div id="' + file.id + '" class="file-item thumbnail"><img><div class="info">' + file.name + '</div></div>'),
        $img = $li.find('img');
    // $list为容器jQuery实例
    $('#licenseLogoList').append($li);
    // 创建缩略图
    // 如果为非图片文件，可以不用调用此方法。
    // thumbnailWidth x thumbnailHeight 为 100 x 100
    license_logo.makeThumb(file, function (error, src) {
        if (error) {
            $img.replaceWith('<span>不能预览</span>');
            return;
        }
        $img.attr('src', src);
    }, 100, 100);
});

// 文件上传成功，给item添加成功class, 用样式标记上传成功。
license_logo.on('uploadSuccess', function (file, response) {
    $('#' + file.id).addClass('upload-state-done');
    $('#license_logo').val(response.data);
});
