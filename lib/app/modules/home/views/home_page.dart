import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

// HomeView is the UI page shown after login
class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Build the UI using GetBuilder to react to controller changes
    return GetBuilder<HomeController>(
      builder: (_) => Material(
        child: Container(
          // Apply a gradient background
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue.shade50, Colors.white],
            ),
          ),
          child: SafeArea(
            // Main column layout for app bar and content
            child: Column(
              children: [
                _buildAppBar(), // Top bar with user info and logout
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        _buildWelcomeCard(), // Welcome message card
                        SizedBox(height: 24),
                        _buildFeatureCards(), // Grid with feature cards
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Builds the top app bar with avatar, username, email, and logout button
  Widget _buildAppBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 1),
        ],
      ),
      child: Row(
        children: [
          // Avatar circle with image or fallback icon
          CircleAvatar(
            radius: 20,
            backgroundImage: controller.userAvatar != null
                ? NetworkImage(controller.userAvatar!)
                : null,
            child: controller.userAvatar == null
                ? Icon(Icons.person, color: Colors.white)
                : null,
            backgroundColor: Colors.blue.shade700,
          ),
          SizedBox(width: 16),
          // Username and email
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, ${controller.userName}!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
                Text(
                  controller.userEmail,
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          // Logout icon button
          IconButton(
            onPressed: controller.logout,
            icon: Icon(Icons.logout, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  // Welcome message shown after login
  Widget _buildWelcomeCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade700, Colors.blue.shade500],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade200,
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(Icons.dashboard, size: 48, color: Colors.white),
          SizedBox(height: 16),
          Text(
            'Welcome to Dashboard',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'You are successfully logged in!',
            style: TextStyle(fontSize: 16, color: Colors.white70),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Grid of feature cards for navigation or information
  Widget _buildFeatureCards() {
    return GridView.count(
      shrinkWrap: true, // Prevent scroll conflict
      crossAxisCount: 2, // Two columns
      crossAxisSpacing: 16, // Horizontal space between cards
      mainAxisSpacing: 16, // Vertical space between cards
      children: [
        _buildFeatureCard(
          icon: Icons.person,
          title: 'Profile',
          subtitle: 'Manage account',
          color: Colors.green,
        ),
        _buildFeatureCard(
          icon: Icons.settings,
          title: 'Settings',
          subtitle: 'App preferences',
          color: Colors.orange,
        ),
        _buildFeatureCard(
          icon: Icons.analytics,
          title: 'Analytics',
          subtitle: 'View reports',
          color: Colors.purple,
        ),
        _buildFeatureCard(
          icon: Icons.help,
          title: 'Help',
          subtitle: 'Get support',
          color: Colors.red,
        ),
      ],
    );
  }

  // A reusable method for creating a styled feature card
  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 1),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Circular icon background
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 32, color: color),
          ),
          SizedBox(height: 12),
          // Card title
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          ),
          SizedBox(height: 4),
          // Card subtitle
          Text(
            subtitle,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
