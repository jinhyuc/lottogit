<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../include/header.jsp" %>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=PRALWoKu6D6cm20NNqXP&submodules=geocoder,panorama"></script>

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
					<div id="storemap" style="width:100%;height:500px;"></div>
				</div>
			</div><br>
			<!-- <div class="row">
                <div class="col-lg-4">
                    <div class="well" id="storeInfo" style="width:100%;height:300px;">
						
                    </div>
                </div>
                <div class="col-lg-6">
                	<div id="panorama" style="width:100%;height:300px;">
                	
                	</div>
                </div>
                /.col-lg-4
            </div><br> -->
			<div class="row">
				<div class="well col-lg-10">
					<div class="media">
						<div class="col-lg-6">
							<div id="panorama" class="pull-left" style="width:100%;height:300px;">
                	
            				</div>
            			</div>
            			<div class="col-lg-4">
							<div id="storeInfo" class="media-body">
    		
          					</div>
          				</div>
					</div>
				</div>
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

var panoramaOptions = {
	    position: naver.maps.TM128Coord.fromCoordToLatLng(new naver.maps.Point(316709, 512225)),
	    size: new naver.maps.Size(800, 600),
	    pov: {
	        pan: -135,
	        tilt: 29,
	        fov: 100
	    }
	};

var pano = new naver.maps.Panorama(document.getElementById("panorama"), {
    position: naver.maps.TM128Coord.fromCoordToLatLng(new naver.maps.Point(316709, 512225))
});

var markers = [];
var storeinfos = [];
var positions = [];

$(document).ready(function() {
	getStoreList_DB();
	
	console.log("markers length: " + markers.length);
});

function getStoreList_DB() {
	$.getJSON("/stores/listall", function(data) {
		var first_store = naver.maps.TM128Coord.fromCoordToLatLng(new naver.maps.Point(data[0].lat, data[0].lon));
		map.setCenter(first_store);
		
		$(data).each(function() {
			addMarker(this.lat, this.lon, this.wcount1, this.wcount2);
			addStoreInfo(this.title, this.telephone, this.address, this.wcount1, this.wcount2, this.lat, this.lon);
		});
		
		naver.maps.Event.addListener(map, 'idle', function() {
		    updateMarkers(map, markers);
		});
		
		for (var i=0, len=markers.length; i<len; i++) {
		    naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
		}
	});
}

function addMarker(mapx, mapy, wcount1, wcount2) {
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
	
	var markerWOptions = {
			position: position,
			map: map,
			    icon: {
			        url: '/resources/dist/img/winning-pin.png',
			        size: new naver.maps.Size(53, 83),
			        origin: new naver.maps.Point(0, 0),
			        anchor: new naver.maps.Point(25, 26)
			}
		};
	
	var marker;
	
	if(wcount1 !=0 || wcount2 != 0) {
		marker = new naver.maps.Marker(markerWOptions);
	} else {
		marker = new naver.maps.Marker(markerOptions);
	}
	
	markers.push(marker);
}

function addStoreInfo(title, telephone, address, wcount1, wcount2, lat, lon) {
	var storeinfo = [
						"<div class='span8'>",
						"<h3><b>" + title + "</b></h3>",
						"<h5>전화번호: " + telephone + "</h5>",
						"<h5>주 소: " + address + "</h5>",
						"<h5>1등 배출 횟수: " + wcount1 + "</h5>",
						"<h5>2등 배출 횟수: " + wcount2 + "</h5>",
						"</div>"
					].join("");
	storeinfos.push(storeinfo);
	var storepos = naver.maps.TM128Coord.fromCoordToLatLng(new naver.maps.Point(lat, lon));
	positions.push(storepos);
}

function updateMarkers(map, markers) {

    var mapBounds = map.getBounds();
    var marker, position;

    for (var i = 0; i < markers.length; i++) {

        marker = markers[i]
        position = marker.getPosition();

        if (mapBounds.hasLatLng(position)) {
            showMarker(map, marker);
        } else {
            hideMarker(map, marker);
        }
    }
}

function showMarker(map, marker) {

    if (marker.setMap()) return;
    marker.setMap(map);
}

function hideMarker(map, marker) {

    if (!marker.setMap()) return;
    marker.setMap(null);
}

function getClickHandler(seq) {
    return function(e) {
        $("#storeInfo").html(storeinfos[seq]);
        
    	pano.setPosition(positions[seq]);
    }
}
</script>

<%@ include file="../include/footer.jsp" %>