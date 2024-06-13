import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summary, {super.key});
  final List<Map<String, Object>> summary;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map((data) {
            final isCorrectAnswer=data['correct_answer']==data['user_answer'];
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                      
                      Container(
                        
                        height: 25,
                        width: 25,
                        alignment: Alignment.center,
                        
                        decoration: BoxDecoration(
                          color: isCorrectAnswer?const Color.fromARGB(255, 235, 109, 151):const Color.fromARGB(255, 85, 159, 220),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        //textAlign: TextAlign.start,
                        ),
                      ),
            
                   
                   
            
                  
                  Expanded(
                    
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['question'] as String,
                     textAlign: TextAlign.left,
                     style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      
                     ),),
            
            
                        const SizedBox(
                          height: 5,
                        ),
            
                        
                        Text(data['user_answer'] as String,
                     textAlign: TextAlign.left,
                     style: const TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 200, 94, 245),
                     ),),
            
            
                        const SizedBox(
                          height: 5,
                        ),
            
            
                        Text(data['correct_answer'] as String,
                     textAlign: TextAlign.left,
                     style: const TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 111, 183, 242),
                     ),),
                      ],
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
