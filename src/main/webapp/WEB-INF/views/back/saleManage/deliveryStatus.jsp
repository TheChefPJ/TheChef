<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<div class="container">
		<div class="content">
			<div class="root">
				<div class="">
					<h2>배송현황 관리</h2>
				<hr>
				</div>
				<div class="blue_box_wrap">
					<div class="blue_box">
						<div class="case_lst2 v2">
							<ul>
								<li>
									<em class="stit">배송준비중 </em>
									<a href="#" class="num">0</a>건
								</li>
								<li>
									<span class="bar">|</span>								
									<em class="stit">배송중 </em>
									<a href="#" class="num">0</a>건
								</li>
								<li>
									<span class="bar">|</span>
									<em class="stit">배송완료 </em>
									<a href="#" class="num">0</a>건
								</li>
								<li>
									<span class="bar">|</span>
									<em class="stit">배송중 문제건 </em>
									<a href="#" class="num">0</a>건
								</li>
							</ul>
						</div>
						<div class="srch_tmp" style="display:">
							<form id="searchForm" name="searchForm">
								<div class="srch_ct">
									<div>
										<select id="orderStatus" name="orderStatus" class="_orderStatuses" title="주문상태" style="width:115px">
									            <option value="ALL">주문상태 전체</option>
									            <option value="WAITING_DISPATCH">발송대기</option>
									            <option value="DELIVERING">배송중</option>
									            <option value="DELIVERED">배송완료</option>
									            
									    </select>
									</div>
									<div class="line">
									    <select id="detailSearch.type" name="detailSearch.type" style="width:115px;margin-right:6px" title="상세조회 전체" class="_detailSearchType _change(nmp.seller_admin.order.n.sale.delivery.situation.changeKeywordType())">
									    		<option value="">상세조회 전체</option>
									            <option value="COLLECTOR_NAME">수취인명</option>
									            <option value="PURCHASER_TEL_NO">구매자연락처</option>
									            <option value="ORDER_NO">주문번호</option>
									            <option value="PRODUCT_ORDER_NO">상품주문번호</option>
									            <option value="PURCHASER_NAME">구매자명</option>
									            <option value="PRODUCT_NO">상품번호</option>
									            <option value="INVOICE_NO">송장번호</option>
									            <option value="PURCHASER_ID">구매자ID</option>
									    </select>
									    <input type="text" id="detailSearch.keyword" name="detailSearch.keyword" value="" title="상세 문구" class="_keyword ipt" style="width:635px;">
									</div>
									<div >
										<select id="dateRange.type" name="dateRange.type" class="_dateRangeTypes" style="width:115px;margin-right:6px;" title="상세주문상태 전체">
									            <option value="PAY_COMPLETED" selected="selected">결제일</option>
									            <option value="DELIVERY_OPERATED">발송 처리일</option>
									            <option value="DELIVERY_COMPLETED">배송 완료일</option>
									    </select>
									    <button type="button" value="" >오늘</button>
										<button type="button" value="" >1주일</button>
										<button type="button" value="" >1개월</button>
										<button type="button" value="" >3개월</button>
										<button type="button" value="" >6개월</button>
										<button type="button" value="" >1년</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
