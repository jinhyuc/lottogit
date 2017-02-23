<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../include/header.jsp" %>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=PRALWoKu6D6cm20NNqXP&submodules=geocoder"></script>

	<!-- Page Content -->
	<div id="page-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">로또 판매점</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-10">
					<div id="storemap" style="width:100%;height:500px"></div>
				</div>
			</div><br>
			<div class="row">
                <div class="col-lg-10">
                    <div class="well">
						<dl class="dl-horizontal">
							<dt>판매점명</dt>
								<dd>로또 판매점</dd>
							<dt>전화번호</dt>
								<dd>02-777-7777</dd>
						</dl>
                    </div>
                </div>
                <!-- /.col-lg-4 -->
            </div>
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->
<script>

var mapOptions = {
		scaleControl : false,
		logoControl : false,
		mapDataControl : false,
		zoomControl : true,
		zoom: 8,
	    center: naver.maps.TM128Coord.fromCoordToLatLng(new naver.maps.Point(316709, 512225))		    
	};

var map = new naver.maps.Map(document.getElementById('storemap'), mapOptions);

var markers = [];

$(document).ready(function() {
	getStoreList_DB();
	
	for (var i=0, len=markers.length; i<len; i++) {
	    naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
	}
});

function getStoreList_DB() {
	$.getJSON("/stores/listall", function(data) {
		var first_store = naver.maps.TM128Coord.fromCoordToLatLng(new naver.maps.Point(data[0].lat, data[0].lon));
		map.setCenter(first_store);
		
		$(data).each(function() {
			if(this.wcount1 != 0 || this.wcount2 != 0) {
				printWmarker(this.lat, this.lon);
			} else {
				printMarker(this.lat, this.lon);
			}
		});	
	});
}

function printMarker(mapx, mapy) {
	var point = new naver.maps.Point(mapx, mapy);
	var position = naver.maps.TM128Coord.fromCoordToLatLng(point);

	var markerOptions = {
			position: position,
			map: map,
			    icon: {
			        url: '/resources/dist/img/pin_default.png',
			        size: new naver.maps.Size(22, 35),
			        origin: new naver.maps.Point(0, 0),
			        anchor: new naver.maps.Point(11, 35)
			}
		};

	var marker = new naver.maps.Marker(markerOptions);
	
	markers.push(marker);
}

function printWmarker(mapx, mapy) {
	var point = new naver.maps.Point(mapx, mapy);
	var position = naver.maps.TM128Coord.fromCoordToLatLng(point);

	var markerOptions = {
			position: position,
			map: map,
			    icon: {
			        url: '/resources/dist/img/winning-pin.png',
			        size: new naver.maps.Size(53, 83),
			        origin: new naver.maps.Point(0, 0),
			        anchor: new naver.maps.Point(25, 26)
			}
		};

	var marker = new naver.maps.Marker(markerOptions);
	markers.push(marker);
}

function getClickHandler(seq) {
    return function(e) {
        alert(seq + "clicked!");
    }
}
</script>

<%@ include file="../include/footer.jsp" %>