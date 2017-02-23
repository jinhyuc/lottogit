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
							<div id="storelist_db">
							
							</div>	
						</div>
					</div>
					<div class="panel panel-green">
						<div class="panel-heading"><b>[Lotto 판매점 리스트] [NaverSearch]</b></div>
						<div class="panel-body">
							<form role="form">
								<div class="form-group input-group col-lg-4" >
									<input type="text" id="keyword" class="form-control">
									<span class="input-group-btn">
										<button id="searchBtn" class="btn btn-default" type="button">
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
                            <!-- Detail Modal -->
							<div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="detailModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
											<h4 class="modal-title" id="detailModalLabel"></h4>
										</div>
										<div class="modal-body">
											<div class="container-fluid">
												<div class="form-group row"> 
	 												<label for="store_id" class="col-lg-2">번호</label>
													<div class="col-lg-10">
														<input type="text" id="store_id" class="form-control" readonly="readonly">
													</div>
												</div>
												<div class="form-group row"> 
	 												<label for="store_title" class="col-lg-2">판매점명</label>
													<div class="col-lg-10">
														<input type="text" id="store_title" class="form-control" readonly="readonly">
													</div>
												</div>
												<div class="form-group row"> 
	 												<label for="store_link" class="col-lg-2">링크</label>
													<div class="col-lg-10">
														<input type="text" id="store_link" class="form-control" readonly="readonly">
													</div>
												</div>
												<div class="form-group row"> 
	 												<label for="store_category" class="col-lg-2">분류</label>
													<div class="col-lg-10">
														<input type="text" id="store_category" class="form-control" readonly="readonly">
													</div>
												</div>
												<div class="form-group row"> 
	 												<label for="store_desc" class="col-lg-2">설명</label>
													<div class="col-lg-10">
														<input type="text" id="store_desc" class="form-control" readonly="readonly">
													</div>
												</div>
												<div class="form-group row"> 
	 												<label for="store_tel" class="col-lg-2">전화번호</label>
													<div class="col-lg-10">
														<input type="text" id="store_tel" class="form-control" readonly="readonly">
													</div>
												</div>
												<div class="form-group row"> 
	 												<label for="store_addr" class="col-lg-2">주소</label>
													<div class="col-lg-10">
														<input type="text" id="store_addr" class="form-control" readonly="readonly">
													</div>
												</div>
												<div class="form-group row"> 
	 												<label for="store_raddr" class="col-lg-2">도로명 주소</label>
													<div class="col-lg-10">
														<input type="text" id="store_raddr" class="form-control" readonly="readonly">
													</div>
												</div>
												<div class="form-group row"> 
	 												<label for="store_lat" class="col-lg-2">MapX</label>
													<div class="col-lg-4">
														<input type="text" id="store_lat" class="form-control" readonly="readonly">
													</div>
	 												<label for="store_lon" class="col-lg-2">MapY</label>
													<div class="col-lg-4">
														<input type="text" id="store_lon" class="form-control" readonly="readonly">
													</div>
												</div>
												<div class="form-group row"> 
	 												<label for="store_wcount1" class="col-lg-2">1등횟수</label>
													<div class="col-lg-4">
														<input type="text" id="store_wcount1" class="form-control" readonly="readonly">
													</div>
	 												<label for="store_wcount2" class="col-lg-2">2등횟수</label>
													<div class="col-lg-4">
														<input type="text" id="store_wcount2" class="form-control" readonly="readonly">
													</div>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-info" id="storeModBtn">수정</button>
											<button type="button" class="btn btn-danger" id="storeDelBtn">삭제</button>
											<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
										</div>
									</div>
								</div>
							</div>
							<!-- Modify Modal -->
							<div class="modal fade" id="modifyModal" tabindex="-1" role="dialog" aria-labelledby="modifyModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
											<h4 class="modal-title" id="modifyModalLabel"></h4>
										</div>
										<div class="modal-body">
											<div class="container-fluid">
												<div class="form-group row"> 
	 												<label for="store_id" class="col-lg-2">번호</label>
													<div class="col-lg-10">
														<input type="text" id="store_id_m" class="form-control" readonly="readonly">
													</div>
												</div>
												<div class="form-group row"> 
	 												<label for="store_title" class="col-lg-2">판매점명</label>
													<div class="col-lg-10">
														<input type="text" id="store_title_m" class="form-control">
													</div>
												</div>
												<div class="form-group row"> 
	 												<label for="store_link" class="col-lg-2">링크</label>
													<div class="col-lg-10">
														<input type="text" id="store_link_m" class="form-control">
													</div>
												</div>
												<div class="form-group row"> 
	 												<label for="store_category" class="col-lg-2">분류</label>
													<div class="col-lg-10">
														<input type="text" id="store_category_m" class="form-control">
													</div>
												</div>
												<div class="form-group row"> 
	 												<label for="store_desc" class="col-lg-2">설명</label>
													<div class="col-lg-10">
														<input type="text" id="store_desc_m" class="form-control">
													</div>
												</div>
												<div class="form-group row"> 
	 												<label for="store_tel" class="col-lg-2">전화번호</label>
													<div class="col-lg-10">
														<input type="text" id="store_tel_m" class="form-control">
													</div>
												</div>
												<div class="form-group row"> 
	 												<label for="store_addr" class="col-lg-2">주소</label>
													<div class="col-lg-10">
														<input type="text" id="store_addr_m" class="form-control">
													</div>
												</div>
												<div class="form-group row"> 
	 												<label for="store_raddr" class="col-lg-2">도로명 주소</label>
													<div class="col-lg-10">
														<input type="text" id="store_raddr_m" class="form-control">
													</div>
												</div>
												<div class="form-group row"> 
	 												<label for="store_lat" class="col-lg-2">MapX</label>
													<div class="col-lg-4">
														<input type="text" id="store_lat_m" class="form-control" readonly="readonly">
													</div>
	 												<label for="store_lon" class="col-lg-2">MapY</label>
													<div class="col-lg-4">
														<input type="text" id="store_lon_m" class="form-control" readonly="readonly">
													</div>
												</div>
												<div class="form-group row"> 
	 												<label for="store_wcount1" class="col-lg-2">1등횟수</label>
													<div class="col-lg-4">
														<input type="text" id="store_wcount1_m" class="form-control">
													</div>
	 												<label for="store_wcount2" class="col-lg-2">2등횟수</label>
													<div class="col-lg-4">
														<input type="text" id="store_wcount2_m" class="form-control">
													</div>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-success" id="storeSaveBtn">저장</button>
											<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
										</div>
									</div>
								</div>
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
	getStoreList_DB();
	getStoreList_Naver(1);
		
    $("#tbl_storelist_db").DataTable({
        responsive: true
    });
});

$("#searchBtn").on("click", function() {
	getStoreList_Naver(1);
});

$("#storelist_naver").on("click", ".storeMapTd", function() {
	var title = $(this).parent().attr("data-title");
	var mapx = $(this).parent().attr("data-mapx");
	var mapy = $(this).parent().attr("data-mapy");
	
	$("#mapModalLabel").html(title);
	moveMap(mapx, mapy);
});

$("#storelist_naver").on("click", ".storeAddTd", function() {
	var title = strip_tag($(this).parent().attr("data-title"));
	var link = strip_tag($(this).parent().attr("data-link"));
	var category = strip_tag($(this).parent().attr("data-category"));
	var desc = strip_tag($(this).parent().attr("data-desc"));
	var telephone = strip_tag($(this).parent().attr("data-telephone"));
	var address = strip_tag($(this).parent().attr("data-address"));
	var roadaddr = strip_tag($(this).parent().attr("data-roadaddr"));
	var mapx = $(this).parent().attr("data-mapx");
	var mapy = $(this).parent().attr("data-mapy");
	
	$.ajax({
		type: "post",
		url:"/stores/",
		headers: {
			"Content-Type": "application/json",
			"X-HTTP-Method-Override": "POST" },
		dataType: "text",
		data: JSON.stringify({
			title:title,
			link:link,
			category:category,
			description:desc,
			telephone:telephone,
			address:address,
			roadAddress:roadaddr,
			lat:mapx,
			lon:mapy
		}),
		success: function(result) {
			console.log("result: " + result);
			if(result == "SUCCESS") {
				alert("등록 되었습니다.");
				getStoreList_DB();
			}
		}

	});
});

$("#storelist_db").on("click", ".storeMapTd", function() {
	var title = $(this).parent().attr("data-title");
	var mapx = $(this).parent().attr("data-lat");
	var mapy = $(this).parent().attr("data-lon");
	
	$("#mapModalLabel").html(title);
	moveMap(mapx, mapy);
});

$("#storelist_db").on("click", ".storeDelTd", function() {
	var id = $(this).parent().attr("data-storeid");
	
	$.ajax({
		type: "delete",
		url: "/stores/del/" + id,
		headers: {
			"Content-Type": "application/json",
			"X-HTTP-Method-Override": "DELETE" },
		dataType: "text",
		success:function(result) {
			console.log("result: " + result);
			if(result == "SUCCESS") {
				alert("삭제 되었습니다.");
				getStoreList_DB();
			}
		}
	});
});

$("#storeDelBtn").on("click", function() {
	var id = $("#store_id").val();
	
	$.ajax({
		type: "delete",
		url: "/stores/del/" + id,
		headers: {
			"Content-Type": "application/json",
			"X-HTTP-Method-Override": "DELETE" },
		dataType: "text",
		success:function(result) {
			console.log("result: " + result);
			if(result == "SUCCESS") {
				$("#detailModal").modal('hide');
				alert("삭제 되었습니다.");
				getStoreList_DB();
			}
		}
	});
});

$("#storelist_db").on("click", ".storeIdTd", function() {
	var storeid = $(this).parent().attr("data-storeid");
	var title = $(this).parent().attr("data-title");
	var link = $(this).parent().attr("data-link");
	var category = $(this).parent().attr("data-category");
	var desc = $(this).parent().attr("data-desc");
	var telephone = $(this).parent().attr("data-telephone");
	var address = $(this).parent().attr("data-address");
	var roadaddr = $(this).parent().attr("data-roadaddr");
	var lat = $(this).parent().attr("data-lat");
	var lon = $(this).parent().attr("data-lon");
	var wcount1 = $(this).parent().attr("data-wcount1");
	var wcount2 = $(this).parent().attr("data-wcount2");
	
	$("#detailModalLabel").html("<b>[" + storeid + " - " + title + "]</b>");
	
	$("#store_id").val(storeid);
	$("#store_title").val(title);
	$("#store_link").val(link);
	$("#store_category").val(category);
	$("#store_desc").val(desc);
	$("#store_tel").val(telephone);
	$("#store_addr").val(address);
	$("#store_raddr").val(roadaddr);
	$("#store_lat").val(lat);
	$("#store_lon").val(lon);
	$("#store_wcount1").val(wcount1);
	$("#store_wcount2").val(wcount2);
});

$("#storeModBtn").on("click", function() {
	var storeid = $("#store_id").val();
	var title = $("#store_title").val();
	var link = $("#store_link").val();
	var category = $("#store_category").val();
	var desc = $("#store_desc").val();
	var telephone = $("#store_tel").val();
	var address = $("#store_addr").val();
	var roadaddr = $("#store_raddr").val();
	var lat = $("#store_lat").val();
	var lon = $("#store_lon").val();
	var wcount1 = $("#store_wcount1").val();
	var wcount2 = $("#store_wcount2").val();
	
	$("#detailModal").modal('hide');
	
	$("#modifyModalLabel").html("<b>[" + storeid + " - " + title + "]</b>");
	$("#store_id_m").val(storeid);
	$("#store_title_m").val(title);
	$("#store_link_m").val(link);
	$("#store_category_m").val(category);
	$("#store_desc_m").val(desc);
	$("#store_tel_m").val(telephone);
	$("#store_addr_m").val(address);
	$("#store_raddr_m").val(roadaddr);
	$("#store_lat_m").val(lat);
	$("#store_lon_m").val(lon);
	$("#store_wcount1_m").val(wcount1);
	$("#store_wcount2_m").val(wcount2);
	$("#modifyModal").modal('show');
});

$("#storeSaveBtn").on("click", function() {
	var storeid = $("#store_id_m").val();
	var title = $("#store_title_m").val();
	var link = $("#store_link_m").val();
	var category = $("#store_category_m").val();
	var desc = $("#store_desc_m").val();
	var telephone = $("#store_tel_m").val();
	var address = $("#store_addr_m").val();
	var roadaddr = $("#store_raddr_m").val();
	var lat = $("#store_lat_m").val();
	var lon = $("#store_lon_m").val();
	var wcount1 = $("#store_wcount1_m").val();
	var wcount2 = $("#store_wcount2_m").val();
	
	$.ajax({
		type: "put",
		url: "/stores/upd/" + storeid,
		headers: {
			"Content-Type": "application/json",
			"X-HTTP-Method-Override": "PUT" },
		dataType: "text",
		data: JSON.stringify({
			storeid:storeid,
			title:title,
			link:link,
			category:category,
			description:desc,
			telephone:telephone,
			address:address,
			roadAddress:roadaddr,
			lat:lat,
			lon:lon,
			wcount1:wcount1,
			wcount2:wcount2
		}),
		success: function(result) {
			console.log("result: " + result);
			if(result == "SUCCESS") {
				$("#modifyModal").modal('hide');
				alert("수정 되었습니다.");
				getStoreList_DB();
			}
		}
	});
});

$("#pagination").on("click", "li", function() {
	var page = $(this).attr("data-page");
	
	getStoreList_Naver(page);
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
		        url: '/resources/dist/img/pin_default.png',
		        size: new naver.maps.Size(22, 35),
		        origin: new naver.maps.Point(0, 0),
		        anchor: new naver.maps.Point(11, 35)
		}
	};

	var marker = new naver.maps.Marker(markerOptions);
}

function getStoreList_Naver(page) {
	var keyword=($("#keyword").val()=="")? "로또판매점" : $("#keyword").val();
	$.getJSON("/admin/storelist/" + page + "/" + keyword + "/10", function(data) {
		var str = "";
		str = "<table width='100%' class='table table-striped table-bordered table-hover'>";
		str += "<thead>";
		str += "<tr>";
		str += "<th>판매점명</th>";
		str += "<th>전화번호</th>";
		str += "<th>주소</th>";
		str += "<th>위치</th>";
		str += "<th>등록</th>";
		str += "</tr>";
		str += "</thead>";
		str += "<tbody>";
		$(data.list).each(function() {
			str += "<tr data-title='" + this.title + "' data-link='" + this.link + "' data-category='" + this.category + "' data-desc='" + this.description + "' data-telephone='" + this.telephone + "' data-address='" + this.address + "' data-roadaddr='" + this.roadAddress + "' data-mapx='" + this.mapx + "' data-mapy='" + this.mapy + "'>";
			str += "<td>" + this.title + "</td>";
			str += "<td>" + this.telephone + "</td>";
			str += "<td>" + this.address + "</td>";
			str += "<td width=40 class='storeMapTd'><a data-toggle='modal' data-target='#mapModal'><button type='button' class='btn btn-info btn-xs'>Map</button></a></td>";
			str += "<td width=40 class='storeAddTd'><button type='button' class='btn btn-primary btn-xs'>Regist</button></td>";
			str += "</tr>";
		})
		str += "</tbody>";
		str += "</table>";
		$("#storelist_naver").html(str);
		printPaging(data.pageMaker);
	});
}

function getStoreList_DB() {
	$.getJSON("/stores/listall", function(data) {
		var str = "";
		str = "<table width='100%' class='table table-striped table-bordered table-hover' id='tbl_storelist_db'>";
		str += "<thead>";
		str += "<tr>";
		str += "<th>번호</th>";
		str += "<th>판매점명</th>";
		str += "<th>전화번호</th>";
		str += "<th>주소</th>";
		str += "<th>1등</th>";
		str += "<th>2등</th>";
		str += "<th>위치</th>";
		str += "<th>삭제</th>";
		str += "</tr>";
		str += "</thead>";
		str += "<tbody>";
		$(data).each(function() {
			str += "<tr data-storeid='" + this.storeid + "' data-title='" + this.title + "' data-link='" + this.link + "' data-category='" + this.category + "' data-desc='" + this.description + "' data-telephone='" + this.telephone + "' data-address='" + this.address + "' data-roadaddr='" + this.roadAddress + "' data-lat='" + this.lat + "' data-lon='" + this.lon + "' data-wcount1='" + this.wcount1 + "' data-wcount2='" + this.wcount2 + "'>";
			str += "<td width=60 class='storeIdTd'><a data-toggle='modal' data-target='#detailModal'>" + this.storeid + "</a></td>";
			str += "<td>" + this.title + "</td>";
			str += "<td>" + this.telephone + "</td>";
			str += "<td>" + this.address + "</td>";
			str += "<td width=50>" + this.wcount1 + "</td>";
			str += "<td width=50>" + this.wcount2 + "</td>";
			str += "<td width=60 class='storeMapTd'><a data-toggle='modal' data-target='#mapModal'><button type='button' class='btn btn-info btn-xs'>Map</button></a></td>";
			str += "<td width=60 class='storeDelTd'><button type='button' class='btn btn-danger btn-xs'>Del</button></td>";
			str += "</tr>";
		})
		str += "</tbody>";
		str += "</table>";
		$("#storelist_db").html(str);
		$("#tbl_storelist_db").DataTable({
	        responsive: true
	    });
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

function strip_tag(str) {
	return str.replace(/(<([^>]+)>)/ig,"");
}
</script>

<%@ include file="../include/footer.jsp" %>