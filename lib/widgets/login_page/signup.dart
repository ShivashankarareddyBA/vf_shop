import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:vf_shop/constants/colors.dart';
import 'package:vf_shop/widgets/custom_text_form_field.dart';
import 'package:vf_shop/widgets/login_page/map_selection_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp>
    with AutomaticKeepAliveClientMixin<SignUp> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Location _location = Location();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: grey,
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  const SizedBox(
                    height: 14,
                  ),
                  _buildSignUp(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Method to build the form field for first name
  Widget _buildFirstNameSection(BuildContext context) {
    return CustomTextFormField(
      controller: _firstNameController,
      data: Icons.person,
      labelText: 'First Name',
      keyboardType: TextInputType.text,
      isObscure: false,
    );
  }

  // Method to build the form field for last name
  Widget _buildLastNameSection(BuildContext context) {
    return CustomTextFormField(
      controller: _lastNameController,
      data: Icons.person,
      labelText: 'Last Name',
      keyboardType: TextInputType.text,
      isObscure: false,
    );
  }

  // Method to build the form field for date of birth
  Widget _buildDobSection(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        CustomTextFormField(
          controller: _dobController,
          data: Icons.calendar_today,
          labelText: 'Date of Birth',
          keyboardType: TextInputType.text,
          isObscure: false,
        ),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Text(
              //   'Select Date',
              //   style: TextStyle(fontSize: 16),
              // ),
              Icon(Icons.calendar_today),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      // Format the selected date
      String formattedDate = "${selectedDate.toLocal()}".split(' ')[0];
      _dobController.text = formattedDate;
    }
  }

  Widget _buildEmailSection(BuildContext context) {
    return CustomTextFormField(
      controller: _emailController,
      data: Icons.email,
      labelText: 'Email',
      keyboardType: TextInputType.emailAddress,
      isObscure: false,
    );
  }

  // Method to build the form field for password
  Widget _buildPasswordSection(BuildContext context) {
    return CustomTextFormField(
      controller: _passwordController,
      data: Icons.lock,
      labelText: 'Password',
      isObscure: true,
    );
  }

  // Method to build the form field for confirming password
  Widget _buildConfirmPasswordSection(BuildContext context) {
    return CustomTextFormField(
      controller: _confirmPasswordController,
      data: Icons.lock,
      labelText: 'Confirm Password',
      isObscure: true,
    );
  }

  // Method to build the form field for address along with location selection button
  Widget _buildAddressSection(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        CustomTextFormField(
          controller: _addressController,
          data: Icons.location_on,
          labelText: 'Address',
          keyboardType: TextInputType.text,
          isObscure: false,
        ),
        const SizedBox(height: 2),
        InkWell(
          onTap: () async {
            final LatLng? selectedLocation = await _selectLocationOnMap();
            if (selectedLocation != null) {
              debugPrint('Selected Location: $selectedLocation');
              _addressController.text =
                  'Latitude: ${selectedLocation.latitude}, Longitude: ${selectedLocation.longitude}';
            }
          },
          // child: Container(
          //   padding: const EdgeInsets.all(16),
          //   decoration: BoxDecoration(
          //     color: grey,
          //     borderRadius: BorderRadius.circular(360),
          //   ),

          child: const Icon(
            Icons.my_location,
            size: 30,
            color: Colors.deepOrange,
          ),
        ),
        // )
      ],
    );
  }

  // Method to navigate to the map selection screen and get the selected location
  Future<LatLng?> _selectLocationOnMap() async {
    PermissionStatus permission = await _location.requestPermission();
    if (permission != PermissionStatus.granted) {
      debugPrint('Location permission not granted');
      return null;
    }

    LocationData? currentLocation = await _location.getLocation();
    if (currentLocation == null) {
      debugPrint('Failed to get current location');
      return null;
    }

    return await Get.to(
      () => MapSelectionScreen(currentLocation),
      fullscreenDialog: true,
    );
  }

  // Method to build the sign-up button
  Widget _buildSignUpButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: () {
          debugPrint("Tapped");
          // Implement sign-up logic here
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(btncolor),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.all(16)),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          fixedSize: MaterialStateProperty.all<Size>(const Size(180, 55)),
        ),
        child: const Text(
          'Sign Up',
          style: TextStyle(color: orangedark, fontSize: 18),
        ),
      ),
    );
  }

  // Method to build the entire sign-up form
  Widget _buildSignUp(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Column(
        children: [
          _buildFirstNameSection(context),
          const SizedBox(height: 2),
          _buildLastNameSection(context),
          const SizedBox(height: 2),
          _buildDobSection(context),
          const SizedBox(height: 2),
          _buildEmailSection(context),
          const SizedBox(height: 2),
          _buildPasswordSection(context),
          const SizedBox(height: 2),
          _buildConfirmPasswordSection(context),
          const SizedBox(height: 2),
          _buildAddressSection(context),
          const SizedBox(height: 2),
          _buildSignUpButton(context),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
