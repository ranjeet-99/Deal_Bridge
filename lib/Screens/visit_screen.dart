import 'package:flutter/material.dart';

class VisitScreen extends StatefulWidget{

  const VisitScreen({super.key});

  @override

  State<VisitScreen> createState() => _VisitScreenState();

}

class _VisitScreenState extends State<VisitScreen>{

  final _formkey = GlobalKey<FormState>();

  final TextEditingController notesController = TextEditingController();
  final TextEditingController employeeController = TextEditingController();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  DateTime? followUpDate;

  String? selectedPurpose;
  String? selectedStatus;

  Future<void> selectDate() async{

   final pickedDate = await showDatePicker(

     context: context,
     firstDate: DateTime.now(),
     lastDate: DateTime(2050),
     initialDate: DateTime.now(),

   );

   if(pickedDate != null){

     setState((){

       selectedDate = pickedDate;

     });

   }

  }

  Future<void> selectTime() async{

    final pickedTime = await showTimePicker(

      context: context,
      initialTime: TimeOfDay.now(),

    );

    if(pickedTime != null){

      setState((){

        selectedTime = pickedTime;

      });

    }

  }

  Future<void> selectFollowUpDate() async{

    final pickedDate = await showDatePicker(

      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
      initialDate: DateTime.now(),

    );

    if(pickedDate != null){

      setState((){

        followUpDate = pickedDate;

      });

    }

  }

  @override

  void dispose(){

    notesController.dispose();
    employeeController.dispose();
    super.dispose();

  }

  Widget build(BuildContext context){

    return Scaffold(

      body:SafeArea(

        child: Form(

          key: _formkey,

        child:SingleChildScrollView(

          padding: const EdgeInsets.all(20),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

            children:[

              Row(

                children: [

                  Container(

                    width: 40,
                    height: 40,

                    decoration: BoxDecoration(

                      shape: BoxShape.circle,

                      border: Border.all(

                        color: Colors.grey.shade300,

                      ),

                    ),

                    child: IconButton(

                      onPressed:(){

                        Navigator.pop(context);

                      },

                      icon: const Icon(Icons.arrow_back),

                    ),

                  ),

                  const SizedBox(width: 12),

                  const Text(

                    "Log a Visit",
                    style: TextStyle(

                      fontWeight: FontWeight.bold,
                      fontSize: 24,

                    ),

                  ),

                ],

              ),

              const SizedBox(height: 25),

              Row(

                children:[

                  Expanded(

                    child: InkWell(

                      onTap: selectDate,

                      child: InputDecorator(

                        decoration: InputDecoration(

                        labelText: "DATE",
                        suffixIcon: const Icon(Icons.keyboard_arrow_down),

                         border: OutlineInputBorder(

                           borderRadius: BorderRadius.circular(12),

                         ),

                        ),

                        child: Text(

                          selectedDate == null ? ""
                                               : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",

                        ),

                      ),
                    ),

                  ),

                const SizedBox(width: 12),

                Expanded(

                  child: InkWell(

                onTap: selectTime,

                child: InputDecorator(

                  decoration: InputDecoration(

                    labelText: "TIME",
                    suffixIcon: Icon(Icons.keyboard_arrow_down),

                    border: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(12),

                    ),

                  ),

                  child: Text (

                    selectedTime == null ? ""
                                         : selectedTime!.format(context),
                  ),

                ),

                  ),

                ),

                ],

              ),

              const SizedBox(height: 20),
              
              DropdownButtonFormField<String>(
                
                initialValue: selectedPurpose,
                
                decoration: InputDecoration(
                  
                  labelText: "PURPOSE",
                  
                  border: OutlineInputBorder(
                    
                    borderRadius: BorderRadius.circular(12),
                    
                  ),
                  
                ),

                items: const [

                  DropdownMenuItem(

                    value:"Product Demo",
                    child: Text("Product Demo"),

                  ),

                  DropdownMenuItem(

                    value:"Follow Up",
                    child: Text("Follow Up"),
                  ),

                  DropdownMenuItem(

                    value:"Business Meating",
                    child: Text("Business Meeting"),

                  ),

                  DropdownMenuItem(

                    value: "Quotation Discussion",
                    child: Text("Quotation Discussion"),

                  ),

                ],

                validator: (value){

                  if(value == null || value.trim().isEmpty){

                    return "Please select Purpose";

                  }

                  return null;

                },

                onChanged: (value){

                  setState((){

                    selectedPurpose = value;

                  });

                }
                
              ),

              const SizedBox(height: 20),

              TextFormField(

                controller: notesController,
                maxLines: 4,

                decoration: InputDecoration(

                  labelText: "NOTES",
                  hintText: "Discussed pricing and delivery timelines...",

                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(12),

                  ),

                ),

              ),

              const SizedBox(height: 20),

              TextFormField(

                controller: employeeController,

                decoration: InputDecoration(

                  labelText: "ASSIGNED EMPLOYEE",
                  hintText: "enter employee name",

                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(12),

                  ),

                ),

                validator: (value){

                  if(value == null || value.trim().isEmpty){

                    return "please enter employee name";

                  }

                  return null;

                }

              ),

              const SizedBox(height: 20),

              InkWell(

                onTap: selectFollowUpDate,

                child: InputDecorator(

                  decoration: InputDecoration(

                    labelText: "FOLLOW-UP-DATE",

                    suffixIcon: const Icon(Icons.keyboard_arrow_down),

                    border: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(12),

                    ),

                  ),

                  child: Text(

                    followUpDate == null ? ""
                                         :"${followUpDate!.day}/${followUpDate!.month}/${followUpDate!.year}",

                  ),

                ),

              ),

              const SizedBox(height: 20),

              DropdownButtonFormField<String>(

                initialValue: selectedStatus,

                decoration: InputDecoration(

                  labelText: "STATUS",

                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(12),

                  ),

                ),

                items: const[

               DropdownMenuItem(

                 value: "Scheduled",
                 child: Text("Scheduled"),

               ),

              DropdownMenuItem(

                value: "Completed",
                child: Text("Completed"),

              ),

              DropdownMenuItem(

                value:"Cancelled",
                child: Text("Cancelled"),

              ),

                ],

                validator: (value){

                  if(value == null || value.trim().isEmpty){

                    return "please select status";

                  }

                  return null;

                },

                onChanged:(value){

                  setState((){

                    selectedStatus = value;

                  });

                }

              ),

              const SizedBox(height: 30),

              SizedBox(

                width: double.infinity,
                height: 55,

                child: ElevatedButton(

                  onPressed:(){

                    if(_formkey.currentState!.validate()){

                      if(selectedDate == null){

                        ScaffoldMessenger.of(context).showSnackBar(

                          const SnackBar(

                            content: Text( "please select visit date"),

                          ),

                        );

                        return;

                      }

                      if(selectedTime == null){

                        ScaffoldMessenger.of(context).showSnackBar(

                          SnackBar(

                            content: Text(

                              "please select visit date"

                            ),

                          ),

                        );

                        return;

                      }

                      ScaffoldMessenger.of(context).showSnackBar(

                        SnackBar(

                          content: Text("Visit saved successfully"),

                        ),

                      );

                    }

                  },

                  style: ElevatedButton.styleFrom(

                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,

                    shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(14),

                    ),

                  ),

                  child: const Text(

                    "Save Visit",
                    style: TextStyle(

                      fontSize: 14,
                      fontWeight: FontWeight.bold,

                    ),
                  ),

                ),

              ),

              const SizedBox(height: 20),

            ] ,

            ),


          ),


        ),

        ),

    );

  }

}