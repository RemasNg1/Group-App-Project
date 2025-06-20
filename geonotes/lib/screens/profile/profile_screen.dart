import 'package:flutter/material.dart';
import 'package:geonotes/style/app_colors.dart';
import 'package:geonotes/style/app_spacing.dart';
import 'package:geonotes/utils/extensions/screen/screen_size.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile"), centerTitle: true),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsetsGeometry.all(24),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/avatar.png',
                    width: context.getWidth(factor: 0.3),
                    height: context.getHeight(factor: 0.13),
                    fit: BoxFit.cover,
                  ),
                ),
                AppSpacing.h16,

                Text(
                  "Sara Ahmed",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                AppSpacing.h32,
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "System",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.orange,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.edit_note_sharp, color: Colors.black),
                  title: Text(
                    "Edit personal information",
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CustomDialog3();
                        },
                      );
                    },
                    child: Icon(
                      Icons.keyboard_arrow_right_outlined,
                      color: Colors.black,
                    ),
                  ),

                  contentPadding: EdgeInsets.all(0),
                ),

                ListTile(
                  leading: Icon(Icons.notifications_none, color: Colors.black),
                  title: Text(
                    "Notification",
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    width: 60,
                    height: 28,
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: true ? Colors.orange : Colors.grey.shade400,
                    ),
                    alignment: true
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  contentPadding: EdgeInsets.all(0),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "System",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.orange,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.support_agent_outlined,
                    color: Colors.black,
                  ),
                  title: Text("Support", style: TextStyle(color: Colors.black)),
                  trailing: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CustomDialog2();
                        },
                      );
                    },
                    child: Icon(
                      Icons.keyboard_arrow_right_outlined,
                      color: Colors.black,
                    ),
                  ),
                  contentPadding: EdgeInsets.all(0),
                ),
                ListTile(
                  leading: Icon(Icons.logout_sharp, color: Colors.black),
                  title: Text("Logout", style: TextStyle(color: Colors.black)),
                  trailing: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CustomDialog();
                        },
                      );
                    },
                    child: Icon(
                      Icons.keyboard_arrow_right_outlined,
                      color: Colors.black,
                    ),
                  ),
                  contentPadding: EdgeInsets.all(0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(24),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Are you sure you want to\n log out?",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          AppSpacing.h24,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Logout",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomDialog2 extends StatelessWidget {
  const CustomDialog2({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      titlePadding: EdgeInsets.zero,
      title: SizedBox(
        height: 48,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Support',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.grey),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
      content: Text(
        'For Help and more Information\ncontact with us via email\n\nNote@gmail.com',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14, color: Colors.grey),
      ),
    );
  }
}

class CustomDialog3 extends StatelessWidget {
  const CustomDialog3({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      titlePadding: EdgeInsets.zero,
      title: SizedBox(
        height: 48,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Edit Inormation',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.grey),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
      content: SizedBox(
        height: context.getHeight(factor: 0.25),
        child: Column(
          children: [
            TextFormField(
              // controller: ,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                contentPadding: EdgeInsets.all(8),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            AppSpacing.h24,

            TextFormField(
              // controller: ,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                contentPadding: EdgeInsets.all(8),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            AppSpacing.h24,
            TextFormField(
              // controller: ,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                contentPadding: EdgeInsets.all(8),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.black),
                ),
                suffixIcon: Icon(Icons.visibility_off_outlined),
              ),
            ),
          ],
        ),
      ),
      actions: [
        SizedBox(
          width: context.getWidth(factor: 0.6),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Save",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
