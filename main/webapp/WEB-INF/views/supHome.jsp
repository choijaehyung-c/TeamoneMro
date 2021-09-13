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
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/supplyIYJ.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
</head>

<body class="sb-nav-fixed" onLoad="change1()">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<a class="navbar-brand ps-3" href="/">MRONE_SUPPLY</a>
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
						<div class="nav-link" onclick="change1()">Dashboard</div>
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

							수주관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</div>
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages">
								<div class="nav-link" onClick="orderWaitList()">수주목록</div>
								<div class="nav-link" onClick="trackDelivery()">출고목록</div>

							</nav>
						</div>



						<div class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages55" aria-expanded="false"
							aria-controls="collapsePages55">
							교환 / 반품 관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</div>
						<div class="collapse" id="collapsePages55"
							aria-labelledby="headingThree" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages">
								<div class="nav-link" onClick="getRefundListForm()">반품 요청
									리스트</div>
								<div class="nav-link" onClick="getExchangeListForm()">교환
									요청 리스트</div>
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
						<!--  -->
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages5" aria-expanded="false"
							aria-controls="collapsePages5"> Pages
							<div class="sb-sidenav-collapse-arrow">
								<svg class="svg-inline--fa fa-angle-down fa-w-10"
									aria-hidden="true" focusable="false" data-prefix="fas"
									data-icon="angle-down" role="img"
									xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"
									data-fa-i2svg="">
									<path fill="currentColor"
										d="M143 352.3L7 216.3c-9.4-9.4-9.4-24.6 0-33.9l22.6-22.6c9.4-9.4 24.6-9.4 33.9 0l96.4 96.4 96.4-96.4c9.4-9.4 24.6-9.4 33.9 0l22.6 22.6c9.4 9.4 9.4 24.6 0 33.9l-136 136c-9.2 9.4-24.4 9.4-33.8 0z"></path></svg>
								<!-- <i class="fas fa-angle-down"></i> Font Awesome fontawesome.com -->
							</div>
						</a>
						<div class="collapse" id="collapsePages5"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion"
							style="">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages">
								<a class="nav-link" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseAuth" aria-expanded="false"
									aria-controls="pagesCollapseAuth"> Authentication
									<div class="sb-sidenav-collapse-arrow">
										<svg class="svg-inline--fa fa-angle-down fa-w-10"
											aria-hidden="true" focusable="false" data-prefix="fas"
											data-icon="angle-down" role="img"
											xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"
											data-fa-i2svg="">
											<path fill="currentColor"
												d="M143 352.3L7 216.3c-9.4-9.4-9.4-24.6 0-33.9l22.6-22.6c9.4-9.4 24.6-9.4 33.9 0l96.4 96.4 96.4-96.4c9.4-9.4 24.6-9.4 33.9 0l22.6 22.6c9.4 9.4 9.4 24.6 0 33.9l-136 136c-9.2 9.4-24.4 9.4-33.8 0z"></path></svg>
										<!-- <i class="fas fa-angle-down"></i> Font Awesome fontawesome.com -->
									</div>
								</a>
								<div class="collapse" id="pagesCollapseAuth"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages" style="">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="login.html">Login</a> <a
											class="nav-link" href="register.html">Register</a> <a
											class="nav-link" href="password.html">Forgot Password</a>
									</nav>
								</div>
								<a class="nav-link" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseError" aria-expanded="false"
									aria-controls="pagesCollapseError"> Error
									<div class="sb-sidenav-collapse-arrow">
										<svg class="svg-inline--fa fa-angle-down fa-w-10"
											aria-hidden="false" focusable="false" data-prefix="fas"
											data-icon="angle-down" role="img"
											xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"
											data-fa-i2svg="">
											<path fill="currentColor"
												d="M143 352.3L7 216.3c-9.4-9.4-9.4-24.6 0-33.9l22.6-22.6c9.4-9.4 24.6-9.4 33.9 0l96.4 96.4 96.4-96.4c9.4-9.4 24.6-9.4 33.9 0l22.6 22.6c9.4 9.4 9.4 24.6 0 33.9l-136 136c-9.2 9.4-24.4 9.4-33.8 0z"></path></svg>
										<!-- <i class="fas fa-angle-down"></i> Font Awesome fontawesome.com -->
									</div>
								</a>
								<div class="collapse" id="pagesCollapseError"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages" style="">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="401.html">401 Page</a> <a
											class="nav-link" href="404.html">404 Page</a> <a
											class="nav-link" href="500.html">500 Page</a>
									</nav>
								</div>
							</nav>
						</div>
						<!--  -->

						<div class="sb-sidenav-menu-heading">Addons</div>
						<div class="nav-link" onclick="change2()">Test3</div>
						<div class="nav-link" onclick="change3()">Test4</div>

					</div>
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main style="height: 100%; width: 100%;">
				<div id="supplyVue" style="height: 100%; width: 100%;">
				<template v-if="display[4].show">
						<ol class="breadcrumb mb-4">
							<li class="breadcrumb-item"><a href="/">메인페이지</a></li>
							<li class="breadcrumb-item active">chart</li>
						</ol>


						<div class="row">
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <svg class="svg-inline--fa fa-chart-bar fa-w-16 me-1" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="chart-bar" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M332.8 320h38.4c6.4 0 12.8-6.4 12.8-12.8V172.8c0-6.4-6.4-12.8-12.8-12.8h-38.4c-6.4 0-12.8 6.4-12.8 12.8v134.4c0 6.4 6.4 12.8 12.8 12.8zm96 0h38.4c6.4 0 12.8-6.4 12.8-12.8V76.8c0-6.4-6.4-12.8-12.8-12.8h-38.4c-6.4 0-12.8 6.4-12.8 12.8v230.4c0 6.4 6.4 12.8 12.8 12.8zm-288 0h38.4c6.4 0 12.8-6.4 12.8-12.8v-70.4c0-6.4-6.4-12.8-12.8-12.8h-38.4c-6.4 0-12.8 6.4-12.8 12.8v70.4c0 6.4 6.4 12.8 12.8 12.8zm96 0h38.4c6.4 0 12.8-6.4 12.8-12.8V108.8c0-6.4-6.4-12.8-12.8-12.8h-38.4c-6.4 0-12.8 6.4-12.8 12.8v198.4c0 6.4 6.4 12.8 12.8 12.8zM496 384H64V80c0-8.84-7.16-16-16-16H16C7.16 64 0 71.16 0 80v336c0 17.67 14.33 32 32 32h464c8.84 0 16-7.16 16-16v-32c0-8.84-7.16-16-16-16z"></path></svg><!-- <i class="fas fa-chart-bar me-1"></i> Font Awesome fontawesome.com -->
                                        Bar Chart Example
                                    </div>
                                    <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div><canvas id="myBarChart" width="722" height="361" style="display: block; height: 289px; width: 578px;" class="chartjs-render-monitor"></canvas></div>
                                    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <svg class="svg-inline--fa fa-chart-pie fa-w-17 me-1" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="chart-pie" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 544 512" data-fa-i2svg=""><path fill="currentColor" d="M527.79 288H290.5l158.03 158.03c6.04 6.04 15.98 6.53 22.19.68 38.7-36.46 65.32-85.61 73.13-140.86 1.34-9.46-6.51-17.85-16.06-17.85zm-15.83-64.8C503.72 103.74 408.26 8.28 288.8.04 279.68-.59 272 7.1 272 16.24V240h223.77c9.14 0 16.82-7.68 16.19-16.8zM224 288V50.71c0-9.55-8.39-17.4-17.84-16.06C86.99 51.49-4.1 155.6.14 280.37 4.5 408.51 114.83 513.59 243.03 511.98c50.4-.63 96.97-16.87 135.26-44.03 7.9-5.6 8.42-17.23 1.57-24.08L224 288z"></path></svg><!-- <i class="fas fa-chart-pie me-1"></i> Font Awesome fontawesome.com -->
                                        Pie Chart Example
                                    </div>
                                    <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div><canvas id="myPieChart" width="722" height="361" style="display: block; height: 289px; width: 578px;" class="chartjs-render-monitor"></canvas></div>
                                    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                                </div>
                            </div>
                        </div>
				</template>

					<template v-if="display[0].show" style="z-index: 3;">
				<div v-if="modal.show" style="height:100%; width: calc( 100% - 225px ); background: rgba(0, 0, 0, 0.5); position: absolute; padding: 20px; z-index: 2;">
                     <div style="width:90%; max-height:80%; background: #fff; transform:translate(-50%,-50%);
                     border-radius: 10px; padding: 20px; z-index:1; position: absolute; top:50%; left:50%; overflow:auto;">
								<table id="datatablesSimple" class="dataTable-table">
									<thead>
										<h5>주문코드 : {{modalDetailList[0].rd_recode}}의 상세내역</h5>
										<tr>

											<th data-sortable
												style="width: 12.3333%; background-color: #E0E0E0;"><a>상품이미지</a></th>
											<th data-sortable
												style="width: 10.3333%; background-color: #E0E0E0;"><a>상품코드</a></th>
											<th data-sortable
												style="width: 20%; background-color: #E0E0E0;"><a>상품명</a></th>
											<th data-sortable
												style="width: 10.3333%; background-color: #E0E0E0;"><a>상품수량</a></th>

											<th data-sortable
												style="width: 10.3333%; background-color: #E0E0E0;"><a>가격(세금)</a></th>
											<th data-sortable
												style="width: 10.3333%; background-color: #E0E0E0;"><a>총
													가격</a></th>
											<th data-sortable
												style="width: 13.3333%; background-color: #E0E0E0;"><a>상태코드</a></th>
											
										</tr>
									</thead>
									<tbody>
										<tr v-for="(li,index) in modalDetailList" @click="insReason(index,li.rd_prcode)">

											<td>
											<div class="form-check">
												<input type="checkbox" class="form-check-input" name="choose" @click="getCheckedVal()" :value=li.rd_prcode id="ch">
												<label title="" class="form-check-label">
														<img :src="li.pr_image" width="70%" height="70%" alt="no search image">
												</label>
											</div>
											</td>
											<td>{{li.rd_prcode}}</td>
											<td>{{li.pr_name}}</td>
											<td>{{li.rd_quantity}}</td>
											<td>{{li.pr_price}}원
												<div>({{li.pr_tax}}원)</div>
											</td>
											<td>{{li.pr_ttprice}}원</td>
											<td>{{li.rd_stcode}}</td>
										</tr>
									</tbody>
								</table>
								
								<div @click="respondOA(modalDetailList[0].rd_recode)"
									class="align-top ms-1 btn btn-outline-dark btn-sm"
									style="position: relative; top: 50%; left: 42%;">접수확인</div>
								<div @click=respondOF(modalDetailList[0].rd_recode)
									class="align-top ms-1 btn btn-outline-dark btn-sm"
									style="position: relative; top: 50%; left: 43%;">접수거절</div>
								<div class="align-top ms-1 btn btn-outline-primary btn-sm"
									@click="modalClose()"
									style="position: relative; top: 50%; left: 80%;">Close</div>
							</div>
						</div>
						<h1 class="mt-4">수주 목록</h1>
						<ol class="breadcrumb mb-4">
							<li class="breadcrumb-item"><a href="/">메인페이지</a></li>
							<li class="breadcrumb-item active">수주대기 목록</li>
						</ol>
						<ol class="breadcrumb mb-4">
	
					 	<ul class="mb-5 nav nav-tabs" role="tablist">
								<li class="nav-item" role="presentation">
								<button type="button" role="tab" data-rb-event-key="allProducts"
										aria-selected="true" class="nav-link active" onclick="orderWaitList()">수주대기목록</button>
								</li>
								<li class="nav-item" role="presentation">
									<button type="button" role="tab" data-rb-event-key="archived"
										aria-selected="false" class="nav-link" onclick="orderRefuseList()">수주거절목록</button></li>
								<li class="nav-item" role="presentation">
									<button type="button" role="tab" data-rb-event-key="drafts"
										aria-selected="false" class="nav-link" onclick="orderReceiveList()">수주완료목록</button></li>
							</ul>

						</ol>
						<div
							class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
							<div class="dataTable-top">
								<div class="dataTable-dropdown">
									<span class="me-2" id="categoryBulkAction"> <select
										name="categoryBulkAction"
										class="d-inline w-auto form-select form-select-sm">
											<option>Bulk Actions</option>
											<option>Delete</option>
									</select>
										<button type="button"
											class="align-top ms-1 btn btn-outline-dark btn-sm">Apply</button>
									</span> <label> <select
										class="dataTable-selector form-select form-select-sm">
											<option value="5">5</option>
											<option value="10" selected="">10</option>
											<option value="15">15</option>
											<option value="20">20</option>
											<option value="25">25</option>
									</select> entries per page
									</label>
								</div>
								<div class="dataTable-search">
									<input class="dataTable-input form-control form-control-sm"
										placeholder="Search..." type="text">
								</div>
							</div>

							<div class="dataTable-container border-0">
								<table class="mb-0 table table-hover dataTable-table">
									<thead>
										<tr class="title">
											<th data-sortable="false" style="width: 14.7704%;">ORDER
												ID</th>
											<th data-sortable="" style="width: 27.7982%;"><a
												href="#" class="dataTable-sorter">NAME</a></th>
											<th data-sortable="" style="width: 11.9491%;"><a
												href="#" class="dataTable-sorter">CONTACT</a></th>
											<th data-sortable="" style="width: 11.9491%;" class="desc"><a
												href="#" class="dataTable-sorter">DATE</a></th>
											<th data-sortable="" style="width: 16.2598%;"><a
												href="#" class="dataTable-sorter">TOTAL PRICE</a></th>
											<th data-sortable="" style="width: 12.281%;"><a href="#"
												class="dataTable-sorter">STATE</a></th>

										</tr>
									</thead>

									<tbody>
										<tr class="align-middle" v-for="li in list" @click="orderListDetail(li.re_code)">
											<td>
												<div class="form-check">
													<input type="checkbox" class="form-check-input"><label
														title="" class="form-check-label">{{li.re_code}}</label>
												</div>
											</td>
											<td><strong>{{li.cl_name}}</strong>
												<br> <span class="text-muted text-sm">{{li.re_clcode}}</span>

											</td>
											<td>{{li.cl_hp}}</td>
											<td>{{li.re_date}}</td>
											<td></td>
											<td><span class="badge text-warning bg-warning-light">{{li.re_state}}</span>
											</td>

										</tr>
									</tbody>
								</table>
							</div>

							<div class="dataTable-bottom">
								<div class="dataTable-info">Showing 1 to 10 of 100 entries</div>
								<nav class="dataTable-pagination">
									<ul class="dataTable-pagination-list">
										<li class="active"><a href="#" data-page="1">1</a></li>
										<li class=""><a href="#" data-page="2">2</a></li>
										<li class=""><a href="#" data-page="3">3</a></li>
										<li class=""><a href="#" data-page="4">4</a></li>
										<li class=""><a href="#" data-page="5">5</a></li>
										<li class=""><a href="#" data-page="6">6</a></li>
										<li class=""><a href="#" data-page="7">7</a></li>
										<li class="ellipsis"><a href="#">…</a></li>
										<li class=""><a href="#" data-page="10">10</a></li>
										<li class="pager"><a href="#" data-page="2">›</a></li>
									</ul>
								</nav>
							</div>
						</div>
					</template>


					<template v-if="display[1].show">
						<h1 class="mt-4">수주 목록</h1>

						<div v-if="modal.show"
							style="height: 100%; width: 100%; background: rgba(0, 0, 0, 0.5); position: absolute; padding: 20px; z-index: 2;">
							<div
								style="max-width: 100%; width: 83.5%; display: table; background: #fff; border-radius: 10px; padding: 20px; z-index: 1;">
								<table id="datatablesSimple" class="dataTable-table">
									<thead>
										<h5>주문코드 : {{modalDetailList[0].rd_recode}}의 상세내역</h5>
										<tr>

											<th data-sortable
												style="width: 12.3333%; background-color: #E0E0E0;"><a>상품이미지</a></th>
											<th data-sortable
												style="width: 10.3333%; background-color: #E0E0E0;"><a>상품코드</a></th>
											<th data-sortable
												style="width: 20%; background-color: #E0E0E0;"><a>상품명</a></th>
											<th data-sortable
												style="width: 10.3333%; background-color: #E0E0E0;"><a>상품수량</a></th>

											<th data-sortable
												style="width: 10.3333%; background-color: #E0E0E0;"><a>가격(세금)</a></th>
											<th data-sortable
												style="width: 10.3333%; background-color: #E0E0E0;"><a>총
													가격</a></th>
											<th data-sortable
												style="width: 13.3333%; background-color: #E0E0E0;"><a>상태코드</a></th>
										</tr>
									</thead>
									<tbody>
										<tr v-for="li2 in modalDetailList">

											<td><img :src="li2.pr_image" width="70%" height="70%"
												alt="no search image" /></td>
											<td>{{li2.rd_prcode}}</td>
											<td>{{li2.pr_name}}</td>
											<td>{{li2.rd_quantity}}</td>
											<td>{{li2.pr_price}}원
												<div>({{li2.pr_tax}}원)</div>
											</td>
											<td>{{li2.pr_ttprice}}원</td>
											<td>{{li2.rd_stcode}}</td>
										</tr>


									</tbody>
								</table>

								<div class="align-top ms-1 btn btn-outline-primary btn-sm"
									@click="modalClose()"
									style="position: relative; top: 50%; left: 43%;">Close</div>
							</div>
						</div>
						<ol class="breadcrumb mb-4">
							<li class="breadcrumb-item"><a href="/">메인페이지</a></li>
							<li class="breadcrumb-item active">수주접수완료 목록</li>
						</ol>
						<ol class="breadcrumb mb-4">
							<ul class="mb-5 nav nav-tabs" role="tablist">
								<li class="nav-item" role="presentation">
									<button type="button" role="tab"
										data-rb-event-key="allProducts" aria-selected="false"
										class="nav-link" onclick="orderWaitList()">수주대기목록</button>
								</li>
								<li class="nav-item" role="presentation">
									<button type="button" role="tab" data-rb-event-key="archived"
										aria-selected="false" class="nav-link"
										onclick="orderRefuseList()">수주거절목록</button>
								</li>
								<li class="nav-item" role="presentation">
									<button type="button" role="tab" data-rb-event-key="drafts"
										aria-selected="true" class="nav-link active"
										onclick="orderReceiveList()">수주완료목록</button>
								</li>
							</ul>
						</ol>
						<div
							class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
							<div class="dataTable-top">
								<div class="dataTable-dropdown">
									<span class="me-2" id="categoryBulkAction"> <select
										name="categoryBulkAction"
										class="d-inline w-auto form-select form-select-sm">
											<option>Bulk Actions</option>
											<option>Delete</option>
									</select>
										<button type="button"
											class="align-top ms-1 btn btn-outline-dark btn-sm">Apply</button>
									</span> <label> <select
										class="dataTable-selector form-select form-select-sm">
											<option value="5">5</option>
											<option value="10" selected="">10</option>
											<option value="15">15</option>
											<option value="20">20</option>
											<option value="25">25</option>
									</select> entries per page
									</label>
								</div>
								<div class="dataTable-search">
									<input id="INPUT" v-on:keyup.13='searchWord()' class="dataTable-input form-control form-control-sm"
										placeholder="Search..." type="text"/>
								</div>
							</div>

							<div class="dataTable-container border-0">
								<table class="mb-0 table table-hover dataTable-table">
									<thead>
										<tr class="title">
											<th data-sortable="false" style="width: 14.7704%;">ORDER
												ID</th>
											<th data-sortable="" style="width: 27.7982%;"><a
												href="#" class="dataTable-sorter">NAME</a></th>
											<th data-sortable="" style="width: 11.9491%;"><a
												href="#" class="dataTable-sorter">CONTACT</a></th>
											<th data-sortable="" style="width: 11.9491%;" class="desc"><a
												href="#" class="dataTable-sorter">DATE</a></th>
											<th data-sortable="" style="width: 16.2598%;"><a
												href="#" class="dataTable-sorter">TOTAL PRICE</a></th>
											<th data-sortable="" style="width: 12.281%;"><a href="#"
												class="dataTable-sorter">STATE</a></th>

										</tr>
									</thead>

									<tbody>
										<tr class="align-middle" v-for="li in list" @click="deliveryListDetail(li.re_code)">
											<td>
												<div class="form-check">
													<input type="checkbox" class="form-check-input"><label
														title="" class="form-check-label">{{li.re_code}}</label>
												</div>
											</td>
											<td><strong>{{li.cl_name}}</strong>
												<br> <span class="text-muted text-sm">{{li.re_clcode}}</span>

											</td>
											<td>{{li.cl_hp}}</td>
											<td>{{li.re_date}}</td>
											<td></td>
											<td><span class="badge text-warning bg-warning-light">{{li.re_state}}</span>
											</td>

										</tr>
									</tbody>
								</table>
							</div>

							<div class="dataTable-bottom">
								<div class="dataTable-info">Showing 1 to 10 of 100 entries</div>
								<nav class="dataTable-pagination">
									<ul class="dataTable-pagination-list">
										<li class="active"><a href="#" data-page="1">1</a></li>
										<li class=""><a href="#" data-page="2">2</a></li>
										<li class=""><a href="#" data-page="3">3</a></li>
										<li class=""><a href="#" data-page="4">4</a></li>
										<li class=""><a href="#" data-page="5">5</a></li>
										<li class=""><a href="#" data-page="6">6</a></li>
										<li class=""><a href="#" data-page="7">7</a></li>
										<li class="ellipsis"><a href="#">…</a></li>
										<li class=""><a href="#" data-page="10">10</a></li>
										<li class="pager"><a href="#" data-page="2">›</a></li>
									</ul>
								</nav>
							</div>
						</div>
					</template>

					<template v-if="display[2].show">
						<h1 class="mt-4">수주 목록</h1>

						<div v-if="modal.show"
							style="height: 100%; width: 100%; background: rgba(0, 0, 0, 0.5); position: absolute; padding: 20px; z-index: 2;">
							<div
								style="max-width: 100%; width: 83.5%; display: table; background: #fff; border-radius: 10px; padding: 20px; z-index: 1;">
								<table id="datatablesSimple" class="dataTable-table">
									<thead>
										<h5>주문코드 : {{modalDetailList[0].rd_recode}}의 상세내역</h5>
										<tr>

											<th data-sortable
												style="width: 12.3333%; background-color: #E0E0E0;"><a>상품이미지</a></th>
											<th data-sortable
												style="width: 10.3333%; background-color: #E0E0E0;"><a>상품코드</a></th>
											<th data-sortable
												style="width: 20%; background-color: #E0E0E0;"><a>상품명</a></th>
											<th data-sortable
												style="width: 10%; background-color: #E0E0E0;"><a>상품수량</a></th>

											<th data-sortable
												style="width: 10%; background-color: #E0E0E0;"><a>가격(세금)</a></th>
											<th data-sortable
												style="width: 10.3333%; background-color: #E0E0E0;"><a>총
													가격</a></th>
											<th data-sortable
												style="width: 12.3333%; background-color: #E0E0E0;"><a>상태코드</a></th>
											<th data-sortable
												style="width: 12.3333%; background-color: #E0E0E0;"><a>사유</a></th>
										</tr>
									</thead>
									<tbody>
										<tr v-for="li2 in modalDetailList">

											<td><img :src="li2.pr_image" width="70%" height="70%"
												alt="no search image" /></td>
											<td>{{li2.rd_prcode}}</td>
											<td>{{li2.pr_name}}</td>
											<td>{{li2.rd_quantity}}</td>
											<td>{{li2.pr_price}}원
												<div>({{li2.pr_tax}}원)</div>
											</td>
											<td>{{li2.pr_ttprice}}원</td>
											<td>{{li2.rd_stcode}}</td>
											<td>{{li2.rd_note}}</td>
										</tr>


									</tbody>
								</table>
								<div class="align-top ms-1 btn btn-outline-primary btn-sm"
									@click="modalClose()"
									style="position: relative; top: 50%; left: 45%;">Close</div>
							</div>
						</div>
						<ol class="breadcrumb mb-4">
							<li class="breadcrumb-item"><a href="/">메인페이지</a></li>
							<li class="breadcrumb-item active">수주거절 목록</li>
						</ol>
						<ol class="breadcrumb mb-4">

					  	<ul class="mb-5 nav nav-tabs" role="tablist">
							<li class="nav-item" role="presentation">
								<button type="button" role="tab" data-rb-event-key="allProducts"
									aria-selected="false" class="nav-link"
									onclick="orderWaitList()">수주대기목록</button>
							</li>
							<li class="nav-item" role="presentation">
								<button type="button" role="tab" data-rb-event-key="archived"
									aria-selected="true" class="nav-link active"
									onclick="orderRefuseList()">수주거절목록</button>
							</li>
							<li class="nav-item" role="presentation">
								<button type="button" role="tab" data-rb-event-key="drafts"
									aria-selected="false" class="nav-link"
									onclick="orderReceiveList()">수주완료목록</button>
							</li>
						</ul>
						</ol>
						<div
							class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
							<div class="dataTable-top">
								<div class="dataTable-dropdown">
									<span class="me-2" id="categoryBulkAction"> <select
										name="categoryBulkAction"
										class="d-inline w-auto form-select form-select-sm">
											<option>Bulk Actions</option>
											<option>Delete</option>
									</select>
										<button type="button"
											class="align-top ms-1 btn btn-outline-dark btn-sm">Apply</button>
									</span> <label> <select
										class="dataTable-selector form-select form-select-sm">
											<option value="5">5</option>
											<option value="10" selected="">10</option>
											<option value="15">15</option>
											<option value="20">20</option>
											<option value="25">25</option>
									</select> entries per page
									</label>
								</div>
								<div class="dataTable-search">
									<input class="dataTable-input form-control form-control-sm"
										placeholder="Search..." type="text">
								</div>
							</div>

							<div class="dataTable-container border-0">
								<table class="mb-0 table table-hover dataTable-table">
									<thead>
										<tr class="title">
											<th data-sortable="false" style="width: 14.7704%;">ORDER
												ID</th>
											<th data-sortable="" style="width: 27.7982%;"><a
												href="#" class="dataTable-sorter">NAME</a></th>
											<th data-sortable="" style="width: 11.9491%;"><a
												href="#" class="dataTable-sorter">CONTACT</a></th>
											<th data-sortable="" style="width: 11.9491%;" class="desc"><a
												href="#" class="dataTable-sorter">DATE</a></th>
											<th data-sortable="" style="width: 16.2598%;"><a
												href="#" class="dataTable-sorter">TOTAL PRICE</a></th>
											<th data-sortable="" style="width: 12.281%;"><a href="#"
												class="dataTable-sorter">STATE</a></th>

										</tr>
									</thead>

									<tbody>
										<tr class="align-middle" v-for="li in list" @click="refuseListDetail(li.re_code)">
											<td>
												<div class="form-check">
													<input type="checkbox" class="form-check-input"><label
														title="" class="form-check-label">{{li.re_code}}</label>
												</div>
											</td>
											<td><strong>{{li.cl_name}}</strong>
												<br> <span class="text-muted text-sm">{{li.re_clcode}}</span>

											</td>
											<td>{{li.cl_hp}}</td>
											<td>{{li.re_date}}</td>
											<td></td>
											<td><span class="badge text-warning bg-warning-light">{{li.re_state}}</span>
											</td>

										</tr>
									</tbody>
								</table>
							</div>

							<div class="dataTable-bottom">
								<div class="dataTable-info">Showing 1 to 10 of 100 entries</div>
								<nav class="dataTable-pagination">
									<ul class="dataTable-pagination-list">
										<li class="active"><a href="#" data-page="1">1</a></li>
										<li class=""><a href="#" data-page="2">2</a></li>
										<li class=""><a href="#" data-page="3">3</a></li>
										<li class=""><a href="#" data-page="4">4</a></li>
										<li class=""><a href="#" data-page="5">5</a></li>
										<li class=""><a href="#" data-page="6">6</a></li>
										<li class=""><a href="#" data-page="7">7</a></li>
										<li class="ellipsis"><a href="#">…</a></li>
										<li class=""><a href="#" data-page="10">10</a></li>
										<li class="pager"><a href="#" data-page="2">›</a></li>
									</ul>
								</nav>
							</div>
						</div>
					</template>
<!-- ------------------------------------배송출발목록---------------------------------------------------------------- -->

					<template v-if="display[3].show">
						<h1 class="mt-4">배송 목록</h1> <!-- 기사님이 물건을 가져갈때 버튼 누르면, 2로 업데이트 -->
						<div v-if="modal.show"
							style="height: 100%; width: 100%; background: rgba(0, 0, 0, 0.5); position: absolute; padding: 20px; z-index: 2;">
							<div
								style="max-width: 100%; margin-left:30%; display: table; background: #fff; border-radius: 10px; padding: 20px; z-index: 1;">
								<table id="datatablesSimple" class="dataTable-table">
									<thead>
											<h5>주문코드 : {{modalDetailList[0].dl_oscode}}배송상태</h5>
										<tr>
											<th>순번</th>
											<th>날짜</th>
											<th>x위치</th>
											<th>x위치</th>
										</tr>
									</thead>

									<tbody>
										<tr v-for="li in modalDetailList">
											<td></td>
											<td >{{li.lc_date}}</td>
											<td >{{li.lc_x}}</td>
											<td >{{li.lc_y}}</td>
											
										</tr>
									</tbody>
								</table>

								<div class="align-top ms-1 btn btn-outline-primary btn-sm"
									@click="modalClose()"
									style="position: relative; top: 50%; left: 80%;">Close</div>
							</div>
						</div>
						<ol class="breadcrumb mb-4">
							<li class="breadcrumb-item"><a href="/">메인페이지</a></li>
							<li class="breadcrumb-item active">배송중 목록</li>
						</ol>
						<div
							class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
							<div class="dataTable-top">
								<div class="dataTable-dropdown">
									<span class="me-2" id="categoryBulkAction"> <select
										name="categoryBulkAction"
										class="d-inline w-auto form-select form-select-sm">
											<option>Bulk Actions</option>
											<option>Delete</option>
									</select>
										<button type="button"
											class="align-top ms-1 btn btn-outline-dark btn-sm">Apply</button>
									</span> <label> <select
										class="dataTable-selector form-select form-select-sm">
											<option value="5">5</option>
											<option value="10" selected="">10</option>
											<option value="15">15</option>
											<option value="20">20</option>
											<option value="25">25</option>
									</select> entries per page
									</label>
								</div>
								<div class="dataTable-search">
									<input class="dataTable-input form-control form-control-sm"
										placeholder="Search..." type="text">
								</div>
							</div>

							<div class="dataTable-container border-0">
								<table class="mb-0 table table-hover dataTable-table">
									<thead>
										<tr class="title">
											<th data-sortable="false" style="width: 14.7704%;">ORDER
												ID</th>
											<th data-sortable="" style="width: 11.9491%;" class="desc"><a
												href="#" class="dataTable-sorter">DELIVERY CODE</a></th>	
											<th data-sortable="" style="width: 27.7982%;"><a
												href="#" class="dataTable-sorter">DRIVER NAME</a></th>
											<th data-sortable="" style="width: 11.9491%;"><a
												href="#" class="dataTable-sorter">CONTACT</a></th>											

											<th data-sortable="" style="width: 12.281%;"><a href="#"
												class="dataTable-sorter">DELIVERY STATE</a></th>

										</tr>
									</thead>

									<tbody>
										<tr class="align-middle" v-for="li in list"
											@click="deliveryState(li.dl_oscode)">
											<td>
												<div class="form-check">
													<input type="checkbox" class="form-check-input"><label
														title="" class="form-check-label">{{li.dl_oscode}}</label>
												</div>
											</td>
											<td>{{li.dl_code}}</td>
											<td><strong>{{li.dv_name}}</strong> <br> <span
												class="text-muted text-sm">{{li.dl_dvcode}}</span></td>
											<td>{{li.dv_hp}}</td>
											
											<td><span class="badge text-warning bg-warning-light">{{li.ds_name}}</span>
											</td>

										</tr>
									</tbody>
								</table>
							</div>

							<div class="dataTable-bottom">
								<div class="dataTable-info">Showing 1 to 10 of 100 entries</div>
								<nav class="dataTable-pagination">
									<ul class="dataTable-pagination-list">
										<li class="active"><a href="#" data-page="1">1</a></li>
										<li class=""><a href="#" data-page="2">2</a></li>
										<li class=""><a href="#" data-page="3">3</a></li>
										<li class=""><a href="#" data-page="4">4</a></li>
										<li class=""><a href="#" data-page="5">5</a></li>
										<li class=""><a href="#" data-page="6">6</a></li>
										<li class=""><a href="#" data-page="7">7</a></li>
										<li class="ellipsis"><a href="#">…</a></li>
										<li class=""><a href="#" data-page="10">10</a></li>
										<li class="pager"><a href="#" data-page="2">›</a></li>
									</ul>
								</nav>
							</div>
						</div>
					</template>

				</div>

			</main>



		</div>
	</div>
	<!-- <component v-bind:is="currentView" v-bind:aaqqd="mssg"></component> -->
	<script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/datatables-simple-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/resources/vue/vue.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/js.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/supplyIYJ.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/resources/js/chart-area-demo.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/chart-bar-demo.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/chart-pie-demo.js"></script>




</body>
</html>
