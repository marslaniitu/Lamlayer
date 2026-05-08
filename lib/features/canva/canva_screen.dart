import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:lamlayer/core/theme/custom_colors.dart';
import 'package:lamlayer/features/canva/canva_design_screen.dart';
import 'package:lamlayer/widgets/custom_button.dart';
import 'package:lamlayer/widgets/custom_label.dart';
import 'package:lamlayer/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_cherry_toast.dart';
import '../../widgets/custom_dialog_box.dart';
import 'components/canva_validator_provider.dart';

class CanvaScreen extends StatefulWidget {
  const CanvaScreen({super.key});

  @override
  State<CanvaScreen> createState() => _CanvaScreenState();
}

class _CanvaScreenState extends State<CanvaScreen> {


  Color pickerColor = CustomColors.primaryColor;
  Color currentColor = CustomColors.primaryColor;

  final TextEditingController heightController = TextEditingController();
  final TextEditingController widthController = TextEditingController();

  bool isColorPicked = false;

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  String getHexFromColor(Color color) {
    return color.value.toRadixString(16).substring(2).toUpperCase();
  }

  Color getTextColor(Color bgColor) {
    return bgColor.computeLuminance() > 0.5
        ? Colors.black
        : Colors.white;
  }

  void openColorPicker() {
    showDialog(
      context: context,
      builder: (context) {
        return CustomDialogBox(
          iconPadding: EdgeInsets.zero,
          icon: Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: CustomColors.primaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                'Pick a color!',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: CustomColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          title: const SizedBox.shrink(),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: pickerColor,
              onColorChanged: changeColor,
            ),
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    currentColor = pickerColor;
                    isColorPicked = true;
                  });
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Get it',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: CustomColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CanvaValidatorProvider>(
      builder: (context, validator, child) {
        return WillPopScope(
          onWillPop: () async => false,
          child: CustomDialogBox(
            iconPadding: EdgeInsets.zero,
            icon: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: CustomColors.primaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  'Create Designs',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: CustomColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            title: const SizedBox.shrink(),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customLabel(context, text: 'Height'),
                const SizedBox(height: 5),
                 CustomTextFormField(
                  controller: heightController,
                   textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.numberWithOptions(),
                  hintText: 'Enter designs height...',
                   onChanged: (value) {
                     validator.setValidateHeight(value);
                   },
                   onEditingComplete: () {
                     validator.clearError('heightValidate');
                   },
                   errorText: validator.heightValidate.isEmpty ? null : validator.heightValidate.toString(),

                ),
                const SizedBox(height: 10),

                customLabel(context, text: 'Width'),
                const SizedBox(height: 5),
                 CustomTextFormField(
                  controller: widthController,
                   textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.numberWithOptions(),
                  hintText: 'Enter designs width...',
                   onChanged: (value) {
                     validator.setValidateWidth(value);
                   },
                   onEditingComplete: () {
                     validator.clearError('widthValidate');
                   },
                   errorText: validator.widthValidate.isEmpty ? null : validator.widthValidate.toString(),
                ),
                const SizedBox(height: 10),

                Row(
                  children: [
                    customLabel(context, text: 'Color:'),
                    const SizedBox(width: 10),

                    Expanded(
                      child: isColorPicked
                          ? GestureDetector(
                        onTap: openColorPicker,
                        child: Container(
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: currentColor,
                            border: Border.all(color: CustomColors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            getHexFromColor(currentColor),
                            style: TextStyle(
                              color: getTextColor(currentColor),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                          : CustomButton(
                        height: 40,
                        text: 'Pick Color?',
                        onPressed: openColorPicker,
                        isLoading: false,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () async {

                    final height = heightController.text.trim().toString();
                    final width = widthController.text.trim().toString();
                    final color = getHexFromColor(currentColor);

                    try{
                      if( validator.setValidateHeight(height) == null && validator.setValidateWidth(width)== null){
                        CustomCherryToast.success(context, title: 'Successfully');

                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> CanvaDesignScreen(
                          width: width,
                          height: height,
                          color: color,
                        )), (_) => false);

                      }else{
                        log('Validation failed');
                        CustomCherryToast.warning(context, title: 'Please fill all fields correctly.');
                      }
                    }catch(e){
                      log('Error: $e');
                      CustomCherryToast.error(context, title: 'An error occured: $e');
                    }


                    // Submit logic here
                    print("Selected Color: ${getHexFromColor(currentColor)}");
                  },

                  child: Text(
                    'Add Designs',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: CustomColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}