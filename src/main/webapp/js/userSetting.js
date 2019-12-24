$(function(){
    $(".user-setting li").click(function(){
        $(".user-setting li").removeClass("active");
        $(this).addClass("active");
        var panelId = "#"+$(this).attr("name");
        $("#userPanel > div").css({'display':'none'});
        $(panelId).css({'display':'block'});

    });

 // 用户管理修改模态框
    $(".doModify").on("click", function() {
        _this = this; //this是事件源
        $("#myModal").modal("show");

    });

    $(".updateOne").on("click", function() {
        $("#myModal").modal("hide");
    });

// 文章管理修改模态框
    $(".showArticle").on("click", function() {
        _this = this; //this是事件源
        $("#myModalArticle").modal("show");
    });

    $(".updateOne").on("click", function() {
        $("#myModalArticle").modal("hide");
    });

    // 喷淋管理修改模态框
    $(".doModifyComment").on("click", function() {
        _this = this; //this是事件源
        $("#myModalComment").modal("show");
    });

    $(".updateComment").on("click", function() {
        $("#myModalComment").modal("hide");
    });
    // 管理员管理 添加管理员模态框
    $("#doAddManger").on("click", function() {
        _this = this; //this是事件源
        $("#addAdmin").modal("show");
    });

    $(".add-Manger").on("click", function() {
        $("#addAdmin").modal("hide");
    });

    //adminManager.jsp
    // 管理员管理 修改管理员模态框
    $(".doMangerModify").on("click", function() {
        _this = this; //this是事件源
        $("#modifyAdmin").modal("show");
    });

    $(".doadminModal").on("click", function() {
        $("#modifyAdmin").modal("hide");
    });

    // 商品管理 修改商品
    $(".doProModify").on("click", function() {
        _this = this; //this是事件源
        $("#myProduct").modal("show");
    });

    $(".updatePro").on("click", function() {
        $("#myProduct").modal("hide");
    });

    // 商品管理 添加商品
    $("#doAddPro").on("click", function() {
        _this = this; //this是事件源
        $("#Product").modal("show");
    });

    $(".addProduct").on("click", function() {
        $("#Product").modal("hide");
    });

    // 文章类型管理 添加文章类型
    $("#doAddCategory").on("click", function() {
        _this = this; //this是事件源
        $("#category").modal("show");
    });

    $(".doAddCategory").on("click", function() {
        $("#category").modal("hide");
    });

    // 文章类型管理 类型修改
    $(".doCategoryModify").on("click", function() {
        _this = this; //this是事件源
        $("#myCategory").modal("show");
    });

    $(".updateCategory").on("click", function() {
        $("#myCategory").modal("hide");
    });

    // 显示隐藏用户查询
    $('#showusersearch').click(function(){
        $('.showusersearch').slideDown(500);
    });
    $('.upp').click(function(){
        $('.showusersearch').slideUp(500);
    });

    // 显示隐藏用户查询
    $('#showmargersearch').click(function(){
        $('.showmargersearch').slideDown(500);
    });
    $('.uppp').click(function(){
        $('.showmargersearch').slideUp(500);
    });

	$('#file').change(function() {
        $("#showImg").attr("src", window.URL.createObjectURL(this.files[0]));
    });


});

function openFileInput(){
	$('#file').click();
}
