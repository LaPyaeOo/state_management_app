import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../util/app_color.dart';
import '../util/dimension.dart';
import '../util/assets_const.dart';
import '../pod/app_theme.dart';
import '../pod/k_label_text.dart';
import '../pod/k_button.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = '/register';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String firstName = '';

  String lastName = '';

  String emailAddress = '';

  String nationality = '';

  String countryResidence = '';

  late DateTime dateOfBirth;

  String dateOfBirthFormatted = '';

  String dateofBirthErrorText = '';

  Future<Null> _selectYearStarted(
    BuildContext context,
  ) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now().add(new Duration(days: -365 * 18)),
        // initialDate: currentValue ?? DateTime.now(),
        firstDate: new DateTime(1900),
        lastDate: new DateTime.now());

    if (picked != null) {
      setState(() {
        dateOfBirth = picked;
        String testT = dateOfBirth.toString();
        DateTime testDate = DateTime.parse(testT);
        dateOfBirthFormatted =
            "${testDate.day < 10 ? "0${testDate.day}" : testDate.day}/${testDate.month < 10 ? "0${testDate.month}" : testDate.month}/${testDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200]!.withOpacity(0.9),
          ),
          height: MARGIN_MEDIUM_2 * 52,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.only(
                    top: MARGIN_MEDIUM * 5,
                    left: MARGIN_MEDIUM * 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200]!.withOpacity(0.9),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: MARGIN_MEDIUM * 2,
                          top: MARGIN_MEDIUM * 2,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Almost there!',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            SizedBox(
                              height: MARGIN_MEDIUM * 2,
                            ),
                            Text(
                              'Complete the form below to create',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            Text(
                              'your Ready To Travel account.',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: MARGIN_MEDIUM * 2,
                          top: MARGIN_MEDIUM * 2,
                          bottom: MARGIN_MEDIUM * 3,
                        ),
                        child: Text(
                          '*Mandatory',
                          style:
                              Theme.of(context).textTheme.headline3!.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MARGIN_MEDIUM_2 * 13.4,
                left: 0,
                right: 0,
                child: Form(
                  key: _formKey,
                  child: Container(
                    width: MARGIN_MEDIUM_2 * 20,
                    height: MARGIN_MEDIUM_2 * 32,
                    padding: EdgeInsets.only(
                      left: MARGIN_MEDIUM_2 * 2,
                      top: MARGIN_MEDIUM_2 * 2.5,
                      right: MARGIN_MEDIUM_2 * 2,
                    ),
                    color: AppColor().primaryColor,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          KLabelText(text: 'First name *'),
                          TextFormField(
                            decoration: kTextFormFieldsDecoration(),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'This is required field';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              firstName = value!;
                            },
                          ),
                          SizedBox(
                            height: MARGIN_MEDIUM_2,
                          ),
                          KLabelText(text: 'Last name *'),
                          TextFormField(
                            decoration: kTextFormFieldsDecoration(),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'This is required field';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              lastName = value!;
                            },
                          ),
                          SizedBox(
                            height: MARGIN_MEDIUM_2,
                          ),
                          KLabelText(text: 'Email Address *'),
                          TextFormField(
                            decoration: kTextFormFieldsDecoration(),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'This is required field';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              emailAddress = value!;
                            },
                          ),
                          SizedBox(
                            height: MARGIN_MEDIUM_2,
                          ),
                          Row(
                            children: [
                              KLabelText(text: 'Date of Birth *'),
                              dateofBirthErrorText == ''
                                  ? Container()
                                  : Text(
                                      dateofBirthErrorText,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3!
                                          .copyWith(
                                            color: Colors.red,
                                            fontSize: TEXT_REGULAR_SMALL,
                                          ),
                                    )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: MARGIN_MEDIUM_2 * 11,
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                    color: Colors.grey,
                                  )),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    KLabelText(
                                      text: dateOfBirthFormatted == ''
                                          ? 'DD /MM /YYYY'
                                          : dateOfBirthFormatted,
                                    ),
                                    IconButton(
                                      icon: Image.asset(dobImage),
                                      onPressed: () {
                                        _selectYearStarted(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              ToggleSwitch(
                                minWidth: MARGIN_MEDIUM_2 * 4.5,
                                cornerRadius: 20.0,
                                activeBgColors: [
                                  [AppColor().primaryColor],
                                  [AppColor().primaryColor]
                                ],
                                activeFgColor: AppColor().primaryFontColor,
                                inactiveBgColor:
                                    Colors.grey[200]!.withOpacity(0.9),
                                inactiveFgColor: AppColor().primaryFontColor,
                                initialLabelIndex: 1,
                                totalSwitches: 2,
                                labels: ['Female', 'Male'],
                                radiusStyle: true,
                                onToggle: (index) {
                                  print('switched to: $index');
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MARGIN_MEDIUM_2,
                          ),
                          KLabelText(text: 'Nationality *'),
                          TextFormField(
                            decoration: kTextFormFieldsDecoration(),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'This is required field';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              nationality = value!;
                            },
                          ),
                          SizedBox(
                            height: MARGIN_MEDIUM_2,
                          ),
                          KLabelText(text: 'Country of Residence *'),
                          TextFormField(
                            decoration: kTextFormFieldsDecoration(),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'This is required field';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              countryResidence = value!;
                            },
                          ),
                          SizedBox(
                            height: MARGIN_MEDIUM_2,
                          ),
                          KLabelText(text: 'Mobile no. (Optional)'),
                          TextFormField(
                            decoration: kTextFormFieldsDecoration(),
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: MARGIN_MEDIUM_2 * 7.3,
                child: Container(
                  width: MARGIN_MEDIUM_2 * 9,
                  height: MARGIN_MEDIUM_2 * 10,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(guitarImage),
                      scale: 1,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor().primaryColor,
                  ),
                  padding: EdgeInsets.only(
                    left: MARGIN_MEDIUM_2 * 2,
                    top: MARGIN_MEDIUM_2,
                    right: MARGIN_MEDIUM_2 * 2,
                  ),
                  width: MARGIN_MEDIUM_2 * 20,
                  height: MARGIN_MEDIUM_2 * 5,
                  child: Center(
                    child: Kbutton(
                      labelText: 'Create my account now',
                      gradient: AppColor().buttonGradientColor,
                      labelColor: AppColor().primaryColor,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (dateOfBirthFormatted == '') {
                            setState(() {
                              dateofBirthErrorText =
                                  'Date of birth is required field';
                            });
                          } else {
                            _formKey.currentState!.save();
                            print(firstName);
                            print(lastName);
                            print(emailAddress);
                            print(nationality);
                            print(countryResidence);
                          }
                        }
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
