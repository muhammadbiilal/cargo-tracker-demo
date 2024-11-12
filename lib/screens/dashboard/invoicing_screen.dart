import 'package:flutter/material.dart';

class InvoicingScreen extends StatelessWidget {
  const InvoicingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoicing & Payments'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Current Invoice
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current Invoice',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    const Text('Base Pay: \$1,500'),
                    const Text('Bonuses: \$300'),
                    const Text('Deductions: -\$100'),
                    const Divider(),
                    const Text(
                      'Total: \$1,700',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Implement request payment
                      },
                      child: const Text('Request Payment'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Payment History
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Payment History',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    const ListTile(
                      title: Text('March 15, 2024'),
                      subtitle: Text('\$2,000 - Paid'),
                    ),
                    ListTile(
                      title: const Text('March 1, 2024'),
                      subtitle: const Text('\$1,800 - Pending'),
                      trailing: TextButton(
                        onPressed: () {
                          // TODO: Implement cancel payment
                        },
                        child: const Text('Cancel'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
