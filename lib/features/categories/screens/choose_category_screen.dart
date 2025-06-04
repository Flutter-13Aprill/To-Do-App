import 'package:flutter/material.dart';

class ChooseCategoryScreen extends StatelessWidget {
  const ChooseCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'name': 'Grocery',
        'color': Colors.green,
        'icon': Icons.local_grocery_store,
      },
      {'name': 'Work', 'color': Colors.red, 'icon': Icons.work},
      {'name': 'Sport', 'color': Colors.cyan, 'icon': Icons.sports_soccer},
      {'name': 'Design', 'color': Colors.teal, 'icon': Icons.design_services},
      {'name': 'University', 'color': Colors.blue, 'icon': Icons.school},
      {'name': 'Social', 'color': Colors.pink, 'icon': Icons.group},
      {'name': 'Music', 'color': Colors.purple, 'icon': Icons.music_note},
      {'name': 'Health', 'color': Colors.greenAccent, 'icon': Icons.favorite},
      {'name': 'Movie', 'color': Colors.lightBlueAccent, 'icon': Icons.movie},
      {'name': 'Home', 'color': Colors.orange, 'icon': Icons.home},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text('Choose Category'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            ...categories.map(
              (cat) => CategoryCard(
                name: cat['name'] as String,
                color: cat['color'] as Color,
                icon: cat['icon'] as IconData,
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/create_category'),
              child: CategoryCard(
                name: 'Create New',
                color: Colors.white,
                icon: Icons.add,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF8687E7),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: () {},
          child: const Text('Add Category'),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String name;
  final Color color;
  final IconData icon;

  const CategoryCard({
    super.key,
    required this.name,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1D1D1D),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(name, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
