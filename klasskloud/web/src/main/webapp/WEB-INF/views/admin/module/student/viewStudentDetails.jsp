<%@include file="../../taglib_includes.jsp"%>
<script type="text/javascript">
$(function() {

	$('.nav>li a').click(function(e) {
		  var tab =  $(this).closest("li").text().toLowerCase(); 
		  $(this).closest("li").siblings().removeClass('active');
		  $(this).closest("li").toggleClass( "active" );
		  $('.table-responsive').hide();
		  $('.'+tab+'-details').show();
		});
});
</script>
<div class="content-wrapper" style="min-height: 100%;">
	<section class="content-header">
		<h1>
			<i class="fa fa-eye" aria-hidden="true"></i> View Student | <small>${STUDENT.fullName}</small>
		</h1>
		<ul class="breadcrumb">
			<li><a href="${contextroot}/dashboard/secure/home"><i
					class="fa fa-home"></i>Home</a></li>
			<li><a href="${contextroot}/student/default/home">Student Configuration</a></li>
			<li class="active" style="text-transform: capitalize;">${maintab}</li>
			<li class="active">${STUDENT.fullName}</li>
		</ul>
	</section>

	<section class="content">
		<div class="row">
			<div class="col-md-3">
				<div class="panel panel-default">
					<div class="panel-body personal-body">
						<img class="center-block img-circle img-thumbnail img-responsive"
							src="${imagepath}/default.png" alt="No Image" style="width: 100px; height: 100px">
						<h4 class="profile-username text-center">${STUDENT.fullName}</h4>
						<h5 class="text-center">
							<span class="label label-success">ACTIVE</span>
						</h5>
						<hr>

						<strong> Student Id </strong>
						<p class="text-muted">${STUDENT.id}</p>

						<strong> Email Address </strong>
						<p class="text-muted">${STUDENT.emailAddress}</p>

						<strong>Mobile No </strong>
						<p class="text-muted">${STUDENT.contactNumber}</p>


					</div>
					
					<!--./pannel-body-->
				</div>
				<!--./pannel-default-->
			</div>
			<div class="col-md-9">
				<div class="panel panel-default">
					<div class="panel-body">
						<div id="user-profile" data-pjax-container=""
							data-pjax-push-state="" data-pjax-replace-state=""
							data-pjax-timeout="10000">
							<ul id="w1" class="nav-tabs margin-bottom nav">
								<li id="personalTab" class="active"><a
									href="#">Personal</a></li>
								<li id="addressTab"><a
									href="#">Address</a></li>
								<li id="guardiansTab"><a
									href="#">Guardians</a></li>`
								<li id="academicsTab"><a
									href="#">Academic</a></li>
								
								<li id="feesTab"><a href="#">Fees</a></li>
							</ul>

							

							<div class="table-responsive personal-details">
								<p class="text-right">
									<a class="btn btn-primary btn-sm" href="#"
										oncontextmenu="return false;" data-target="#globalModal"
										data-toggle="modal" data-modal-size="modal-lg"><i
										class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit</a>
								</p>
								<table class="table">
									<colgroup>
										<col style="width: 15%">
										<col style="width: 35%">
										<col style="width: 15%">
										<col style="width: 35%">
									</colgroup>
									<tbody>
										<tr>
											<th>Name</th>
											<td>${STUDENT.fullName}</td>
										</tr>
										<tr>
											<th>Gender</th>
											<td>${STUDENT.gender}</td>
											<th>Date of Birth</th>
											<td>${STUDENT.dateOfBirth}</td>
										</tr>
									</tbody>
								</table>
							</div>
							
							<div class="table-responsive address-details" style="display: none;">
								<p class="text-right">
									<a class="btn btn-primary btn-sm" href="#"
										oncontextmenu="return false;" data-target="#globalModal"
										data-toggle="modal" data-modal-size="modal-lg"><i
										class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit</a>
								</p>
								Address Details
								
							</div>
							<div class="table-responsive guardians-details" style="display: none;">
								<p class="text-right">
									<a id="update-guard-data" class="btn btn-success"
										href="#"
										data-target="#globalModal" data-toggle="modal"
										data-modal-size="modal-lg"><i class="fa fa-user-plus"
										aria-hidden="true"></i> Add Guardian</a>
								</p>
								Guardian Details
							</div>
							<div class="table-responsive academic-details" style="display: none;">
								<div class="panel panel-default">
									<div class="panel-body">
										<div class="text-bold"
											style="margin-bottom: 5px; font-size: 18px">
											Course : <a href="#" data-target="#globalModal"
												data-toggle="modal">${STUDENT.course.name}</a> | Batch : <a
												href="#" data-target="#globalModal" data-toggle="modal">${STUDENT.batch.name}</a>
											<div class="pull-right">
												<a class="btn btn-primary btn-sm" href="#" title="Update"
													data-target="#globalModal" data-toggle="modal"><i
													class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit</a>
											</div>
										</div>

										<span class="text-muted"> <strong>Academic
												Year Year</strong> : ${STUDENT.acadYear.name } | <strong>Roll
												No.</strong> : <span class="not-set">${STUDENT.rollNo }</span> | <strong>Created
												Time</strong> :
										</span>
									</div>
								</div>
							</div>
							<div class="table-responsive fees-details" style="display: none;">
								Fees Details
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

</div>
