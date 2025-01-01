import 'package:flutter/material.dart';

class CustomRowAppbar extends StatelessWidget {
  const CustomRowAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return    Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20),
                      child: Text(
                        'Pazar',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => Search()));
                      },
                      child: Container(
                          height: 35,
                          width: 230,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Icon(Icons.search),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Center(child: Text('What are you looking for?')),
                            ],
                          )),
                    ),
                    IconButton(
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>F()));
                      },
                      icon: Icon(
                        Icons.favorite_border,
                        size: 30,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                );
               
  }
}