<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<div class="container">
		<div class="content">
			<div class="root">
				<div class="">
					<h2>반품관리</h2>
					<hr>
				</div>
				<div class="blue_box_wrap">
					<div class="blue_box">
						<div class="case_lst2 v2">
							<ul>
								<li>
									<em class="stit">반품요청 </em>
									<a href="#" class="num">0</a>건
								</li>
								<li>
									<span class="bar">|</span>								
									<em class="stit">반품 수거중</em>
									<a href="#" class="num">0</a>건
								</li>
								<li>
									<span class="bar">|</span>
									<em class="stit">반품 수거완료</em>
									<a href="#" class="num">0</a>건
								</li>
								<li>
									<span class="bar">|</span>
									<em class="stit">환불보류</em>
									<a href="#" class="num">0</a>건
								</li>
								<li>
									<span class="bar">|</span>
									<em class="stit">반품지연</em>
									<a href="#" class="num">0</a>건
								</li>
							</ul>
						</div>
						<div class="srch_tmp" style="display:">
							<form id="searchForm" name="searchForm">
								<div class="srch_ct">
								
									<div>
										<select id="range.type" name="range.type" title="반품요청일" style="width:115px;margin-right:7px">
									            <option value="RETURN_REQUEST" selected="selected">반품 요청일</option>
									            <option value="PAY_COMPLETED">결제일</option>
									    </select>
									    <button type="button" value="" >오늘</button>
										<button type="button" value="" >1주일</button>
										<button type="button" value="" >1개월</button>
										<button type="button" value="" >3개월</button>
										<button type="button" value="" >6개월</button>
										<button type="button" value="" >1년</button>
									 </div>
									 <div>
									 	<select id="productOrder.lastClaim.claimStatus" name="productOrder.lastClaim.claimStatus" title="처리상태 전체" style="width:115px">
									    		<option value="">처리상태 전체</option>
									            <option value="RETURN_REQUEST">반품요청</option>
									            <option value="COLLECTING">수거중</option>
									            <option value="COLLECT_DONE">수거완료</option>
									            <option value="RETURN_DONE">반품완료</option>
									            <option value="RETURN_REJECT">반품철회</option>
									    </select>
									    <span class="bar">|</span>
									    <select id="detailSearch.type" name="detailSearch.type" style="width:115px" class="_change(nmp.seller_admin.order.claim.cancel.changeDetailSearchSelect()) _stopDefault">
									    		<option value="">상세검색 전체</option>
									            <option value="PRODUCT_ORDER_NO">상품주문번호</option>
									            <option value="ORDER_NO">주문번호</option>
									            <option value="PURCHASER_ID">구매자ID</option>
									            <option value="PURCHASER_NAME">구매자명</option>
									            <option value="COLLECTOR_NAME">수취인명</option>
									            <option value="PRODUCT_NO">상품번호</option>
									    </select>
									    <input type="text" id="detailSearch.keyword" name="detailSearch.keyword" 
									    value="" title="상세검색" class="ipt" style="width:493px">
									    
									 </div>
								<div>
										<button class="srch_btn" style="margin-top:12px"><a href="#" class=""><span>검색</span></a></button>
								
								</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>