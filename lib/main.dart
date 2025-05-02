import 'package:flutter/material.dart';

void main() {
  runApp(MyUltraBeautifulApp());
}

class MyUltraBeautifulApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grid View & List View',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Roboto',
      ),
      home: UltraHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class UltraHomePage extends StatelessWidget {
  final List<Map<String, dynamic>> languages = [
    {'name': 'Flutter', 'icon': Icons.flutter_dash, 'color': Colors.blue},
    {'name': 'Dart', 'icon': Icons.code, 'color': Colors.teal},
    {'name': 'C++', 'icon': Icons.developer_mode, 'color': Colors.purple},
    {'name': 'C', 'icon': Icons.memory, 'color': Colors.indigo},
    {'name': 'Java', 'icon': Icons.coffee, 'color': Colors.brown},
    {'name': 'Python', 'icon': Icons.pets, 'color': Colors.orange},
    {'name': 'HTML', 'icon': Icons.language, 'color': Colors.deepOrange},
    {'name': 'CSS', 'icon': Icons.brush, 'color': Colors.blueAccent},
    {'name': 'JavaScript', 'icon': Icons.javascript, 'color': Colors.amber},
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          elevation: 4,
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          title: Text("⚡ Grid View & List View ⚡", style: TextStyle(fontWeight: FontWeight.bold)),
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.list_alt), text: "List View"),
              Tab(icon: Icon(Icons.grid_on), text: "Grid View"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // 🌟 List View
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  var lang = languages[index];
                  return Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16),
                      leading: CircleAvatar(
                        backgroundColor: lang['color'],
                        radius: 24,
                        child: Icon(lang['icon'], color: Colors.white),
                      ),
                      title: Text(
                        lang['name'],
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("Popular programming language"),
                      trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),

            // 🌟 Grid View
            Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                itemCount: languages.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context, index) {
                  var lang = languages[index];
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [lang['color'].withOpacity(0.9), lang['color'].withOpacity(0.7)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: lang['color'].withOpacity(0.4),
                          blurRadius: 6,
                          offset: Offset(2, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(lang['icon'], size: 80, color: Colors.white),
                        SizedBox(height: 10),
                        Text(
                          lang['name'],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
