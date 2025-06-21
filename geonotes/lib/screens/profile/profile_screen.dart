import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geonotes/screens/profile/bloc/profile_bloc.dart';
import 'package:geonotes/style/app_colors.dart';
import 'package:geonotes/style/app_spacing.dart';
import 'package:geonotes/utils/extensions/screen/screen_size.dart';
import 'package:geonotes/widgets/avatar.dart';
import 'package:geonotes/widgets/custom_list_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<ProfileBloc>();
          return Scaffold(
            appBar: AppBar(title: Text("Profile"), centerTitle: true),
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding: EdgeInsetsGeometry.all(24),
                  child: Column(
                    children: [
                      Avatar(imagePath: 'assets/images/avatar.png'),

                      AppSpacing.h16,
                      Text(
                        "Sara Ahmed",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
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
                      CustomListTile(
                        leadingIcon: Icons.edit_note_sharp,
                        title: "Edit personal information",
                        trailing: Icon(
                          Icons.keyboard_arrow_right_outlined,
                          color: Colors.black,
                        ),
                        onTrailingTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => CustomDialog3(),
                          );
                        },
                      ),
                      CustomListTile(
                        leadingIcon: Icons.notifications_none,
                        title: "Notification",
                        trailing: BlocBuilder<ProfileBloc, ProfileState>(
                          builder: (context, state) {
                            final bloc = context.read<ProfileBloc>();
                            return InkWell(
                              onTap: () {
                                bloc.add(ChangeNotificationEvent());
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                width: 60,
                                height: 28,
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: bloc.isEnable
                                      ? Colors.orange
                                      : Colors.grey.shade400,
                                ),
                                alignment: bloc.isEnable
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
                            );
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "More",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.orange,
                          ),
                        ),
                      ),
                      CustomListTile(
                        leadingIcon: Icons.support_agent_outlined,
                        title: "Support",
                        trailing: Icon(
                          Icons.keyboard_arrow_right_outlined,
                          color: Colors.black,
                        ),
                        onTrailingTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => CustomDialog2(),
                          );
                        },
                      ),
                      CustomListTile(
                        leadingIcon: Icons.logout_sharp,
                        title: "Logout",
                        trailing: Icon(
                          Icons.keyboard_arrow_right_outlined,
                          color: Colors.black,
                        ),
                        onTrailingTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => CustomDialog(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
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
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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
