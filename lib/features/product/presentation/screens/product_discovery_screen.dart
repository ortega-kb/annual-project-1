import 'package:e_commerce/core/shared/widgets/auth_required_dialog.dart';
import 'package:e_commerce/core/theme/app_color.dart';
import 'package:e_commerce/core/theme/app_dimen.dart';
import 'package:e_commerce/features/product/presentation/widgets/product_promo.dart';
import 'package:e_commerce/init_dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDiscoveryScreen extends StatefulWidget {
  const ProductDiscoveryScreen({super.key});

  @override
  State<ProductDiscoveryScreen> createState() => _ProductDiscoveryScreenState();
}

class _ProductDiscoveryScreenState extends State<ProductDiscoveryScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "E-commerce",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [
          IconButton(
            tooltip: "Panier",
            onPressed: () {
              final isAuthenticated = serviceLocator<SharedPreferences>()
                      .getBool('authentication') ??
                  false;
              if (!isAuthenticated) {
                authRequiredDialog(context);
                return;
              }
              context.push("/cart");
            },
            icon: const Icon(
              CupertinoIcons.cart,
            ),
          ),
          const SizedBox(width: AppDimen.p16)
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: AppDimen.p16),
            ProductPromo(),
            SizedBox(height: AppDimen.p16),
          ],
        ),
      ),
    );
  }
}
