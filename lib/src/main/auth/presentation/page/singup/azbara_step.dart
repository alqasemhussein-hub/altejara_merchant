import 'package:flutter/material.dart';

class AzbaraStep extends StatefulWidget {
  final TextEditingController classificationController;
  final VoidCallback onNext;

  AzbaraStep({required this.classificationController, required this.onNext});

  @override
  _AzbaraStepState createState() => _AzbaraStepState();
}

class _AzbaraStepState extends State<AzbaraStep> {
  String selectedClassification = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: Column(
        children: [
          // Chamber logo and title
          Column(
            children: [
              Text(
                'واجهة التحقق',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.red, width: 3),
                ),
                child: ClipOval(
                  child: Container(
                    color: Colors.blue[800],
                    child: Center(
                      child: Icon(
                        Icons.location_on,
                        color: Colors.yellow,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'قم بإدخال رقم الصنف',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'ادخل رقم الصنف الموجود في هوية غرفة تجارة بغداد',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(height: 40),
          // Classification input
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: widget.classificationController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'رقم',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      selectedClassification = value;
                    });
                  },
                ),
              ),
              SizedBox(width: 12),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButton<String>(
                  value: 'الصرف',
                  underline: SizedBox(),
                  items: ['الصرف', 'التجارة', 'الصناعة'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    // Handle dropdown change
                  },
                ),
              ),
            ],
          ),
          Spacer(),
          // Next button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: selectedClassification.isNotEmpty
                  ? widget.onNext
                  : null,
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
    );
  }
}
