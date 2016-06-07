<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<div class="container">
		<div class="content">
			<div id="root" class="root">
				<div class="hd2_wrap">
					<h2><span >발주 / 발송관리</span></h2>
				</div>
				<div class="blue_box_wrap">
					<div class="blue_box">
						<div class="case_lst2 v2 _divSummaryCnt">
							<ul>
								<li>
									<em class="stit">신규주문</em>
									<a href="#" class="">0</a>건
									<span style="display:inline-block">
									(지연<a href="#" class="">0</a> 건)
									</span>
								</li>
								<li>
									<span class="bar">| |</span>
									<em class="stit">배송준비 </em>
									<a href="#" class="">0</a>건
									<span style="display:inline-block">
									(지연<a href="#" class="">0</a> 건)
									</span>
								</li>
								<li>
									<span class="bar">| |</span>
									<em class="stit">발송전 취소요청 </em>
									<a href="#" class="">0</a>건
								</li>
								<li>
									<span class="bar">| |</span>
									<em class="stit">발송전 배송지 변경 </em>
									<a href="#" class="">0</a>건
								</li>
							</ul>	
						</div>
						<div class="srch_tmp _detailSearchArea" style="display:"> 
							<form id="searchForm" name="searchForm">
								<div class="srch_ct">
									<div>
										<select id="orderStatus" name="orderStatus" class="" title="주문상태" style="width:115px">
									            <option value="ALL">주문상태 전체</option>
									            <option value="WAITING_DISPATCH">발송대기</option>
									            <option value="DELIVERING">배송중</option>
									            <option value="DELIVERED">배송완료</option>
									    </select>
									    <span class="bar">|</span>
									    <select id="deliveryMethodType" name="deliveryMethodType" class="_detailDeliveryMethods" title="배송방법 전체" style="width:138px">
									    		<option value="">배송방법 전체</option>
									            <option value="DELIVERY">택배,등기,소포</option>
									            <option value="GDFW_ISSUE_SVC">굿스플로 송장출력</option>
									            <option value="DIRECT_DELIVERY">직접전달</option>
									            <option value="VISIT_RECEIPT">방문수령</option>
									            <option value="QUICK_SVC">퀵서비스</option>
									            <option value="NOTHING">배송없음</option>
									    </select>
									    <span class="bar">|</span>									    
									    <select id="deviceClassType" name="deviceClassType" class="_deviceClassTypes" title="결제위치 전체" style="width:138px">
									    		<option value="">결제위치 전체</option>
									            <option value="PC">PC</option>
									            <option value="MOBILE">MOBILE</option>
									    </select>
									    <span class="bar">|</span>									    
									    <select id="delayDispatchGuideTreatStateType" name="delayDispatchGuideTreatStateType" class="_delayDispatchGuideTreatStateTypes" title="발송지연 안내 여부" style="width:138px">
									    		<option value="">발송지연 안내 여부</option>
									            <option value="COMPLETE">처리</option>
									            <option value="NOTREAT">미처리</option>
									    </select>
									</div>
									<div class="line">
										<select id="detailSearch.type" name="detailSearch.type" style="width:115px;margin-right:6px" title="상세조회 전체" class="_detailSearchType _change(nmp.seller_admin.order.n.sale.delivery.changeKeywordType())">
									    		<option value="">상세조회 전체</option>
									            <option value="COLLECTOR_NAME">수취인명</option>
									            <option value="PURCHASER_AND_COLLECTOR_TEL_NO">구매자연락처</option>
									            <option value="ORDER_NO">주문번호</option>
									            <option value="PRODUCT_ORDER_NO">상품주문번호</option>
									            <option value="PURCHASER_NAME">구매자명</option>
									            <option value="PRODUCT_NO">상품번호</option>
									            <option value="INVOICE_NO">송장번호</option>
									            <option value="PURCHASER_ID">구매자ID</option>
									    </select>
									    <input type="text" id="detailSearch.keyword" name="detailSearch.keyword" value="" title="상세 문구" class="_keyword ipt" style="width:297px;">
									</div>
									<div class="line _dateRange">
										<select id="dateRange.type" name="dateRange.type" class="_dateRangeTypes" style="width:115px;margin-right:6px;" title="조회기간">
									            <option value="PAY_COMPLETED" selected="selected">결제일</option>
									            <option value="ORDERING_CONFIRM">발주 확인일</option>
									            <option value="DELIVERY_OPERATED">발송 처리일</option>
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
						<div class="hd_wrap">
									<h4 class="hd3 fl">검색 결과 내역</h4>
									
						</div>
						<div class="srch_tmpl"style="padding-bottom:5px">
							<div class="case_lst2 case_lst2_v2">
								<p class="fl">
								<strong class="tit" style="margin-right:10px">신규주문</strong>
								총<a href="#" class="num">0</a>건
								</p>
							</div>
						</div>
						<div class="case_lst2 v3">
							<div class="fr">
								<form id="searchAddtionForm" name="searchAddtionForm">
								<input type="hidden" id="sort.direction" name="sort.direction" value="DESC" class="_direction">
									<select id="sort.type" name="sort.type" title="정렬조건" style="width:115px" class="_sortTypes _change(nmp.seller_admin.order.n.sale.delivery.changeCondition(SORT)) _stopDefault">
								            <option value="RECENTLY_ORDER_YMDT" selected="selected">최근주문건부터</option>
								            <option value="SAME_RECEIVER_INFO">동일 수취 정보별 보기</option>
								    </select>
								    <select id="rowPerPageType" name="rowPerPageType" style="width:115px;" class="_rowsPerPageType _change(nmp.seller_admin.order.n.sale.delivery.changeCondition(ROWSPER)) _stopDefault">
								            <option value="ROW_CNT_50">50개씩 보기</option>
								            <option value="ROW_CNT_100" selected="selected">100개씩 보기</option>
								            <option value="ROW_CNT_200">200개씩 보기</option>
								            <option value="ROW_CNT_300">300개씩 보기</option>
								            <option value="ROW_CNT_400">400개씩 보기</option>
								            <option value="ROW_CNT_500">500개씩 보기</option>
								    </select>
								</form>
							</div>
						</div>
						<div class=""  style="width:100%;height:440px">
						<!-- 게시판  -->
					</div>
				</div>
			</div>
		</div>
	</div>
