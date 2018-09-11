<%@include file="../../taglib_includes.jsp"%>
<script type="text/javascript">
	var flag = true;
	$(function() {
		$('.date').datepicker();

		$("#studentId").change(function() {
			$("#testId").empty();
			var options1 = $("#testId");
			options1.append(new Option("--- Select Test ---", ""));
			populateTests();
		});

		$("#testId").change(function() {
			 $('#score-form').find('#outOf').val(0);
			 if(this.value != ''){
				 $.getJSON("${contextroot}/rest/tests/"+this.value, function(result) {
					 $('#score-form').find('#outOf').val(result.object.maxScore);
				 });
			 }
		});

		
		$('.btn-create').on('click',function(e) {
			if (validate()) {
				var postData = $('#score-form').serializeArray();
				var formURL = $('#score-form').attr("action");
				$.ajax({
					url : formURL,
					type : "POST",
					data : postData,
					success : function(data,textStatus, jqXHR) {
						if (data.status == false) {
							alert("Failed");
						} else {
							alert("Success");
							$(location).attr('href','${contextroot}/score/default/manage');
						}
					},
					error : function(jqXHR, textStatus,errorThrown) {
					}
				});
			}
			
		});

		$('.btn-reset').on('click',function(e) {
			$('.error-block').text('');
			$('.form-control').css('border', '');
		});

		

	});


	function populateTests(){
		var sId = $('#score-form').find('#studentId').val();
	    $.getJSON("${contextroot}/rest/tests/list/"+sId, function(result) {
			var options = $("#testId");
			$("#testId").empty()
			options.append(new Option("--- Select Test ---", ""));
			$.each(result.list, function(i, v) {
				options.append(new Option(v.name, v.id));
			});
		});
	}


	function validate() {
		var flag = true;
		var studentId = $('#score-form').find('#studentId').val();
		var testId = $('#score-form').find('#testId').val();
		var score = $('#score-form').find('input[name="score"]').val();

		if (studentId.length == 0) {
			flag = false;
			$('#score-form').find('#studentId').css('border', '1px solid #CD5C5C');
			$('#score-form').find('#studentId').siblings('.error-block').text('Please select a Student.');
		} else {
			$('#score-form').find('#studentId').css('border', '');
			$('#score-form').find('#studentId').siblings('.error-block').text('');
		}

		if (testId.length == 0) {
			flag = false;
			$('#score-form').find('#testId').css('border', '1px solid #CD5C5C');
			$('#score-form').find('#testId').siblings('.error-block').text('Please select a Test.');
		} else {
			$('#score-form').find('#testId').css('border', '');
			$('#score-form').find('#testId').siblings('.error-block').text('');
		}

		if (score.length == 0) {
			flag = false;
			$('#score-form').find('input[name="score"]').css('border', '1px solid #CD5C5C')
			$('#score-form').find('input[name="score"]').siblings('.error-block').text('Please enter a Score.');
		} else {
			$('#score-form').find('input[name="score"]').css('border', '');
			$('#score-form').find('input[name="score"]').siblings('.error-block').text('');
		}
		
		return flag;
	}


</script>
<div class="content-wrapper" style="min-height: 100%;">
	<section class="content-header">
		<h1>
			<i class="fa fa-th-list"></i>Manage<small>Scores</small>
		</h1>
		<ul class="breadcrumb">
			<li><a href="${contextroot}/dashboard/secure/home"><i
					class="fa fa-home"></i>Home</a></li>
			<li><a href="${contextroot}/test/default/home">Test Configuration</a></li>
			<li class="active" style="text-transform: capitalize;">${maintab}</li>
		</ul>
	</section>

	<section class="content">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">
						<i class="fa fa-plus-square"></i> <span class="header-text">
							Add Scores </span>
					</h3>
				</div>

				<form id="score-form"
					action="${contextroot}/rest/score" method="post">
					<input type="hidden" id="id" name="id" value="" />
					<input type="hidden" id="orgId" name="orgId" value="${context.selectedOrgId}" />
						<div class="box-body">
							<div class="row">
								<div class="col-sm-4">
									<div class="form-group required">
										<label class="control-label">Student</label> <select
											id="studentId" class="form-control" name="studentId"
											aria-required="true">
											<option value="">--- Select Select ---</option>
											<c:forEach items="${STUDENTLIST}" var="student">
												<option value="${student.id}">${student.firstName} ${student.lastName} </option>
											</c:forEach>
										</select>
	
										<div class="help-block"></div>
										<div class="error-block"></div>
									</div>
								</div>
								
								<div class="col-sm-4">
									<div class="form-group required">
										<label class="control-label">Test</label> <select
											id="testId" class="form-control" name="testId"
											aria-required="true">
											<option value="">--- Select Test ---</option>
											<c:forEach items="${TESTLIST}" var="test">
												<option value="${test.id}">${test.name} </option>
											</c:forEach>
										</select>
	
										<div class="help-block"></div>
										<div class="error-block"></div>
									</div>
								</div>
								
								<div class="col-sm-2">
									<div class="form-group field-name required">
										<label class="control-label" >Score</label> <input
											type="text" id="score" class="form-control" name="score"
											maxlength="50" placeholder="Test Score" data-validation="required">
	
										<div class="help-block"></div>
										<div class="error-block "></div>
									</div>
								</div>
								
								<div class="col-sm-2">
									<div class="form-group field-name">
										<label class="control-label" >Out Of</label> <input
											type="text" id="outOf" class="form-control" name="outOf"
											maxlength="50" placeholder="0" disabled="disabled">
	
										<div class="help-block"></div>
										<div class="error-block "></div>
									</div>
								</div>
								
							</div>
							
	
						</div>
					
						<div class="box-footer">
						<button type="button" class="btn btn-primary btn-create">Create</button>
						<button type="reset" class="btn btn-default btn-reset">Reset</button>
						</div>
					
					</div>
					<!-- /.box-body -->

				
					<!-- /.box-footer-->

				</form>
			</div>
	</section>
</div>