<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
	
<form class="form-horizontal" method="post" action="payment">
		<div class="col-lg-6 col-md-6">
			<!--REVIEW ORDER-->
			<div class="panel panel-info">
				<div class="panel-heading">
					Review Order
					<div class="pull-right">
						<small><a class="afix-1" href="#">Edit Cart</a></small>
					</div>
				</div>
				<div class="panel-body">
					<div class="form-group">
						<div class="col-sm-3 col-xs-3">
							<c:if test="${code==1}">
								<img alt="레시피/테마" src="upload/RTP/${thumbFile}" width="200"
									height="150">
							</c:if>
							<c:if test="${code==2}">
								<img alt="상품 골라담기" src="upload/farmProduct/${thumbFile}"
									width="200" height="150" />
							</c:if>
						</div>
						<div class="col-sm-6 col-xs-6">
							<div class="col-xs-12">&nbsp;&nbsp;Product name</div>
							<div class="col-xs-12">
								<small>&nbsp;&nbsp;Quantity:<span>${count}</span></small>
							</div>
						</div>
						<div class="col-sm-3 col-xs-3 text-right">
							<h6>
								<span>$</span>${c_price * count}</h6>
						</div>
					</div>
					<div class="form-group">
						<hr />
					</div>
					<div class="form-group">
						<div class="col-xs-12">
							<strong>Subtotal</strong>
							<div class="pull-right">
								<span>$</span><span>${c_price * count}</span>
							</div>
						</div>
						<div class="col-xs-12">
							<small>Shipping</small>
							<div class="pull-right">
								<span>$ ${shipping_fee}</span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<hr />
					</div>
					<div class="form-group">
						<div class="col-xs-12">
							<strong>Order Total</strong>
							<div class="pull-right">
								<span>$</span><span>${c_total_price}</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<div class="col-lg-6 col-md-6">
		<!--SHIPPING METHOD-->
		<div class="panel panel-info">
			<div class="panel-heading">Address</div>
			<div class="panel-body">
				<div class="form-group">
					<div class="col-md-12">
						<h4>Shipping Address</h4>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-6 col-xs-12">
						<strong>First Name:</strong> <input type="text" name="first_name"
							class="form-control"/>
					</div>
					<div class="span1"></div>
					<div class="col-md-6 col-xs-12">
						<strong>Last Name:</strong> <input type="text" name="last_name"
							class="form-control" value="" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-12">
						<strong>Zip / Postal Code:</strong>
					</div>
					<div class="col-md-12">
						<input type="text" name="zip_code" class="form-control" value="" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-12">
						<strong>Address1:</strong>
					</div>
					<div class="col-md-12">
						<input type="text" name="address1" class="form-control" value="" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-12">
						<strong>Address2:</strong>
					</div>
					<div class="col-md-12">
						<input type="text" name="address2" class="form-control" value="" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-12">
						<strong>Phone Number:</strong>
					</div>
					<div class="col-md-12">
						<input type="text" name="phone" class="form-control"
							value="" />
					</div>
				</div>
				<div class="form-group">
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <button type="submit" class="btn btn-primary btn-submit-fix">Place Order</button>
                    </div>
                </div>
			</div>
		</div>
	</div>
</form>
<!--SHIPPING METHOD END-->