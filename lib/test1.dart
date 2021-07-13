import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/age_bloc.dart';

class Test1 extends StatelessWidget {
  final _ctrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  getColor(age) {
    if (age < 15) {
      return Colors.blue;
    } else if (age < 30) {
      return Colors.green;
    } else if (age < 45) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Test'),
        ),
        body: BlocBuilder<AgeBloc, AgeState>(
          builder: (context, state) {
            if (state is AgeLoadSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Form(
                    key: _formKey,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Age',
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            validator: (val) {
                              return val == null || val.isEmpty
                                  ? 'Please fill this field'
                                  : null;
                            },
                            controller: _ctrl,
                            onChanged: (val) {
                              if (val.isNotEmpty) {
                                BlocProvider.of<AgeBloc>(context)
                                    .add(AgeChanged(val));
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Container(
                            color: _ctrl.text.isNotEmpty || state.age != null
                                ? getColor(state.age)
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text('Your age is: ${state.submitted ? state.age : ''}'),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<AgeBloc>(context).add(AgeSubmitted());
                        }
                      },
                      child: Text('Submit'))
                ],
              );
            }

            return Container();
          },
        ));
  }
}
