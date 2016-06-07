<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<div class="container">
		<div class="content">
			<div class="root">
				<div class="">
					<h2> 판매자 정산내역</h2>
					<hr>
				</div>
				<form action="" id="" name="searchForm" class="searchForm" method="post">
					<div class="srch_tmp"style="margin-top:10px">
						<div class="srch_ct">
							<div>
								<label for="date"><strong class="tit">기간</strong></label>
								<select name="periodType" style="width:92px">
							            		<option value="settleScheduleDate">정산예정일</option>
							            		<option value="settleBaisDate">정산기준일</option>
							            		<option value="settleCompleteDate">정산완료일</option>
							            		<option value="payDate">결제일</option>
								</select>
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								
								<label for="order_number_view"><strong class="tit2">검색</strong></label>
																
								<select name="orderNoType" style="width:100px">
							            				<option value="orderNo">주문번호</option>
							            				<option value="prodOrderNo">상품주문번호</option>
								</select>
								<input type="text" class="ipt" style="width:155px" name="orderNoText" value="">
							</div>
						</div>
						<p class="srch_btn" style="margin-top:-2px">		
						<a href="#" class="btn_e"><span>검색</span></a>
						</p>
					
					</div>
					
				</form>
			</div>
		</div>
	</div>
