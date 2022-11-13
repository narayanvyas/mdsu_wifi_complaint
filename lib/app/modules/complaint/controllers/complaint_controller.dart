import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';
import 'package:wifi_complaint/app/global.dart';
import 'package:wifi_complaint/services/database.dart';

class ComplaintController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController complaintController = TextEditingController();
  RxInt currentTroubleshootingIndex = 0.obs;
  RxString currentComplaintId = ''.obs;
  RxString selectedDepartment = 'Department of Computer Science'.obs;
  List<String> departmentList = [
    'Department of Fine Arts',
    'Bharat Vidya Adhyan Sankul',
    'Department of Commerce',
    'Department of Management Studies',
    'Department of Environmental Science',
    'Department of Education',
    'Department of Library & Education Sciences',
    'Department of Computer Science',
    'Department of Law',
    'Department of Botany',
    'Department of Food Science & Nutrition',
    'Department of Rajasthan Studies',
    'Kaptan Durga Prasad Choudhary Deptt. for Journalism, Mass Communication & Multi-media technique',
    'Department of Microbiology',
    'Department of Zoology',
    'Department of Mathematics',
    'Department of Pure & Applied Chemistry',
    'Department of Hindi',
    'Department of Geography',
    'Department of Economics',
    'Department of History',
    'Department of Political Science',
    'Department of Population Studies',
    'Department of Geoinformatics & Remote Sensing',
    'Department of Vedic Vangmaya',
    'Department of Yogic Sciences & Human Consciousness'
  ];

  bool validateComplaintInput() {
    if (nameController.text.length < 2) {
      showSnackbar('Please Enter Valid Name', Status.failed);
      return false;
    } else if (!GetUtils.isEmail(emailController.text)) {
      showSnackbar('Please Enter Valid Email Address', Status.failed);
      return false;
    } else if (complaintController.text.length < 2) {
      showSnackbar('Please Enter Valid Complaint', Status.failed);
      return false;
    }
    return true;
  }

  void updateDropdown(String value) => selectedDepartment.value = value;

  Future<void> submitComplaint() async {
    if (validateComplaintInput()) {
      currentComplaintId.value = 'MDS${randomNumeric(10)}';
      await Database().createComplaint(
          currentComplaintId.value,
          nameController.text,
          emailController.text,
          complaintController.text,
          getComplaintEmail(),
          department: selectedDepartment.value);
      currentTroubleshootingIndex.value = 3;
      nameController.text = '';
      emailController.text = '';
      complaintController.text = '';
    }
  }

  dynamic getComplaintEmail() {
    return {
      "subject": 'WiFi Complaint ${currentComplaintId.value} Received',
      "html": '''<!DOCTYPE html>
<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office" lang="en">

<head>
	<title></title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!--[if mso]><xml><o:OfficeDocumentSettings><o:PixelsPerInch>96</o:PixelsPerInch><o:AllowPNG/></o:OfficeDocumentSettings></xml><![endif]-->
	<style>
		* {
			box-sizing: border-box;
		}

		body {
			margin: 0;
			padding: 0;
		}

		a[x-apple-data-detectors] {
			color: inherit !important;
			text-decoration: inherit !important;
		}

		#MessageViewBody a {
			color: inherit;
			text-decoration: none;
		}

		p {
			line-height: inherit
		}

		.desktop_hide,
		.desktop_hide table {
			mso-hide: all;
			display: none;
			max-height: 0px;
			overflow: hidden;
		}

		@media (max-width:620px) {
			.desktop_hide table.icons-inner {
				display: inline-block !important;
			}

			.icons-inner {
				text-align: center;
			}

			.icons-inner td {
				margin: 0 auto;
			}

			.row-content {
				width: 100% !important;
			}

			.mobile_hide {
				display: none;
			}

			.stack .column {
				width: 100%;
				display: block;
			}

			.mobile_hide {
				min-height: 0;
				max-height: 0;
				max-width: 0;
				overflow: hidden;
				font-size: 0px;
			}

			.desktop_hide,
			.desktop_hide table {
				display: table !important;
				max-height: none !important;
			}
		}
	</style>
</head>

<body style="background-color: transparent; margin: 0; padding: 0; -webkit-text-size-adjust: none; text-size-adjust: none;">
	<table class="nl-container" width="100%" border="0" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: transparent;">
		<tbody>
			<tr>
				<td>
					<table class="row row-1" align="center" width="100%" border="0" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;">
						<tbody>
							<tr>
								<td>
									<table class="row-content stack" align="center" border="0" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; color: #000000; width: 600px;" width="600">
										<tbody>
											<tr>
												<td class="column column-1" width="100%" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; font-weight: 400; text-align: left; vertical-align: top; padding-top: 5px; padding-bottom: 0px; border-top: 0px; border-right: 0px; border-bottom: 0px; border-left: 0px;">
													<table class="heading_block block-1" width="100%" border="0" cellpadding="0" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt;">
														<tr>
															<td class="pad" style="width:100%;text-align:center;">
																<h1 style="margin: 0; color: #8a3c90; font-size: 38px; font-family: Arial, Helvetica Neue, Helvetica, sans-serif; line-height: 120%; text-align: center; direction: ltr; font-weight: 700; letter-spacing: normal; margin-top: 0; margin-bottom: 0;"><span class="tinyMce-placeholder">MDSU WiFi Complaint Portal</span></h1>
															</td>
														</tr>
													</table>
													<table class="paragraph_block block-2" width="100%" border="0" cellpadding="30" cellspacing="0" role="presentation" style="mso-table-lspace: 0pt; mso-table-rspace: 0pt; word-break: break-word;">
														<tr>
															<td class="pad">
																<div style="color:#101112;font-size:16px;font-family:Arial, Helvetica Neue, Helvetica, sans-serif;font-weight:400;line-height:120%;text-align:center;direction:ltr;letter-spacing:0px;mso-line-height-alt:19.2px;">
																	<p style="margin: 0; margin-bottom: 16px;">We have received a new complaint.</p>
																	<p style="margin: 0; margin-bottom: 16px;">&nbsp;</p>
																	<p style="margin: 0; margin-bottom: 16px;">Complaint ID - ${currentComplaintId.value}</p>
																	<p style="margin: 0; margin-bottom: 16px;">Name - ${nameController.text}</p>
																	<p style="margin: 0; margin-bottom: 16px;">Email - ${emailController.text}</p>
																	<p style="margin: 0; margin-bottom: 16px;">Department - ${selectedDepartment.value}</p>
																	<p style="margin: 0; margin-bottom: 16px;">Complaint - ${complaintController.text}</p>
																	<p style="margin: 0; margin-bottom: 16px;">&nbsp;</p>
																	<p style="margin: 0;">&nbsp;</p>
																</div>
															</td>
														</tr>
													</table>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</tbody>
	</table><!-- End -->
</body>

</html>''',
    };
  }
}
