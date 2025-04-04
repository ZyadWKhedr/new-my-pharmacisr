import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_my_pharmacist/features/medicines/presentation/pages/details_page.dart';
import 'package:new_my_pharmacist/features/medicines/presentation/providers/medicine_provider.dart';
import 'package:new_my_pharmacist/features/medicines/presentation/widgets/medicine_tile.dart';

class MedicinesPage extends ConsumerStatefulWidget {
  const MedicinesPage({super.key});

  @override
  ConsumerState<MedicinesPage> createState() => _MedicinesPageState();
}

class _MedicinesPageState extends ConsumerState<MedicinesPage> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final medicineAsync =
        query.isEmpty
            ? ref.watch(topMedicinesProvider)
            : ref.watch(medicineSearchProvider(query));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicines'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search medicines...',
                  prefixIcon: Icon(Icons.search, color: Colors.grey[700]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                ),
                onChanged: (val) => setState(() => query = val),
              ),
            ),

            // Medicine List
            Expanded(
              child: medicineAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text('Error: $e')),
                data:
                    (medicines) => ListView.builder(
                      itemCount: medicines.length,
                      itemBuilder: (context, index) {
                        final med = medicines[index];
                        return MedicineTile(
                          medicine: med,
                          onTap:
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) => MedicineDetailsPage(medicine: med),
                                ),
                              ),
                        );
                      },
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
