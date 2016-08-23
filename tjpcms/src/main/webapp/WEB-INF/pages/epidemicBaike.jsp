<%--
  Created by IntelliJ IDEA.
  User: simon
  Date: 16/7/14
  Time: 下午12:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <link href="${pageContext.request.contextPath}/adminex/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/adminex/css/style-responsive.css" rel="stylesheet">

</head>
<body class="sticky-header">


<section>
    <%@include file="menu.jsp" %>
    <!-- main content start-->
    <div class="main-content">
        <%@include file="header.jsp" %>

        <!--body wrapper start-->
        <div class="wrapper">
            <div class="row">
                <div class="col-md-12">
                    <section class="panel">
                        <header class="panel-heading">
                            疫情百科
                            <span class="tools pull-right">
                                <a href="javascript:;" class="fa fa-chevron-down"></a>
                                <a href="javascript:;" class="fa fa-times"></a>
                             </span>
                        </header>
                        <div class="panel-body">

                            <div id="gallery" class="media-gal">
                                <c:forEach items="${baikeList}" var="baike">
                                    <div class="images item ">
                                        <a onclick="dj('${baike.id}','${baike.epidemic.epidemicName}');">
                                            <img src="${baike.imgUrl}"
                                                 alt=""/>
                                        </a>
                                        <p>${baike.epidemic.epidemicName}</p>
                                    </div>
                                </c:forEach>
                            </div>


                            <!-- Modal -->
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
                                 aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"
                                                    aria-hidden="true">&times;</button>
                                            <h4 id="title" class="modal-title"></h4>
                                        </div>

                                        <div class="modal-body row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label> 简介</label>
                                                    <p id="jj"></p>
                                                </div>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </div>

                        </div>


                    </section>
                </div>
            </div>
        </div>
        <!--body wrapper end-->

    </div>
    <!-- main content end-->


</section>


<!-- Placed js at the end of the document so the pages load faster -->
<script src="${pageContext.request.contextPath}/adminex/js/jquery-1.10.2.min.js"></script>
<script src="${pageContext.request.contextPath}/adminex/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${pageContext.request.contextPath}/adminex/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/adminex/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/adminex/js/modernizr.min.js"></script>

<script src="${pageContext.request.contextPath}/adminex/js/jquery.isotope.js"></script>

<!--common scripts for all pages-->
<script src="${pageContext.request.contextPath}/adminex/js/scripts.js"></script>

<script type="text/javascript">
    function dj(id,name) {

        $.get("${pageContext.request.contextPath}/epidemicBaike/fetchBaikeInfo.do", {id: id},
                function (data) {
                    var json = data;
                    $("#title").html(name);
                    $("#jj").html(json['content']);
                    $('#myModal').modal('show');
                },
                "json");


    }

    $(function () {
//        var $container = $('#gallery');
//        $container.isotope({
//            itemSelector: '.item',
//            animationOptions: {
//                duration: 750,
//                easing: 'linear',
//                queue: false
//            }
//        });
//
//        // filter items when filter link is clicked
//        $('#filters a').click(function () {
//            var selector = $(this).attr('data-filter');
//            $container.isotope({filter: selector});
//            return false;
//        });
    });
</script>
</body>

</html>