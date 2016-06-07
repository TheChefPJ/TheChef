<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/css/bootstrapValidator.min.css" />
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/js/bootstrapValidator.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<form role="form" id="contact-form" class="contact-form" action="listAfterWrite" method="post">
				<input type="hidden" name="p_no" value="${p_no}" />
				<input type="hidden" name="id" value="${id}" />
				<input type="hidden" name="code" value="${code}" />
				
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<input type="text" class="form-control" name="r_title" autocomplete="off" id="Title" placeholder="Title">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<select class="selectpicker show-menu-arrow" name="r_score" id="score" style="width: 180px; height: 35px; color:#FF4040;">
								  <option selected="selected" value="5">★★★★★</option>
								  <option value="4">★★★★</option>
								  <option value="3">★★★</option>
								  <option value="2">★★</option>
								  <option value="1">★</option>
							</select>
						</div>
					</div>
					
					
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<textarea class="form-control textarea" rows="3" name="r_review"
								id="Review" placeholder="review"></textarea>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<button type="submit" class="btn main-btn pull-right">Submit</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>