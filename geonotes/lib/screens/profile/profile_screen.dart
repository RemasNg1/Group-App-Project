import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geonotes/repository/supabase.dart';
import 'package:geonotes/screens/profile/bloc/profile_bloc.dart';
import 'package:geonotes/style/app_colors.dart';
import 'package:geonotes/style/app_spacing.dart';
import 'package:geonotes/widgets/avatar.dart';
import 'package:geonotes/widgets/custom_list_tile.dart';
import 'package:geonotes/widgets/edit_info.dart';
import 'package:geonotes/widgets/info_dialog.dart';
import 'package:geonotes/widgets/logout_dialog.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Avatar(imagePath: 'assets/images/avatar.png'),

                    AppSpacing.h16,
                    FutureBuilder<String?>(
                      future: SupabaseConnect.getUsername(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return SizedBox.shrink();
                        } else if (snapshot.hasError) {
                          return Text('Error loading username');
                        } else if (!snapshot.hasData || snapshot.data == null) {
                          return Text('No username found');
                        } else {
                          return Text(
                            snapshot.data!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        }
                      },
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
                      onTrailingTap: () async {
                        final user = Supabase.instance.client.auth.currentUser;

                        final response = await Supabase.instance.client
                            .from('user_info')
                            .select('name')
                            .eq('authid', user!.id)
                            .maybeSingle();

                        bloc.nameController.text = response?['name'] ?? '';
                        bloc.passwordController.clear();

                        showDialog(
                          context: context,
                          builder: (context) => BlocProvider.value(
                            value: bloc,
                            child: EditInfoDialog(),
                          ),
                        );
                      },
                    ),
                    CustomListTile(
                      leadingIcon: Icons.notifications_none,
                      title: "Notification",
                      trailing: BlocBuilder<ProfileBloc, ProfileState>(
                        builder: (context, state) {
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
                          builder: (context) => const InfoDialog(
                            title: "Support",
                            content:
                                "For Help and more Information\ncontact with us via email\n\nNote@gmail.com",
                          ),
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
                          builder: (context) => BlocProvider.value(
                            value: bloc,
                            child: LogoutDialog(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
