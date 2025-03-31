import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/pancake_provider.dart';
import '../models/pancake.dart';

class PancakeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PancakeProvider>(context);
    
    return Scaffold(
      appBar: AppBar(title: Text("Pancakes")),
      body: ListView.builder(
        itemCount: provider.pancakes.length,
        itemBuilder: (context, index) {
          final pancake = provider.pancakes[index];
          return ListTile(
            title: Text(pancake.color),
            subtitle: Text("Price: \$${pancake.price}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: () => _showPancakeDialog(context, provider, pancake),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _confirmDelete(context, provider, pancake.id),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showPancakeDialog(context, provider, null),
      ),
    );
  }

  void _showPancakeDialog(BuildContext context, PancakeProvider provider, Pancake? pancake) {
    final TextEditingController colorController = TextEditingController(text: pancake?.color ?? "");
    final TextEditingController priceController = TextEditingController(text: pancake?.price.toString() ?? "");
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(pancake == null ? "Add Pancake" : "Edit Pancake"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: colorController, decoration: InputDecoration(labelText: "Color")),
            TextField(controller: priceController, decoration: InputDecoration(labelText: "Price"), keyboardType: TextInputType.number),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")),
          TextButton(
            onPressed: () {
              final color = colorController.text;
              final price = double.tryParse(priceController.text) ?? 0;
              if (pancake == null) {
                provider.addPancake(color, price);
              } else {
                provider.updatePancake(pancake.id, color, price);
              }
              Navigator.pop(context);
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context, PancakeProvider provider, String id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Confirm Delete"),
        content: Text("Are you sure you want to delete this pancake?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")),
          TextButton(
            onPressed: () {
              provider.deletePancake(id);
              Navigator.pop(context);
            },
            child: Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}