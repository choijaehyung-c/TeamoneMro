<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>MRONE</title>
 
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="resources/css/styles.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
</head>

<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<a class="navbar-brand ps-3" href="/">MRONE</a>
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown">
				<div class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
					<i class="fas fa-user fa-fw"></i>
				</div>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><div class="dropdown-item">Settings</div></li>
					<li><div class="dropdown-item">Activity Log</div></li>
					<li><hr class="dropdown-divider" /></li>
					<li><div class="dropdown-item"
							onclick="readyAccessMro('-1','/AccessOutMro')">Logout</div></li>
				</ul>
			</li>
		</ul>
	</nav>
	
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Core</div>
						<div class="nav-link">Dashboard</div>
						<div class="sb-sidenav-menu-heading">Interface</div>

						<div class="nav-link collapsed" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">

							거래처관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</div>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<div class="nav-link" onClick="clientList()">고객사 목록</div>
								<div class="nav-link" onClick="supplyList()">공급사 목록</div>
							</nav>
						</div>

						<div class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages">

							주문관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</div>
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages">
								<div class="nav-link" onClick="mroOrderList()">주문목록</div>
								<div class="nav-link" onClick="mroRefundList()">반품목록</div>
								<div class="nav-link" onClick="mroExchangeList()">교환목록</div>
							</nav>
						</div>



						<div class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages2" aria-expanded="false"
							aria-controls="collapsePages2">
							상품관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</div>
						<div class="collapse" id="collapsePages2"
							aria-labelledby="headingThree" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages">
								<div class="nav-link" onClick="getNewProductRequest()">새상품
									등록 요청건</div>
								<div class="nav-link" onClick="getModifyRequest()">상품수정
									요청건</div>
							</nav>
						</div>

						<div class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages3" aria-expanded="false"
							aria-controls="collapsePages3">
							발주관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</div>
						<div class="collapse" id="collapsePages3"
							aria-labelledby="headingfour" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages">
								<div class="nav-link" onClick="requestOrder()">발주하기</div>
							</nav>
						</div>


						<div class="sb-sidenav-menu-heading">Addons</div>
						<div class="nav-link">Test3</div>
						<div class="nav-link">Test4</div>

					</div>
				</div>
			</nav>
		</div>
		
		
		<div id="layoutSidenav_content">
			<main style="height: 100%; width: 100%;">
				<div id="mainVue" style="height: 100%; width: 100%;">
				
				
				<div v-if="page[1].show" style="height: 100%; width: 100%; background: rgba(0,0,0,0.5); position: absolute; padding: 20px; z-index: 2;">
                  <div style="max-width: 100%; width: 83.5%; display: table; background: #fff; border-radius: 10px; padding: 20px; z-index: 1;">
						<table id="datatablesSimple" class="dataTable-table">
										<thead>
											<tr>
												<th data-sortable style="width: 13.3333%; background-color: #E0E0E0;"><a>공급사코드</a></th>
												<th data-sortable style="width: 13.3333%; background-color: #E0E0E0;"><a>공급사명</a></th>
												<th data-sortable style="width: 13.3333%; background-color: #E0E0E0;"><a>주문코드</a></th>
												<th data-sortable style="width: 13.3333%; background-color: #E0E0E0;"><a>상품코드</a></th>
												<th data-sortable style="width: 20%; background-color: #E0E0E0;"><a>상품명</a></th>
												<th data-sortable style="width: 13.3333%; background-color: #E0E0E0;"><a>상품수량</a></th>
												<th data-sortable style="width: 13.3333%; background-color: #E0E0E0;"><a>상태코드</a></th>
											</tr>
										</thead>
										<tbody>
											<tr v-for="old in orderListDetail" >
												<td>{{old.od_prspcode}}</td>
												<td>{{old.sp_name}}</td>
												<td>{{old.od_oscode}}</td>
												<td>{{old.od_prcode}}</td>
												<td>{{old.pr_name}}</td>
												<td>{{old.od_quantity}}</td>
												<td>{{old.od_stcode}}</td>
											</tr>							
											    <button class="btn-datatable"  v-on:click="close(1)"><img src="../../resources/img/close.png"></button>										  											   																																							
						                </tbody>									  				
						</table>							
					  </div>
					</div>
					

					<template v-if="page[0].show" style="z-index: 3;">
					
						<div class="container-fluid px-4">
							<h1 style = "padding:20px; font-size:25px; color:#808080; font-weight:bold; margin-left:-30px;"><a href="/">메인페이지</a> >주문목록</h1>
						
							<div class="card mb-4">
								<div class="card-body">※주문목록 확인 후 처리해주세요 [문의 :
									nsb214@naver.com]</div>
							</div>
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-table me-1"></i> 주문 접수 목록
								</div>

								<div class="card-body">
									<table id="datatablesSimple" class="dataTable-table">
										<thead>
											<tr>
												<th data-sortable style="width: 19.5444%;"><a>주문코드</a></th>
												<th data-sortable style="width: 19.5444%;"><a>고객사명</a></th>
												<th data-sortable style="width: 19.5444%;"><a>접수날짜</a></th>
												<th data-sortable style="width: 19.5444%;"><a>접수내용</a></th>
											</tr>
										</thead>
										<tbody>
											<tr v-for="ol in orderList"
												@click="mroOrderListDetail(ol.os_code)">
												<td>{{ol.os_code}}</td>
												<td>{{ol.cl_name}}</td>
												<td>{{ol.os_date}}</td>
												<td>{{ol.os_state}}</td>
											</tr>
											</tbody>																	
									</table>
								</div>
							</div>
						</div>
					</template>
					
					
					<template v-if="page[2].show" style="z-index:3;">
					
						<div class="container-fluid px-4">
							<h1 style = "padding:20px; font-size:25px; color:#808080; font-weight:bold; margin-left:-30px;"><a href="/">메인페이지</a> >반품신청목록</h1>
							
							<div class="card mb-4">
								<div class="card-body">※반품신청목록 확인 후 처리해주세요 [문의 :
									nsb214@naver.com]</div>
							</div>
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-table me-1"></i> 주문 신청 목록
								</div>

								<div class="card-body">
									<table id="datatablesSimple" class="dataTable-table">
										<thead>
											<tr>
												<th data-sortable style="width: 19.5444%;"><a>주문코드</a></th>
												<th data-sortable style="width: 19.5444%;"><a>고객사명</a></th>
												<th data-sortable style="width: 19.5444%;"><a>접수날짜</a></th>
												<th data-sortable style="width: 19.5444%;"><a>접수내용</a></th>
											</tr>
										</thead>
										<tbody>
											<tr v-for="ol in orderList"
												@click="mroOrderListDetail(ol.os_code)">
												<td>{{ol.os_code}}</td>
												<td>{{ol.cl_name}}</td>
												<td>{{ol.os_date}}</td>
												<td>{{ol.os_state}}</td>
											</tr>
											</tbody>																	
									</table>
								</div>
							</div>
						</div>
					</template>
					
					
					<template v-if="page[3].show" style="z-index:3;">
					
						<div class="container-fluid px-4">
							<h1 style = "padding:20px; font-size:25px; color:#808080; font-weight:bold; margin-left:-30px;"><a href="/">메인페이지</a> >교환신청목록</h1>
							
							<div class="card mb-4">
								<div class="card-body">※교환신청목록 확인 후 처리해주세요 [문의 :
									nsb214@naver.com]</div>
							</div>
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-table me-1"></i> 교환 신청 목록
								</div>

								<div class="card-body">
									<table id="datatablesSimple" class="dataTable-table">
										<thead>
											<tr>
												<th data-sortable style="width: 19.5444%;"><a>주문코드</a></th>
												<th data-sortable style="width: 19.5444%;"><a>고객사명</a></th>
												<th data-sortable style="width: 19.5444%;"><a>접수날짜</a></th>
												<th data-sortable style="width: 19.5444%;"><a>접수내용</a></th>
											</tr>
										</thead>
										<tbody>
											<tr v-for="ol in orderList"
												@click="mroOrderListDetail(ol.os_code)">
												<td>{{ol.os_code}}</td>
												<td>{{ol.cl_name}}</td>
												<td>{{ol.os_date}}</td>
												<td>{{ol.os_state}}</td>
											</tr>
											</tbody>																	
									</table>
								</div>
							</div>
						</div>
					</template>
					
					
				</div>
			</main>
		</div>
	<script src="resources/js/scripts.js"></script>
	<script src="resources/js/datatables-simple-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/resources/vue/vue.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/js.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/mro.js"></script>


</body>
</html>
