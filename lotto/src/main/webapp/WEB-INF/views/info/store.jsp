<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../include/header.jsp" %>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=PRALWoKu6D6cm20NNqXP"></script>

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
			<div id="storemap" style="width:100%;height:600px;"></div>
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->
<script>
getStore();

var mapOptions = {
		scaleControl : false,
		logoControl : false,
		mapDataControl : false,
		zoomControl : true,
		center: new naver.maps.LatLng(37.3724620, 127.1051714)
};
var map = new naver.maps.Map(document.getElementById('storemap'), mapOptions);


function getStore() {
	$.getJSON("/info/storeloc", function(data) {
		/* printMarker(37.3724620, 127.1051714); */
		var posx;
		var posy;
		
		$(data.list).each(function() {
			posx = this.mapx;
			posy = this.mapy;
		});
		
		printMarker(posx, posy);

	});	
}

function printMarker(mapx, mapy) {
	var point = new naver.maps.Point(mapx, mapy);
	var mapOptions = {
			scaleControl : false,
			logoControl : false,
			mapDataControl : false,
			zoomControl : true,
			center: point
	};
	var map = new naver.maps.Map(document.getElementById('storemap'), mapOptions);

	var urlMarker = new naver.maps.Marker({
		position : point,
		map : map,
		title : 'urlMarker',
		/* icon : "/resources/dist/img/pin_default.png", */
		animation : naver.maps.Animation.DROP
	});

	naver.maps.Event.addListener(urlMarker, 'click', function() {
		if (urlMarker.getAnimation() !== null) {
			urlMarker.setAnimation(null);
		} else {
			urlMarker.setAnimation(naver.maps.Animation.BOUNCE);
		}
	});
}
</script>

<%@ include file="../include/footer.jsp" %>