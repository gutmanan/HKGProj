﻿<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="Trainings.aspx.cs" Inherits="View_Update_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" Runat="Server">
<div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <div class="card card-wizard" id="wizardCard">
                            <form id="wizardForm" method="" action="">

                            <div class="header text-center">
                                <h3 class="title">Awesome Wizard</h3>
                                <p class="category">Split a complicated flow in multiple steps</p>
                            </div>

            				<div class="content">
            				    <ul class="nav">
            						<li><a href="#tab1" data-toggle="tab">First Tab</a></li>
            						<li><a href="#tab2" data-toggle="tab">Second Tab</a></li>
            						<li><a href="#tab3" data-toggle="tab">Third Tab</a></li>
            					</ul>

            					<div class="tab-content">
            					    <div class="tab-pane" id="tab1">
                                        <h5 class="text-center">Please tell us more about yourself.</h5>
                                        <div class="row">
                                            <div class="col-md-5 col-md-offset-1">
                                                <div class="form-group">
                                                    <label class="control-label">First Name</label>
                                                    <input class="form-control"
                                                           type="text"
                                                           name="first_name"
                                                           placeholder="ex: Mike"
                                                    />
                                                </div>
                                            </div>
                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <label class="control-label">Last Name</label>
                                                    <input class="form-control"
                                                           type="text"
                                                           name="last_name"
                                                           required="true"
                                                           placeholder="ex: Andrew"
                                                    />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-10 col-md-offset-1">
                                                <div class="form-group">
                                                    <label class="control-label">Email<star>*</star></label>
                                                    <input class="form-control"
                                                           type="text"
                                                           name="email"
                                                           email="true"
                                                           placeholder="ex: hello@creative-tim.com"
                                                    />
                                                </div>
                                            </div>
                                        </div>

            					    </div>

            					    <div class="tab-pane" id="tab2">
                                        <h5 class="text-center">Please give us more details about your platform.</h5>
                                        <div class="row">
                                            <div class="col-md-10 col-md-offset-1">
                                                <div class="form-group">
                                                    <label class="control-label">Your Website<star>*</star></label>
                                                    <input class="form-control"
                                                           type="text"
                                                           name="website"
                                                           url="true"
                                                           placeholder="ex: http://www.creative-tim.com"
                                                    />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-5 col-md-offset-1">
                                                <div class="form-group">
                                                    <label class="control-label">Framework Type</label>
                                                    <input class="form-control"
                                                           type="text"
                                                           name="framework"
                                                           placeholder="ex: http://www.creative-tim.com"
                                                    />
                                                </div>
                                            </div>

                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <label class="control-label">Language<star>*</star></label>

                                                    <!--     IMPORTANT! - the "bootstrap select picker" is not compatible with jquery.validation.js, that's why we use the "default select" inside this wizard. We will try to contact the guys who are responsibble for the "bootstrap select picker" to find a solution. Thank you for your patience.
                                                     -->

                                                    <select name="cities" class="form-control">
                                                        <option selected="" disabled="">- language -</option>
                                                        <option value="ms">Bahasa Melayu</option>
                                                        <option value="ca">Català</option>
                                                        <option value="da">Dansk</option>
                                                        <option value="de">Deutsch</option>
                                                        <option value="en">English</option>
                                                        <option value="es">Español</option>
                                                        <option value="el">Eλληνικά</option>
                                                        <option value="fr">Français</option>
                                                        <option value="it">Italiano</option>
                                                        <option value="hu">Magyar</option>
                                                        <option value="nl">Nederlands</option>
                                                        <option value="no">Norsk</option>
                                                        <option value="pl">Polski</option>
                                                        <option value="pt">Português</option>
                                                        <option value="fi">Suomi</option>
                                                        <option value="sv">Svenska</option>
                                                        <option value="tr">Türkçe</option>
                                                        <option value="is">Íslenska</option>
                                                        <option value="cs">Čeština</option>
                                                        <option value="ru">Русский</option>
                                                        <option value="th">ภาษาไทย</option>
                                                        <option value="zh">中文 (简体)</option>
                                                        <option value="zh-TW">中文 (繁體)</option>
                                                        <option value="ja">日本語</option>
                                                        <option value="ko">한국어</option>
                                                    </select>

                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-5 col-md-offset-1">
                                                <div class="form-group">
                                                    <label class="control-label">Bootstrap Version</label>

                                                    <!--     IMPORTANT! - the "bootstrap select picker" is not compatible with jquery.validation.js, that's why we use the "default select" inside this wizard. We will try to contact the guys who are responsibble for the "bootstrap select picker" to find a solution. Thank you for your patience.
                                                     -->

                                                    <select name="cities" class="form-control">
                                                        <option selected="" disabled="">- version -</option>
                                                        <option value="1.1">Bootstrap 1.1</option>
                                                        <option value="2.0">Bootstrap 2.0</option>
                                                        <option value="3.0">Bootstrap 3.0</option>
                                                        <option value="4.0">Bootstrap 4.0(alpha)</option>
                                                    </select>

                                                </div>
                                            </div>

                                            <div class="col-md-5">
                                                <div class="form-group">
                                                    <label class="control-label">Price</label>
                                                    <input class="form-control"
                                                           type="text"
                                                           name="price"
                                                           placeholder="ex: 19.00"
                                                    />
                                                </div>
                                            </div>

                                        </div>

            					    </div>

            						<div class="tab-pane" id="tab3">
            							<h2 class="text-center text-space">Yuhuuu! <br><small> Click on "<b>Finish</b>" to join our community</small></h2>
            					    </div>

            					</div>
            				</div>

            				<div class="footer">
                                <button type="button" class="btn btn-default btn-fill btn-wd btn-back pull-left">Back</button>

                                <button type="button" class="btn btn-info btn-fill btn-wd btn-next pull-right">Next</button>
                                <button type="button" class="btn btn-info btn-fill btn-wd btn-finish pull-right" onclick="onFinishWizard()">Finish</button>

                                <div class="clearfix"></div>
            				</div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
<!--   Core JS Files and PerfectScrollbar library inside jquery.ui   -->
    <script src="../../assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="../../assets/js/jquery-ui.min.js" type="text/javascript"></script>
	<script src="../../assets/js/bootstrap.min.js" type="text/javascript"></script>


	<!--  Forms Validations Plugin -->
	<script src="../../assets/js/jquery.validate.min.js"></script>

	<!--  Plugin for Date Time Picker and Full Calendar Plugin-->
	<script src="../../assets/js/moment.min.js"></script>

    <!--  Date Time Picker Plugin is included in this js file -->
    <script src="../../assets/js/bootstrap-datetimepicker.js"></script>

    <!--  Select Picker Plugin -->
    <script src="../../assets/js/bootstrap-selectpicker.js"></script>

	<!--  Checkbox, Radio, Switch and Tags Input Plugins -->
	<script src="../../assets/js/bootstrap-checkbox-radio-switch-tags.js"></script>

	<!--  Charts Plugin -->
	<script src="../../assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="../../assets/js/bootstrap-notify.js"></script>

    <!-- Sweet Alert 2 plugin -->
	<script src="../../assets/js/sweetalert2.js"></script>

    <!-- Vector Map plugin -->
	<script src="../../assets/js/jquery-jvectormap.js"></script>

    <!--  Google Maps Plugin    -->
    <script src="https://maps.googleapis.com/maps/api/js"></script>

	<!-- Wizard Plugin    -->
    <script src="../../assets/js/jquery.bootstrap.wizard.min.js"></script>

	<!--  Bootstrap Table Plugin    -->
	<script src="../../assets/js/bootstrap-table.js"></script>

	<!--  Plugin for DataTables.net  -->
	<script src="../../assets/js/jquery.datatables.js"></script>

    <!--  Full Calendar Plugin    -->
    <script src="../../assets/js/fullcalendar.min.js"></script>

    <!-- Light Bootstrap Dashboard Core javascript and methods -->
	<script src="../../assets/js/light-bootstrap-dashboard.js"></script>

	<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
	<script src="../../assets/js/demo.js"></script>

    <script type="text/javascript">
        $().ready(function(){

            var $validator = $("#wizardForm").validate({
    		  rules: {
    		    email: {
                    required: true,
                    email: true,
                    minlength: 5
    		    },
    		    first_name: {
    		        required: false,
                    minlength: 5
    		    },
    		    last_name: {
    		        required: false,
                    minlength: 5
    		    },
    		    website: {
    		        required: true,
                    minlength: 5,
                    url: true
    		    },
    		    framework: {
        		    required: false,
        		    minlength: 4
    		    },
    		    cities: {
        		    required: true
    		    },
    		    price:{
        		    number: true
    		    }
    		  }
    		});



            // you can also use the nav-pills-[blue | azure | green | orange | red] for a different color of wizard

            $('#wizardCard').bootstrapWizard({
            	tabClass: 'nav nav-pills',
            	nextSelector: '.btn-next',
                previousSelector: '.btn-back',
            	onNext: function(tab, navigation, index) {
            		var $valid = $('#wizardForm').valid();

            		if(!$valid) {
            			$validator.focusInvalid();
            			return false;
            		}
            	},
                onInit : function(tab, navigation, index){

                    //check number of tabs and fill the entire row
                    var $total = navigation.find('li').length;
                    $width = 100/$total;

                    $display_width = $(document).width();

                    if($display_width < 600 && $total > 3){
                       $width = 50;
                    }

                    navigation.find('li').css('width',$width + '%');
                },
                onTabClick : function(tab, navigation, index){
                    // Disable the posibility to click on tabs
                    return false;
                },
                onTabShow: function(tab, navigation, index) {
                    var $total = navigation.find('li').length;
                    var $current = index+1;

                    var wizard = navigation.closest('.card-wizard');

                    // If it's the last tab then hide the last button and show the finish instead
                    if($current >= $total) {
                        $(wizard).find('.btn-next').hide();
                        $(wizard).find('.btn-finish').show();
                    } else if($current == 1){
                        $(wizard).find('.btn-back').hide();
                    } else {
                        $(wizard).find('.btn-back').show();
                        $(wizard).find('.btn-next').show();
                        $(wizard).find('.btn-finish').hide();
                    }
                }

            });

        });

        function onFinishWizard(){
            //here you can do something, sent the form to server via ajax and show a success message with swal

            swal("Good job!", "You clicked the finish button!", "success");
        }
    </script>

</html>
</asp:Content>

