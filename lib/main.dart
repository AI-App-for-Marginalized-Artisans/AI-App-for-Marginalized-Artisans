import 'package:flutter/material.dart';

void main() => runApp(const ArtisanApp());

class AppColors {
  static const primary = Color(0xFF5B3A8E);
  static const deepPurple = Color(0xFF3D285F);
  static const lavender = Color(0xFFF1ECF7);
  static const cream = Color(0xFFFAF7F2);
  static const gold = Color(0xFFC99A3D);
  static const goldLight = Color(0xFFF5EBD5);
  static const text = Color(0xFF29252D);
  static const muted = Color(0xFF746D78);
  static const border = Color(0xFFE7E0EA);
  static const green = Color(0xFF3C8061);
}

class ArtisanApp extends StatelessWidget {
  const ArtisanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Artisan',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.cream,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.light,
        ),
        fontFamily: 'Arial',
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: AppColors.border),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: AppColors.border),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

class Product {
  final String name;
  final String category;
  final String artisan;
  final String material;
  final String craft;
  final String colour;
  final double price;
  final IconData icon;

  const Product({
    required this.name,
    required this.category,
    required this.artisan,
    required this.material,
    required this.craft,
    required this.colour,
    required this.price,
    required this.icon,
  });
}

const products = <Product>[
  Product(
    name: 'Handwoven Heritage Saree',
    category: 'Textiles',
    artisan: 'Meena Crafts',
    material: 'Cotton',
    craft: 'Handloom',
    colour: 'Indigo',
    price: 2850,
    icon: Icons.checkroom_rounded,
  ),
  Product(
    name: 'Terracotta Leaf Pot',
    category: 'Pottery',
    artisan: 'Kannan Pottery',
    material: 'Clay',
    craft: 'Terracotta',
    colour: 'Earth Red',
    price: 780,
    icon: Icons.local_florist_rounded,
  ),
  Product(
    name: 'Palm Leaf Basket',
    category: 'Baskets',
    artisan: 'Lakshmi Weaves',
    material: 'Palm Leaf',
    craft: 'Handwoven',
    colour: 'Natural',
    price: 620,
    icon: Icons.shopping_basket_rounded,
  ),
  Product(
    name: 'Brass Heritage Earrings',
    category: 'Jewellery',
    artisan: 'Ananya Studio',
    material: 'Brass',
    craft: 'Handcrafted',
    colour: 'Gold',
    price: 950,
    icon: Icons.diamond_rounded,
  ),
];

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1400), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const WelcomeScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppLogo(large: true, light: true),
            SizedBox(height: 18),
            Text(
              'Crafted with heritage.',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 15,
                letterSpacing: .5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppLogo extends StatelessWidget {
  final bool large;
  final bool light;

  const AppLogo({super.key, this.large = false, this.light = false});

  @override
  Widget build(BuildContext context) {
    final size = large ? 62.0 : 42.0;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: AppColors.gold,
            borderRadius: BorderRadius.circular(large ? 18 : 13),
          ),
          child: Icon(
            Icons.handyman_rounded,
            color: AppColors.deepPurple,
            size: size * .55,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          'ARTISAN',
          style: TextStyle(
            color: light ? Colors.white : AppColors.deepPurple,
            fontSize: large ? 26 : 20,
            fontWeight: FontWeight.w800,
            letterSpacing: 2.2,
          ),
        ),
      ],
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              const AppLogo(),
              const Spacer(),
              Container(
                height: 230,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.lavender,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: const Center(
                  child: Icon(
                    Icons.auto_awesome_rounded,
                    size: 88,
                    color: AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(height: 34),
              const Text(
                'Where tradition\nmeets opportunity.',
                style: TextStyle(
                  fontSize: 38,
                  height: 1.08,
                  fontWeight: FontWeight.w800,
                  color: AppColors.deepPurple,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'A simple digital space for artisans to showcase their craft and reach more people.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: AppColors.muted,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                  ),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 17),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Learn more about Artisan',
                    style: TextStyle(color: AppColors.primary),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool signup = false;
  bool obscure = true;

  void continueToApp() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const ChooseUserScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(26, 10, 26, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                signup ? 'Create your account' : 'Welcome back',
                style: const TextStyle(
                  fontSize: 31,
                  fontWeight: FontWeight.w800,
                  color: AppColors.deepPurple,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                signup
                    ? 'Join the Artisan community.'
                    : 'Sign in to continue to your marketplace.',
                style: const TextStyle(color: AppColors.muted, fontSize: 15),
              ),
              const SizedBox(height: 30),
              if (signup) ...[
                const Text(
                  'Full name',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                const TextField(
                  decoration: InputDecoration(hintText: 'Enter your name'),
                ),
                const SizedBox(height: 18),
              ],
              const Text(
                'Email address',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              const TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: 'you@example.com'),
              ),
              const SizedBox(height: 18),
              const Text(
                'Password',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              TextField(
                obscureText: obscure,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  suffixIcon: IconButton(
                    onPressed: () => setState(() => obscure = !obscure),
                    icon: Icon(
                      obscure
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
              ),
              if (!signup)
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Forgot password?'),
                  ),
                ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: continueToApp,
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 17),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    signup ? 'Create Account' : 'Sign In',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    signup
                        ? 'Already have an account?'
                        : "Don't have an account?",
                  ),
                  TextButton(
                    onPressed: () => setState(() => signup = !signup),
                    child: Text(signup ? 'Sign in' : 'Sign up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChooseUserScreen extends StatelessWidget {
  const ChooseUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const Text(
                'How will you use\nArtisan?',
                style: TextStyle(
                  fontSize: 34,
                  height: 1.1,
                  fontWeight: FontWeight.w800,
                  color: AppColors.deepPurple,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Choose the experience that fits you.',
                style: TextStyle(color: AppColors.muted, fontSize: 16),
              ),
              const SizedBox(height: 34),
              RoleCard(
                icon: Icons.handyman_rounded,
                title: 'I am an Artisan',
                subtitle: 'Create listings and showcase my craft.',
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const ArtisanShell()),
                ),
              ),
              const SizedBox(height: 16),
              RoleCard(
                icon: Icons.shopping_bag_outlined,
                title: 'I am a Buyer',
                subtitle: 'Discover and shop authentic handmade products.',
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const BuyerShell()),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class RoleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const RoleCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Container(
              height: 58,
              width: 58,
              decoration: BoxDecoration(
                color: AppColors.lavender,
                borderRadius: BorderRadius.circular(17),
              ),
              child: Icon(icon, color: AppColors.primary, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: AppColors.muted,
                      height: 1.35,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 17,
              color: AppColors.muted,
            ),
          ],
        ),
      ),
    );
  }
}

class ArtisanShell extends StatefulWidget {
  const ArtisanShell({super.key});

  @override
  State<ArtisanShell> createState() => _ArtisanShellState();
}

class _ArtisanShellState extends State<ArtisanShell> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      ArtisanDashboard(onAdd: () => setState(() => index = 1)),
      const ArtisanProducts(),
      const ArtisanProfile(),
    ];

    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (value) => setState(() => index = value),
        backgroundColor: Colors.white,
        indicatorColor: AppColors.lavender,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.inventory_2_outlined),
            selectedIcon: Icon(Icons.inventory_2_rounded),
            label: 'Products',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class ArtisanDashboard extends StatelessWidget {
  final VoidCallback onAdd;

  const ArtisanDashboard({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(22, 22, 22, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppLogo(),
            const SizedBox(height: 30),
            const Text(
              'Good evening, Artisan',
              style: TextStyle(color: AppColors.muted),
            ),
            const SizedBox(height: 5),
            const Text(
              'Grow your craft online.',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: AppColors.deepPurple,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: AppColors.deepPurple,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ready to add a new creation?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Let AI help turn your product photo into a polished listing.',
                          style: TextStyle(color: Colors.white70, height: 1.45),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  IconButton.filled(
                    onPressed: onAdd,
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.gold,
                      foregroundColor: AppColors.deepPurple,
                    ),
                    icon: const Icon(Icons.add_rounded, size: 28),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            const SectionTitle(title: 'Your overview'),
            const SizedBox(height: 12),
            Row(
              children: const [
                Expanded(
                  child: StatCard(number: '12', label: 'Products'),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: StatCard(number: '286', label: 'Views'),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: StatCard(number: '18', label: 'Saved'),
                ),
              ],
            ),
            const SizedBox(height: 28),
            const SectionTitle(title: 'Recent products'),
            const SizedBox(height: 12),
            ...products
                .take(2)
                .map(
                  (product) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: ProductListTile(product: product),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String number;
  final String label;

  const StatCard({super.key, required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Text(
            number,
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w800,
              color: AppColors.deepPurple,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: AppColors.muted),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final String? action;

  const SectionTitle({super.key, required this.title, this.action});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
        ),
        if (action != null)
          Text(
            action!,
            style: const TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
      ],
    );
  }
}

class ProductListTile extends StatelessWidget {
  final Product product;

  const ProductListTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          ProductVisual(product: product, size: 72),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 5),
                Text(
                  product.category,
                  style: const TextStyle(color: AppColors.muted),
                ),
                const SizedBox(height: 7),
                Text(
                  '₹${product.price.toStringAsFixed(0)}',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded, color: AppColors.muted),
        ],
      ),
    );
  }
}

class ProductVisual extends StatelessWidget {
  final Product product;
  final double size;

  const ProductVisual({super.key, required this.product, this.size = 150});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: AppColors.lavender,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Icon(product.icon, size: size * .38, color: AppColors.primary),
    );
  }
}

class ArtisanProducts extends StatelessWidget {
  const ArtisanProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(22),
        children: [
          const PageTitle(
            title: 'My Products',
            subtitle: 'Manage everything you have published.',
          ),
          const SizedBox(height: 22),
          FilledButton.icon(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AddProductScreen()),
            ),
            icon: const Icon(Icons.add_rounded),
            label: const Text('Add New Product'),
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
          const SizedBox(height: 22),
          ...products.map(
            (product) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ProductListTile(product: product),
            ),
          ),
        ],
      ),
    );
  }
}

class ArtisanProfile extends StatelessWidget {
  const ArtisanProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(22),
        children: [
          const PageTitle(
            title: 'My Profile',
            subtitle: 'Tell buyers the story behind your craft.',
          ),
          const SizedBox(height: 25),
          Center(
            child: Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                color: AppColors.lavender,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person_rounded,
                size: 48,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: 14),
          const Center(
            child: Text(
              'Meena Crafts',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(height: 5),
          const Center(
            child: Text(
              'Handloom artisan • Tamil Nadu',
              style: TextStyle(color: AppColors.muted),
            ),
          ),
          const SizedBox(height: 30),
          ProfileOption(
            icon: Icons.storefront_outlined,
            title: 'My Store',
            onTap: () {},
          ),
          ProfileOption(
            icon: Icons.edit_outlined,
            title: 'Edit Profile',
            onTap: () {},
          ),
          ProfileOption(
            icon: Icons.language_rounded,
            title: 'Language',
            onTap: () {},
          ),
          ProfileOption(
            icon: Icons.help_outline_rounded,
            title: 'Help & Support',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileOption({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 3),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.lavender,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: AppColors.primary),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
      trailing: const Icon(Icons.chevron_right_rounded, color: AppColors.muted),
      onTap: onTap,
    );
  }
}

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Product')),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageTitle(
              title: 'Create a listing',
              subtitle: 'Start with a few details about your creation.',
            ),
            const SizedBox(height: 25),
            const Text(
              'Product name',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                hintText: 'e.g. Handwoven Cotton Saree',
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'Category',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              initialValue: 'Textiles',
              items: const [
                DropdownMenuItem(value: 'Textiles', child: Text('Textiles')),
                DropdownMenuItem(value: 'Pottery', child: Text('Pottery')),
                DropdownMenuItem(value: 'Jewellery', child: Text('Jewellery')),
                DropdownMenuItem(value: 'Baskets', child: Text('Baskets')),
                DropdownMenuItem(
                  value: 'Wooden Craft',
                  child: Text('Wooden Craft'),
                ),
              ],
              onChanged: (_) {},
            ),
            const SizedBox(height: 18),
            const Text(
              'Your selling price',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixText: '₹ ',
                hintText: 'Enter your price',
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const UploadPhotoScreen()),
                ),
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 17),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UploadPhotoScreen extends StatelessWidget {
  const UploadPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Photo')),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const PageTitle(
              title: 'Show us your craft',
              subtitle:
                  'Upload a clear photo. AI will prepare it for your listing.',
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.border),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_a_photo_outlined,
                      size: 60,
                      color: AppColors.primary,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Add product photo',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      'JPG or PNG • clear and well lit',
                      style: TextStyle(color: AppColors.muted),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.photo_library_outlined),
                    label: const Text('Gallery'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ProcessingScreen(),
                      ),
                    ),
                    icon: const Icon(Icons.camera_alt_outlined),
                    label: const Text('Camera'),
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 15),
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

class ProcessingScreen extends StatefulWidget {
  const ProcessingScreen({super.key});

  @override
  State<ProcessingScreen> createState() => _ProcessingScreenState();
}

class _ProcessingScreenState extends State<ProcessingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const AIResultsScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 105,
                width: 105,
                decoration: const BoxDecoration(
                  color: AppColors.lavender,
                  shape: BoxShape.circle,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(32),
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(height: 28),
              const Text(
                'Preparing your listing',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 10),
              const Text(
                'Enhancing the image and understanding your craft...',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.muted, height: 1.5),
              ),
              const SizedBox(height: 25),
              const ProcessingStep(
                icon: Icons.auto_fix_high_rounded,
                text: 'Preparing product image',
              ),
              const ProcessingStep(
                icon: Icons.search_rounded,
                text: 'Identifying craft details',
              ),
              const ProcessingStep(
                icon: Icons.description_outlined,
                text: 'Creating your product description',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProcessingStep extends StatelessWidget {
  final IconData icon;
  final String text;

  const ProcessingStep({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 19, color: AppColors.gold),
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(color: AppColors.muted)),
        ],
      ),
    );
  }
}

class AIResultsScreen extends StatelessWidget {
  const AIResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Results')),
      body: ListView(
        padding: const EdgeInsets.all(22),
        children: [
          const PageTitle(
            title: 'We found the details',
            subtitle: 'Review what AI detected before creating your listing.',
          ),
          const SizedBox(height: 22),
          const ResultChip(label: 'Category', value: 'Textiles'),
          const ResultChip(label: 'Material', value: 'Cotton'),
          const ResultChip(label: 'Craft type', value: 'Handloom'),
          const ResultChip(label: 'Colour', value: 'Indigo'),
          const ResultChip(
            label: 'Pattern',
            value: 'Traditional geometric motif',
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.goldLight,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Row(
              children: [
                Icon(Icons.verified_rounded, color: AppColors.gold),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'AI confidence: High\nYou can edit any detail before publishing.',
                    style: TextStyle(height: 1.4),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ReviewListingScreen()),
            ),
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('Review Listing'),
          ),
        ],
      ),
    );
  }
}

class ResultChip extends StatelessWidget {
  final String label;
  final String value;

  const ResultChip({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                color: AppColors.muted,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w800)),
        ],
      ),
    );
  }
}

class ReviewListingScreen extends StatefulWidget {
  const ReviewListingScreen({super.key});

  @override
  State<ReviewListingScreen> createState() => _ReviewListingScreenState();
}

class _ReviewListingScreenState extends State<ReviewListingScreen> {
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(
      text: 'Handwoven Heritage Cotton Saree',
    );
    descriptionController = TextEditingController(
      text: 'A beautifully handwoven cotton saree inspired by traditional textile heritage. Crafted with care and designed for everyday elegance.',
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final product = products.first;

    return Scaffold(
      appBar: AppBar(title: const Text('Review Listing')),
      body: ListView(
        padding: const EdgeInsets.all(22),
        children: [
          ProductVisual(product: product, size: double.infinity),
          const SizedBox(height: 22),
          const Text(
            'Listing title',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          TextField(controller: titleController),
          const SizedBox(height: 18),
          const Text(
            'Description',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          TextField(controller: descriptionController, maxLines: 6),
          const SizedBox(height: 18),
          const Text('Price', style: TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          const TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(prefixText: '₹ ', hintText: '2850'),
          ),
          const SizedBox(height: 26),
          FilledButton(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const PublishSuccessScreen()),
            ),
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 17),
            ),
            child: const Text('Publish Product'),
          ),
        ],
      ),
    );
  }
}

class PublishSuccessScreen extends StatelessWidget {
  const PublishSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 92,
                width: 92,
                decoration: const BoxDecoration(
                  color: AppColors.goldLight,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_rounded,
                  size: 50,
                  color: AppColors.gold,
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Your product is live!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.w800,
                  color: AppColors.deepPurple,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Your creation is now ready to be discovered by buyers.',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.muted, height: 1.5),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const ArtisanShell()),
                    (route) => false,
                  ),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 17),
                  ),
                  child: const Text('Back to Dashboard'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuyerShell extends StatefulWidget {
  const BuyerShell({super.key});

  @override
  State<BuyerShell> createState() => _BuyerShellState();
}

class _BuyerShellState extends State<BuyerShell> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      BuyerHome(onSearch: () => setState(() => index = 1)),
      const BuyerSearch(),
      const BuyerSaved(),
      const BuyerProfile(),
    ];

    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (value) => setState(() => index = value),
        backgroundColor: Colors.white,
        indicatorColor: AppColors.lavender,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search_rounded),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.bookmark_border_rounded),
            selectedIcon: Icon(Icons.bookmark_rounded),
            label: 'Saved',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class BuyerHome extends StatelessWidget {
  final VoidCallback onSearch;

  const BuyerHome({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(22, 22, 22, 30),
        children: [
          const AppLogo(),
          const SizedBox(height: 28),
          const Text(
            'Discover something meaningful.',
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w800,
              color: AppColors.deepPurple,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Authentic products, crafted by real people.',
            style: TextStyle(color: AppColors.muted),
          ),
          const SizedBox(height: 22),
          InkWell(
            onTap: onSearch,
            borderRadius: BorderRadius.circular(15),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.border),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search_rounded, color: AppColors.muted),
                  SizedBox(width: 10),
                  Text(
                    'Search products or crafts',
                    style: TextStyle(color: AppColors.muted),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 27),
          const SectionTitle(title: 'Explore categories'),
          const SizedBox(height: 13),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CategoryItem(icon: Icons.checkroom_rounded, label: 'Textiles'),
                CategoryItem(
                  icon: Icons.local_florist_rounded,
                  label: 'Pottery',
                ),
                CategoryItem(
                  icon: Icons.shopping_basket_rounded,
                  label: 'Baskets',
                ),
                CategoryItem(icon: Icons.diamond_rounded, label: 'Jewellery'),
              ],
            ),
          ),
          const SizedBox(height: 27),
          const SectionTitle(title: 'Featured crafts'),
          const SizedBox(height: 13),
          SizedBox(
            height: 285,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              separatorBuilder: (context, index) => const SizedBox(width: 14),
              itemBuilder: (context, index) =>
                  BuyerProductCard(product: products[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 94,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.primary, size: 28),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class BuyerProductCard extends StatelessWidget {
  final Product product;

  const BuyerProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ProductDetailsScreen(product: product),
        ),
      ),
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: 205,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductVisual(product: product, size: 205),
            const SizedBox(height: 10),
            Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 4),
            Text(
              product.artisan,
              style: const TextStyle(color: AppColors.muted, fontSize: 13),
            ),
            const SizedBox(height: 5),
            Text(
              '₹${product.price.toStringAsFixed(0)}',
              style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.bookmark_border_rounded),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(22, 5, 22, 30),
        children: [
          ProductVisual(product: product, size: double.infinity),
          const SizedBox(height: 22),
          Text(
            product.category.toUpperCase(),
            style: const TextStyle(
              color: AppColors.gold,
              fontSize: 12,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            product.name,
            style: const TextStyle(
              fontSize: 29,
              height: 1.15,
              fontWeight: FontWeight.w800,
              color: AppColors.deepPurple,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'by ${product.artisan}',
            style: const TextStyle(color: AppColors.muted),
          ),
          const SizedBox(height: 18),
          Text(
            '₹${product.price.toStringAsFixed(0)}',
            style: const TextStyle(
              fontSize: 25,
              color: AppColors.primary,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 22),
          const Text(
            'About this craft',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 8),
          Text(
            'Made with care using ${product.material} and the traditional ${product.craft} technique. Every piece carries the character of the artisan who created it.',
            style: const TextStyle(
              color: AppColors.muted,
              height: 1.55,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 24),
          const SectionTitle(title: 'Product details'),
          const SizedBox(height: 12),
          ResultChip(label: 'Material', value: product.material),
          ResultChip(label: 'Craft', value: product.craft),
          ResultChip(label: 'Colour', value: product.colour),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 17),
              ),
              child: const Text('Buy Now'),
            ),
          ),
        ],
      ),
    );
  }
}

class BuyerSearch extends StatelessWidget {
  const BuyerSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(22),
        children: [
          const PageTitle(
            title: 'Search',
            subtitle: 'Find products, materials and traditional crafts.',
          ),
          const SizedBox(height: 22),
          const TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search_rounded),
              hintText: 'Search handmade products...',
            ),
          ),
          const SizedBox(height: 22),
          ...products.map(
            (product) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ProductListTile(product: product),
            ),
          ),
        ],
      ),
    );
  }
}

class BuyerSaved extends StatelessWidget {
  const BuyerSaved({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(22),
        children: [
          const PageTitle(
            title: 'Saved',
            subtitle: 'Your favourite creations in one place.',
          ),
          const SizedBox(height: 25),
          ...products
              .take(2)
              .map(
                (product) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ProductListTile(product: product),
                ),
              ),
        ],
      ),
    );
  }
}

class BuyerProfile extends StatelessWidget {
  const BuyerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(22),
        children: [
          const PageTitle(
            title: 'My Profile',
            subtitle: 'Your Artisan marketplace account.',
          ),
          const SizedBox(height: 25),
          const ProfileOption(
            icon: Icons.person_outline_rounded,
            title: 'Personal details',
            onTap: _empty,
          ),
          const ProfileOption(
            icon: Icons.shopping_bag_outlined,
            title: 'My orders',
            onTap: _empty,
          ),
          const ProfileOption(
            icon: Icons.location_on_outlined,
            title: 'Saved addresses',
            onTap: _empty,
          ),
          const ProfileOption(
            icon: Icons.help_outline_rounded,
            title: 'Help & Support',
            onTap: _empty,
          ),
        ],
      ),
    );
  }
}

void _empty() {}

class PageTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const PageTitle({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: AppColors.deepPurple,
          ),
        ),
        const SizedBox(height: 7),
        Text(
          subtitle,
          style: const TextStyle(color: AppColors.muted, height: 1.45),
        ),
      ],
    );
  }
}
