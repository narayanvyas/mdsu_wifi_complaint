import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';
import 'package:rflutter_alerts/rflutter_alerts.dart';
import 'package:wifi_complaint/app/controllers/global_controller.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/form_field_styles.dart';
import '../../../theme/text_styles.dart';
import '../../../theme/ui_helpers.dart';
import '../../../utils/app_texts.dart';
import '/app/global.dart';
import '/services/database.dart';

import '../../../../models/complaint_model.dart';

class ComplaintController extends GetxController {
  RxList<ComplaintModel> complaints = <ComplaintModel>[].obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController complaintController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  RxInt currentTroubleshootingIndex = 0.obs;
  RxString currentComplaintId = ''.obs;
  RxString selectedComplaintResolution = 'WiFi Error'.obs;
  Map<String, num> currentLocation = {'longitude': 0.0, 'latitude': 0.0};
  RxString selectedDepartment = 'Computer Science'.obs;
  RxBool isLoading = false.obs;
  final List<String> complaintSolutionsList = [
    'WiFi Error',
    'Router Error',
    'Network Error'
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
    Get.focusScope!.unfocus();
    if (validateComplaintInput()) {
      isLoading.value = true;
      currentComplaintId.value = 'MDS${randomNumeric(10)}';
      currentLocation = await getLocation();
      await Database().createComplaint(
          currentComplaintId.value,
          nameController.text,
          emailController.text,
          complaintController.text,
          getComplaintEmail(),
          currentLocation,
          department: selectedDepartment.value);
      currentTroubleshootingIndex.value = 3;
      nameController.text = '';
      emailController.text = '';
      complaintController.text = '';
      isLoading.value = false;
    }
  }

  Future<Map<String, num>> getLocation() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;
      serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        showSnackbar('Location services are disabled', Status.failed);
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          showSnackbar('Location permissions are denied', Status.failed);
        }
      }

      if (permission == LocationPermission.deniedForever) {
        showSnackbar(
            'Location permissions are permanently denied, we cannot request permissions.',
            Status.failed);
      }

      final Position position = await Geolocator.getCurrentPosition();
      final Map<String, num> locationValues = {
        'latitude': position.latitude,
        'longitude': position.longitude
      };
      return locationValues;
    } catch (e) {
      debugPrint(e.toString());
      return {'latitude': 0.0, 'longitude': 0.0};
    }
  }

  @override
  void onInit() {
    complaints.bindStream(Database().complaintsStream());
    super.onInit();
  }

  showResolveComplaintDialog(
      ComplaintModel complaint, BuildContext context) async {
    remarksController.text = '';
    Alert(
      context: context,
      title: 'Resolve Complaint',
      desc: 'Mark the complaint as resolved',
      style: AlertStyle(
          titleStyle: headlineTwoDarkStyle,
          descStyle: darkBodyStyle.copyWith(height: 1.5)),
      content: Column(
        children: [
          verticalSpaceMedium,
          SizedBox(
            width: screenWidth(context) - 180.w,
            child: DropdownButtonFormField<String>(
              decoration: customTextFormFieldDecoration.copyWith(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.blackColor!),
                ),
                labelText: 'Complaint Type',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.blackColor!),
                ),
              ),
              value: selectedComplaintResolution.value,
              onChanged: (String? value) {
                selectedComplaintResolution.value = value ?? '';
              },
              dropdownColor: AppColors.whiteColor,
              items: complaintSolutionsList.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(height: 1.5),
                    overflow: TextOverflow.clip,
                  ),
                );
              }).toList(),
            ),
          ),
          verticalSpaceMedium,
          Theme(
            data: Get.theme.copyWith(
              textTheme: TextTheme(
                subtitle1: TextStyle(color: AppColors.primaryColor),
              ),
              inputDecorationTheme: outlineInputTextFormFieldStyleTwo.copyWith(
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1, color: AppColors.primaryColor!),
                    borderRadius: BorderRadius.circular(4)),
              ),
            ),
            child: TextFormField(
              controller: remarksController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Remarks',
                hintText: 'Complaint Remarks',
              ),
            ).paddingSymmetric(horizontal: 10),
          ),
        ],
      ),
      buttons: [
        DialogButton(
          color: Colors.transparent,
          border: Border.all(width: 1, color: AppColors.primaryColor!),
          radius: BorderRadius.circular(2),
          onPressed: () => Get.back(),
          width: 120,
          child: DialogButtonText(
            "Cancel",
          ),
        ),
        DialogButton(
          color: AppColors.primaryColor,
          border: Border.all(width: 1, color: Colors.transparent),
          radius: BorderRadius.circular(2),
          onPressed: () async {
            if (remarksController.text.length < 2) {
              await showSnackbar(
                  'Please Enter Valid Complaint Remarks', Status.failed);
            } else {
              complaint.type = selectedComplaintResolution.value;
              complaint.remarks = remarksController.text;
              complaint.resolvedByUserId =
                  Get.find<GlobalController>().user.value.id ?? '';
              complaint.resolvedByUserName =
                  Get.find<GlobalController>().user.value.name ?? '';
              complaint.status = 'Resolved';
              complaint.resolvedAt = FieldValue.serverTimestamp();
              await Database().updateComplaint(complaint);
              Get.back();
              showSnackbar('Complaint Resolved Successfully', Status.success);
            }
          },
          width: 120,
          child: Text(
            "Update",
            style: lightButtonTextStyle.copyWith(color: AppColors.whiteColor),
          ),
        )
      ],
    ).show();
  }

  List<String> departmentList = [
    'Fine Arts',
    'Bharat Vidya Adhyan Sankul',
    'Commerce',
    'Management Studies',
    'Environmental Science',
    'Education',
    'Library & Education Sciences',
    'Computer Science',
    'Law',
    'Botany',
    'Food Science & Nutrition',
    'Rajasthan Studies',
    'Kaptan Durga Prasad Choudhary Deptt. for Journalism, Mass Communication & Multi-media technique',
    'Microbiology',
    'Zoology',
    'Mathematics',
    'Pure & Applied Chemistry',
    'Hindi',
    'Geography',
    'Economics',
    'History',
    'Political Science',
    'Population Studies',
    'Geoinformatics & Remote Sensing',
    'Vedic Vangmaya',
    'Yogic Sciences & Human Consciousness'
  ];

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
																	<p style="margin: 0; margin-bottom: 16px;">Location - https://www.google.com/maps/search/?api=1&query=${currentLocation['latitude']},${currentLocation['longitude']}</p>
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
