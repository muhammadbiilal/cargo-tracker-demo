import 'package:flutter/material.dart';

class LoadManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Load Management'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Current Load Overview
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current Load Overview',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    const Text('Load Type: Refrigerated'),
                    const Text('Pick-up: New York, NY'),
                    const Text('Drop-off: Los Angeles, CA'),
                    const Text('ETA: 3 days'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // New Load Requests
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'New Load Requests',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    ListTile(
                      title: const Text('Pick-up: Chicago, IL'),
                      subtitle: const Text(
                          'Destination: Miami, FL\nPayment: \$2,000'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.check, color: Colors.green),
                            onPressed: () {
                              // TODO: Accept load
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.close, color: Colors.red),
                            onPressed: () {
                              // TODO: Decline load
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Load History
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Load History',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    const ListTile(
                      title: Text('Completed: Boston, MA to Seattle, WA'),
                      subtitle: Text('Payment: \$3,500'),
                    ),
                    const ListTile(
                      title: Text('Canceled: Dallas, TX to Denver, CO'),
                      subtitle: Text('Payment: \$1,800'),
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
