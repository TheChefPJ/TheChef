<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>kosta 109</title>
</head>
<body>
	<div class="container">
		<div class="content">
			<div class="root">
				<div>
					<h2>발주 / 발송관리</h2>
				</div>
				<div class="hd_wrap">
					<h4 class="hd3 fl">발주 내역</h4>
					<span class="dsc_txt"><span class="f12">※</span> 등록된 발주 내역입니다.</span>
				</div>
				<div class="uio_grid" style="width:100%;height:440px">
					
					<table width="100%" class="nb">
         
			           <thead>
			           <tr class="thead-inverse"> 
			            <th width="7%">번호</th>
			            <th width="30%">제목</th>
			            <th width="20%">작성자</th>
			            <th width="23%">작성일</th>
			            <th width="10%">관리</th>
			         </tr>
			         </thead>
			            
			      </table>
			      
			      <!-- 페이징 table -->
		         <table width="100%">
		            <tbody><tr>
		               <td align="center">
		                  <!-- 처음 이전 링크 --> 
		                   
		                  
		                         
		                      
		                      
		                   
		                  <!-- 블록 범위 찍기 -->
		                  
		                     
		                     
		                        <a href="NB_noticeManage?pg=0">0</a>
		                     
		                    
		                  <!-- 다음, 이후 --> 
		                   
		                  
		                  
		                       
		                       
		                       <img src="resources/img/arrowright.gif">
		                       <img src="resources/img/arrowsright.gif">
		                    
		                  
		               </td>
		            </tr>
		         </tbody></table>
				</div>
				
				<div class="hd_wrap">
					<h4 class="hd3 fl">발송 내역</h4>
					<span class="dsc_txt"><span class="f12">※</span> 등록된 발송 내역입니다.</span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>