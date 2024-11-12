import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final List<FAQItem> _faqItems = [
    FAQItem(
      'How do I accept a new load?',
      'To accept a new load, go to the Load Management screen and tap on the "Accept" button next to the load you want to take.',
    ),
    FAQItem(
      'How do I update my bank information?',
      'Go to Settings > Bank Information to update your payment details.',
    ),
    FAQItem(
      'What should I do in case of an emergency?',
      'Use the SOS button in the tracking screen for immediate assistance. Our support team will contact you right away.',
    ),
    // Add more FAQ items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _buildSection(
            'Contact Support',
            [
              ListTile(
                leading: const Icon(Icons.phone),
                title: const Text('Call Support'),
                subtitle: const Text('24/7 Emergency Support'),
                onTap: () {
                  // TODO: Implement phone call
                },
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: const Text('Email Support'),
                subtitle: const Text('Response within 24 hours'),
                onTap: () {
                  // TODO: Implement email
                },
              ),
              ListTile(
                leading: const Icon(Icons.chat),
                title: const Text('Live Chat'),
                subtitle: const Text('Available 9 AM - 5 PM'),
                onTap: () {
                  // TODO: Implement live chat
                },
              ),
            ],
          ),
          _buildSection(
            'Frequently Asked Questions',
            [
              ExpansionPanelList(
                elevation: 1,
                expandedHeaderPadding: EdgeInsets.zero,
                children: _faqItems.map((FAQItem item) {
                  return ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text(item.question),
                      );
                    },
                    body: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: Text(item.answer),
                    ),
                    isExpanded: item.isExpanded,
                  );
                }).toList(),
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    _faqItems[index].isExpanded = !isExpanded;
                  });
                },
              ),
            ],
          ),
          _buildSection(
            'Additional Resources',
            [
              ListTile(
                leading: const Icon(Icons.book),
                title: const Text('User Guide'),
                onTap: () {
                  // TODO: Open user guide
                },
              ),
              ListTile(
                leading: const Icon(Icons.video_library),
                title: const Text('Video Tutorials'),
                onTap: () {
                  // TODO: Open video tutorials
                },
              ),
              ListTile(
                leading: const Icon(Icons.policy),
                title: const Text('Terms of Service'),
                onTap: () {
                  // TODO: Open terms of service
                },
              ),
              ListTile(
                leading: const Icon(Icons.privacy_tip),
                title: const Text('Privacy Policy'),
                onTap: () {
                  // TODO: Open privacy policy
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
        ),
        ...children,
        const Divider(),
      ],
    );
  }
}

class FAQItem {
  final String question;
  final String answer;
  bool isExpanded;

  FAQItem(this.question, this.answer, {this.isExpanded = false});
}
