import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tejara_store/core/assets/Text_strings.dart';
import 'package:tejara_store/core/assets/custom_colors.dart';
import 'package:tejara_store/core/assets/image_assets.dart';
import 'package:tejara_store/core/assets/sizes.dart';
import 'package:tejara_store/core/widgets/elevatedButton/elevated_button.dart';

class LoginPresentation extends HookWidget {
  final VoidCallback goToRegister;
  final VoidCallback goToForgotPassword;
  const LoginPresentation({
    super.key,
    required this.goToRegister,
    required this.goToForgotPassword,
  });

  @override
  Widget build(BuildContext context) {
    final isPasswordHidden = useState(true);
    final rememberMe = useState(false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(TejaraSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TejaraTexts.loginTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: TejaraSizes.sm),
                Text(
                  TejaraTexts.loginSubTitle,
                  style: TextStyle(
                    color: TejaraColors.textSecondary,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            SizedBox(height: TejaraSizes.spaceBtwItems),
            Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: TejaraTexts.email,
                    prefixIcon: Icon(Iconsax.direct_right),
                  ),
                ),
                SizedBox(height: TejaraSizes.spaceBtwInputFields),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: TejaraTexts.password,
                    prefixIcon: Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordHidden.value
                            ? Iconsax.eye
                            : Iconsax.eye_slash,
                      ),
                      onPressed: () {
                        isPasswordHidden.value = !isPasswordHidden.value;
                      },
                    ),
                  ),
                ),
                SizedBox(height: TejaraSizes.spaceBtwInputFields / 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: rememberMe.value,
                          onChanged: (value) =>
                              rememberMe.value = value ?? false,
                          activeColor: TejaraColors.buttonPrimary,
                        ),
                        Text(TejaraTexts.rememberMe),
                      ],
                    ),
                    TextButton(
                      onPressed: goToForgotPassword,
                      child: Text(TejaraTexts.forgetPassword),
                    ),
                  ],
                ),
                SizedBox(height: TejaraSizes.spaceBtwItems),
                TejaraElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: TejaraColors.buttonPrimary,
                  ),
                  child: Text(TejaraTexts.signIn),
                ),
                SizedBox(height: TejaraSizes.spaceBtwItems),
                TejaraElevatedButton(
                  onPressed: goToRegister,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.black),
                  ),
                  child: Text(
                    TejaraTexts.createAccount,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: TejaraSizes.spaceBtwItems),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 1,
                    child: Divider(
                      endIndent: 5,
                      thickness: 1,
                      color: TejaraColors.darkGrey,
                    ),
                  ),
                ),
                Text(TejaraTexts.orSignInWith),
                Expanded(
                  child: SizedBox(
                    height: 1,
                    child: Divider(
                      indent: 5,

                      thickness: 1,
                      color: TejaraColors.darkGrey,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: TejaraSizes.spaceBtwItems),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: TejaraColors.darkGrey),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      ImageAssets.googleLogo,
                      height: TejaraSizes.iconLg,
                      width: TejaraSizes.iconLg,
                    ),
                  ),
                ),
                SizedBox(width: TejaraSizes.spaceBtwItems),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: TejaraColors.darkGrey),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      ImageAssets.facebookLogo,
                      height: TejaraSizes.iconLg,
                      width: TejaraSizes.iconLg,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
