<%--
  Created by IntelliJ IDEA.
  User: zyl
  Date: 2016/12/27
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="base.jsp" %>
<html>
<head>
    <title>商品添加</title>
</head>
<body>


<div class="container">
    <h1>添加商品</h1>
    <hr/>

    <legend>图片上传</legend>
    <h6>只能上传单张10M以下的JPG格式的图片</h6>
    <form action="/photoUpload" method="post" enctype="multipart/form-data">
        <%--选择文件:<input type="file" name="file">--%>
        <%--<input type="submit" value="上传">--%>
        <div class="form-group">
            <label for="name">选择文件:</label>
            <input type="file" class="form-control" id="file" name="file"
            />
        </div>
        <div class="form-group">
            <button type="submit" >上传</button>
        </div>
    </form>


    <form action="/addGoodPost" method="post">
        <div class="form-group">
            <label for="name">商品名称:</label>
            <input type="text" class="form-control" id="name" name="name"
            />
        </div>
        <div class="form-group">
            <label for="price">租赁价格(元/天):</label>
            <input type="text" class="form-control" id="price" name="price"
            />
        </div>
        <div class="form-group">
            <label for="foregift">押金:</label>
            <input type="text" class="form-control" id="foregift" name="foregift"
            />
        </div>
        <div class="form-group">
            <label for="amount">库存:</label>
            <input type="text" class="form-control" id="amount" name="amount"
            />
        </div>

        <%--<div class="form-group">--%>
        <%--<label for="file">商品图片上传(只能上传PNG、JPG、GIF格式的图片):</label>--%>
        <%--<input type="text" class="form-control" id="file" name="file"--%>
        <%--/>--%>
        <%--</div>--%>
        <%--<input type="button" value="上传" id="addFile" name="addFile" onclick="addToFile()">--%>

        <div class="form-group">
            <button type="submit" class="btn btn-sm btn-success">提交</button>
        </div>
    </form>

</div>
<script type="text/javascript">
    function addToFile() {

        var formData = new Object();
//            var data = $(":input").each(function () {
        formData['file'] = $("#file").val();
//            });
        $.ajax({
            async: false,
            cache: false,
            type: 'POST',
            url: '/photoUpload',
            data: formData,
            error: function () {// 请求失败处理函数
            },
            success: function (data) {
                alert(data);
            }
        });

    }
</script>
</body>
</html>
