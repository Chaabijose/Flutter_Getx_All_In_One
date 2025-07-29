import 'package:flutter/material.dart';

// Custom reusable button widget with loading state and styling options
class CustomButton extends StatelessWidget {
  // Text displayed on the button
  final String text;

  // Callback function when button is pressed, nullable
  final VoidCallback? onPressed;

  // Flag to indicate if a loading spinner should be shown
  final bool isLoading;

  // Optional width of the button
  final double? width;

  // Optional background color of the button
  final Color? color;

  // Optional text color of the button
  final Color? textColor;

  // Constructor with named parameters, some optional with default values
  const CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.width,
    this.color,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, // Use passed width or shrink-wrap if null
      height: 48, // Fixed height for button
      child: ElevatedButton(
        // Disable button if loading
        onPressed: isLoading ? null : onPressed,

        // Style the button
        style: ElevatedButton.styleFrom(
          backgroundColor:
              color ?? Colors.blue.shade700, // Use provided or default color
          foregroundColor: textColor ?? Colors.white, // Text/icon color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
          elevation: 2, // Button shadow elevation
        ),

        // Show loading spinner or text depending on isLoading flag
        child: isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2, // Thin spinner stroke
                  valueColor: AlwaysStoppedAnimation<Color>(
                    textColor ??
                        Colors.white, // Spinner color matches text color
                  ),
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ), // Button text style
              ),
      ),
    );
  }
}
