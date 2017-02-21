<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../include/header.jsp" %>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=PRALWoKu6D6cm20NNqXP&submodules=geocoder"></script>

	<!-- Page Content -->
	<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">ADMIN PAGE - store</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>			
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading"><b>[Lotto 판매점 리스트] [Database]</b></div>
						<div class="panel-body">
							<table width="100%" class="table table-striped table-bordered table-hover" id="storelist_db">
								<thead>
									<tr>
										<th>판매점명</th>
										<th>설명</th>
										<th>전화번호</th>
										<th>주소</th>
										<th>위치</th>
										<th>1등 배출 횟수</th>
										<th>2등 배출 횟수</th>
									</tr>
								</thead>
								<tbody>
	
								</tbody>
							</table>	
						</div>
					</div>
					<div class="panel panel-green">
						<div class="panel-heading"><b>[Lotto 판매점 리스트] [NaverSearch]</b></div>
						<div class="panel-body">
							<form role="form">
								<div class="form-group input-group">
									<input type="text" id="keyword" class="form-control">
									<span class="input-group-btn">
										<button class="btn btn-default" type="button">
										<i class="fa fa-search"></i>
										</button>
									</span>
								</div>
							</form>
							<div id="storelist_naver">

							</div>
							<div id="pagination" class="text-center"></div>
							<!-- Map Modal -->
							<div class="modal fade" id="mapModal" tabindex="-1" role="dialog" aria-labelledby="mapModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="mapModalLabel"></h4>
                                        </div>
                                        <div class="modal-body">
                                            <div id="map" style="width:570px;height:400px;"></div>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
						</div>
					</div>
				</div>
			</div>
	</div>
	<!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->

<script>
$(document).ready(function() {
	getStoreList_Naver(1);
	
    $('#storelist_db').DataTable({
        responsive: true
    });
});

function moveMap(mapx, mapy) {
	var point = new naver.maps.Point(mapx, mapy);
	var center = naver.maps.TM128Coord.fromCoordToLatLng(point);
	var mapOptions = {
			scaleControl : false,
			logoControl : false,
			mapDataControl : false,
			zoomControl : true,
		    center: center		    
		};

	var map = new naver.maps.Map(document.getElementById('map'), mapOptions);
	
	var markerOptions = {
		position: center,
		map: map,
		    icon: {
		        url: './img/pin_default.png',
		        size: new naver.maps.Size(22, 35),
		        origin: new naver.maps.Point(0, 0),
		        anchor: new naver.maps.Point(11, 35)
		}
	};

	var marker = new naver.maps.Marker(markerOptions);
}

$("#storelist_naver").on("click", ".storeListTd", function() {
	var title = $(this).attr("data-title");
	var mapx = $(this).attr("data-mapx");
	var mapy = $(this).attr("data-mapy");
	
	$("#mapModalLabel").html(title);
	moveMap(mapx, mapy);
	
});

function getStoreList_Naver(page) {
	var keyword=($("#keyword").val()=="")? "로또판매점" : $("#keyword").val();
	$.getJSON("/admin/storelist/" + page + "/" + keyword + "/10", function(data) {
		var str = "";
		str = "<table width='100%' class='table table-striped table-bordered table-hover'>";
		str += "<thead>";
		str += "<tr>";
		str += "<th>판매점명</th>";
		str += "<th>판매점 정보</th>";
		str += "<th>전화번호</th>";
		str += "<th>주소</th>";
		str += "<th>위치</th>";
		str += "</tr>";
		str += "</thead>";
		str += "<tbody>";
		$(data.list).each(function() {
			str += "<tr>";
			str += "<td>" + this.title + "</td>";
			str += "<td>" + this.description + "</td>";
			str += "<td>" + this.telephone + "</td>";
			str += "<td>" + this.address + "</td>";
			str += "<td width=70 class='storeListTd' data-mapx='" + this.mapx + "' data-mapy='" + this.mapy + "' data-title='" + this.title + "'><a data-toggle='modal' data-target='#mapModal'><button type='button' class='btn btn-info'>Map</button></a></td>";
			str += "</tr>";
		})
		str += "</tbody>";
		str += "</table>";
		$("#storelist_naver").html(str);
		printPaging(data.pageMaker);
	});
}

function printPaging(pageMaker) {
	var str = "";
	
	str += "<ul class='pagination'>";

	if (pageMaker.prev) {
		str += "<li data-page='" + (pageMaker.startPage - 1) + "'><a>&laquo;</a></li>";
	}

	for (var idx = pageMaker.startPage, len = pageMaker.endPage; idx <= len; idx++) {
		if (pageMaker.cri.page == idx) {
			str += "<li class='active' data-page='" + idx + "'><a>" + idx + "</a></li>";
		} else {
			str += "<li data-page='" + idx + "'><a>" + idx + "</a></li>";
		}
	}

	if (pageMaker.next && pageMaker.endPage > 0) {
		str += "<li data-page='" + (pageMaker.endPage + 1) + "'><a>&raquo;</a></li>";
	}
	
	str += "</ul>";

	$('#pagination').html(str);
}


$("#pagination").on("click", "li", function() {
	var page = $(this).attr("data-page");
	
	getStoreList_Naver(page);
})
</script>

<%@ include file="../include/footer.jsp" %>