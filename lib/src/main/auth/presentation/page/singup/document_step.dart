import 'package:flutter/material.dart';

class Step3DocumentUpload extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  Step3DocumentUpload({required this.onNext, required this.onPrevious});

  @override
  _Step3DocumentUploadState createState() => _Step3DocumentUploadState();
}

class _Step3DocumentUploadState extends State<Step3DocumentUpload> {
  List<String?> uploadedFiles = [null, null, null, null];
  List<String> fileLabels = [
    'صورة هوية غرفة التجارة أمامية',
    'صورة هوية غرفة التجارة خلفية',
    'صورة بطاقة الموحدة أمامية',
    'صورة بطاقة الموحدة خلفية',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: Column(
        children: [
          Text(
            'الصور المطلوبة',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          // Profile icon
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(Icons.person, size: 40, color: Colors.grey[600]),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(4, (index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: _buildFileUploadField(index),
                  );
                }),
              ),
            ),
          ),
          SizedBox(height: 20),
          // Navigation buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: widget.onPrevious,
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'السابق',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: widget.onNext,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'التالي',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFileUploadField(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          fileLabels[index],
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle file selection
                  setState(() {
                    uploadedFiles[index] = 'file_${index + 1}.jpg';
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  foregroundColor: Colors.black87,
                  elevation: 0,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                child: Text('Browse...'),
              ),
              Text(
                uploadedFiles[index] ?? 'No file selected.',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
